<?php
namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Models\Backend\T_Tramites;
use App\Http\Models\Frontend\T_Tramite_Documentacion;
use App\Http\Models\Frontend\P_Respuesta;
use App\Http\Models\Backend\T_Tramite_Observacion;

// use App\Http\Models\Frontend\T_Tramite_Constancia;
// use App\Http\Models\Frontend\P_Examen_Contestaron;
// use App\Http\Classes\FormatDate;
use Auth;
use DB;

class TramitesHospitalController extends Controller
{
    private $route='tramites-hospital';
    
    public function __construct()
     {
        view()->share('title', 'Tramites hospital');
        view()->share('current_route', $this->route);       
     }

    public function getResults(Request $vrequest)
     {
        // Descripción: Función para consultar todas las solicitudes
        // Creación: Lunes, 25 de Septiembre de 2023
        // Versión: 1.0.0

        $vHTTPCode=200;
        $vresponse=['codigo'=>1, 'mensaje'=>'Exito', 'icono'=>'success'];
        try {
            $vfilter=array();
            switch ($vrequest->method) {
                case 'show':
                    $vresponse['respuesta']=T_Tramites::queryToHospitalDB(['id'=>$vrequest->id])->first();
                  break; 
                case 'get':
                    $filtro=array();
                    $filtro['id_status'] = $vrequest->id_status;
                    $filtro['id_usuario_r'] = Auth::User()->id;

                    $vresponse['respuesta']=T_Tramites::queryToHospitalDB($filtro)->get();
                  break;  
                case 'admin':
                    $filtro=array();                   
                    $vresponse['respuesta']=T_Tramites::queryToHospitalDB($filtro)->get();
                  break;              
                default:
                    $vresponse=['codigo'=>0, 'mensaje'=>'Lo sentimos! Metodo no definido.', 'icono'=>'warning'];
                  break;
            }
        }
        catch (Exception $vexception) {
            $vHTTPCode=500;
            $vresponse=[
                'codigo'=>-1,
                'mensaje'=>'Error en el servidor! Comuniquese con su administrador '. $vexception->getMessage(),
                'icono'=>'danger'
            ];
        }
        return response()->json($vresponse, $vHTTPCode);
     }

    public function index_proceso() 
     {
        return view('backend.hospital.proceso.index');
     }

    public function index_observado() 
     {
        return view('backend.hospital.observado.index');
     }

    public function index_solventado() 
     {
        return view('backend.hospital.solventado.index');
     }

    public function index_aceptado() 
     {
        return view('backend.hospital.aceptados.index');
     }

    public function index_concluido() 
     {
        return view('backend.hospital.concluidos.index');
     }

    public function index_cancelado() 
     {
        return view('backend.hospital.cancelados.index');
     }

    public function show($id) 
     {
        $dato = T_Tramites::find($id);
        return view('backend.hospital.show', ['id_status'=>$dato->id_status, 'id_tramite' => $id]);
     }

    public function datos_generales(Request $vrequest)
     {
        // Descripción: Función para consultar los datos generales del tramite
        // Creación: Lunes, 25 de Septiembre de 2023
        // Versión: 1.0.0

        $vHTTPCode=200;
        $vresponse=['codigo'=>1, 'mensaje'=>'Exito', 'icono'=>'success'];
        try {
            $vfilter=array();
            switch ($vrequest->method) {
                case 'show':
                    $vresponse['respuesta']=T_Tramites::queryToGralHospitalDB(['id_tramite'=>$vrequest->id_tramite])->first();
                    $observados = count(T_Tramite_Documentacion::queryToDocumentacionDB(['id_tramite'=>$vrequest->id_tramite, 'id_status_obs_solv'=>8])->get());                    
                    $tramite = T_Tramites::find($vrequest->id_tramite);
                    $vresponse['total_observados'] = $observados;
                    $vresponse['status_tramite'] = $tramite->id_status;
                  break;                             
                default:
                    $vresponse=['codigo'=>0, 'mensaje'=>'Lo sentimos! Metodo no definido.', 'icono'=>'warning'];
                  break;
            }
        }
        catch (Exception $vexception) {
            $vHTTPCode=500;
            $vresponse=[
                'codigo'=>-1,
                'mensaje'=>'Error en el servidor! Comuniquese con su administrador '. $vexception->getMessage(),
                'icono'=>'danger'
            ];
        }
        return response()->json($vresponse, $vHTTPCode);
     } 
    
    public function datos_solicitante(Request $vrequest)
     {
        // Descripción: Función para consultar los datos del solicitante
        // Creación: Viernes, 11 de Agosto de 2023
        // Versión: 1.0.0

        $vHTTPCode=200;
        $vresponse=['codigo'=>1, 'mensaje'=>'Exito', 'icono'=>'success'];
        try {
            $vfilter=array();
            switch ($vrequest->method) {
                case 'show':
                    $vresponse['respuesta']=T_Tramites::queryToDetailsHospitalDB(['id_tramite'=>$vrequest->id_tramite])->first();
                  break;                             
                default:
                    $vresponse=['codigo'=>0, 'mensaje'=>'Lo sentimos! Metodo no definido.', 'icono'=>'warning'];
                  break;
            }
        }
        catch (Exception $vexception) {
            $vHTTPCode=500;
            $vresponse=[
                'codigo'=>-1,
                'mensaje'=>'Error en el servidor! Comuniquese con su administrador '. $vexception->getMessage(),
                'icono'=>'danger'
            ];
        }
        return response()->json($vresponse, $vHTTPCode);
     } 

    public function datos_documentacion(Request $vrequest)
     {
        // Descripción: Función para consultar los documentos de un tramite
        // Creación: Viernes, 14 de Agosto de 2023
        // Versión: 1.0.0

        $vHTTPCode=200;
        $vresponse=['codigo'=>1, 'mensaje'=>'Exito', 'icono'=>'success'];
        try {
            $vfilter=array();
            switch ($vrequest->method) {
                case 'show':
                    $vresponse['respuesta']=T_Tramite_Documentacion::queryToDB(['id'=>$vrequest->id])->first();
                  break; 
                case 'get':
                    $filtro=array();
                    $filtro['id_tramite']   = $vrequest->id_tramite;
                    $filtro['solventacion'] = 0;

                    $vresponse['respuesta']=T_Tramite_Documentacion::queryToDocumentacionDB($filtro)->get();
                  break;               
                default:
                    $vresponse=['codigo'=>0, 'mensaje'=>'Lo sentimos! Metodo no definido.', 'icono'=>'warning'];
                  break;
            }
        }
        catch (Exception $vexception) {
            $vHTTPCode=500;
            $vresponse=[
                'codigo'=>-1,
                'mensaje'=>'Error en el servidor! Comuniquese con su administrador '. $vexception->getMessage(),
                'icono'=>'danger'
            ];
        }
        return response()->json($vresponse, $vHTTPCode);
     }

    public function resultados_examen(Request $vrequest)
     {
        // Descripción: Función para consultar los resultados de la evaluacion
        // Creación: Martes, 15 de Agosto de 2023
        // Versión: 1.0.0

        $vHTTPCode=200;
        $vresponse=['codigo'=>1, 'mensaje'=>'Exito', 'icono'=>'success'];
        try {
            $vfilter=array();
            switch ($vrequest->method) {
                case 'show':
                    $r_incorrectas = count(P_Respuesta::getDatosExamen($data=['incorrectas'=>0, 'id_tramite'=>$vrequest->id_tramite])->get());
                    $r_correctas   = count(P_Respuesta::getDatosExamen($data=['correctas'=>1, 'id_tramite'=>$vrequest->id_tramite])->get());
                  
                    $r_total= $r_incorrectas + $r_correctas;
                    $porcentaje = 0; 
                    if($r_total > 0)
                        $porcentaje = ($r_correctas * 100) / $r_total;

                    $vresponse['incorrectas'] =$r_incorrectas;
                    $vresponse['correctas']   =$r_correctas;
                    $vresponse['total']       =$r_total;
                    $vresponse['porcentaje']  =$porcentaje;                   
                  break;                             
                default:
                    $vresponse=['codigo'=>0, 'mensaje'=>'Lo sentimos! Metodo no definido.', 'icono'=>'warning'];
                  break;
            }
        }
        catch (Exception $vexception) {
            $vHTTPCode=500;
            $vresponse=[
                'codigo'=>-1,
                'mensaje'=>'Error en el servidor! Comuniquese con su administrador '. $vexception->getMessage(),
                'icono'=>'danger'
            ];
        }
        return response()->json($vresponse, $vHTTPCode);
     }

    public function download_adjunto($id)
     {
        $datos = T_Tramite_Documentacion::find($id);
        $path= storage_path().'/app/'.$datos->ruta.'/';
        $file= $path.$datos->documento;

        return response()->download($file);
     }

    public function agregar_observacion(Request $vrequest)
     {
        $vstatusHTTP=201;
        $vresponse=['icono'=>'warning', 'codigo'=> 0, 'mensaje'=> 'No se pudieron insertar los datos, intente de nuevo.'];
    
        try{
                DB::beginTransaction();
                    $vflobservacion= new T_Tramite_Observacion;
                    $vflDocumentoTramite = T_Tramite_Documentacion::find($vrequest->input('id_documento_tramite'));

                    $post["id_tramite"]           = $vrequest->input('_tramite');
                    $post["id_c_documento"]       = $vrequest->input('id_c_documento');
                    $post["id_tramite_documento"] = $vrequest->input('id_documento_tramite');
                    $post["id_usuario_observo"]   = Auth::User()->id;
                    $post["observacion"]          = $vrequest->input('txtObservacion');
                    
                    $vflobservacion->fill($post)->save();

                    $postDocumentoTramite['id_status'] = 8;
                    $vflDocumentoTramite->fill($postDocumentoTramite)->save();

                    unset($vflobservacion, $vflDocumentoTramite);

                    $vresponse=['icono'=>'success', 'codigo'=> 1, 'mensaje'=> 'La observacion fue agregada satisfactoriamente.'];
                DB::commit();
            }
        catch ( Exception $e ) {
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

    public function getObservaciones(Request $vrequest)
     {
        // Descripción: Función para consultar las observaciones de un tramite
        // Creación: Viernes, 14 de Agosto de 2023
        // Versión: 1.0.0

        $vHTTPCode=200;
        $vresponse=['codigo'=>1, 'mensaje'=>'Exito', 'icono'=>'success'];
        try {
            $vfilter=array();
            switch ($vrequest->method) {
                case 'show':
                    $vresponse['respuesta']=T_Tramite_Observacion::queryToDB(['id'=>$vrequest->id])->first();
                  break; 
                case 'get':
                    $filtro=array();
                    $filtro['id_tramite'] = $vrequest->id_tramite;

                    $vresponse['respuesta']=T_Tramite_Observacion::queryToDB($filtro)->get();
                  break;               
                default:
                    $vresponse=['codigo'=>0, 'mensaje'=>'Lo sentimos! Metodo no definido.', 'icono'=>'warning'];
                  break;
            }
        }
        catch (Exception $vexception) {
            $vHTTPCode=500;
            $vresponse=[
                'codigo'=>-1,
                'mensaje'=>'Error en el servidor! Comuniquese con su administrador '. $vexception->getMessage(),
                'icono'=>'danger'
            ];
        }
        return response()->json($vresponse, $vHTTPCode);
     }

    public function aceptar_documento(Request $vrequest)
     {
        $id_documento_tramite = $vrequest->id_documento_tramite;

        $vstatusHTTP=201;
        $vresponse=['icono'=>'warning', 'codigo'=> 0, 'mensaje'=> 'No se pudieron insertar los datos, intente de nuevo.'];
        $status=0;

        try{
                DB::beginTransaction();

                $vflDocumento      = T_Tramite_Documentacion::find($id_documento_tramite);
                $post["id_status"] = 10;
                $vflDocumento->fill($post)->save();

                $total = count(T_Tramite_Documentacion::queryToDocumentacionDB(['id_tramite'=>$vflDocumento->id_tramite, 'id_status'=>10])->get());
                if($total == 3)
                {
                    $tramite = T_Tramites::find($vflDocumento->id_tramite);
                    $postTramite['id_status'] = 10;
                    $tramite->fill($postTramite)->save();

                    $status = $tramite->id_status;
                    
                    unset($t_tramite);
                }

                unset($vflDocumento);

                $vresponse=['icono'=>'success', 'codigo'=> 1, 'mensaje'=> 'El documento fue aceptado satisfactoriamente.', 'status_tramite'=>$status];
                DB::commit();
            }
        catch ( Exception $e ) {
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

    public function send_observaciones($id_tramite)
     {
        $vstatusHTTP=201;
        $vresponse=['icono'=>'warning', 'codigo'=> 0, 'mensaje'=> 'No se pudieron insertar los datos, intente de nuevo.', 'url'=> ''];
        $vroute_redirect = "";

        try {
                DB::beginTransaction();

                    $t_tramite = T_Tramites::find($id_tramite);
                    $post['id_status']=8;
                    $t_tramite->fill($post)->save();

                    unset($t_tramite);

                    $vresponse=['icono'=>'success', 'codigo'=> 1, 'mensaje'=> 'Las observaciones fueron enviadas satisfactoriamente.','url'=> route($this->route.'.observados')];

                DB::commit();
            }
            catch ( Exception $e ) {
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

    public function getSolventaciones(Request $vrequest)
     {
        // Descripción: Función para consultar las solventaciones de un tramite
        // Creación: Viernes, 14 de Agosto de 2023
        // Versión: 1.0.0

        $vHTTPCode=200;
        $vresponse=['codigo'=>1, 'mensaje'=>'Exito', 'icono'=>'success'];
        try {
            $vfilter=array();
            switch ($vrequest->method) {
                case 'show':
                    $vresponse['respuesta']=T_Tramite_Observacion::queryToDB(['id'=>$vrequest->id])->first();
                  break; 
                case 'get':
                    $filtro=array();
                    $filtro['id_tramite'] = $vrequest->id_tramite;

                    $vresponse['respuesta']=T_Tramite_Observacion::queryToSolventacionesDB($filtro)->get();
                  break;               
                default:
                    $vresponse=['codigo'=>0, 'mensaje'=>'Lo sentimos! Metodo no definido.', 'icono'=>'warning'];
                  break;
            }
        }
        catch (Exception $vexception) {
            $vHTTPCode=500;
            $vresponse=[
                'codigo'=>-1,
                'mensaje'=>'Error en el servidor! Comuniquese con su administrador '. $vexception->getMessage(),
                'icono'=>'danger'
            ];
        }
        return response()->json($vresponse, $vHTTPCode);
     }

    public function aceptar_solventacion(Request $vrequest)
     {
        $id_observacion = $vrequest->id_observacion;

        $vstatusHTTP=201;
        $vresponse=['icono'=>'warning', 'codigo'=> 0, 'mensaje'=> 'No se pudieron insertar los datos, intente de nuevo.'];
    
        try{
                DB::beginTransaction();

                $vflObservacion = T_Tramite_Observacion::find($id_observacion);
                $postObs["aceptado"] = 10;
                $vflObservacion->fill($postObs)->save();

                $vflDocumento      = T_Tramite_Documentacion::find($vflObservacion->id_tramite_documento);
                $post["id_status"] = 9;
                $vflDocumento->fill($post)->save();

                //Cuento cuantos solventaciones fueron aceptadas
                $obs = count(T_Tramite_Observacion::queryToDB(['id_tramite'=>$vflObservacion->id_tramite])->get());
                $aceptados = count(T_Tramite_Observacion::queryToDB(['id_tramite'=>$vflObservacion->id_tramite, 'aceptado'=>10])->get());

                if($aceptados == $obs)
                {
                    $tramite = T_Tramites::find($vflObservacion->id_tramite);
                    $postTramite['id_status'] = 10;
                    $tramite->fill($postTramite)->save();
                    unset($t_tramite);
                }
                unset($vflObservacion, $vflDocumento, $obs, $aceptados);

                $vresponse=['icono'=>'success', 'codigo'=> 1, 'mensaje'=> 'La solventacion fue aceptada satisfactoriamente.'];
                DB::commit();
            }
        catch ( Exception $e ) {
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

    public function negar_solventacion(Request $vrequest)
     {
        $id_observacion = $vrequest->id_observacion;

        $vstatusHTTP=201;
        $vresponse=['icono'=>'warning', 'codigo'=> 0, 'mensaje'=> 'No se pudieron insertar los datos, intente de nuevo.'];
    
        try{
                DB::beginTransaction();

                $vflObservacion = T_Tramite_Observacion::find($id_observacion);
                $postObs["aceptado"] = 4;
                $vflObservacion->fill($postObs)->save();

                $vflDocumento      = T_Tramite_Documentacion::find($vflObservacion->id_tramite_documento);
                $post["id_status"] = 9;
                $vflDocumento->fill($post)->save();

                unset($vflObservacion, $vflDocumento);

                $vresponse=['icono'=>'success', 'codigo'=> 1, 'mensaje'=> 'La solventacion fue negada satisfactoriamente.'];
                DB::commit();
            }
        catch ( Exception $e ) {
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

    public function concluir(Request $vrequest)
     {
        $vstatusHTTP=201;
        $vresponse=['icono'=>'warning', 'codigo'=> 0, 'mensaje'=> 'No se pudieron insertar los datos, intente de nuevo.', 'url'=> ''];
        $vroute_redirect = "";
        $id_tramite = $vrequest->id_tramite;
       
        $tramite = T_Tramites::findOrFail($id_tramite);
        $post['id_status']=3;
        $post['fecha_fin']=date("Y-m-d H:i:s");
        $post['responsable_firma']     = "Dr. Limber del Carmen García Zapata";

        try {
            DB::beginTransaction();

                $tramite->fill($post)->save();

                unset($t_tramite);

                $vresponse=['icono'=>'success', 'codigo'=> 1, 'mensaje'=> 'El trámite concluyo satisfactoriamente.','url'=> route($this->route.'.concluidos')];

            DB::commit();
        }
        catch ( Exception $e ) {
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

    public function cancelar(Request $vrequest)
     {
        $vstatusHTTP=201;
        $vresponse=['icono'=>'warning', 'codigo'=> 0, 'mensaje'=> 'No se pudieron insertar los datos, intente de nuevo.', 'url'=> ''];
        $vroute_redirect = "";
        $id_tramite = $vrequest->id_tramite;

        $tramite = T_Tramites::find($id_tramite);
        $post['id_status']=7;       

        try {
                DB::beginTransaction();

                    $tramite->fill($post)->save();                    
                    unset($t_tramite);

                    $vresponse=['icono'=>'success', 'codigo'=> 1, 'mensaje'=> 'El trámite fue cancelado satisfactoriamente.','url'=> route($this->route.'.cancelados')];

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