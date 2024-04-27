<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use Auth;
use DB;

class HomeController extends Controller
{
    public function __construct() {
        $this->middleware('auth');
    }

    public function index() 
    { 
       
        if(Auth::User()->hasRole(['admin']))
        {
            return redirect()->route('dashboard.index'); 
        }else if(Auth::User()->hasRole(['usuario']))
        {
            return redirect()->route('mis-tramites.index');
        }else if(Auth::User()->hasRole(['hospital']))
        {
            return redirect()->route('mis-tramites-hospital.index');
        }else if(Auth::User()->hasRole(['ventanilla']))
        {
            return redirect()->route('tramites.proceso');
        }
            
    }

    public function cambiar_tema(Request $vrequest)
    {
        /**
         * 01 de Febrero de 2023
         * Metodo para cambiar el tema.
         * */

        $vstatusHTTP=201;        
        $vresponse=['icono'=>'warning', 'codigo'=> 0, 'mensaje'=> 'No se pudo cambiar el tema. intente de nuevo.'];        
              
        try {
            DB::beginTransaction();

                $vfluser = User::find(Auth::user()->id);
                $vdatos['theme']   = $vrequest->input('tema');
                $vfluser->fill($vdatos)->save();

                unset($vfluser);

                $vresponse=['icono'=>'success', 'codigo'=> 1, 'mensaje'=> 'El tema fue cambiado satisfactoriamente.'];               

            DB::commit();
        }
        catch (Exception $vexception) {
            DB::rollBack();
            $vstatusHTTP=500;
            $vresponse = [
                'icono'  =>'danger', 
                'codigo' => -1, 
                'message'=> 'Error en el servidor, verifiquelo con el administrador, '. $vexception->getMessage()               
            ];
        }       
            
        return response()->json($vresponse, $vstatusHTTP, [], JSON_HEX_APOS|JSON_HEX_QUOT);
    }

    public function modo_oscuro()
    {
        /**
         * 01 de Febrero de 2023
         * Metodo para cambiar el tema a modo oscuro.
         * */

        $vstatusHTTP=201;        
        $vresponse=['icono'=>'warning', 'codigo'=> 0, 'mensaje'=> 'No se pudo cambiar el modo oscuro. intente de nuevo.' ];        
              
        try {
            DB::beginTransaction();

                $vfluser = User::find(Auth::user()->id);

                if($vfluser->dark_mode ==1)
                    $vdatos['dark_mode']   = 0;
                else
                    $vdatos['dark_mode']   = 1;
                
                $vfluser->fill($vdatos)->save();

                unset($vfluser);

                $vresponse=['icono'=>'success', 'codigo'=> 1, 'mensaje'=> 'El modo oscuro fue cambiado satisfactoriamente.' ];               

            DB::commit();
        }
        catch (Exception $vexception) {
            DB::rollBack();
            $vstatusHTTP=500;
            $vresponse = [
                'icono'  =>'danger', 
                'codigo' => -1, 
                'message'=> 'Error en el servidor, verifiquelo con el administrador, '. $vexception->getMessage()               
            ];
        }       
            
        return response()->json($vresponse, $vstatusHTTP, [], JSON_HEX_APOS|JSON_HEX_QUOT);
    }   
}
