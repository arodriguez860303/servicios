<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;

class LoginController extends Controller
{

    use AuthenticatesUsers;
    protected $redirectTo = RouteServiceProvider::HOME;

    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

    public function username()
    {
        return 'nickname';
    }    

    public function authenticate(Request $request)
    {
        $this->validate($request,['nickname'=>'required', 'password'=>'required']);
        $credentials= $request->only('nickname', 'password');
        if (Auth::attempt($credentials+['active' => 1])) {
            // Authentication passed...
            return redirect()->intended('dashboard');
        }
        return redirect('login')
                ->withInput($request->only('nickname'))
                ->withErrors(['error'=>'Los datos proporcionados son incorrectos!']);           
    }    
}
