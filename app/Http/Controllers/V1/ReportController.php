<?php

namespace App\Http\Controllers\V1;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\Customer;
use App\Models\Vendor;
use App\Models\PurchaseOrder;
use App\Models\PurchaseOrderItem;
use App\Models\SaleOrderItem;
use App\Models\SaleOrder;
use App\Models\AccountCategory;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use App\Http\Controllers\V1\Collections\ProductReportCollection;
use App\Http\Controllers\V1\Collections\LowStockReportCollection;
use App\Http\Controllers\V1\Collections\VendorReportCollection;
use App\Http\Controllers\V1\Collections\CustomerReportCollection;
use App\Http\Controllers\V1\Collections\PurchaseReportCollection;
use App\Http\Controllers\V1\Collections\SaleReportCollection;
use App\Http\Controllers\V1\Collections\AccountReportCollection;

use DB;

class ReportController extends Controller
{

    /*
     * Show the profile for a given user.
     */
    public function product_report(Request $request)
    {
        
       
        $per_page = 10;
        $sort_by = 'date';
        $assending = 'asc';
        $data = Product::query();

        if($request->has('search')){
            $search = $request->search;
            $data->where('title', 'like', '%'.$search.'%')
            ->orWhere('slug', 'like', '%'.$search.'%');
        }
        
        if($request->has('per_page') && $request->per_page != ''){
          $per_page = $request->per_page;            
        }
        // $data = $data->paginate(10);
    
     
        return new ProductReportCollection($data->paginate($per_page));
    }
    
    /*
     * Show the profile for a given user.
     */
    public function product_history_report(Request $request,$id)
    { 
        
        $data = Product::where('id',$id)->first();
        if($data == null){
          return response()->json([
            "message" => 'Record Not Found',
          ],500);
        }
        
        
        
        $purchase = PurchaseOrderItem::where('product_id',$id)->with('pparent')
        ->get()->map(function ($item){
            return [
              'id' => $item->pparent->id, 
              'type' => 'in', 
              'description' => 'Purchse Item', 
              'quantity' => $item->quantity,
              'date' => $item->pparent->date ? $item->pparent->date : null,
            ];
        });
        
        $sale = SaleOrderItem::where('product_id',$id)->with('pparent')
        ->get()->map(function ($item){
            return [
              'id' => $item->pparent->id, 
              'type' => 'out', 
              'description' => 'Sale Item', 
              'quantity' => $item->quantity,
              'date' => $item->pparent->date ? $item->pparent->date : null,
            ];
        });
        
        
        $collection = collect($sale);
        $collection = $collection->merge($purchase);
        $collection = $collection->sortBy('date');
        
        
        $jsonresponse = [];
        $total = 0;
        $sale = 0;
        $purchase = 0;
        foreach($collection as $item){
            
            if($item['type'] == 'in'){
              $total += $item['quantity'];
            }else{
              $total -= $item['quantity'];  
            }
            
            array_push($jsonresponse,[
              'id' => $item['id'], 
              'date' => $item['date'],  
              'description' => $item['description'], 
              'quantity' => $item['quantity'],
              'total' => $total,
            ]);
        }
        
        return response()->json([
        "product" => $data,
        "data" => $jsonresponse,    
        ]);
    }
    
    
    
    /*
     * Show the profile for a given user.
     */
    public function low_stock_report(Request $request)
    { 
        
        $per_page = 10;
        $sort_by = 'date';
        $assending = 'asc';
        $data = Product::query();

        if($request->has('search')){
            $search = $request->search;
            $data->where('title', 'like', '%'.$search.'%')
            ->orWhere('slug', 'like', '%'.$search.'%');
        }
        
        if($request->has('per_page') && $request->per_page != ''){
          $per_page = $request->per_page;            
        }
        
        $data = $data->with(['unit','category','purchase','sale']);
        return new LowStockReportCollection($data->paginate(10));
    }
    
     /*
     * Show the profile for a given user.
     */
    public function vendor_report(Request $request)
    { 
        
        $per_page = 10;
        $sort_by = 'date';
        $assending = 'asc';
        $data = Vendor::query();

        if($request->has('search')){
            $search = $request->search;
            $data->where('name', 'like', '%'.$search.'%')
            ->orWhere('email', 'like', '%'.$search.'%');
        }
        
        if($request->has('per_page') && $request->per_page != ''){
          $per_page = $request->per_page;            
        }
        
        $data = $data->with(['purchase']);
        return new VendorReportCollection($data->paginate(10));
        
    }
    
    
    /*
     * Show the profile for a given user.
     */
    public function customer_report(Request $request)
    { 
        
        $per_page = 10;
        $sort_by = 'date';
        $assending = 'asc';
        $data = Customer::query();

        if($request->has('search')){
            $search = $request->search;
            $data->where('name', 'like', '%'.$search.'%')
            ->orWhere('email', 'like', '%'.$search.'%');
        }
        
        if($request->has('per_page') && $request->per_page != ''){
          $per_page = $request->per_page;            
        }
        
        $data = $data->with(['sale']);
        return new CustomerReportCollection($data->paginate($per_page));
        
    }
    
    
    
    
    /*
     * Show the profile for a given user.
     */
    public function purchase_report(Request $request)
    { 
        
        $per_page = 10;
        $sort_by = 'date';
        $assending = 'asc';
        $data = PurchaseOrder::query();

        if($request->has('search')){
            $search = $request->search;
            $data->where('serial_no', 'like', '%'.$search.'%')
            ->orWhere('ref', 'like', '%'.$search.'%');
        }
        
        if($request->has('per_page') && $request->per_page != ''){
          $per_page = $request->per_page;            
        }
        
        return new PurchaseReportCollection($data->paginate($per_page));
    }
    
    
    
    /*
     * Show the profile for a given user.
     */
    public function sale_report(Request $request)
    { 
        
        $per_page = 10;
        $sort_by = 'date';
        $assending = 'asc';
        $data = SaleOrder::query();

        if($request->has('search')){
            $search = $request->search;
            $data->where('serial_no', 'like', '%'.$search.'%')
            ->orWhere('ref', 'like', '%'.$search.'%');
        }
        
        if($request->has('per_page') && $request->per_page != ''){
          $per_page = $request->per_page;            
        }
        
        return new SaleReportCollection($data->paginate($per_page));
    }
    
    
     /*
     * Show the profile for a given user.
     */
    public function balance_sheet(Request $request)
    { 
        
        $per_page = 10;
        $sort_by = 'date';
        $assending = 'asc';
        $data = AccountCategory::where('parent_id',0)->orderBy('sort');

        if($request->has('search')){
            $search = $request->search;
            $data->where('title', 'like', '%'.$search.'%');
        }
        
        if($request->has('per_page') && $request->per_page != ''){
          $per_page = $request->per_page;            
        }
        
        
        // $data = $data->with('sub_accounts')->get();
        
        // $resData = [];
        
        // foreach($data){
            
        
        // }
        
        
        
        
        
        
        
        
        return response()->json();
        
        // return new AccountReportCollection($data->paginate($per_page));
        
    ?>
        
            <table style="width:400px" >
                  <tr>
                    <td style="text-align:left">Assets</td>
                    <td style="text-align:right">0</td>
                  </tr>
                     <tr style="padding-left:5px;">
                        <td>--- Petty Cash</td>
                        <td style="text-align:right">0</td>
                      </tr>
                      <tr style="padding-left:5px;">
                        <td>--- Inventory</td>
                        <td style="text-align:right">0</td>
                      </tr>
                      <tr style="padding-left:5px;">
                        <td>--- Accounts Receivable</td>
                        <td style="text-align:right">0</td>
                      </tr>
                  <!--Assets-->
                  
                 
                  <tr>
                    <td>Liabilities</td>
                    <td style="text-align:right">0</td>
                  </tr>
                      <tr style="padding-left:5px;">
                        <td>--- Collected Sales Tax</td>
                        <td style="text-align:right">0</td>
                      </tr>
                      <tr style="padding-left:5px;">
                        <td>--- Accounts Payable</td>
                        <td style="text-align:right">0</td>
                      </tr>
                      <tr style="padding-left:5px;">
                        <td>--- Credit Memo</td>
                        <td style="text-align:right">0</td>
                      </tr>
                      <tr style="padding-left:5px;">
                        <td>--- Income Tax</td>
                        <td style="text-align:right">0</td>
                      </tr>
                      <tr style="padding-left:5px;">
                        <td>--- Payroll Tax</td>
                        <td style="text-align:right">0</td>
                      </tr>
                  <!--Liablities-->
                  
                  
            
                  <tr>
                    <td>Expenses</td>
                    <td style="text-align:right">0</td>
                  </tr>
                      <tr style="padding-left:5px;">
                        <td>--- Insurance</td>
                        <td style="text-align:right">0</td>
                      </tr>
                      <tr style="padding-left:5px;">
                        <td>--- Payroll</td>
                        <td style="text-align:right">0</td>
                      </tr>
                      <tr style="padding-left:5px;">
                        <td>--- Rent</td>
                        <td style="text-align:right">0</td>
                      </tr>
                      <tr style="padding-left:5px;">
                        <td>--- Electricity Bills</td>
                        <td style="text-align:right">0</td>
                      </tr>
                       <tr style="padding-left:5px;">
                        <td>--- Gas Bills</td>
                        <td style="text-align:right">0</td>
                      </tr>
                  <!--Expenses-->
                  
                  
                  <tr>
                    <td>Income (Revenue)</td>
                    <td style="text-align:right">0</td>
                  </tr>
                       <tr style="padding-left:5px;">
                        <td>--- Earned Interest</td>
                        <td style="text-align:right">0</td>
                       </tr>
                       <tr style="padding-left:5px;">
                        <td>--- Product Sales</td>
                        <td style="text-align:right">0</td>
                       </tr>
                  <!--Income (Revenue)-->
            
                  <tr>
                    <td>Equity</td>
                    <td style="text-align:right">0</td>
                  </tr>
                       <tr style="padding-left:5px;">
                        <td>--- Retained Earnings</td>
                        <td style="text-align:right">0</td>
                       </tr>
                       <tr style="padding-left:5px;">
                        <td>--- Owner’s Equity</td>
                        <td style="text-align:right">0</td>
                       </tr>
                       <tr style="padding-left:5px;">
                        <td>--- Common Stock</td>
                        <td style="text-align:right">0</td>
                       </tr>
                <!-- Equity -->
                
           </table>
           
        <?php
    }
}