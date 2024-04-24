<?php
namespace App\Http\Controllers\Catalogos;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Models\Catalogos\C_Usuarios;
use App\Http\Models\Backend\T_Tramites;
use App\Http\Models\Mantenimiento\RoleUser;
use App\Http\Requests\Catalogos\UsuariosRequest;
use Illuminate\Support\Facades\Hash;
use DB;

class UsuariosController extends Controller
{
    private $route='usuarios';
    public function __construct()
    {
        view()->share('title', 'Usuarios del sistema');
        view()->share('current_route', $this->route);       
    } 
    
    public function getResults(Request $vrequest)
     {
        // Descripción: Función para consultar todos los  usuarios
        // Creación: Miercoles, 23 de Agosto de 2023
        // Versión: 1.0.0

        $vHTTPCode=200;
        $vresponse=['codigo'=>1, 'mensaje'=>'Exito', 'icono'=>'success'];
        try {
            $vfilter=array();
            switch ($vrequest->method) {
                case 'show':
                    $vresponse['respuesta']=C_Usuarios::queryToDetailDB(['id'=>$vrequest->id])->first();
                  break; 
                case 'get':
                    $filtro=array();
                    $vresponse['respuesta']=C_Usuarios::queryToDB($filtro)->get();
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

    public function index()
     {
        return view('catalogos.usuarios.index');
     }

    public function create()
     {
        return view('catalogos.usuarios.create');
     }    

    public function edit($id)
     {
        return view('catalogos.usuarios.edit', ['id' => $id]);
     }

    public function store(UsuariosRequest $vrequest)
     {
        $vstatusHTTP=201;
        $vresponse=['icono'=>'warning', 'codigo'=> 0, 'mensaje'=> 'No se pudieron insertar los datos, intente de nuevo.', 'url'=>''];

        $post = $vrequest->only('id', 'txtNombre', 'txtCorreo', 'txtNickname', 'txtPassword');

        //creo el arreglo para roles
        $post_rol = $vrequest->only('id_rol');

        $post['name']          =$vrequest->input('txtNombre');
        $post['nickname']      =$vrequest->input('txtNickname');
        $post['email']         =$vrequest->input('txtCorreo');
        $post['password']      =Hash::make(trim($vrequest->input('txtPassword')));
        $post['recovery_pass'] = base64_encode(trim($post['txtPassword']));

        $existe_usuario = 0;
        
        //valido para saber si es una edicion o una insercion nueva
        if(isset($post['id']))
        {            
            $id=$post['id'];
            $datos = C_Usuarios::find($post['id']);
            $datos_rol = RoleUser::obtener_rol($datos->id);

            //busco si ya hay un nickname registrado
            $buscaUser = C_Usuarios::queryToExistsDB(['nickname'=>trim($vrequest->input('txtNickname')), 'id_usuario'=>$id])->first();

            if(!empty($buscaUser))
               $existe_usuario = 1;             
        }
        else
        {
            $id=0;
            $datos= new C_Usuarios;
            $datos_rol= new RoleUser;

            //busco si ya hay un nickname registrado
            $buscaUser = C_Usuarios::queryToExistsDB(['nickname'=>trim($vrequest->input('txtNickname'))])->first();

            if(!empty($buscaUser))
               $existe_usuario = 1;
        }

        if($existe_usuario==1)
        {
            $vresponse=['icono'=>'warning', 'codigo'=> 0, 'mensaje'=> 'Ya existe una cuenta creada con ese nickname', 'url'=> ''];
        }
        else
        {
            try {
                    DB::beginTransaction();

                    //guardo los datos
                    $datos->fill($post)->save();

                    //guardo los datos del rol
                    $post_rol['user_id']=$datos->id;
                    $post_rol['role_id']=$post_rol['id_rol'];
                    $datos_rol->fill($post_rol)->save(); 

                    if(isset($post['id']))
                        $msg= "El usuario fue modificado satisfactoriamente";                
                    else
                        $msg= "El usuario fue creado satisfactoriamente";                   

                    $vresponse=['icono'=>'success', 'codigo'=> 1, 'mensaje'=> $msg, 'url'=> route($this->route.'.index')];

                    DB::commit();
                }
                catch ( Exception $e ) {
                    DB::rollback();
                    $vstatusHTTP=500;
                    $vrespuesta=[
                        'icono'=>'danger', 
                        'codigo'=> -1, 
                        'message'=> 'Error en el servidor, verifiquelo con el administrador, '. $e->getMessage()
                    ];
            }
        }

        return response()->json($vresponse, $vstatusHTTP, [], JSON_HEX_APOS|JSON_HEX_QUOT);
     }
    
    public function destroy($id)
    {
        $vHTTPCode=200;
        $vresponse=['icono'=>'warning', 'codigo'=> 0, 'mensaje'=> 'No se pudieron insertar los datos, intente de nuevo.'];

        //consulto si el usuario no tiene tramites pendientes
        $_usuario = C_Usuarios::find($id);
        $_idRegistro = $_usuario->id_registro;
        $tramites = T_Tramites::queryToSearchTramitesUserDB(['id_registro'=>$_idRegistro])->get();

        $status=0;
        if(isset($_usuario->id_registro))
        {            
           if(count($tramites) > 0)
            {
                $vresponse=['icono'=>'warning', 'codigo'=> 0, 'mensaje'=> 'No se puede eliminar el usuario. Porque tiene trámites registrados.'];
                $status=1;
            }            
        }
        
        if($status==0)
        {
            try {
                    $eliminar=C_Usuarios::findOrFail($id);            
                    $eliminar->delete();
                
                    $vresponse=['icono'=>'success', 'codigo'=> 1, 'mensaje'=> 'El usuario ha sido eliminado correctamente.'];
                }
            catch (Exception $vexception) {
                $vHTTPCode=500;
                $vresponse=[
                    'codigo'=>-1,
                    'mensaje'=>'Error en el servidor! Comuniquese con su administrador '. $vexception->getMessage(),
                    'icono'=>'danger'
                ];
            }                         
        }
        
        return response()->json($vresponse, $vHTTPCode);
    }    
}