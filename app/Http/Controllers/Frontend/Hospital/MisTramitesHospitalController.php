<?php
namespace App\Http\Controllers\Frontend\Hospital;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Models\Backend\T_Registro;
use App\Http\Models\Frontend\T_Tramite_Constancia;
use App\Http\Models\Frontend\T_Preguntas;
use App\Http\Models\Frontend\P_Respuesta;
use App\Http\Models\Frontend\P_Examen_Contestaron;
use App\Http\Models\Frontend\T_Tramite;
use App\Http\Models\Frontend\T_Tramite_Documentacion;
use App\Http\Classes\clsTurnar;
use App\Http\Classes\FormatDate;
// use App\Http\Requests\Frontend\ConstanciaRequest;
use Illuminate\Support\Str;
use Auth;
use DB;
use File;
use Storage;

class MisTramitesHospitalController extends Controller
{
    private $route='mis-tramites-hospital';
    public function __construct()
     {
        view()->share('title', 'Mis Tramites del hospital');
        view()->share('current_route', $this->route);       
     } 
    
    public function header_hospital() 
     {
        $vstatus=200;
        $vrespuesta=array();
        try {
                $vfiltro=array();  
                $vfiltro['id_registro'] =  Auth::User()->id_registro;
                $vrespuesta['encabezado']=T_Registro::dtsGeneralesHospital($vfiltro)->first();
        }
        catch(Exception $vexception ){
            $vstatus=500;
            $vrespuesta['message']=$vexception->getMessage();
        }
        return response()->json($vrespuesta, $vstatus);
     }

    public function datos_generales() 
     {
        $vstatus=200;
        $vrespuesta=array();
        try {
                $vfiltro=array();  
                $vfiltro['id_registro'] =  Auth::User()->id_registro;
                $vrespuesta['datos']=T_Registro::dtsRegistroHospital($vfiltro)->first();
        }
        catch(Exception $vexception ){
            $vstatus=500;
            $vrespuesta['message']=$vexception->getMessage();
        }
        return response()->json($vrespuesta, $vstatus);
     }
        
    public function datos_diploma() 
     {
        $vstatus=200;
        $vrespuesta=array();
        try {
                $vfiltro=array();  
                $vfiltro['id_registro'] =  Auth::User()->id_registro;
                $vrespuesta['respuesta']=T_Tramite_Constancia::queryToDB($vfiltro)->first();
        }
        catch(Exception $vexception ){
            $vstatus=500;
            $vrespuesta['message']=$vexception->getMessage();
        }
        return response()->json($vrespuesta, $vstatus);
     }

    public function buscar() 
     {
        $vstatus=200;
        $vrespuesta=array();
        try {
                $vfiltro=array();  
                $vfiltro['id_registro'] =  Auth::User()->id_registro;
                $vrespuesta['respuesta']=T_Tramite_Constancia::queryToDB($vfiltro)->first();
        }
        catch(Exception $vexception ){
            $vstatus=500;
            $vrespuesta['message']=$vexception->getMessage();
        }
        return response()->json($vrespuesta, $vstatus);
     }

    public function getTramites(Request $vrequest)
     {
        $vHTTPCode=200;
        $vresponse=['codigo'=>1, 'mensaje'=>'Exito', 'icono'=>'success'];
        try {
            $vfilter=array();
            switch ($vrequest->method) {
                case 'show':
                    $vresponse['respuesta']=T_Tramite::queryToHospitalDB(['id'=>$vrequest->id])->first();
                  break; 
                case 'get':
                    $vresponse['respuesta']=T_Tramite::queryToHospitalDB(['id_registro' =>Auth::User()->id_registro])->get();
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
    
    public function show($id) 
     {
        $datos = T_Tramite::queryToHospitalDB(['id_tramite'=>$id])->first();
        return view('frontend.hospital.tramites.detalles.show', ['datos'=>$datos, 'id'=>$id]);
     }

    public function index() 
     {   
    	return view('frontend.hospital.tramites.index');
     }

    public function create() 
     {
        $id_registro = Auth::User()->id_registro;
        //Busco si ya hay un registro
        $constancia = T_Tramite_Constancia::queryToDB(['id_registro' =>Auth::User()->id_registro ])->first();

        if(!isset($constancia))
        {
            $t_tramite_constancia = new T_Tramite_Constancia;
            $post_folio["id_registro_temp"]    = Auth::User()->id_registro;
            $post_folio["folio_hacienda"]      = 'N/A';
            $post_folio["id_usuario_registro"] = Auth::User()->id_registro;
            $t_tramite_constancia->fill($post_folio)->save();
            unset($t_tramite_constancia);
        }
        
        $vfiltro=array();
        $vflPreguntas=T_Preguntas::lstPreguntasHospital($vfiltro)->get();  

        return view('frontend.hospital.tramites.create', ['id_registro'=>$id_registro, 'preguntas'=>$vflPreguntas]);
     }
    
    public function store(Request $vrequest)
     {
        $vstatusHTTP=201;
        $vresponse=['icono'=>'warning', 'codigo'=> 0, 'mensaje'=> 'No se pudieron insertar los datos, intente de nuevo.'];
        $vroute_redirect = "";

        $id_registro = $vrequest->input('id_registro');

        //Inicializo las clases
        $t_tramite    = new T_Tramite;
        $t_constancia = T_Tramite_Constancia::queryToDB(['id_registro'=>$id_registro])->first();
        $t_examen     = P_Examen_Contestaron::queryToDB(['id_registro'=>$id_registro])->first();
        $t_documentos = T_Tramite_Documentacion::queryToDB(['id_registro_temp'=>$id_registro])->get();

        //genero el arreglo para tramites
        $post_tramite['id_registro']=  $id_registro;
        $post_tramite['id_tipo_tramite']=2;
        $post_tramite['id_status']=2;
        $post_tramite['fecha_inicio']=date("Y-m-d H:i:s");
        $post_tramite['fecha_envio']=date("Y-m-d H:i:s");

        //Se turna al usuario con menos folios
        $turnar= new clsTurnar;
        $turnar_status= $turnar->asignar_responsables_hospital();
        if($turnar_status==true) {
            $array= [];                                 
            $post_tramite['id_usuario_r']= $turnar->getResponsableHospital();
        }

        $total_tramites = (T_Tramite::queryToTotalAnioDB(date('Y'))) + 1;

        $post_tramite['folio']      = str_pad($total_tramites, 4, "0", STR_PAD_LEFT) . '-H-' . date('Y');
        
        try {
                    DB::beginTransaction();

                        //guardo el tramite
                        $t_tramite->fill($post_tramite)->save();

                        $anio_tramite = FormatDate::anio($t_tramite->created_at, 1);

                        //Guardo los datos de la constancia
                        $post_constancia['id_registro_temp'] = null;
                        $post_constancia['id_tramite']       = $t_tramite->id;
                        $t_constancia->fill($post_constancia)->save();

                        //Guardo los datos del examen
                        $post_examen['id_tramite']= $t_tramite->id;
                        $t_examen->fill($post_examen)->save();

                        //Actualizo la documentacion
                        $registro = T_Registro::find($id_registro);
                        foreach ($t_documentos as $value) {

                            $vrutaCarpeta='/expedientes/'. $anio_tramite .'/hospital/'. $registro->curp .'/exp_'. $t_tramite->id;

                            /*Convierto el base64 a archivo*/
                            $image_64  = $value->baseFile;
                            $extension = explode('/', explode(':', substr($image_64, 0, strpos($image_64, ';')))[1])[1];   // .jpg .png .pdf
                            $replace   = substr($image_64, 0, strpos($image_64, ',')+1);
                            $image     = str_replace($replace, '', $image_64);
                            $image     = str_replace(' ', '+', $image);
                            $name      = $value->id_c_documento_tramite . '_' . time() . '.' . $extension;
                            Storage::disk('dipris')->put($vrutaCarpeta.'/'.$name, base64_decode($image));
                            /*Termina conversion de archivo*/

                            $documento = T_Tramite_Documentacion::find($value->id);
                            $post_docto['id_registro_temp'] = null;
                            $post_docto['id_tramite']       = $t_tramite->id;
                            $post_docto['documento']        = $name;
                            $post_docto['ruta']             = $vrutaCarpeta;
                            $post_docto['baseFile']         = null;
                            $documento->fill($post_docto)->save();
                            unset($documento);

                        }

                        $vresponse=['icono'=>'success', 'codigo'=> 1, 'mensaje'=> 'El tramite fue enviado satisfactoriamente.', 'url'=> route($this->route.'.index'), 'data'=>''];

                        unset($t_tramite, $t_examen, $t_constancia);

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

    public function store_capacitacion()
     {
        $status               = 1;
        $code                 = 201;        
        $route_redirect = "";
        $data = [];

        //Busco si ya hay un registro
        $constancia = T_Tramite_Constancia::queryToDB(['id_registro' =>Auth::User()->id_registro ])->first();

        try {
                DB::beginTransaction();

                    $post['id_status_video'] = 1;
                    $constancia->fill($post)->save();

                DB::commit();

                $msg   = "El curso ha terminado satisfactoriamente";
                $data  = $constancia;               
                unset($constancia);

            } catch (\Exception $e) {
                $status         = 3;
                $code           = 409;
                $msg            = $e->getMessage();
                $route_redirect = "";
                $data=[];
                DB::rollback();
            }
        return response()->json(['status' => $status, 'code' => $code, 'msg' => $msg, 'route_redirect' => $route_redirect, 'data'=>$data], $code);
     }
    
    public function store_examen(Request $vrequest)
     {
        $vstatus=200;
        $vresponse=array();
        try {
                $vstatusPersonal=1;
                $vflPreguntas=array();
                $vflPreguntas=$vrequest->all();

                if ( !empty($vflPreguntas['idPregunta']) && is_array($vflPreguntas['idPregunta']) ) {

                    # Begin: Registro de personal                  
                    $post_examen['id_registro']=Auth::User()->id_registro;                    
                    $examen=new P_Examen_Contestaron;
                    $examen->fill($post_examen)->save();                            
                    # End: Registro de personal

                    foreach ( $vflPreguntas['idPregunta'] as $vidPregunta ) {
                        $vrespuestaUsuario='';
                        $vrespuestaUsuario=$vflPreguntas['cbxbtn_' . $vidPregunta][0];
                        $vflPregunta=T_Preguntas::findOrFail($vidPregunta);

                        if( !empty($vflPregunta) ) {
                            $vrespuestaUsuarioTexto=null;
                            $vopcionRespuesta=$vflPreguntas['cbxbtn_' . $vidPregunta][0];
                            switch ( $vopcionRespuesta ) {
                                case 'a': $vrespuestaUsuarioTexto=$vflPregunta->fldopc_a; break;
                                case 'b': $vrespuestaUsuarioTexto=$vflPregunta->fldopc_b; break;
                                case 'c': $vrespuestaUsuarioTexto=$vflPregunta->fldopc_c; break;
                            }
                            
                            $vflPreguntas['fldcorrecta']=0;
                            $vflPreguntas['fldespecifique']=$vrespuestaUsuarioTexto;
                            if( $vflPregunta->fldrespuesta == $vrespuestaUsuario )
                                $vflPreguntas['fldcorrecta']=1; 
                        }
                        unset($vflPregunta);                         
                        
                        $vdlRespuesta=new P_Respuesta;
                        $vflPreguntas['id_examen_contestaron']=$examen->id;
                        $vflPreguntas['id_pregunta']=$vidPregunta;
                        $vflPreguntas['fldrespuesta']=$vopcionRespuesta;
                        $vdlRespuesta->fill($vflPreguntas)->save();
                        unset($vdlRespuesta);
                    }

                    $r_incorrectas = count(P_Respuesta::getRespuestas($data=['incorrectas'=>0, 'id_examen'=>$examen->id])->get());
                    $r_correctas = count(P_Respuesta::getRespuestas($data=['correctas'=>1, 'id_examen'=>$examen->id])->get());
                    $r_total= $r_incorrectas + $r_correctas;
                    $porcentaje = ($r_correctas * 100) / $r_total;

                    #Actualizo status del examen  
                    $aprobado=0;
                    if($porcentaje>=80)
                        $aprobado=1;
                    
                    $examen->fill(['aprobado'=>$aprobado])->save(); 
                   
                    $vfiltro=array();
                    $vfiltro['id_registro']= Auth::User()->id_registro; 
                    $tramiteConstancia=T_Tramite_Constancia::queryToDB($vfiltro)->first();
                    
                    if($aprobado==1){
                        $post_t['id_status_examen'] = 1;                    
                        $tramiteConstancia->fill($post_t)->save(); 
                    }   

                    unset($tramiteConstancia);
                }
                $vresponse['codigo']  = 1;
                $vresponse['mensaje'] = 'Examen contestado exitosamente.';
                $vresponse['calificacion'] = $porcentaje;
                unset($examen);
                    
        }
        catch(Exception $vexception ){
            $vstatus=500;
            $vresponse['message']=$vexception->getMessage();
        }
        return response()->json($vresponse, $vstatus);
     }

    public function resultados_examen() 
     {
        $vstatus=200;
        $vrespuesta=array();
        try { 
                $id_registro =  Auth::User()->id_registro;

                $r_incorrectas = count(P_Respuesta::getDatosExamen($data=['incorrectas'=>0, 'id_registro'=>$id_registro])->get());
                $r_correctas = count(P_Respuesta::getDatosExamen($data=['correctas'=>1, 'id_registro'=>$id_registro])->get());

                $datos_constancia = T_Tramite_Constancia::queryToDB(['id_registro'=>$id_registro])->first();

                $r_total= $r_incorrectas + $r_correctas;
                $porcentaje = 0; 
                if($r_total > 0)
                    $porcentaje = ($r_correctas * 100) / $r_total;

                $vrespuesta['incorrectas']=$r_incorrectas;
                $vrespuesta['correctas']=$r_correctas;
                $vrespuesta['total']=$r_total;
                $vrespuesta['porcentaje']=$porcentaje;
                $vrespuesta['datos_constancia']=$datos_constancia;
        }
        catch(Exception $vexception ){
            $vstatus=500;
            $vrespuesta['message']=$vexception->getMessage();
        }
        return response()->json($vrespuesta, $vstatus);
     }

    public function store_nuevo_examen()
     {
        $status               = 1;
        $code                 = 201;        
        $route_redirect = "";   

        //Busco si ya hay un examen
        $examen = P_Examen_Contestaron::queryToDB(['id_registro' =>Auth::User()->id_registro ])->first();

        $respuestas = P_Respuesta::queryToDB(['id_examen_contestaron'=>$examen->id])->get();

        try {
                DB::beginTransaction();

                    foreach ($respuestas as $value) {
                        $resp=P_Respuesta::find($value->id);
                        $resp->delete();
                    }

                    $examen->delete();

                DB::commit();

                $msg = "La apertura para la nueva evaluación se realizo satisfactoriamente"; 
                $route_redirect = route($this->route.'.create');                              
                unset($examen, $respuestas);

            } catch (\Exception $e) {
                $status         = 3;
                $code           = 409;
                $msg            = $e->getMessage();
                $route_redirect = "";          
                DB::rollback();
            }
        return response()->json(['status' => $status, 'code' => $code, 'msg' => $msg, 'route_redirect' => $route_redirect], $code);
     }

    public function cancelar_tramite()
     {
        $vstatusHTTP=201;
        $vresponse=['icono'=>'warning', 'codigo'=> 0, 'mensaje'=> 'No se pudieron insertar los datos, intente de nuevo.'];
        $vroute_redirect = "";

        $id_registro = Auth::User()->id_registro;

        try {
                DB::beginTransaction();

                    //Elimino la constancia
                    $t_constancia = T_Tramite_Constancia::queryToDB(['id_registro'=>$id_registro])->first();
                    $t_constancia->delete();

                    //Elimino los documentos
                    $t_documentos = T_Tramite_Documentacion::queryToDB(['id_registro_temp'=>$id_registro])->get();
                    if(count($t_documentos)>0)
                    {
                        foreach ($t_documentos as $value) {
                            $documento = T_Tramite_Documentacion::find($value->id);                       
                            $post_docto['baseFile'] = null;
                            $documento->fill($post_docto)->save();
                            $documento->delete();
                            unset($documento);
                        }
                    }
                    
                    //Elimino el examen
                    $t_examen     = P_Examen_Contestaron::queryToDB(['id_registro'=>$id_registro])->first();

                    if(isset($t_examen->id))
                    {
                        //Elimino las respuestas
                        $t_respuestas =P_Respuesta::queryToDB(['id_examen_contestaron'=>$t_examen->id])->get();
                        if(count($t_respuestas)>0)
                        {
                            foreach ($t_respuestas as $vr) {
                                $respuesta = P_Respuesta::find($vr->id); 
                                $respuesta->delete();
                                unset($respuesta);
                            }
                        }                    

                        $t_examen->delete(); 
                    }
                    

                    unset($t_constancia, $t_documentos, $t_examen);

                    $vresponse=['icono'=>'success', 'codigo'=> 1, 'mensaje'=> 'El tramite fue cancelado satisfactoriamente.','url'=> route($this->route.'.index')];

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

}