<?php
 
namespace App\Http\Resources\V1\Front;
 
use Illuminate\Http\Resources\Json\ResourceCollection;
 
class FeaturedProductsCollection extends ResourceCollection
{

    /**
     * Transform the resource collection into an array.
     * @return array
     */
    public function toArray($request)
    {
        return [
            'data' => $this->collection,
            'links' => [
                'self' => 'link-value',
            ],
        ];
    }


    /*
     * Get additional data that should be returned with the resource array.
     * @return array
     */
        public function with($request)
        {
            return [
                'meta' => [
                    'key' => 'value',
                ],
            ];
        }

}