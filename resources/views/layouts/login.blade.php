<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">


    <link href="{{ asset('lgDipris/fonts/icomoon/style.css') }}" rel="stylesheet">
    <link href="{{ asset('lgDipris/css/bootstrap.min.css') }}" rel="stylesheet">
    <link href="{{ asset('lgDipris/css/style.css') }}" rel="stylesheet">

    <link href="{{ asset('lgDipris/font-awesome/css/font-awesome.min.css') }}" rel="stylesheet">

    <title>DIPRIS | Plataforma Digital para la Atención de Trámites Administrativos</title>
  </head>
  <body>
  
	<div style="background:#621132; color:#FFF;  align-items: center; display: flex; height: 90px; justify-content: center; text-align:center">
	  <h3 class="titulo"><strong>Plataforma Digital para la Atención de Trámites Administrativos de DIPRIS</strong></h3>
	</div>
  
  <div class="content">
    <div class="container">
      <div class="row">

        <div class="col-md-6 order-md-2">
          <img src="{{ asset('lgDipris/images/salud-logo.png') }}" alt="Image" class="img-fluid">
        </div>
        <div class="col-md-6 contents">
          <div class="row justify-content-center">
            <div class="col-md-8">
              <div class="mb-4">
                <h3>Inicio de Sesión</h3>
                <p class="mb-4">Por favor ingresa tu nombre de usuario y contraseña:</p>
              </div>
              @yield('content') 			
            </div>
          </div>
          
        </div>
        
      </div>

    </div>

    <hr class="lineaD"> 
    <div class="container">
     <div class="mb-4"  style="text-align:center">
      <h4>¿ Aun no tienes Cuenta ? Crea una</h4> 
      <a class="btn text-white " href="crear-cuenta/registro" role="button" style="background:#333333; width:250px; margin:auto; text-decoration: none;"><img src="{{ asset('img/iconos/constancia.png') }}" style="width: 20%"> Alimentos</a>

      <a class="btn btn-info text-white " href="crear-cuenta/registro-hospitales" role="button" style="width:250px; margin:auto; text-decoration: none;"><img src="{{ asset('img/iconos/hospital.png') }}" style="width: 20%"> Hospitales</a>
    </div>
    <hr class="lineaD">		
    <div style="text-align:center">
      <br><span class="ml-auto" style="color:#818285">Dirección de Protección contra Riesgos Sanitarios<br>Teléfono (961) 611 1185 <br> fomento.dipris@salud.chiapas.gob.mx</span>     
    </div>
  </div>
</div>

    <script src="{{ asset('lgDipris/js/jquery-3.3.1.min.js') }}"></script>
    <script src="{{ asset('lgDipris/js/bootstrap.min.js') }}"></script>
    <script src="{{ asset('lgDipris/js/main.js') }}"></script>

    <script src="{{ asset('template/plugins/sweetalert/dist/sweetalert.min.js') }}"></script>  
    <script src="{{ asset('js/recuperar_password.js') }}"></script> 

    <script type="text/javascript">
      var vuri = window.location.host;
      if(vuri == "localhost")
      {
        vuri = window.location.origin+"/salud/dipris/public";
      }else{
        vuri = window.location.origin + '/';
      }
      $(document).ready(function () {
          @yield('scripts')
      });    
    </script>
  </body>
</html>