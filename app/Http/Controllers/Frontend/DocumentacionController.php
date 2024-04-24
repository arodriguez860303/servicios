<?php
namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Models\Catalogos\C_Documentos;
use App\Http\Models\Frontend\T_Tramite_Documentacion;
use App\Http\Models\Frontend\T_Tramite_Constancia;
use App\Http\Models\Backend\T_Registro;
use App\Http\Requests\Backend\SubirDocumentoRequest;
use App\Http\Classes\Validaciones;
use Illuminate\Support\Str;
use Response;
use File;
use Storage;
use Auth;
use DB;

class DocumentacionController extends Controller
{    
    public function documentacion_tramite(Request $request) 
    { 
        $vstatus=200;
        $vrespuesta=array();
        try {
                $vrespuesta['respuesta'] = C_Documentos::lista_documentacion_tramite(Auth::User()->id_registro);
        }
        catch(Exception $vexception ){
            $vstatus=500;
            $vrespuesta['message']=$vexception->getMessage();
        }
        return response()->json($vrespuesta, $vstatus);
    }  

    public function store_document(SubirDocumentoRequest $request)
    {
        $arr_validacion = [];
        $validation     = new Validaciones;
        $status         = 1;
        $code           = 201;
        $post           = $request->all();
        $id_registro    = $post["id_registro"];
        $id_documento   = $post["id_documento"];        
        
        $t_registro = T_Registro::find($id_registro);
        $folder     = '/expedientes/' . date('Y') . '/alimentos/' . $t_registro->curp . '/tmp';

        $path = substr(Storage::disk('dipris')->getAdapter()->getPathPrefix(), 0, -1) . $folder;

        $validation->registroSubirDocumentoTmp(['id_registro' => $id_registro, 'id_documento' => $id_documento]);
        if (!$validation->getStatusB()) {
            try {
                DB::beginTransaction();
                    $t_tramite_documentacion = new T_Tramite_Documentacion;

                    if ($request->hasFile('archivosubido')) {
                        if ($request->file('archivosubido')->isValid()) {
                            $file      = $request->archivosubido;
                            $extension = $file->extension();
                            $fileName  = $id_documento . '_' . time() . '.' . $extension;
                            $tamanio   = $file->getSize();
                            //$request->file('archivosubido')->storeAs($folder, $fileName, 'dipris');
                            
                            $base64 = 'data:image/' . $extension . ';base64,' . base64_encode(file_get_contents($file));                           
                        }

                        $post_documento["id_registro_temp"]        = $id_registro;
                        $post_documento["id_c_documento_tramite"] = $id_documento;
                        // $post_documento["documento"]               = $fileName;
                        // $post_documento["ruta"]                    = $folder;                    
                        $post_documento["extension"]               = $extension;
                        $post_documento["size"]                    = $tamanio;
                        $post_documento["baseFile"]                   = $base64;
                        $post_documento["id_status"]               = 2;
                        $post_documento["id_usuario_subio"]        = Auth::User()->id;
                        $t_tramite_documentacion->fill($post_documento)->save();

                        //se cuenta si ya se guardaron todos los requerimientos
                        $totalDoctos = T_Tramite_Documentacion::general(['id_registro_temp'=>$id_registro])->get();
                        if(count($totalDoctos)==4)
                        {
                            $postR['id_status_requerimiento'] =  1;
                            $t_datosConstancia=T_Tramite_Constancia::queryToDB(['id_registro'=>Auth::User()->id_registro])->first();
                            $t_datosConstancia->fill($postR)->save();
                        }
                    }                    
                    DB::commit();

                    $msg                      = "El documento ha sido subido satisfactoriamente";
                    $route_redirect           = ""; //route($this->route . '.index');
                    $data                     = $t_tramite_documentacion;
                    unset($totalDoctos, $t_datosConstancia, $t_tramite_documentacion);
            } catch (\Exception $e) {
                $status         = 3;
                $code           = 409;
                $msg            = $e->getMessage();
                $route_redirect = "";
                $data           = [];
                DB::rollback();
            }
        } else {
            $status         = 3;
            $code           = $validation->getStatusCode();
            $msg            = $validation->getStatusMsg();
            $route_redirect = "";
            $data           = [];
        }

        return response()->json(['status' => $status, 'code' => $code, 'msg' => $msg, 'route_redirect' => $route_redirect, 'data' => $data], $code);
    } 

    public function download_adjunto($id_tramite_documentacion)
    {

        $datos = T_Tramite_Documentacion::find($id_tramite_documentacion);
        $image_64 = $datos->baseFile; //your base64 encoded data

        $extension = explode('/', explode(':', substr($image_64, 0, strpos($image_64, ';')))[1])[1];   // .jpg .png .pdf

        $replace = substr($image_64, 0, strpos($image_64, ',')+1); 

        // find substring fro replace here eg: data:image/png;base64,
        $image = str_replace($replace, '', $image_64); 
        $image = str_replace(' ', '+', $image); 
        $imageName = Str::random(10).'.'.$extension;

        //Storage::disk('public')->put($imageName, base64_decode($image));

        return response()->download(base64_decode($image));

        //return response()->download(base64_decode($image));
    }     

    public function delete_adjunto($id) 
    { 
        $vstatus=200;
        $vrespuesta=array();
        try {
                $documento=T_Tramite_Documentacion::find($id);
                $documento->delete();

                //se cuenta si ya se guardaron todos los requerimientos
                $totalDoctos = T_Tramite_Documentacion::general(['id_registro_temp'=>Auth::User()->id_registro])->get();
                if(count($totalDoctos)<4)
                {
                    $post['id_status_requerimiento'] =  0;
                    $t_datosConstancia=T_Tramite_Constancia::queryToDB(['id_registro'=>Auth::User()->id_registro])->first();
                    $t_datosConstancia->fill($post)->save();
                }
                
                unset($documento, $t_datosConstancia);

                $vrespuesta['respuesta']='El documento ha sido eliminado correctamente';
        }
        catch(Exception $vexception ){
            $vstatus=500;
            $vrespuesta['message']=$vexception->getMessage();
        }
        return response()->json($vrespuesta, $vstatus);
    } 




    /*Metodos exclusivos para tramites de hospital*/  

    public function documentacion_hospital(Request $request) 
    { 
        $vstatus=200;
        $vrespuesta=array();
        try {
                $vrespuesta['respuesta'] = C_Documentos::lista_documentacion_hospital(Auth::User()->id_registro);
        }
        catch(Exception $vexception ){
            $vstatus=500;
            $vrespuesta['message']=$vexception->getMessage();
        }
        return response()->json($vrespuesta, $vstatus);
    }

    public function store_document_hospital(SubirDocumentoRequest $request)
    {
        $arr_validacion = [];
        $validation     = new Validaciones;
        $status         = 1;
        $code           = 201;
        $post           = $request->all();
        $id_registro    = $post["id_registro"];
        $id_documento   = $post["id_documento"];        
        
        $t_registro = T_Registro::find($id_registro);
        $folder     = '/expedientes/' . date('Y') . '/hospital/' . $t_registro->curp . '/tmp';

        $path = substr(Storage::disk('dipris')->getAdapter()->getPathPrefix(), 0, -1) . $folder;

        $validation->registroSubirDocumentoTmp(['id_registro' => $id_registro, 'id_documento' => $id_documento]);
        if (!$validation->getStatusB()) {
            try {
                DB::beginTransaction();
                    $t_tramite_documentacion = new T_Tramite_Documentacion;

                    if ($request->hasFile('archivosubido')) {
                        if ($request->file('archivosubido')->isValid()) {
                            $file      = $request->archivosubido;
                            $extension = $file->extension();
                            $fileName  = $id_documento . '_' . time() . '.' . $extension;
                            $tamanio   = $file->getSize();
                            
                            $base64 = 'data:image/' . $extension . ';base64,' . base64_encode(file_get_contents($file));                           
                        }

                        $post_documento["id_registro_temp"]        = $id_registro;
                        $post_documento["id_c_documento_tramite"] = $id_documento;                  
                        $post_documento["extension"]               = $extension;
                        $post_documento["size"]                    = $tamanio;
                        $post_documento["baseFile"]                   = $base64;
                        $post_documento["id_status"]               = 2;
                        $post_documento["id_usuario_subio"]        = Auth::User()->id;
                        $t_tramite_documentacion->fill($post_documento)->save();

                        //se cuenta si ya se guardaron todos los requerimientos
                        $totalDoctos = T_Tramite_Documentacion::general(['id_registro_temp'=>$id_registro])->get();
                        if(count($totalDoctos)==3)
                        {
                            $postR['id_status_requerimiento'] =  1;
                            $t_datosConstancia=T_Tramite_Constancia::queryToDB(['id_registro'=>Auth::User()->id_registro])->first();
                            $t_datosConstancia->fill($postR)->save();
                        }
                    }                    
                    DB::commit();

                    $msg                      = "El documento ha sido subido satisfactoriamente";
                    $route_redirect           = "";
                    $data                     = $t_tramite_documentacion;
                    unset($totalDoctos, $t_datosConstancia, $t_tramite_documentacion);
            } catch (\Exception $e) {
                $status         = 3;
                $code           = 409;
                $msg            = $e->getMessage();
                $route_redirect = "";
                $data           = [];
                DB::rollback();
            }
        } else {
            $status         = 3;
            $code           = $validation->getStatusCode();
            $msg            = $validation->getStatusMsg();
            $route_redirect = "";
            $data           = [];
        }

        return response()->json(['status' => $status, 'code' => $code, 'msg' => $msg, 'route_redirect' => $route_redirect, 'data' => $data], $code);
    }
    
    public function delete_adjunto_hospital($id) 
    { 
        $vstatus=200;
        $vrespuesta=array();
        try {
                $documento=T_Tramite_Documentacion::find($id);
                $documento->delete();

                //se cuenta si ya se guardaron todos los requerimientos
                $totalDoctos = T_Tramite_Documentacion::general(['id_registro_temp'=>Auth::User()->id_registro])->get();
                if(count($totalDoctos)<3)
                {
                    $post['id_status_requerimiento'] =  0;
                    $t_datosConstancia=T_Tramite_Constancia::queryToDB(['id_registro'=>Auth::User()->id_registro])->first();
                    $t_datosConstancia->fill($post)->save();
                }
                
                unset($documento, $t_datosConstancia);

                $vrespuesta['respuesta']='El documento ha sido eliminado correctamente';
        }
        catch(Exception $vexception ){
            $vstatus=500;
            $vrespuesta['message']=$vexception->getMessage();
        }
        return response()->json($vrespuesta, $vstatus);
    }
}