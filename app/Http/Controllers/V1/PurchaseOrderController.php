<?php

namespace App\Http\Controllers\V1;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\PurchaseOrder;
use App\Models\PurchaseOrderItem;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class PurchaseOrderController extends Controller
{

    /**
     * Show the profile for a given user.
     */
    public function search(Request $request)
    { 

        $data = PurchaseOrder::query();
        if($request->has('search')){
            $search = $request->search;
            $data->where('serial_no', 'like', '%'.$search.'%');
        }

        $data = $data->limit(5)->get();
        return response()->json([
           "message" => "Get Records Successfully",
           "data" =>  $data,
        ],200);
    }



    /**
     * Show the profile for a given user.
     */
    public function index(Request $request)
    { 
        $per_page = 10;
        $sort_by = 'date';
        $assending = 'asc';
   
        $data = PurchaseOrder::query();

        if($request->has('search')){
            $search = $request->search;
            $data->where('id', 'like', '%'.$search.'%')
            ->orWhere('serial_no', 'like', '%'.$search.'%');
        }

        if($request->has('ascending') && $request->ascending != ''){
            $assending = $request->ascending;
        }

        if($request->has('sort_by') && $request->sort_by != null){
            $sort_by = $request->sort_by;
        }

        if($request->has('per_page') && is_numeric($request->per_page)){
            $per_page = $request->per_page;
        }

        switch ($sort_by) {

            case 'date':
                $data->orderBy('created_at',$assending);
                break;

            case 'id':
                $data->orderBy('id',$assending);
                break;        

            default:

               $data->orderBy('created_at',$assending);
            break;
        }

        $data = $data->with(['items.product','vendor']);
        return response()->json([
            'query' => '',
            "message" => "Get Records Successfully",
            "data" =>  $data->paginate($per_page),
        ],200);
        
    }



     /*
     * Show the profile for a given user.
     */
    public function show($id)
    {
        
        $module = PurchaseOrder::where('id',$id)->with(['vendor','items.product.unit','items.product.category'])->first();
        
        return response()->json([
            "message" => 'Get Record Successfully',
            "data" => $module,
        ],200);
    }
    

    /*
     * Show the profile for a given user.
     */
    public function update(Request $request,$id)
    {
        if($id == 0){
               $module = New PurchaseOrder();  
        }else{
            $module = PurchaseOrder::where('id',$id)->first();
            if(!$module){
                return response()->json(["message" => "Record Not Found"],403);
            }
        }
        
        //-----------Validations
        $validations = [
            'vendor_id' => ['required'],
            'serial_no' => ['nullable','string','unique:purchase_orders,serial_no'],
            'ref' => ['nullable','string'],
            'date' => ['required'],
            'tax' => ['nullable'],
            'discount' => ['nullable'],
            'description' => ['nullable','string'],
        ];
        
        if($id != 0){
            $validations['serial_no'] = ['nullable','string','unique:purchase_orders,serial_no,'.$id];
        }
        
        $validator = Validator::make($request->all(),$validations);
        if($validator->fails()){
            return response()->json([
                "message" => "Validation Failed",
                "data" => ["validations" => $validator->messages()],
            ],403);
        }

        //Data
        $module->vendor_id = $request->vendor_id;
        $module->serial_no = $request->serial_no;
        $module->ref = $request->ref;
        $module->date = $request->date;
        $module->tax = $request->tax;
        $module->discount = $request->discount;
        $module->description = $request->description;
        $module->status = $request->status;
        $module->save();
        
        $this->update_calculation($module->id);

        //Response
        $message = $id ? 'Record Updated Successfully' : 'Record Created Successfully';
        return response()->json([
            "message" => $message,
            "data" => ['id' => $module->id]
        ],200);
        
    }



    /*
     * Show the profile for a given user.
     */
    public function destroy($id)
    {
        $module = PurchaseOrder::find($id);
        if($module == null){
             return response()->json(["message" => 'Record Deleted Successfully'],200);
        }
        
        $module->delete();
        return response()->json([
            "message" => 'Record Deleted Successfully',
            "data" => ['id' => $id]
        ],200);
    }
    
    
    
    /*
     * Show the profile for a given user.
     */
    public function item_add(Request $request,$id)
    {
         $validations = [
            'product_id' => ['required'],
            'price' => ['required'],
            'quantity' => ['required'],
        ];
        
        $validator = Validator::make($request->all(),$validations);
        if($validator->fails()){
            return response()->json([
                "message" => "Validation Failed",
                "data" => ["validations" => $validator->messages()],
            ],403);
        }
        
        $module = PurchaseOrder::find($id);
        if($module == null){
             return response()->json(["message" => 'Record Not Found '],500);
        }
        
        $item = PurchaseOrderItem::create([
            'parent_id' => $id,
            'product_id' => $request->product_id,
            'price' => $request->price,
            'quantity' => $request->quantity,
            'discount' => $request->discount,
            'tax' => $request->tax,
            'description' => $request->description,
            
        ]);
        
        $this->update_calculation($module->id);
        
        return response()->json([
            "message" => 'Record Added Successfully',
            "data" => ['id' => $item->id]
        ],200);
    }
    
    
    
    /*
     * Show the profile for a given user.
     */
    public function item_delete($id)
    {
        $module = PurchaseOrderItem::find($id);
        if($module == null){
             return response()->json(["message" => 'Record Not Found'],500);
        }
        
        $module->delete();
        $this->update_calculation($module->parent_id);
        
        return response()->json([
            "message" => 'Record Deleted Successfully',
            "data" => ['id' => $id]
        ],200);
    }
    
    
    
     /*
     * Show the profile for a given user.
     */
    public function update_calculation($id)
    {
        $module = PurchaseOrder::find($id);
        if($module){
           
           $subtotal = 0;
           $gtotal = 0;
           foreach($module->items as $item){
             
              $price = $item->price ? $item->price : 0;
              $quantity = $item->quantity ? $item->quantity : 0;
              $cost = $price * $quantity; 
              $item->cost = $cost;
              $discount = $item->discount ? $item->discount : 0;
              $tax = $item->tax ? $item->tax : 0;
              $step = $item->cost + $discount;  
              $total = $step - $tax;  
              $item->total = $total;
              $subtotal += $total; 
              $item->save();
              
           }
           
           $module->subtotal = $subtotal;
           $discount = $module->discount ? $module->discount : 0;
           $tax = $module->tax ? $module->tax : 0;
           $step = $subtotal + $discount;  
           $step = $step - $tax; 
           $module->total = $step;
           $module->save();
           
        }
        
    }


    
    
    /*
     * Remove the specified resource from storage.
     */
    public function action(Request $request)
    {
        if($request->has('idz') && $request->has('action') && $request->has('value')){
            $idz = explode(',',$request->idz);   
            switch ($request->action) {
                case 'delete':
                case 'active':
                    $pp = Product::whereIn('id',$idz)->update(['active' => $request->value]);
                    return response()->json(['message' => "updated"],200);
                    break;
                default:
                break;
            }
        }
        return response()->json(['message' => translate('Error Found')],400);
    }



// action

}