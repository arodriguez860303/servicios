<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Models\Backend\T_Tramites;
use App\Http\Models\Backend\T_Tramite_Observacion;
use App\Http\Models\Frontend\T_Tramite_Documentacion;
use App\Http\Models\Frontend\T_Tramite_Constancia;
use App\Http\Models\Frontend\P_Examen_Contestaron;
use App\Http\Models\Frontend\P_Respuesta;
use DB;


class AdminController extends Controller
{
    public function __construct() {
        $this->middleware('auth');
    }

    public function index() 
     { 
      return view('backend.admin.index');
     }

    public function index_hospital() 
     { 
      return view('backend.admin.index_hospital');
     }    

    public function eliminar(Request $vrequest)
     {
        $vstatusHTTP=201;
        $vresponse=['icono'=>'warning', 'codigo'=> 0, 'mensaje'=> 'No se pudieron insertar los datos, intente de nuevo.'];
        $vroute_redirect = "";
        $id_tramite = $vrequest->id_tramite;

        //busco si hubieron observaciones
        $observaciones = T_Tramite_Observacion::queryToAllDB(['id_tramite'=>$id_tramite])->get();

        //busco los documentos
        $documentos = T_Tramite_Documentacion::queryToDB(['id_tramite'=>$id_tramite])->get();

        //busco constancia
        $constancia = T_Tramite_Constancia::queryToSearchDB(['id_tramite'=>$id_tramite])->first();

        //busco el examen
        $examen = P_Examen_Contestaron::queryToSearchDB(['id_tramite'=>$id_tramite])->first();

        //Busco el tramite
        $tramite = T_Tramites::find($id_tramite);

        try {
                DB::beginTransaction();

                    //si hay mas de una observacion se eliminan
                    if(count($observaciones) > 0)
                    {
                        foreach ($observaciones as $value) {
                            $obs = T_Tramite_Observacion::find($value->id);
                            $obs->delete();
                            unset($obs);
                        }
                    }

                    //si hay mas de un documento se eliminan
                    if(count($documentos) > 0)
                    {
                        foreach ($documentos as $value) {
                            $doc = T_Tramite_Documentacion::find($value->id);
                            $doc->delete();
                            unset($doc);
                        }
                    }

                    //Verifico si hay constancia
                    if (!empty($constancia))
                    {
                        $constancia->delete();
                        unset($constancia);
                    }

                    //Verifico si hay un examen
                    if (!empty($examen))
                    {
                        $examen->delete();                        

                        $respuestas = P_Respuesta::queryToDB(['id_examen_contestaron'=>$examen->id])->get();

                        if(count($respuestas) > 0)
                        {
                            foreach ($respuestas as $value) {
                                $res = P_Respuesta::find($value->id);
                                $res->delete();
                                unset($res);
                            }
                        }
                        unset($examen, $respuestas);
                    }

                	//Elimino el tramite                	
                    $tramite->delete();                    
                    unset($t_tramite);

                    $vresponse=['icono'=>'success', 'codigo'=> 1, 'mensaje'=> 'El trámite fue eliminado satisfactoriamente.'];

                DB::commit();
            }
        catch ( Exception $e ) 
            {
                DB::rollback();
                $vstatusHTTP=500;
                $vrespuesta=[
                    'icono'=>'danger', 
                    'codigo'=> -1, 
                    'message'=> 'Error en el servidor, verifiquelo con el administrador, '. $vexception->getMessage()
                ];
            }

        return response()->json($vresponse, $vstatusHTTP, [], JSON_HEX_APOS|JSON_HEX_QUOT);
     }

    public function eliminar_hospital(Request $vrequest)
     {
        $vstatusHTTP=201;
        $vresponse=['icono'=>'warning', 'codigo'=> 0, 'mensaje'=> 'No se pudieron insertar los datos, intente de nuevo.'];
        $vroute_redirect = "";
        $id_tramite = $vrequest->id_tramite;

        //busco si hubieron observaciones
        $observaciones = T_Tramite_Observacion::queryToAllDB(['id_tramite'=>$id_tramite])->get();

        //busco los documentos
        $documentos = T_Tramite_Documentacion::queryToDB(['id_tramite'=>$id_tramite])->get();

        //busco constancia
        $constancia = T_Tramite_Constancia::queryToSearchDB(['id_tramite'=>$id_tramite])->first();

        //busco el examen
        $examen = P_Examen_Contestaron::queryToSearchDB(['id_tramite'=>$id_tramite])->first();

        //Busco el tramite
        $tramite = T_Tramites::find($id_tramite);

        try {
                DB::beginTransaction();

                    //si hay mas de una observacion se eliminan
                    if(count($observaciones) > 0)
                    {
                        foreach ($observaciones as $value) {
                            $obs = T_Tramite_Observacion::find($value->id);
                            $obs->delete();
                            unset($obs);
                        }
                    }

                    //si hay mas de un documento se eliminan
                    if(count($documentos) > 0)
                    {
                        foreach ($documentos as $value) {
                            $doc = T_Tramite_Documentacion::find($value->id);
                            $doc->delete();
                            unset($doc);
                        }
                    }

                    //Verifico si hay constancia
                    if (!empty($constancia))
                    {
                        $constancia->delete();
                        unset($constancia);
                    }

                    //Verifico si hay un examen
                    if (!empty($examen))
                    {
                        $examen->delete();                        

                        $respuestas = P_Respuesta::queryToDB(['id_examen_contestaron'=>$examen->id])->get();

                        if(count($respuestas) > 0)
                        {
                            foreach ($respuestas as $value) {
                                $res = P_Respuesta::find($value->id);
                                $res->delete();
                                unset($res);
                            }
                        }
                        unset($examen, $respuestas);
                    }

                    //Elimino el tramite                    
                    $tramite->delete();                    
                    unset($t_tramite);

                    $vresponse=['icono'=>'success', 'codigo'=> 1, 'mensaje'=> 'El trámite fue eliminado satisfactoriamente.'];

                DB::commit();
            }
        catch ( Exception $e ) 
            {
                DB::rollback();
                $vstatusHTTP=500;
                $vrespuesta=[
                    'icono'=>'danger', 
                    'codigo'=> -1, 
                    'message'=> 'Error en el servidor, verifiquelo con el administrador, '. $vexception->getMessage()
                ];
            }

        return response()->json($vresponse, $vstatusHTTP, [], JSON_HEX_APOS|JSON_HEX_QUOT);
     }
}
