<?php

namespace App\Http\Models\Catalogos;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use DB;

class C_Documentos extends Model
{
    use SoftDeletes;
    protected $dates = ['deleted_at'];
    protected $table = 'c_documentos_tramite';
    protected $fillable = [
        'id', 'id_tipo_tramite', 'nombre', 'obligatorio'
    ];

    protected $hidden = [
        //'id',
    ];

    public static function lista_documentacion_tramite($id_registro)
    {
        $registro = \App\Http\Models\Backend\T_Registro::find($id_registro);
        
        $documentos = self::documentos_requeridos_m();

        $documentos_requeridos = [];
        foreach ($documentos as $documento) {
            $array             = [];
            $tramite_documento = \App\Http\Models\Frontend\T_Tramite_Documentacion::documentacion_requerida_tmp($id_registro, $documento->id);

            $array  = [
                        "id" => $documento->id, 
                        "documento" => $documento->nombre,
                        "id_tramite_documento" => null,
                        "id_c_documento_tramite" => null
                      ];
            
            if ($tramite_documento != null) {
                $array["id_tramite_documento"]     = $tramite_documento->id;
                $array["id_c_documento_tramite"] = $tramite_documento->id_c_documento_tramite;
                $array["descarga"]                 = $tramite_documento->path . "/" . $tramite_documento->nombre . "." . $tramite_documento->extension; 
                $array['id_status'] = $tramite_documento->id_status;               
            }
                     
            array_push($documentos_requeridos, $array);
        }

        return $documentos_requeridos;
    }

    public static function documentos_requeridos_m()
    {
        $result = C_Documentos::select('*');

        $result = $result->where("id_tipo_tramite", 1);        
        $result = $result->where("obligatorio", 1);        
        
        $result = $result->orderBy('id', 'asc');
        return $result->get();
    }



    /*Consultas para tramites de hospital*/

    public static function lista_documentacion_hospital($id_registro)
    {
        $registro = \App\Http\Models\Backend\T_Registro::find($id_registro);
        
        $documentos = self::documentos_requeridos_hospital();

        $documentos_requeridos = [];
        foreach ($documentos as $documento) {
            $array             = [];
            $tramite_documento = \App\Http\Models\Frontend\T_Tramite_Documentacion::documentacion_requerida_tmp($id_registro, $documento->id);

            $array  = [
                        "id" => $documento->id, 
                        "documento" => $documento->nombre,
                        "id_tramite_documento" => null,
                        "id_c_documento_tramite" => null
                      ];
            
            if ($tramite_documento != null) {
                $array["id_tramite_documento"]     = $tramite_documento->id;
                $array["id_c_documento_tramite"] = $tramite_documento->id_c_documento_tramite;
                $array["descarga"]                 = $tramite_documento->path . "/" . $tramite_documento->nombre . "." . $tramite_documento->extension; 
                $array['id_status'] = $tramite_documento->id_status;               
            }
                     
            array_push($documentos_requeridos, $array);
        }

        return $documentos_requeridos;
    }

    public static function documentos_requeridos_hospital()
    {
        $result = C_Documentos::select('*');

        $result = $result->where("id_tipo_tramite", 2);        
        $result = $result->where("obligatorio", 1);        
        
        $result = $result->orderBy('id', 'asc');
        return $result->get();
    }
}