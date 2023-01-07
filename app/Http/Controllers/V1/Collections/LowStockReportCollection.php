<?php

namespace App\Http\Controllers\V1\Collections;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\ResourceCollection;

class LowStockReportCollection extends ResourceCollection
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
                $low_stock = $data->low_stock ? $data->low_stock : 0; 
        
                if($stock >= $low_stock) {
                    return false;
                }
                
                return [
                    'id' => (int) $data->id,
                    'name' => $data->title,
                    'slug' => $data->slug,
                    'unit' => $data->unit ? $data->unit : null ,
                    'category' => $data->category ? $data->category : null ,
                    'total' => $stock,
                ];
                
                
            })->reject(function ($value) {
                if($value == false){
                    return true;
                }
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