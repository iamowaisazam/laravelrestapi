<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
| Here is where you can register API routes for your application. These
*/


    //Registration
    Route::prefix('admin/auth')->namespace('App\Http\Controllers\V1\Admin')->group(function(){

        //Registration
        Route::get('/social-login','LoginController@social_login');  
        Route::post('/register','RegisterController@register');
        Route::post('/login','LoginController@login');

        Route::get('/resend/email-verification/{email}','LoginController@resend_email_verification');
        Route::get('/verify-email/{email}/token/{token}','LoginController@verify_email');

        //Password Reset
        Route::get('/password-reset-request/{email}','PasswordResetController@password_reset_request');
        Route::get('/password-reset-verify/{code}','PasswordResetController@password_reset_verify');
        Route::post('/password-reset/{id}','PasswordResetController@password_reset');
        
    });


    // Admin Panel
    Route::prefix('admin')->namespace('App\Http\Controllers\V1')->group(function () {
        
        //Profile
        Route::get('/profile','ProfileController@profile')->name('profile');
        Route::get('/logout', 'ProfileController@logout')->name('logout');

        //units Management  
        Route::get('/units/action','UnitController@action');
        Route::get('/units/search','UnitController@search');
        Route::apiResource('units','UnitController');
        
        //Products Management  
        Route::get('/products/action','ProductController@action');
        Route::get('/products/search','ProductController@search');
        Route::apiResource('products','ProductController');
      
        //Categories Management  
        Route::get('/categories/action','CategoryController@action');
        Route::get('/categories/search','CategoryController@search');
        Route::apiResource('categories','CategoryController');

        //Brands Management  
        Route::get('/brands/list','BrandController@list');
        Route::apiResource('brands','BrandController');
        
        //Customers Management  
        Route::get('/customers/action','CustomerController@action');
        Route::get('/customers/search','CustomerController@search');
        Route::apiResource('customers','CustomerController');
        
        //Vendors Management  
        Route::get('/vendors/action','VendorController@action');
        Route::get('/vendors/search','VendorController@search');
        Route::apiResource('vendors','VendorController');
        
        //Purchase Orders Management  
        Route::get('/purchase-orders/action','PurchaseOrderController@action');
        Route::get('/purchase-orders/search','PurchaseOrderController@search');
        Route::post('/purchase-orders/item/add/{id}','PurchaseOrderController@item_add');
        Route::get('/purchase-orders/item/delete/{id}','PurchaseOrderController@item_delete');
        Route::apiResource('purchase-orders','PurchaseOrderController');
        
        //Sale Orders Management  
        Route::get('/sale-orders/action','SaleOrderController@action');
        Route::get('/sale-orders/search','SaleOrderController@search');
        Route::post('/sale-orders/item/add/{id}','SaleOrderController@item_add');
        Route::get('/sale-orders/item/delete/{id}','SaleOrderController@item_delete');
        Route::apiResource('sale-orders','SaleOrderController');
        
        //Accounts Management  
        Route::get('/accounts/action','AccountController@action');
        Route::get('/accounts/search','AccountController@search');
        Route::apiResource('accounts','AccountController');
        
        //Accounts Management  
        Route::get('/transactions/action','TransactionController@action');
        Route::get('/transactions/search','TransactionController@search');
        Route::apiResource('transactions','TransactionController');
        
        
        //Account Categories Management  
        // Route::get('/account-categories/action','AccountCategoryController@action');
        Route::get('/account-categories/search','AccountCategoryController@search');
        // Route::apiResource('account-categories','AccountCategoryController');
        
        
        //Reports
        Route::get('/reports/product-report','ReportController@product_report');
        Route::get('/reports/product-history-report/{id}','ReportController@product_history_report');
        Route::get('/reports/low-stock-report','ReportController@low_stock_report');
        Route::get('/reports/customer-report','ReportController@customer_report');
        Route::get('/reports/vendor-report','ReportController@vendor_report');
        Route::get('/reports/sale-report','ReportController@sale_report');
        Route::get('/reports/purchase-report','ReportController@purchase_report');
        Route::get('/reports/balance-sheet','ReportController@balance_sheet');
        
    
        //Files Upload
        Route::post('filemanagers/update/{id}', 'FileManagerController@update');
        Route::get('filemanagers/file/{id}', 'FileManagerController@get');
        Route::post('filemanagers/store', 'FileManagerController@store');
        Route::get('filemanagers/delete/{id}', 'FileManagerController@delete');
        Route::get('filemanagers', 'FileManagerController@index');
        
    });



    //Front
    Route::namespace('App\Http\Controllers\V1')->group(function () {
        
        //Home
        Route::get('/latest-products','HomeController@latest_products');
        Route::get('/featured-products','HomeController@featured_products');
        Route::get('/popular-products', 'HomeController@popular_products');
        Route::get('/featured-categories','HomeController@featured_categories');
        Route::get('/featured-brands', 'HomeController@featured_brands');
        
        // Shop
        Route::get('/stores','ShopController@stores');
        Route::get('/brands','ShopController@brands');
        Route::get('/tags','ShopController@tags');
        Route::get('/categories', 'ShopController@categories');
    
        Route::get('/products', 'ShopController@all_products');
        Route::get('/product-details/{id}','ShopController@product_details');
        Route::get('/product-reviews/{id}', 'ShopController@reviews');
        Route::get('/product-reviews/add/{id}', 'ShopController@add_reviews');
        
        // Reviews
                
    });

    Route::fallback(function() {
        return response()->json([
            "message" => 'Invaled Route',
         ],404);
    });