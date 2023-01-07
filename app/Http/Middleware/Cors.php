<?php
 
namespace App\Http\Middleware;
 
use Closure;
 
class Cors
{
    
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        // if ($request->input('token') !== 'my-secret-token') {
            // return redirect('home');
        // }
        
        dd('test');
 
        return $next($request);
    }
}