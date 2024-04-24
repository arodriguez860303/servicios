<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Models\Backend\T_Tramites;
use Illuminate\Support\Facades\Crypt;

class ValidacionController extends Controller
{	    
    public function getValida($id)
    {        
    	$_id =  Crypt::decrypt($id);
        $tramite = T_Tramites::queryToValida(['id_tramite'=>$_id])->first();

        return view('validaciones.constancia', ['tramite'=>$tramite]);
    }  

   	public function getValidaDiploma($id)
    {        
        $_id =  Crypt::decrypt($id);
        $tramite = T_Tramites::queryToValidaDiploma(['id_tramite'=>$_id])->first();

        return view('validaciones.diploma', ['tramite'=>$tramite]);
    }   
}