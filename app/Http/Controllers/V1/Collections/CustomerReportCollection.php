<?php

namespace App\Http\Controllers\V1\Collections;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\ResourceCollection;

class CustomerReportCollection extends ResourceCollection
{
    
     public function toArray($request)
    {
        
       return [
           
            'data' => $this->collection->map(function($data) {
                
                $subtotal = 0;
                $discount = 0;
                $tax = 0;
                $total = 0;
            
                foreach($data->sale as $item){
                    $subtotal += $item->subtotal;
                    $discount += $item->discount;
                    $tax += $item->tax;
                    $total += $item->total;
                }
                
                
                return [
                    'id' => (int) $data->id,
                    'name' => $data->name,
                    'email' => $data->email,
                    'subtotal' => $subtotal,
                    'discount' => $discount,
                    'tax' => $tax,
                    'total' => $total,
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