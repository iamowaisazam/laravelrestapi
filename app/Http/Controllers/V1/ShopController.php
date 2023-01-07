<?php

namespace App\Http\Controllers\V1;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Category;
use App\Models\Brand;
use App\Models\Vendor;
use App\Models\ProductReview;
use DB;
use App\Models\ProductTag;
use App\Http\Controllers\V1\Collections\ShopCollection;

class ShopController extends Controller
{
    
    public function tags(Request $request)
    {
        
        $data = ProductTag::orderBy('created_at','desc')->get();
        return response()->json([
           "message" => '',
           "data" => $data,
        ],200);
        
    }
    
    public function stores(Request $request)
    {
        
        $data = Vendor::with('products')->orderBy('created_at','desc')->get();
        return response()->json([
           "message" => '',
           "data" => $data,
        ],200);
    }
    
    
    public function brands(Request $request)
    {
        
        $data = Brand::with('products')->orderBy('created_at','desc')->get();
        return response()->json([
           "message" => '',
           "data" => $data,
        ],200);
    }
    
    
     public function categories(Request $request)
    {
        
        $data = [];
        $categories = Category::where('parent_id',0)->with('children')->orderBy('created_at','desc')->get();
        
        foreach($categories as $category){
            
            $children = [];
            foreach($category->children as $child){
                 array_push($children,[
                    "id" => $child->id,
                    "title" => $child->title,
                    "count" => count(array_unique($child->product_count())),
                    "slug" => $child->slug,
                    "description" => $child->description,
                    "image" => $child->image,
                  ]);
            }
            
            array_push($data,[
                "id" => $category->id,
                "title" => $category->title,
                "count" => count(array_unique($category->product_count())),
                "slug" => $category->slug,
                "description" => $category->description,
                "image" => $category->image,
                "children" =>$children,
            ]);
        }
        
        return response()->json([
           "message" => '',
           "data" => $data,
        ],200);
        
    }
    
    

    public function all_products(Request $request)
    {
        
        $data = Product::query();
        
        if($request->has('search') && $request->search != ''){
            $search = $request->search;
            $data = $data->where('title', 'like', '%'.$search.'%');
        }
        
        if($request->has('brand') && $request->brand != ''){
            $brand_slugs = explode(',',$request->brand);
            $brands = Brand::whereIn('slug',$brand_slugs)->pluck('id')->toArray();
            $data = $data->whereIn('brand_id',$brands);
        }
        
        if($request->has('store') && $request->store != ''){
            $store_slug = explode(',',$request->store);
            $stores = Vendor::whereIn('slug',$store_slug)->pluck('id')->toArray();
            $data = $data->whereIn('vendor_id',$stores);
        }
        
        if($request->has('tag') && $request->tag != ''){
            $tag_slug = explode(',',$request->tag);
            $tags = ProductTag::whereIn('slug',$tag_slug)->pluck('id')->toArray();
            $idz = DB::table('prdouct_tag_relation')->whereIn('tag_id',$tags)->pluck('product_id')->toArray();
            $data = $data->whereIn('id',$idz);
        }
        
        if($request->has('category') && $request->category != ''){
            $category_slug = explode(',',$request->category);
            $category = Category::whereIn('slug',$category_slug)->get();
            
            $idz = [];
            foreach($category as $cat){
                
                if($cat->parent_id == 0){
                    foreach ($cat->children()->get() as $value){  
                        $pp = Product::where('category_id',$value->id)->get();
                        foreach($pp as $p){
                         array_push($idz,$p->id);    
                        }
                    }
                }else{
                    $pp = Product::where('category_id',$cat->id)->get();
                    foreach($pp as $p){
                       array_push($idz,$p->id);    
                    }
                }
            }
            $data = $data->whereIn('id',$idz);
        }
        
        if($request->has('price') && $request->price != null){
            
            $price = explode(',',$request->price);
            if(isset($price[0])){
                $data = $data->where('price', '>=', $price[0]);     
            }
            
            if(isset($price[1])){
                $data = $data->where('price', '<=', $price[1]);
            }
        }
        
        
        if($request->has('sort') && $request->sort != ''){
            
            switch($request->sort){
              case "popular":
                $data = $data ->orderBy('id','asc');
                break;
              case "rating":
                $data = $data ->orderBy('id','asc');
                break;
              case "price_low_to_high":
                $data = $data ->orderBy('price','asc');
                break;
              case "price_high_to_low":
                $data = $data ->orderBy('price','desc');
                break;    
              default:
                  $data = $data ->orderBy('created_at','desc');
            }
            
        }
        
        $data = $data->with(['brand','category']);
        
    
        return new ShopCollection($data->paginate(4));
        
        dd($collection);

        return response()->json([
          "message" => '',
          "data" => $collection,
        ],200);
        
    }


    public function product_details($slug)
    {

        $data = Product::where('slug',$slug)->with(['brand','category'])->first();
        if(! $data){
            return response()->json([
                "message" => 'Not Found',
             ],400);
        }

        return response()->json([
           "message" => '',
           "data" => $data,
        ],200);
    }
    
    
    public function reviews($id)
    {
        
        $data = Product::where('id',$id)->first();
        if(! $data){
            return response()->json([
                "message" => 'Not Found',
             ],400);
        }
        $data = ProductReview::where('product_id',$id)->get();
        
        return response()->json([
           "message" => '',
           "data" => $data,
        ],200);
        
    }
    
    
    public function add_reviews(Request $request,$id)
    {
        
        $data = Product::where('id',$id)->first();
        if(! $data){
            return response()->json([
                "message" => 'Not Found',
             ],400);
        }

        $review = ProductReview::create([
            "user_id" => 1,
            "product_id" =>$data->id,
            "description" => $request->description,
            "rating" => $request->rating,
            "status" => 1,
        ]);
        
        return response()->json([
           "message" => 'Review Added',
           "data" => $review,
        ],200);
        
    }
    
    
}