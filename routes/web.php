<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
*/

use App\Http\Controllers\Portal\AuthController;
use App\Http\Controllers\Portal\DashboardController;
use App\Http\Controllers\Portal\UserController;



    Route::prefix('admin')->name('admin.')->group(function(){

            Route::get('/logout', [AuthController::class, 'logout'])->middleware('auth')->name('logout');
            Route::get('/login', [AuthController::class, 'login'])->name('login');
            Route::post('/login-submit', [AuthController::class, 'login_submit'])->name('login_submit');
            Route::get('/register', [AuthController::class, 'register'])->name('register');
            Route::post('/register-submit', [AuthController::class, 'register_submit'])->name('register_submit');

            Route::middleware(['auth'])->group(function(){
            
              Route::get('/dashboard',[DashboardController::class,'dashboard'])->name('dashboard');
              
              //Users
              Route::resource('users', UserController::class);
              Route::get('/dashboard',[DashboardController::class,'dashboard'])->name('dashboard');

            // Route::get('login', [AuthController::class, 'login'])->name('login');      
            // Route::get('/admin/login/submit',[DashboardController::class,'login_submit'])->name('admin.login.submit');
        
            });

    });
