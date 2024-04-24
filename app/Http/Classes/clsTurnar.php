<?php
namespace App\Http\Classes;
use \App\Http\Models\Mantenimiento\RoleUser;
use DB;

class clsTurnar{
    private $id_usuario_r;

    public function __construct()
    {
        $this->id_usuario_r= 0;
    }

    public function getResponsableAlimentos(){
        return $this->id_usuario_r;
    }

    public function asignar_responsables_alimentos(){    
        $status= true;
        try {
            DB::beginTransaction(); 
            $this->id_usuario_r= RoleUser::obtener_responsable_alimentos()->user_id;
            DB::commit();
        }catch (\Exception $e) {
            $status= false;
            DB::rollback();                       
        }
        return $status;
    }


    public function getResponsableHospital(){
        return $this->id_usuario_r;
    }


    public function asignar_responsables_hospital(){    
        $status= true;
        try {
            DB::beginTransaction(); 
            $this->id_usuario_r= RoleUser::obtener_responsable_hospital()->user_id;
            DB::commit();
        }catch (\Exception $e) {
            $status= false;
            DB::rollback();                       
        }
        return $status;
    }
}
?>