<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>{{ config('app.name', 'DIPRIS | Plataforma Digital para la Atención de Trámites Administrativos') }}</title>                           
    @yield('meta')

	<!-- Fav  Icon Link -->
	<link href="{{asset('img/logos/salud.png')}}" rel="shortcut icon" type="image/png"/>
	<!-- Bootstrap core CSS -->
	<link href="{{ asset('template_hospital/css/bootstrap.min.css') }}" rel="stylesheet"/>
	<!-- themify icons CSS -->
	<link href="{{ asset('template_hospital/css/themify-icons.css') }}" rel="stylesheet"/>
	<link href="{{ asset('template_hospital/css/font-awesome.min.css') }}" rel="stylesheet"/>
	<!-- Animations CSS -->
	<link href="{{ asset('template_hospital/css/animate.css') }}" rel="stylesheet"/>
	<!-- Main CSS -->
	<link href="{{ asset('template_hospital/css/styles.css') }}" rel="stylesheet"/>
	<link href="{{ asset('template_hospital/css/green.css') }}" rel="stylesheet"/>
	<link href="{{ asset('template_hospital/css/responsive.css') }}" rel="stylesheet"/>
		
	<!-- jvectormap -->
	<link href="{{ asset('template_hospital/css/jquery-jvectormap.css') }}" rel="stylesheet"/>
	<!--Mi estilo  sircse-->
    <link href="{{ asset('css/cssHeaderHospital.css') }}" rel="stylesheet"/>

	@yield('css')

	<script src="{{ asset('template_hospital/js/modernizr.min.js') }}"></script>

	<style>
		.badge-dark-arb, .bg-dark-arb {
		  background-color: #40484F !important;
		  color: #fff;
		}

		.my-ti-help {
		  padding: 10px;
		  border-radius: 50%;
		  color: #000;
		  background: rgba(0,0,0,.1);
		}
	</style>
</head>

<body>
	<!-- Pre Loader -->
	<div class="loading">
		<div class="spinner">
			<div class="double-bounce1"></div>
			<div class="double-bounce2"></div>
		</div>
	</div>
	<!--/Pre Loader -->
	<div class="wrapper">		
		<!-- Page Content -->
		<div id="content">
			<!-- Top Navigation -->
			<div class="container top-brand">
				<nav class="navbar navbar-default">			
					<div class="navbar-header">
						<div class="sidebar-header"> 
							<a href="index.html">
								<img alt="logo" class="logo" src="{{asset('img/logos/salud.png')}}" />          
							</a>
						</div>
					</div>
					<ul class="nav justify-content-end">						
						<li class="nav-item">
							<a class="nav-link" data-toggle="modal" data-target=".proclinic-modal-lg">
								<span class="ti-help-alt my-ti-help"></span>
							</a>
							<div class="modal fade proclinic-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
								<div class="modal-dialog modal-lorvens">
									<div class="modal-content proclinic-box-shadow2">
										<div class="modal-header">
											<h5 class="modal-title">Información</h5>
											<span class="ti-close" data-dismiss="modal" aria-label="Close">
											</span>
										</div>
										<div class="modal-body">
											<p class="text-center">
				                                <b style="font-size: 18px;">Dirección de Protección contra Riesgos Sanitarios</b><br>
				                                Calle 12a Pte. Nte. No. 232, entre 1a y 2a Norte , Barrio el Magueyito C.P. 29000 Tuxtla Gutiérrez, Chiapas.
				                            </p>

				                            <p class="text-center">
				                                <b style="font-size: 19px;">Dr. Limber García Zapata</b>                       
				                            </p>

				                            <p class="text-center">
				                                <b style="font-size: 15px;">Telefono de Atención</b><br>
				                                (961) 611 1185 
				                            </p>
				                            <p class="text-center">
				                                <b style="font-size: 15px;">Correo electrónico</b><br>
				                                fomento.dipris@salud.chiapas.gob.mx
				                            </p>

				                            <p class="text-center">
				                                <b style="font-size: 15px;">Secretaría de Salud Chiapas </b>
				                            </p>  
										</div>
									</div>
								</div>
							</div>
						</li>
						<li class="nav-item">
							<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true"
							 aria-expanded="false">
								<span class="ti-announcement"></span>
							</a>
							<div class="dropdown-menu proclinic-box-shadow2 notifications animated flipInY">
								<h5>Notificaciones</h5>
								<a class="dropdown-item" href="#">
									<span class="ti-wheelchair"></span> Sin notificaciones</a>
							</div>
						</li>
						<li class="nav-item">
							<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true"
							 aria-expanded="false">
								<span class="ti-user"></span>
							</a>
							<div class="dropdown-menu proclinic-box-shadow2 profile animated flipInY">
								<h5>{{ Auth::User()->name }}</h5>
								<a class="dropdown-item" href="#">
									<span class="ti-settings"></span> Mi perfil</a>
								<a class="dropdown-item" href="#">
									<span class="ti-help-alt"></span> Ayuda</a>
								<a class="dropdown-item" href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
									<span class="ti-power-off"></span> Cerrar sesión
								</a>
								<form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
				                    @csrf
				                </form>
							</div>
						</li>
					</ul>
			
				</nav>
			</div>
			<!-- /Top Navigation -->		

			<!-- Breadcrumb -->
			<!-- Page Title -->
			<div class="container mt-0">
				<div class="row breadcrumb-bar">
					<div class="col-md-6">
						<h3 class="block-title">
							<div id="dvNameHospital"></div>
						</h3>
					</div>
					<div class="col-md-6">						
						<ol class="breadcrumb">
							<li class="breadcrumb-item">
								<a href="{{ route('mis-tramites-hospital.index') }}">
									<span class="ti-home"></span>
								</a>
							</li>
							@yield('breadcrumb')							
						</ol>													
					</div>
				</div>
			</div>
			<!-- /Page Title -->
			<!-- /Breadcrumb -->
			<!-- Main Content -->
			<div class="container home">
				<div id="dvHeader" name="dvHeader" class="dvHeader"></div>			
				@yield('content')
			</div>
			<!-- /Main Content -->
			<!--Copy Rights-->
			<div class="container">
				<div class="d-sm-flex justify-content-center">
				  <span class="text-muted text-center d-block d-sm-inline-block"><a href="#">Dirección de Protección contra Riesgos Sanitarios</a>.</span>
				</div>
			</div>
			<!-- /Copy Rights-->
		</div>
		<!-- /Page Content -->
	</div>
	<!-- Back to Top -->
	<a id="back-to-top" href="#" class="back-to-top">
		<span class="ti-angle-up"></span>
	</a>
	<!-- /Back to Top -->
	<!-- Jquery Library-->
	<script src="{{ asset('template_hospital/js/jquery-3.2.1.min.js') }}"></script>
	<!-- Popper Library-->
	<script src="{{ asset('template_hospital/js/popper.min.js') }}"></script>
	<!-- Bootstrap Library-->
	<script src="{{ asset('template_hospital/js/bootstrap.min.js') }}"></script>	
	<!-- Custom Script-->
	<script src="{{ asset('template_hospital/js/custom.js') }}"></script>

	<script src="{{ asset('template/plugins/sweetalert/dist/sweetalert.min.js') }}"></script>

	@yield('js')
      

    <script type="text/javascript">
        var vuri = window.location.origin + '/servicios-dipris';

        $(document).ready(function () {
            @yield('script')       

            if({{Auth::user()->dark_mode}} == 1){
                $('.bodyPage').addClass('dark-theme');
            }
            else
            {
                $('.bodyPage').removeClass('dark-theme');
            }         
        });
    </script>
</body>
</html>
