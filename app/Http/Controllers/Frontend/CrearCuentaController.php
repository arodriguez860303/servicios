<?php
namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Classes\Validaciones;
use App\Http\Requests\Frontend\CrearCuentaRequest;
use App\Http\Requests\Frontend\CrearCuentaHospitalRequest;
use App\Http\Requests\Frontend\RecuperarPassRequest;
use App\Http\Models\Backend\T_Registro;
use App\Http\Models\Backend\D_Personal;
use App\Http\Models\Backend\D_Domicilios;
// use App\Http\Classes\CorreoPlantillas;
// use App\Http\Classes\Correo;
// use App\Http\Classes\clsFunciones;
use DB;
use Hash;
use Str;
use App\User;

class CrearCuentaController extends Controller
{
    private $route='crear-cuenta';
    public function __construct()
    {
        view()->share('title', 'crear-cuenta');
        view()->share('current_route', $this->route);       
    } 

    public function create(){
        $chk_sexo_1='checked=""'; $chk_sexo_2="";  

        return view('frontend.crear-cuenta.create', 
                    [              
                        'chk_sexo_1'=>$chk_sexo_1,
                        'chk_sexo_2'=>$chk_sexo_2
                    ]);
    }

    public function store(CrearCuentaRequest $request){  
        $arr_validacion= [];
        $validacion = new Validaciones;
        $status= 1; $code= 201;
        $post= $request->all();  

        //Datos domicilio
        $post_domiclio['id_municipio']  =$post['id_municipio'];
         
        $post_domiclio['codigo_postal'] =trim($post['codigo_postal']);
        $post_domiclio['calle']         =trim($post['calle']);
        $post_domiclio['num_exterior']  =trim($post['num_exterior']);
        $post_domiclio['num_interior']  =trim($post['num_interior']);
        $post_domiclio['colonia']       =trim($post['colonia']);
        $post_domiclio['entre_calle']   =trim($post['entre_calle']);
        $post_domiclio['y_calle']       =trim($post['y_calle']);

        //Datos personales
        $p_personal['nombre']             = strtoupper(trim($post['nombre']));
        $p_personal['ap_paterno']         = strtoupper(trim($post['ap_paterno']));
        $p_personal['ap_materno']         = strtoupper(trim($post['ap_materno']));
        $p_personal['curp']               = strtoupper(trim($post['curp']));
        $p_personal['rfc']                = strtoupper(trim($post['rfc']));
        $p_personal['sexo']               = $post['sexo'];
        $p_personal['telefono']           = $post['telefono'];
        $p_personal['correo_electronico'] = strtolower(trim($post['correo']));                      
        
        //Datos para tabla T_Registro
        $p_registro['id_tipo_tramite']       = 1;    
        
        $p_registro['rfc']                   = strtoupper(trim($post['rfc']));
        $p_registro['curp']                  = strtoupper(trim($post['curp']));
        $p_registro['razon_social_o_nombre'] = strtoupper(trim($post['nombre'].' '.$post['ap_paterno'].' '.$post['ap_materno']));
        $p_registro['telefono']              = $post['telefono'];
        $p_registro['email']                 = $post['correo'];

        /*Datos para la tabla user*/        
        $p_usuario['name']            = strtoupper(trim($p_registro['razon_social_o_nombre']));
        $p_usuario['nickname']        = $post['nickname'];
        $p_usuario['email']           = $post['correo'];
        $claro                        = trim($post['password']);
        $p_usuario['password']        = Hash::make(trim($post['password']));  
        
        $p_usuario['recovery_pass']   = base64_encode(trim($post['password']));
        
        $validacion->crearCuentaNueva(['nickname'=>$post['nickname'], 'curp'=>trim($post['curp'])]);        

        if(!$validacion->getStatusB()){             
            try{
                DB::beginTransaction();   
                
                $d_domicilio= new D_Domicilios;
                $d_personal= new D_Personal;
                $d_registro= new T_Registro;
                $usuario= new User;


                $d_domicilio->fill($post_domiclio)->save();

                $p_personal['id_d_domicilio']= $d_domicilio->id;
                $d_personal->fill($p_personal)->save();
              
                $p_registro['id_d_personal']= $d_personal->id;             
                $p_registro['id_d_domicilio']= $d_domicilio->id;
                $d_registro->fill($p_registro)->save();

                $p_usuario['id_registro']= $d_registro->id;
                $usuario->fill($p_usuario)->save();

                if($d_registro->id_tipo_tramite == 1)
                    $usuario->roles()->sync([2]);
                else
                    $usuario->roles()->sync([6]);
                DB::commit();  
                        
                //Se envia el correo con los datos de registro
                // $vdatos=array();
                // if($id_tipo_persona==1)
                //     $vdatos['name']= $p_registro['razon_social_o_nombre'];               

                // $vdatos['nickname']= trim($p_usuario['nickname']);
                // $vdatos['password']= $claro;
            
                // $datos_correo=array();
                // $datos_correo['asunto']= 'DIPRIS: Registro de cuenta de usuario';
                // $datos_correo['cuerpo']= CorreoPlantillas::creacion_cuenta($vdatos);
                // $datos_correo['correo_destinatario']=[$p_registro['email']];
                // if($id_tipo_persona==1)
                //     $datos_correo['nombre_destinatario']= $p_registro['razon_social_o_nombre'];        
               
                // $vstatusCorreo= Correo::sendEmail($datos_correo, 1);

                $msg= "La cuenta ha sido creada satisfactoriamente, se ha enviado un mensaje de bienvenida con sus datos al correo registrado"; 
                //$route_redirect= route('login');
                $route_redirect= route('crear-cuenta.notificacion', [$d_registro->id]);
                $data= [];
            }catch (\Exception $e) {
                $status= 3; $code= 409; $msg= $e->getMessage(); $route_redirect= ""; $data= [];
                DB::rollback();                       
            }
        }else{
            $status= 3; $code= $validacion->getStatusCode(); $msg= $validacion->getStatusMsg(); $route_redirect= ""; $data= [];
        }
        return response()->json(['status'=>$status, 'code'=>$code, 'msg'=>$msg, 'route_redirect'=>$route_redirect, 'data'=>$data], $code);
    }

    public function recuperar_password(RecuperarPassRequest $request){ 
       //busco el correo y la curp en la tabla registro
        $array=[];
        $array['correo']=$request->input('txtCorreo');
        $array['curp']=$request->input('txtCurp');
        $datos=T_Registro::dtsUserRegistro($array);

        $status= 1; $code= 201;

        if(!isset($datos->curp) && !isset($datos->email))
        {
            $msg= "La CURP o el Correo proporcionado no se encuentra registrado.";
            $status= 3; $code= 409;  $route_redirect= ""; $data= [];
        }
        else
        {
            //busco el id de usuario
            $array2=[];
            $array2['id_registro']=$datos->id;
                     

            try{
                DB::beginTransaction();            

                    $usuario=User::general($array2)->first();
                    $contrasenia = base64_decode($usuario->recovery_pass);

                    $data['nombre']= $usuario->name; 
                    $data['usuario']= $usuario->nickname; 
                    $data['contrasenia']= $contrasenia; 

                DB::commit();              
                $msg= "La contraseña se ha recuperado satisfactoriamente."; 
                $route_redirect= route('login');
                  
            }catch (\Exception $e) {
                $status= 3; $code= 409; $msg= $e->getMessage(); $route_redirect= ""; $data= [];
                DB::rollback();                       
            }   
        }

        return response()->json(['status'=>$status, 'code'=>$code, 'msg'=>$msg, 'route_redirect'=>$route_redirect, 'data'=>$data], $code);
    }

    public function notificacion($id){
        $datos = T_Registro::get_cuenta($id);
        $datos->recovery_pass = base64_decode($datos->recovery_pass);
        return view('frontend.crear-cuenta.notificacion', ['datos'=>$datos]);
    }

    /*Metodos para hospitales*/
    public function create_hospital()
     {
        return view('frontend.crear-cuenta.hospital.create');
     }

    public function store_hospital(CrearCuentaHospitalRequest $request)
     {
        $arr_validacion= [];
        $validacion = new Validaciones;
        $status= 1; $code= 201;
        $post= $request->all();  

        //Datos personales
        $p_personal['nombre']             = strtoupper(trim($post['nombre']));
        $p_personal['ap_paterno']         = strtoupper(trim($post['ap_paterno']));
        $p_personal['ap_materno']         = strtoupper(trim($post['ap_materno']));
        $p_personal['curp']               = strtoupper(trim($post['curp']));

        //Datos para tabla T_Registro
        $p_registro['id_tipo_tramite']    = 2;    
        $p_registro['id_hospital']        = $post['id_hospital'];    
        
        $p_registro['curp']                  = strtoupper(trim($post['curp']));
        $p_registro['razon_social_o_nombre'] = strtoupper(trim($post['nombre'].' '.$post['ap_paterno'].' '.$post['ap_materno']));

        /*Datos para la tabla user*/        
        $p_usuario['name']            = strtoupper(trim($p_registro['razon_social_o_nombre']));
        $p_usuario['nickname']        = $post['nickname'];       
        $claro                        = trim($post['password']);
        $p_usuario['password']        = Hash::make(trim($post['password']));  
        
        $p_usuario['recovery_pass']   = base64_encode(trim($post['password']));
        
        $validacion->crearCuentaNueva(['nickname'=>$post['nickname'], 'curp'=>trim($post['curp'])]); 

        if(!$validacion->getStatusB()){
            try{
                DB::beginTransaction();

                $d_personal= new D_Personal;
                $d_registro= new T_Registro;
                $usuario= new User;

                $d_personal->fill($p_personal)->save();
              
                $p_registro['id_d_personal']= $d_personal->id;    
                $d_registro->fill($p_registro)->save();

                $p_usuario['id_registro']= $d_registro->id;
                $usuario->fill($p_usuario)->save();

                $usuario->roles()->sync([6]);
                DB::commit();  

                $msg= "La cuenta ha sido creada satisfactoriamente, se ha enviado un mensaje de bienvenida con sus datos al correo registrado";            
                $route_redirect= route('crear-cuenta.notificacion', [$d_registro->id]);
                $data= [];

            }catch (\Exception $e) {
                $status= 3; $code= 409; $msg= $e->getMessage(); $route_redirect= ""; $data= [];
                DB::rollback();                       
            }

        }else{
            $status= 3; $code= $validacion->getStatusCode(); $msg= $validacion->getStatusMsg(); $route_redirect= ""; $data= [];
        }
        return response()->json(['status'=>$status, 'code'=>$code, 'msg'=>$msg, 'route_redirect'=>$route_redirect, 'data'=>$data], $code);
     }
}
