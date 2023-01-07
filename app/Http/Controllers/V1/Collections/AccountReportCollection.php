<?php

namespace App\Http\Controllers\V1\Collections;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\ResourceCollection;

class AccountReportCollection extends ResourceCollection
{
    
     public function toArray($request)
    {
        
    
       return [
           
                'data' => $this->collection->map(function($data) {
                    
                     $subaccount = $data->sub_accounts->map(function($data){
                         return [
                            'id' => (int) $data->id,
                            "title" => $data->title,
                            "balance" => 0,
                        ];
                     });
                    
                    
                    return [
                        'id' => (int) $data->id,
                        "title" => $data->title,
                        "balance" => 0,
                        "sub_accounts" => $subaccount,
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