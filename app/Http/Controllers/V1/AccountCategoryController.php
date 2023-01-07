<?php

namespace App\Http\Controllers\V1;

use App\Http\Controllers\Controller;
use App\Models\AccountCategory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class AccountCategoryController extends Controller
{

    /**
     * Show the profile for a given user.
     */
    public function search(Request $request)
    { 

        $data = AccountCategory::query()->where('parent_id',0);
        // if($request->has('search')){
        //     $search = $request->search;
        //     $data->where('title', 'like', '%'.$search.'%');
        // }

        $data = $data->with('sub_accounts');
        $data = $data->get();
        return response()->json([
           "message" => "Get All Records Successfully",
           "data" =>  $data,
        ],200);
    }


    // /**
    //  * Show the profile for a given user.
    //  */
    // public function index(Request $request)
    // { 
    //     $per_page = 10;
    //     $sort = 'date';
    //     $assending = 'asc';

    //     $data = AccountCategory::query()->with('pparent.parent_account');

    //     if($request->has('search')){
    //         $search = $request->search;
    //         $data->where('title', 'like', '%'.$search.'%');
    //     }

    //     if($request->has('ascending')){
    //         $assending = $request->ascending;
    //     }

    //     if($request->has('sort')){
    //         $sort = $request->sort;
    //     }

    //     if($request->has('per_page') && is_numeric($request->per_page)){
    //         $per_page = $request->per_page;
    //     }

    //     switch ($sort_by) {
    //         default:
    //           $data->orderBy('title',$assending);
    //         break;
    //     }

    //     return response()->json([
    //         "message" => "Get All Records Successfully",
    //         "data" =>  $data->paginate($per_page),
    //     ],200);
    // }



    // /*
    //  * Show the profile for a given user.
    //  */
    // public function update(Request $request,$id)
    // {

    //     if($id == 0){
    //         $module = New Account();    
    //     }else{
    //         $module = Account::where('id',$id)->first();
    //         if(!$module){
    //             return response()->json(["message" => "Record Not Found"],403);
    //         }
    //     }

    //     $validations = [
    //         'title' => ['required','string'],
    //         'description' => ['nullable','string'],
    //     ];

    //     if($id == 0){
    //         // $validations['slug'] = ['required','unique:categories,slug'];
    //     }else{
    //         // $validations['slug'] = ['required','unique:categories,slug,'.$id];
    //     }

    //     $validator = Validator::make($request->all(),$validations);
    //     if($validator->fails()){
    //         return response()->json([
    //             "message" => "Validation Failed",
    //             "data" => ["validations" => $validator->messages()],
    //         ],403);
    //     }

    //     //Validations
    //     $module->title = $request->title;
    //     $module->description = $request->description;
    //     $module->parent_id = $request->parent_id;
    //     if($request->has('active')){
    //         $module->active = $request->active;
    //     }
    //     $module->save();

    //     //Response
    //     $message = $id ? 'Record Updated Successfully' : 'Record Created Successfully';
    //     return response()->json([
    //         "message" => $message,
    //         "data" => ['id' => $module->id]
    //     ],200);
    // }

    //  /*
    //  * Show the profile for a given user.
    //  */
    // public function show($id)
    // {
        
    //     $module = Account::where('id',$id)->first();
    //     if(!$module){
    //         return response()->json(["message" => "Record Not Found"],403);
    //     }
        
    //     return response()->json([
    //         "message" => 'Get Record Successfully',
    //         "data" => $module,
    //     ],200);
    // }
    



    // /**
    //  * Show the profile for a given user.
    //  */
    // public function destroy(Category $category)
    // {
    //     $module = Account::where('id',$id)->first();
    //     if(!$module){
    //         return response()->json(["message" => "Record Not Found"],403);
    //     }
        
    //     $module->delete();
      
    //     return response()->json([
    //         "message" => 'Record Deleted Successfully',
    //         "data" => ['id' => $id]
    //     ],200);
    // }
    
    
    // /*
    //  * Remove the specified resource from storage.
    //  */
    // public function action(Request $request)
    // {
    //     if($request->has('idz') && $request->has('action') && $request->has('value')){
            
    //         $idz = explode(',',$request->idz);   
    //         switch ($request->action) {
            
    //             case 'delete':
                    

    //             case 'active':
    //                 $pp = Account::whereIn('id',$idz)->update(['active' => $request->value]);
    //                 return response()->json(['message' => "updated"],200);
    //                 break;
    //             default:
    //             break;
                
    //         }
            
    //     }

    //     return response()->json(['message' => translate('Error Found')],400);
    // }



}