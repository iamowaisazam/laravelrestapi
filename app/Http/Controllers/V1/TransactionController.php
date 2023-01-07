<?php

namespace App\Http\Controllers\V1;

use App\Http\Controllers\Controller;
use App\Models\Account;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use App\Models\Transaction;

class TransactionController extends Controller
{

    
    /**
     * Show the profile for a given user.
     */
    public function search(Request $request)
    { 

        $data = Transaction::query();
        if($request->has('search')){
            $search = $request->search;
            $data->where('description', 'like', '%'.$search.'%');
        }

        // $data = $data->with('transactions');
        $data = $data->limit(5)->get();
        return response()->json([
          "message" => "Get All Records Successfully",
          "data" =>  $data,
        ],200);
    }


    /**
     * Show the profile for a given user.
     */
    public function index(Request $request)
    { 
        $per_page = 10;
        $sort = 'date';
        $assending = 'asc';
        $data = Transaction::query()->with(['sender','receiver']);

        if($request->has('search')){
            $search = $request->search;
            $data->where('description', 'like', '%'.$search.'%');
        }

        if($request->has('ascending')){
            $assending = $request->ascending;
        }

        if($request->has('sort')){
            $sort = $request->sort;
        }

        if($request->has('per_page') && is_numeric($request->per_page)){
            $per_page = $request->per_page;
        }

        switch ($sort_by) {
            default:
               $data->orderBy('date',$assending);
            break;
        }

        return response()->json([
            "message" => "Get All Records Successfully",
            "data" =>  $data->paginate($per_page),
        ],200);
    }



    /*
     * Show the profile for a given user.
     */
    public function update(Request $request,$id)
    {

        if($id == 0){
            $module = New Transaction();    
        }else{
            $module = Transaction::where('id',$id)->first();
            if(!$module){
                return response()->json(["message" => "Record Not Found"],403);
            }
        }

        $validations = [
            'sender_id' => ['required'],
            'receiver_id' => ['required'],
            'amount' => ['required'],
        ];

        if($id == 0){
            // $validations['slug'] = ['required','unique:categories,slug'];
        }else{
            // $validations['slug'] = ['required','unique:categories,slug,'.$id];
        }

        $validator = Validator::make($request->all(),$validations);
        if($validator->fails()){
            return response()->json([
                "message" => "Validation Failed",
                "data" => ["validations" => $validator->messages()],
            ],403);
        }

        //Validations
        $module->account_id = $request->sender_id;
        $module->received_at = $request->receiver_id;
        $module->description = $request->description;
        $module->amount = $request->amount;
        $module->type = $request->type;
        $module->date = $request->date;
        if($request->has('active')){
            $module->active = $request->active;
        }
        $module->save();

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
    public function show($id)
    {
        
        $module = Transaction::where('id',$id)->first();
        $module->sender->pparent->parent_account;
        $module->receiver->pparent->parent_account;
        
        if(!$module){
            return response()->json(["message" => "Record Not Found"],403);
        }
        
        return response()->json([
            "message" => 'Get Record Successfully',
            "data" => $module,
        ],200);
    }
    



    /**
     * Show the profile for a given user.
     */
    public function destroy($id)
    {
        $module = Transaction::where('id',$id)->first();
        if(!$module){
            return response()->json(["message" => "Record Not Found"],403);
        }
        
        $module->delete();
      
        return response()->json([
            "message" => 'Record Deleted Successfully',
            "data" => ['id' => $id]
        ],200);
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
                    $pp = Transaction::whereIn('id',$idz)->update(['active' => $request->value]);
                    return response()->json(['message' => "updated"],200);
                    break;
                default:
                break;
                
            }
            
        }

        return response()->json(['message' => 'Error Found'],400);
    }



}