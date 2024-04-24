<?php

namespace App\Http\Models\Frontend;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use DB;

class T_Tramite_Documentacion extends Model
{
    use SoftDeletes;
    protected $dates = ['deleted_at'];
    protected $table = 't_tramites_documentos';
    protected $fillable = [
        'id',
        'id_tramite', 
        'id_registro_temp',
        'id_c_documento_tramite',
        'documento',
        'ruta',        
        'extension', 
        'size',
        'baseFile',
        'id_status',
        'id_usuario_subio',
        'solventacion'
    ];

    protected $hidden = [
        //'id',
    ];

    public static function documentacion_requerida_tmp($id_registro, $id_documento) {      
        $result = T_Tramite_Documentacion::select('*')->where('id_registro_temp', $id_registro)->where('id_c_documento_tramite', $id_documento)->where('id_tramite', 0)->first();
        return $result;
    }

    public static function general($data = [])
    {
        $result = T_Tramite_Documentacion::select(
            't_tramites_documentos.id',
            't_tramites_documentos.id_registro_temp',
            't_tramites_documentos.id_c_documento_tramite'      
        );
       
        if (array_key_exists('id_documento', $data)) {
            $filtro = $data["id_documento"];
            $result = $result->where(function ($sql) use ($filtro) {
                $sql->where('t_tramites_documentos.id_c_documento_tramite', '=', $filtro);
            });
        }
       
        if (array_key_exists('id_registro_temp', $data)) {
            $filtro = $data["id_registro_temp"];
            $result = $result->where(function ($sql) use ($filtro) {
                $sql->where('t_tramites_documentos.id_registro_temp', '=', $filtro);
            });
        }

        $result = $result->whereNull('t_tramites_documentos.deleted_at');

        $result = $result->orderBy('t_tramites_documentos.id', 'DESC');

        return $result;
    }

    public static function queryToDB($data = [])
    {
        $result = T_Tramite_Documentacion::select(
            't_tramites_documentos.*'     
        );       
     
        if (array_key_exists('id_registro_temp', $data)) {
            $filtro = $data["id_registro_temp"];
            $result = $result->where(function ($sql) use ($filtro) {
                $sql->where('t_tramites_documentos.id_registro_temp', '=', $filtro);
            });
        }

        if (array_key_exists('id_tramite', $data)) {
            $filtro = $data["id_tramite"];
            $result = $result->where(function ($sql) use ($filtro) {
                $sql->where('t_tramites_documentos.id_tramite', '=', $filtro);
            });
        }

        $result = $result->whereNull('t_tramites_documentos.deleted_at');

        $result = $result->orderBy('t_tramites_documentos.id', 'DESC');

        return $result;
    }

    public static function queryToDocumentacionDB($data = [])
    {
        $result = T_Tramite_Documentacion::select(
            't_tramites_documentos.id as id_documento_tramite',
            't_tramites_documentos.id_tramite',            
            't_tramites_documentos.documento as archivo',
            't_tramites_documentos.ruta',        
            't_tramites_documentos.extension', 
            't_tramites_documentos.size',           
            't_tramites_documentos.id_status',
            'c_documentos_tramite.nombre as nombre_documento',
            'c_status.nombre as status',
            'c_status.color as status_color',
            't_tramites_documentos.id_c_documento_tramite as id_c_documento'
        ); 

        $result = $result->leftJoin('c_documentos_tramite', 't_tramites_documentos.id_c_documento_tramite', '=', 'c_documentos_tramite.id');
        $result = $result->leftJoin('c_status', 't_tramites_documentos.id_status', '=', 'c_status.id');  

        if (array_key_exists('id_tramite', $data)) {
            $filtro = $data["id_tramite"];
            $result = $result->where(function ($sql) use ($filtro) {
                $sql->where('t_tramites_documentos.id_tramite', '=', $filtro);
            });
        }

        if (array_key_exists('id_status', $data)) {
            $filtro = $data["id_status"];
            $result = $result->where(function ($sql) use ($filtro) {
                $sql->where('t_tramites_documentos.id_status', '=', $filtro);
            });
        }

        if (array_key_exists('id_status_obs_solv', $data)) {
            $filtro = $data["id_status_obs_solv"];
            $result = $result->where(function ($sql) use ($filtro) {
                $sql->where('t_tramites_documentos.id_status', '=', $filtro)->orWhere('t_tramites_documentos.id_status', '=', 9);
            });
        }
       

        if (array_key_exists('solventacion', $data)) {
            $filtro = $data["solventacion"];
            $result = $result->where(function ($sql) use ($filtro) {
                $sql->where('t_tramites_documentos.solventacion', '=', $filtro);
            });
        }

        $result = $result->whereNull('t_tramites_documentos.deleted_at');

        $result = $result->orderBy('t_tramites_documentos.id', 'ASC');

        return $result;
    }

    public static function setFoto($id_tramite){
        $query=  T_Tramite_Documentacion::select(
            't_tramites_documentos.ruta', 
            't_tramites_documentos.documento', 
            't_tramites_documentos.id_status', 
            't_tramites_documentos.id'
        );
        $query= $query->where('t_tramites_documentos.id_tramite', '=', $id_tramite);
        $query= $query->whereNull('t_tramites_documentos.deleted_at');
        $query= $query->where('t_tramites_documentos.id_c_documento_tramite', '=', 1)->first();

        return $query;      
    }

    public static function setFotoHospital($id_tramite){
        $query=  T_Tramite_Documentacion::select(
            't_tramites_documentos.ruta', 
            't_tramites_documentos.documento', 
            't_tramites_documentos.id_status', 
            't_tramites_documentos.id'
        );
        $query= $query->where('t_tramites_documentos.id_tramite', '=', $id_tramite);
        $query= $query->whereNull('t_tramites_documentos.deleted_at');
        $query= $query->where('t_tramites_documentos.id_c_documento_tramite', '=', 5)->first();

        return $query;      
    }
 }