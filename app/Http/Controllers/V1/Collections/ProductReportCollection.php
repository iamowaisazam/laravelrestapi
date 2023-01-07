<?php

namespace App\Http\Controllers\V1\Collections;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\ResourceCollection;

class ProductReportCollection extends ResourceCollection
{
    
     public function toArray($request)
    {
        
       return [
           
            'data' => $this->collection->map(function($data) {
                
                $stock = 0;
                $sale = 0;
                $purchase = 0;
                
                foreach($data->purchase as $item){
                   $purchase += $item->quantity;
                }
                
                foreach($data->sale as $item){
                    $sale += $item->quantity;
                }
                
                $stock = $purchase - $sale;
                
                return [
                    'id' => (int) $data->id,
                    'name' => $data->title,
                    'slug' => $data->slug,
                    'unit' => $data->unit ? $data->unit : null ,
                    'category' => $data->category ? $data->category : null ,
                    'purchase' => $purchase,
                    'sale' => $sale,
                    'total' => $stock,
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