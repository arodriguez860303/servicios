<?php
namespace App\Http\Classes;

use SoapClient;


class clsRevisaFolioHacienda {
    
    public static function getFolioPago($folio) {
        $valor = 0;
        //instancio el webservice
        $servicio = new SoapClient("https://soluciones.haciendachiapas.gob.mx/Servicios/IngresosFI/Service.asmx?wsdl");

        //DRS018 y DRS019
        //ConsultaFolioRec: Folios LB
        //ConsultaFolio: Folios FI y FO   

        //Consulta folio para el filtro DRS018     
        $param = array(
            "PmFolio" => $folio,
            "PmCaso" => "DRS018",
            "PmSec01" => "[_pR7eb4M3#COnT%10#22_f3B]",
            "PmSec02" => "Ws_D1r3c_10n_R13SSg0S_s41nt4RI0s"
        );
        
        $result = $servicio->ConsultaFolio($param);        
        if($result->ConsultaFolioResult=="Registro no disponible")
        {
            //Consulta folio para el filtro DRS019  
            $param2 = array(
                "PmFolio" => $folio,
                "PmCaso" => "DRS019",
                "PmSec01" => "[_pR7eb4M3#COnT%10#22_f3B]",
                "PmSec02" => "Ws_D1r3c_10n_R13SSg0S_s41nt4RI0s"
            );
            
            $result2 = $servicio->ConsultaFolio($param2);             
            if($result2->ConsultaFolioResult=="Registro no disponible")
            {
                //Consulta folio para el filtro DRS018
                $param3 = array(
                    "PmFolio" => $folio,
                        "PmCaso" => "DRS018",
                        "PmSec01" => "[_pR7eb4M3#COnT%10#22_f3B]",
                        "PmSec02" => "Ws_D1r3c_10n_R13SSg0S_s41nt4RI0s"
                );
                
                $result3 = $servicio->ConsultaFolioRec($param3);                
                if($result3->ConsultaFolioRecResult=="Registro no disponible")
                {
                    //Consulta folio para el filtro DRS019
                    $param4 = array(
                            "PmFolio" => $folio,
                            "PmCaso" => "DRS019",
                            "PmSec01" => "[_pR7eb4M3#COnT%10#22_f3B]",
                            "PmSec02" => "Ws_D1r3c_10n_R13SSg0S_s41nt4RI0s"
                    );                    

                    $result4 = $servicio->ConsultaFolioRec($param4);
                    if($result4->ConsultaFolioRecResult=="Registro no disponible")
                        $valor = 0;                    
                    else
                        $valor = 1;                    
                }
                else                
                    $valor=1;                
            }       
            else
                $valor=1;                             
        }
        else        
            $valor=1;
       
        return $valor;
    }
}