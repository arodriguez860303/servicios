<?php

namespace App\Http\Models\Backend;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use DB;

class T_Tramite_Observacion extends Model
{
    use SoftDeletes;
    protected $dates = ['deleted_at'];
    protected $table = 't_tramites_observaciones';
    protected $fillable = [
        'id',
        'id_tramite_documento', 
        'id_tramite',
        'id_c_documento', 
        'id_usuario_observo',
        'observacion',        
        'observacion_solventacion', 
        'documento',
        'ruta',
        'extension',
        'aceptado',
        'solventado'
    ];

    protected $hidden = [
        //'id',
    ];

    public static function queryToDB($vfiltros=[])
     {
        /**
         * Consulta principal a la tabla t_tramites para traer el listado de tramites
         * 11 de Agosto de 2023
         * */
        $vqueryToDB=T_Tramite_Observacion::select(
            't_tramites_observaciones.id',
            't_tramites_observaciones.observacion',
            'c_documentos_tramite.nombre as documento',
            't_tramites_observaciones.created_at as fecha',
            't_tramites_observaciones.id_c_documento',
            't_tramites_observaciones.solventado',
            't_tramites_observaciones.aceptado'
        );   
          
        $vqueryToDB = $vqueryToDB->leftJoin('c_documentos_tramite', 't_tramites_observaciones.id_c_documento', '=', 'c_documentos_tramite.id'); 

        if(array_key_exists('id_tramite', $vfiltros)){
            $filtro= $vfiltros["id_tramite"];
            $vqueryToDB= $vqueryToDB->where( function($sql) use ($filtro)
            {
                $sql->where('t_tramites_observaciones.id_tramite','=', $filtro);
            });
        }

        if(array_key_exists('aceptado', $vfiltros)){
            $filtro= $vfiltros["aceptado"];
            $vqueryToDB= $vqueryToDB->where( function($sql) use ($filtro)
            {
                $sql->where('t_tramites_observaciones.aceptado','=', $filtro);
            });
        }

        $vqueryToDB = $vqueryToDB->whereNull('t_tramites_observaciones.deleted_at');     
       
        return $vqueryToDB;
     }

    public static function queryToSolventacionesDB($vfiltros=[])
     {
        /**
         * Consulta principal a la tabla t_tramites para traer el listado de tramites
         * 11 de Agosto de 2023
         * */
        $vqueryToDB=T_Tramite_Observacion::select(
            't_tramites_observaciones.id as id_observacion',
            't_tramites_observaciones.observacion',
            't_tramites_observaciones.aceptado',
            'c_documentos_tramite.nombre as documento',
            't_tramites_documentos.ruta',
            't_tramites_documentos.documento as nombre_archivo',
            't_tramites_documentos.id as id_documento_tramite'           
        );   
          
        $vqueryToDB = $vqueryToDB->leftJoin('c_documentos_tramite', 't_tramites_observaciones.id_c_documento', '=', 'c_documentos_tramite.id'); 
        $vqueryToDB = $vqueryToDB->leftJoin('t_tramites_documentos', 't_tramites_observaciones.id_tramite_documento', '=', 't_tramites_documentos.id'); 

        if(array_key_exists('id_tramite', $vfiltros)){
            $filtro= $vfiltros["id_tramite"];
            $vqueryToDB= $vqueryToDB->where( function($sql) use ($filtro)
            {
                $sql->where('t_tramites_observaciones.id_tramite','=', $filtro);
            });
        }   

        $vqueryToDB = $vqueryToDB->whereNull('t_tramites_observaciones.deleted_at');     
       
        return $vqueryToDB;
     }

     public static function queryToFotoSolventadaDB($vfiltros=[])
     {
        /**
         * Consulta principal a la tabla t_tramites para traer la foto solventada
         * 11 de Agosto de 2023
         * */
        $vqueryToDB=T_Tramite_Observacion::select(
            't_tramites_observaciones.ruta',
            't_tramites_observaciones.documento'        
        );   
          
        if(array_key_exists('id_tramite', $vfiltros)){
            $filtro= $vfiltros["id_tramite"];
            $vqueryToDB= $vqueryToDB->where( function($sql) use ($filtro)
            {
                $sql->where('t_tramites_observaciones.id_tramite','=', $filtro);
            });
        }

        if(array_key_exists('id_tramite_documento', $vfiltros)){
            $filtro= $vfiltros["id_tramite_documento"];
            $vqueryToDB= $vqueryToDB->where( function($sql) use ($filtro)
            {
                $sql->where('t_tramites_observaciones.id_tramite_documento','=', $filtro);
            });
        }

        $vqueryToDB = $vqueryToDB->whereNull('t_tramites_observaciones.deleted_at');     
       
        return $vqueryToDB;
     }

     public static function queryToAllDB($vfiltros=[])
     {
        /**
         * Consulta principal a la tabla t_tramites para traer el listado de tramites
         * 11 de Agosto de 2023
         * */
        $vqueryToDB=T_Tramite_Observacion::select(
            't_tramites_observaciones.*'            
        );   
                
        if(array_key_exists('id_tramite', $vfiltros)){
            $filtro= $vfiltros["id_tramite"];
            $vqueryToDB= $vqueryToDB->where( function($sql) use ($filtro)
            {
                $sql->where('t_tramites_observaciones.id_tramite','=', $filtro);
            });
        }

        $vqueryToDB = $vqueryToDB->whereNull('t_tramites_observaciones.deleted_at');     
       
        return $vqueryToDB;
     }
 }