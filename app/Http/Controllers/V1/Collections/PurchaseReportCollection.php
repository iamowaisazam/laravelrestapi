<?php

namespace App\Http\Controllers\V1\Collections;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\ResourceCollection;

class PurchaseReportCollection extends ResourceCollection
{
    
     public function toArray($request)
    {
        
       return [
           
            'data' => $this->collection->map(function($data) {
                
                

                return [
                    'id' => (int) $data->id,
                    'vendor' => $data->vendor ? $data->vendor : null,
                    'date' => $data->date,
                    'serial_no' => $data->serial_no,
                    'ref' => $data->ref,
                    'subtotal' => $data->subtotal,
                    'discount' => $data->discount,
                    'tax' => $data->tax,
                    'total' => $data->total,
                ];
                
                
            })->reject(function ($value) {
                
                // dd($value);
                // if($value['purchase'] != 0 && $value['sale']){
                //     return true;
                // }
                
            })
        
        ];
    }

    // public function with($request)
    // {
    //     return [
    //         'success' => true,
    //         'status' => 200
    //     ];
    // }

}