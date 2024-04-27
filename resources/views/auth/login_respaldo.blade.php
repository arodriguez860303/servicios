<!DOCTYPE html>
<html lang="en">  
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1, shrink-to-fit=no" name="viewport">
    <meta name="description" content="Dashlead -  Admin Panel HTML Dashboard Template">
    <meta name="author" content="Spruko Technologies Private Limited">
    <meta name="keywords" content="sales dashboard, admin dashboard, bootstrap 4 admin template, html admin template, admin panel design, admin panel design, bootstrap 4 dashboard, admin panel template, html dashboard template, bootstrap admin panel, sales dashboard design, best sales dashboards, sales performance dashboard, html5 template, dashboard template">
    <!-- Favicon -->
    <link rel="icon" href="{{ asset('template/img/brand/favicon.ico') }}" type="image/x-icon"/>

    <!-- Title -->
    <title>DIPRIS -  Licencias de Funcionamiento</title>

    <!---Fontawesome css-->
    <link href="{{ asset('template/plugins/fontawesome-free/css/all.min.css') }}" rel="stylesheet">
   
    <!---Ionicons css-->
    <link href="{{ asset('template/plugins/ionicons/css/ionicons.min.css') }}" rel="stylesheet">

    <!---Typicons css-->
    <link href="{{ asset('template/plugins/typicons.font/typicons.css') }}" rel="stylesheet">

    <!---Feather css-->
    <link href="{{ asset('template/plugins/feather/feather.css') }}" rel="stylesheet">

    <!---Falg-icons css-->
    <link href="{{ asset('template/plugins/flag-icon-css/css/flag-icon.min.css') }}" rel="stylesheet">
  
    <!---Style css-->
    <link href="{{ asset('template/css/style.css') }}" rel="stylesheet">
    <link href="{{ asset('template/css/custom-style.css') }}" rel="stylesheet">
    <link href="{{ asset('template/css/skins.css') }}" rel="stylesheet">
    <link href="{{ asset('template/css/dark-style.css') }}" rel="stylesheet">
    <link href="{{ asset('template/css/custom-dark-style.css') }}" rel="stylesheet">    
  </head>

  <body class="main-body">
    <!-- Loader -->
    <div id="global-loader">
      <img src="{{ asset('template/img/loader.svg') }}" alt="Loader" class="loader-img">
    </div>
    <!-- End Loader -->

    <!-- Page -->
    <div class="page main-signin-wrapper">

      <!-- Row -->
      <div class="row text-center pl-0 pr-0 ml-0 mr-0">
        <div class="col-lg-3 d-block mx-auto">
          <div class="text-center mb-2">
            <img src="{{ asset('template/img/brand/logo.png') }}" alt="logo" class="header-brand-img">
            <img src="{{ asset('template/img/brand/logo-light.png') }}" alt="logo" class="header-brand-img theme-logos">
          </div>
          <div class="card custom-card">
            <div class="card-body">
              <h4 class="text-center">Ingresa tus datos</h4>  
                {!! Form::open(['url' => 'login', 'method' => 'POST']) !!}

                  @if(count($errors) > 0)
                     @foreach( $errors->all() as $message )
                        <div class="alert alert-danger display-hide">
                          <button class="close" data-close="alert"></button>
                          <span>Los datos proporcionados son incorrectos</span>
                        </div>
                     @endforeach
                  @endif

                    <div class="form-group text-left">
                      <label>Usuario</label>
                      {!! Form::text('nickname', old('nickname'),['id'=>'nickname', 'required'=>'true', 'class'=>'form-control']) !!}
                    </div>
                    <div class="form-group text-left">
                      <label>Contraseña</label>
                      {!! Form::password('password', ['id'=>'password', 'required'=>'true', 'class'=>'form-control']) !!}  
                    </div>
                    <button class="btn ripple btn-main-primary btn-block">Ingresar</button>
                {!! Form::close() !!}           
            
              <div class="mt-3 text-center">
                <p class="mb-1"><a href="#modal-alert" data-toggle="modal">Olvidaste tu contraseña?</a></p>
                <p class="mb-0">Aún no tienes cuenta? <a href="crear-cuenta/registro">Crear una cuenta</a></p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- End Row -->
      @include('auth.md_recover_pass')
    </div>
    <!-- End Page -->
     
    <!-- End Page -->
    <!-- Jquery js-->
    <script src="{{ asset('template/plugins/jquery/jquery.min.js') }}"></script>

    <!-- Bootstrap js-->
    <script src="{{ asset('template/plugins/bootstrap/js/bootstrap.bundle.min.js') }}"></script>

    <!-- Perfect-scrollbar js-->
    <script src="{{ asset('template/plugins/perfect-scrollbar/perfect-scrollbar.min.js') }}"></script>
    
    <!-- Rating js-->
    <script src="{{ asset('template/plugins/rating/jquery.rating-stars.js') }}"></script>
    
    <!-- Custom js-->
    <script src="{{ asset('template/js/custom.js') }}"></script>

    <script src="{{ asset('js/registro/recuperar_password.js') }}"></script> 

    <script type="text/javascript">
      console.log("login");
      var vuri = window.location.origin + '/constancias-dipris';
      
      $(document).ready(function () {
          @yield('scripts')
      });    
    </script>
  
  </body>
</html>