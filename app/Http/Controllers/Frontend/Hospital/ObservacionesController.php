<?php
namespace App\Http\Controllers\Frontend\Hospital;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Models\Backend\T_Registro;
use App\Http\Models\Backend\T_Tramites;
use App\Http\Models\Backend\T_Tramite_Observacion;
use App\Http\Requests\Frontend\SolventarRequest;
use App\Http\Classes\FormatDate;
use App\User;
use Auth;
use DB;
use File;
use Storage;


class ObservacionesController extends Controller
{   
    public function observaciones($id_tramite) 
     {    
        return view('frontend.hospital.observaciones.index', ['id_tramite'=>$id_tramite]);
     }

    public function getObservacionesCliente(Request $vrequest)
     {
        $vHTTPCode=200;
        $vresponse=['codigo'=>1, 'mensaje'=>'Exito', 'icono'=>'success'];
        try {
            $vfilter=array();
            switch ($vrequest->method) {
                case 'show':
                    $vresponse['respuesta']=T_Tramites::queryToHospitalDB(['id'=>$vrequest->id])->first();
                  break; 
                case 'get':
                    $vresponse['respuesta']=T_Tramite_Observacion::queryToDB(['id_tramite' =>$vrequest->id_tramite])->get();
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

    public function solventar(SolventarRequest $vrequest)
     {
        $arr_validacion = [];      
        $status         = 1;
        $code           = 201;
        $post           = $vrequest->all();
        $id_tramite     = $post["id_tramite"];
        $id_observacion = $post["idObservacion"];    
        //Este es el id del catalogo de documentos    
        $id_c_documento = $post["id_documento"];        
        
        $usuario = User::find(Auth::User()->id);        
        $t_registro = T_Registro::find($usuario->id_registro);     
        $t_tramite  = T_Tramites::find($id_tramite);

        $anio_tramite= FormatDate::anio($t_tramite->created_at,1);

        $folder     = '/expedientes/' . (int)$anio_tramite . '/hospital/' . $t_registro->curp . '/exp_'.$id_tramite.'/solventacion';
                   
        try {
            DB::beginTransaction();              
                $t_observacion = T_Tramite_Observacion::find($id_observacion);

                if ($vrequest->hasFile('archivosubido')) {
                    if ($vrequest->file('archivosubido')->isValid()) {
                        $file      = $vrequest->archivosubido;
                        $extension = $file->extension();
                        $fileName  = $id_c_documento . '_' . time() . '_solventacion.' . $extension;
                        $tamanio   = $file->getSize();
                        $vrequest->file('archivosubido')->storeAs($folder, $fileName, 'dipris');
                    }

                    $post_documento["documento"]               = $fileName;
                    $post_documento["ruta"]                    = $folder;                    
                    $post_documento["extension"]               = $extension;                   
                    $post_documento["solventado"]              = 1;                
                    $t_observacion->fill($post_documento)->save();                      
                }                    
                DB::commit();

                $msg                      = "La observacion ha sido solventada satisfactoriamente";
                $route_redirect           = "";
                $data                     = $t_observacion;
                unset($t_observacion);
        } catch (\Exception $e) {
            $status         = 3;
            $code           = 409;
            $msg            = $e->getMessage();
            $route_redirect = "";
            $data           = [];
            DB::rollback();
        }
        
        return response()->json(['status' => $status, 'code' => $code, 'msg' => $msg, 'route_redirect' => $route_redirect, 'data' => $data], $code);
     }

    public function enviar_solventaciones(Request $vrequest)
     {
        $vstatusHTTP=201;
        $vresponse=['icono'=>'warning', 'codigo'=> 0, 'mensaje'=> 'No se pudieron insertar los datos, intente de nuevo.', 'url'=> ''];
        $vroute_redirect = "";
        $id_tramite = $vrequest->id_tramite;

        try {
                DB::beginTransaction();

                    $t_tramite = T_Tramites::find($id_tramite);
                    $post['id_status']=5;
                    $t_tramite->fill($post)->save();

                    unset($t_tramite);

                    $vresponse=['icono'=>'success', 'codigo'=> 1, 'mensaje'=> 'Las solventaciones fueron enviadas satisfactoriamente.','url'=> route('mis-tramites-hospital.index')];

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