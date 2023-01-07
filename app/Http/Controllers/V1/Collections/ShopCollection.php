<?php

namespace App\Http\Controllers\V1\Collections;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\ResourceCollection;

class ShopCollection extends ResourceCollection
{
    
     public function toArray($request)
    {
        
       return [
           
          'data' => [
                  
                  'data' => $this->collection->map(function($data){
                    
                        return [
                            
                            "id" => $data->id,
                            "title" => $data->title,
                            "slug" => $data->slug,
                            "description" => $data->description, 
                            "sku" => $data->sku,
                            "price" => $data->price,
                            "short_description" =>$data->short_description,
                            "image" => $data->image,
                            "images" => [],
                            "featured" => $data->featured,
                            "active" => $data->active,
                            "category_id" => $data->category,
                            "brand_id" => $data->brand,
                            "store" => $data->store,
                            "tags" => $data->tag,
                            "unit_id" => $data->unit,
                            "meta_title" =>$data->meta_title,
                            "low_stock" => $data->low_stock,
                            "meta_description" => $data->meta_description,
                            "created_at" => $data->created_at,
                            "updated_at" => $data->updated_at,
                      ];
                    
                    
                    })->reject(function($value){
                        // dd($value);
                        // if($value['purchase'] != 0 && $value['sale']){
                        //     return true;
                        // }
                    })
            ]
           
        ];
         
    }

    public function with($request)
    {
        return [
            'success' => true,
            'status' => 200
        ];
    }

}