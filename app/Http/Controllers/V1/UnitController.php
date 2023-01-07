<?php

namespace App\Http\Controllers\V1;

use App\Http\Controllers\Controller;
use App\Models\Unit;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class UnitController extends Controller
{

    /**
     * Show the profile for a given user.
     */
    public function search(Request $request)
    { 

        $data = Unit::query();
        if($request->has('search')){
            $search = $request->search;
            $data->where('title', 'like', '%'.$search.'%');
        }

        $data = $data->limit(5)->get();
        return response()->json([
           "message" => "Get All Units Successfully",
           "data" =>  $data,
        ],200);
    }



    /**
     * Show the profile for a given user.
     */
    public function index(Request $request)
    { 
        $per_page = 10;
        $sort_by = 'date';
        $assending = 'asc';
   
        $data = Unit::query();

        if($request->has('search')){
            $search = $request->search;
            $data->where('title', 'like', '%'.$search.'%')
            ->orWhere('slug', 'like', '%'.$search.'%');
        }

        if($request->has('ascending') && $request->ascending != ''){
            $assending = $request->ascending;
        }

        if($request->has('sort_by') && $request->sort_by != null){
            $sort_by = $request->sort_by;
        }

        if($request->has('per_page') && is_numeric($request->per_page)){
            $per_page = $request->per_page;
        }

        switch ($sort_by) {

            case 'title':
                $data->orderBy('title',$assending);
                break;

            case 'date':
                $data->orderBy('created_at',$assending);
                break;

            case 'id':
                $data->orderBy('id',$assending);
                break;        

            default:

               $data->orderBy('created_at',$assending);
            break;
        }

        // $data = $data->with(['unit','category']);

        return response()->json([
            'query' => '',
            "message" => "Get All Units Successfully",
            "data" =>  $data->paginate($per_page),
        ],200);
    }



     /*
     * Show the profile for a given user.
     */
    public function show($id)
    {
    
        $module = Unit::where('id',$id)->first();
        if(!$module){
            return response()->json(["message" => "Record Not Found"],403);
            
        }
        
        return response()->json([
            "message" => 'Units Get Successfully',
            "data" => $module,
        ],200);
    }
    


    /*
     * Show the profile for a given user.
     */
    public function update(Request $request,$id)
    {

        if($id == 0){
            $module = New Unit();    
        }else{
            $module = Unit::where('id',$id)->first();
            if(!$module){
                return response()->json(["message" => "Record Not Found"],403);
            }
        }

        //-----------Validations

        if(request()->has('slug')){
            request()->merge(['slug' => Str::slug( request()->slug)]);
        } 

        $validations = [
            'title' => ['required','string'],
            'description' => ['nullable','string'],
            'short_name' => ['nullable','string'],
            
        ];

        if($id == 0){
            $validations['slug'] = ['required','unique:units,slug'];
        }else{
            $validations['slug'] = ['required','unique:units,slug,'.$id];
        }

        $validator = Validator::make($request->all(),$validations);
        if($validator->fails()){
            return response()->json([
                "message" => "Validation Failed",
                "data" => ["validations" => $validator->messages()],
            ],403);
        }

        //Validations
        $module->title = $request->title;
        $module->slug = $request->slug;

        if($request->has('short_name')){
            $module->short_name = $request->short_name;
         }
         
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
    public function destroy($id)
    {
        $module = Unit::find($id);
        if($module == null){
             return response()->json(["message" => 'Record Deleted Successfully'],200);
        }
        
        $module->delete();
        return response()->json([
            "message" => 'Product Deleted Successfully',
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
                    $pp = Unit::whereIn('id',$idz)->update(['active' => $request->value]);
                    return response()->json(['message' => "updated"],200);
                    break;
                
                default:
                break;
            }

        }

        return response()->json(['message' => translate('Error Found')],400);
    }

}