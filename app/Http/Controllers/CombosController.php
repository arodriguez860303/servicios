<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Models\Catalogos\C_Rol;
use App\Http\Models\Catalogos\C_Municipios;
use App\Http\Models\Catalogos\C_Tipo_Tramite;
use App\Http\Models\Catalogos\C_Hospitales;

class CombosController extends Controller
{	      
    public function tipoRoles(Request $vrequest)
     {
        // Descripción: Función para el catalogo de roles
        // Creación: Miercoles 23 de Agosto de 2023
        // Versión: 1.0.0

        $vHTTPCode=200;
        $vresponse=['codigo'=>1, 'mensaje'=>'Exito', 'icono'=>'success'];
        try {
            $vfilter=array();
            switch ($vrequest->method) {
                case 'show':
                        $vresponse['respuesta']=C_Rol::findOrFail($vrequest->id);
                    break;
                case 'get':
                        $vresponse['respuesta']=C_Rol::queryToDB($vfilter)->get();
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

    //lista el catalogo de municipios
    public function getMunicipios(Request $vrequest)
     {
        // Descripción: Función para el catalogo de roles
        // Creación: Miercoles 23 de Agosto de 2023
        // Versión: 1.0.0

        $vHTTPCode=200;
        $vresponse=['codigo'=>1, 'mensaje'=>'Exito', 'icono'=>'success'];
        try {
            $vfilter=array();
            switch ($vrequest->method) {
                case 'show':
                        $vresponse['respuesta']=C_Municipios::findOrFail($vrequest->id);
                    break;
                case 'get':

                        $vresponse['respuesta']=C_Municipios::queryToDB(['id_estado'=>$vrequest->id_estado])->get();
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

    public function getTipoTramite(Request $vrequest)
     {
        // Descripción: Función para el catalogo de tipo de tramite
        // Creación: Miercoles 20 de Septiembre de 2023
        // Versión: 1.0.0

        $vHTTPCode=200;
        $vresponse=['codigo'=>1, 'mensaje'=>'Exito', 'icono'=>'success'];
        try {
            $vfilter=array();
            switch ($vrequest->method) {
                case 'show':
                        $vresponse['respuesta']=C_Tipo_Tramite::findOrFail($vrequest->id);
                    break;
                case 'get':
                        $vresponse['respuesta']=C_Tipo_Tramite::queryToDB($vfilter)->get();
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

    public function getHospitales(Request $vrequest)
     {
        // Descripción: Función para el catalogo de hospitales
        // Creación: Miercoles 20 de Septiembre de 2023
        // Versión: 1.0.0

        $vHTTPCode=200;
        $vresponse=['codigo'=>1, 'mensaje'=>'Exito', 'icono'=>'success'];
        try {
            $vfilter=array();
            switch ($vrequest->method) {
                case 'show':
                        $vresponse['respuesta']=C_Hospitales::findOrFail($vrequest->id);
                    break;
                case 'get':
                        $vresponse['respuesta']=C_Hospitales::queryToDB($vfilter)->get();
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
}