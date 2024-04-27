<!DOCTYPE html>
<html lang="en">
    <meta content="text/html;charset=utf-8" http-equiv="content-type"/>
    <head>
        <meta charset="utf-8">
            <meta content="width=device-width, initial-scale=1, shrink-to-fit=no" name="viewport"></meta>               
            <!-- Favicon -->
            <link href="{{asset('img/iconos/favicon.ico')}}" rel="icon" type="image/x-icon"/>
            <!-- Title -->
            <title>{{ config('app.name', 'DIPRIS | Plataforma Digital para la Atención de Trámites Administrativos') }}</title>                           
            @yield('meta')

            <!---Fontawesome css-->
            <link href="{{ asset('template/plugins/fontawesome-free/css/all.min.css') }}" rel="stylesheet"/>
            <!---Ionicons css-->
            <link href="{{ asset('template/plugins/ionicons/css/ionicons.min.css') }}" rel="stylesheet"/>
            <!---Typicons css-->
            <link href="{{ asset('template/plugins/typicons.font/typicons.css') }}" rel="stylesheet"/>
            <!---Feather css-->
            <link href="{{ asset('template/plugins/feather/feather.css') }}" rel="stylesheet"/>
            <!---Falg-icons css-->
            <link href="{{ asset('template/plugins/flag-icon-css/css/flag-icon.min.css') }}" rel="stylesheet"/>
            <!---Style css-->
            <link href="{{ asset('template/css/style.css') }}" rel="stylesheet"/>
            <link href="{{ asset('template/css/custom-style.css') }}" rel="stylesheet"/>
            <link href="{{ asset('template/css/skins.css') }}" rel="stylesheet"/>
            <link href="{{ asset('template/css/dark-style.css') }}" rel="stylesheet"/>
            <link href="{{ asset('template/css/custom-dark-style.css') }}" rel="stylesheet"/>
            
            <!---Jquery.mCustomScrollbar css-->
            <link href="{{ asset('template/plugins/jquery.mCustomScrollbar/jquery.mCustomScrollbar.css') }}" rel="stylesheet"/>
            <!---Sidebar css-->
            <link href="{{ asset('template/plugins/sidebar/sidebar.css') }}" rel="stylesheet"/>
            <!---Switcher css-->                            
            <link href="{{ asset('template/switcher/demo.css') }}" rel="stylesheet"/>

            <!--Mi estilo  sircse-->
            <link href="{{ asset('css/cssHeader.css') }}" rel="stylesheet"/>
            
            <style type="text/css">
                .badge-dark-arb {
                  background-color: #334151 !important;
                  color: #fff;
                }
            </style>

            @yield('styles')
                      

        <style>
            .badge-green{
                background-color: #00acac;
                color: #fff;
            }
            .badge-warning{
                background-color: #f59c1a;
                color: #fff;
            }
            .badge-danger{
                background-color: #ff5b57;
                color: #fff;
            }
            .badge-secondary{
                background-color: #6C757D;
                color: #fff;
            }
            .badge-success{
                background-color: #00acac;
                color: #fff;
            }  

            .texto-logo { 
                font-size: 30px;
                text-transform: uppercase;
                /*font-weight: bold;*/
                font-family: Verdana, sans-serif;
            }   

            @media only screen and (max-device-width: 480px) {
                .texto-logo { 
                    font-size: 15px;
                    text-transform: uppercase;
                    /*font-weight: bold;*/
                    font-family: Verdana, sans-serif;
                } 
            } 

            @media only screen and (max-width: 480px) {
                .texto-logo { 
                    font-size: 15px;
                } 
            }      
        </style>    
    </head>
    <body class="bodyPage">  
        <!-- Loader -->
        <div id="global-loader">
            <img alt="Loader" class="loader-img" src="{{asset('template/img/loader.svg')}}">
            </img>
        </div>
        <!-- End Loader -->
        <!-- Page -->
        <div class="page">
            <!-- Main Header-->
            <div class="main-header hor-header">
                <div class="container">
                    <div class="main-header-left">
                        <a class="main-header-menu-icon d-lg-none" href="#" id="mainNavShow">
                            <span>
                            </span>
                        </a>
                        <a class="texto texto-logo main-content-title tx-24 mg-b-5" href="#">CONSTANCIA DE MANEJO HIGIÉNICO DE ALIMENTOS</a>
                    </div>
                    <div class="main-header-right">             
                      
                        <!-- <div class="dropdown main-header-notification">
                            <a class="nav-link icon" href="#">                                
                                <i class="fe fe-bell"></i>                                                               
                                <span class="pulse bg-danger"></span>                             
                            </a>
                            <div class="dropdown-menu">
                                <div class="header-navheading">
                                    <p class="main-notification-text">
                                        Usted tiene 5 trámites con observaciones                                        
                                    </p>
                                </div>
                                <div class="main-notification-list">
                                   
                                    <a href="#">
                                    <div class="media new">                                        
                                        <div class="main-img-user online">                                                
                                            <img alt="logo" src="{{asset('img/logos/avatar.jpg')}}">                                                
                                        </div>
                                        <div class="media-body">
                                            <p>El folio <strong>5645646</strong> se encuentra observado</p><span>Fecha inicio: sin fecha</span>
                                        </div>                                        
                                    </div>
                                    </a>
                                   
                                </div>
                            </div>
                        </div> -->
                        

                        <div class="dropdown main-profile-menu">
                            <a class="main-img-user" href="#">
                                <img alt="avatar" src="{{asset('img/logos/avatar.jpg')}}"/>
                            </a>
                            <div class="dropdown-menu">
                                <div class="header-navheading">
                                    <h6 class="main-notification-title">
                                        {{ Auth::User()->name }}
                                    </h6>
                                    <p class="main-notification-text">
                                        {{ Auth::User()->roles->first()->description }}
                                    </p>
                                </div>
                                <a class="dropdown-item border-top" href="#">
                                    <i class="fe fe-user">
                                    </i>
                                    Mi Perfil
                                </a>
                                                                
                                <a class="dropdown-item" href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                                    <i class="fe fe-power">
                                    </i>
                                    Cerrar sesión
                                </a>
                                <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
				                    @csrf
				                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Main Header-->
            <!-- Horizonatal menu-->
            <div class="main-navbar sticky">
                <div class="container">
                    <ul class="nav">
                        @include('layouts.menu_frontend')
                    </ul>
                </div>
            </div>
            <!--End  Horizonatal menu-->
            <!-- Main Content-->
            <div class="main-content pt-0">
                <div class="container">
                    <!-- Page Header -->
                    <div class="page-header">
                        <div>
                            @yield('title')
                            <ol class="breadcrumb">
                                @yield('breadcrumb')
                            </ol>
                        </div>
                        <div class="d-flex">
                            <div class="mr-2">
                                @yield('buttons')
                            </div>
                        </div>
                    </div>
                    <!-- End Page Header -->
                    @yield('content')
                </div>
            </div>
            <!-- End Main Content-->

            <div class="modal" id="mdlAtencion">
                <div class="modal-dialog" role="document">
                    <div class="modal-content modal-content-demo">
                        <div class="modal-header">
                            <h6 class="modal-title">Atenci&oacute;n Telef&oacute;nica</h6><button aria-label="Close" class="close" data-dismiss="modal" type="button"><span aria-hidden="true">&times;</span></button>
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
                        <div class="modal-footer">
                            <button class="btn ripple btn-secondary" data-dismiss="modal" type="button">Cerrar</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Main Footer-->
            <!--div class="main-footer text-center">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <span>
                                Copyright © 2019
                                <a href="#">
                                    Dashlead
                                </a>
                                . Designed by
                                <a href="https://www.spruko.com/">
                                    Spruko
                                </a>
                                All rights reserved.
                            </span>
                        </div>
                    </div>
                </div>
            </div-->
            <!--End Footer-->
        </div>
        <!-- End Page -->
        <!-- Back-to-top -->
        <a href="#top" id="back-to-top">
            <i class="fe fe-arrow-up">
            </i>
        </a>
        <!-- Jquery js-->
        <script src="{{ asset('template/plugins/jquery/jquery.min.js') }}">
        </script>
        <!-- Bootstrap js-->
        <script src="{{ asset('template/plugins/bootstrap/js/bootstrap.bundle.min.js') }}">
        </script>
        <!-- Ionicons js-->
        <!-- <script src="{{ asset('dashlead/plugins/ionicons/ionicons.js') }}">  </script>-->
       
        <!-- Rating js-->
        <script src="{{ asset('template/plugins/rating/jquery.rating-stars.js') }}">  </script>
       
        <script src="{{ asset('template/plugins/sweetalert/dist/sweetalert.min.js') }}"></script>
       
        <!-- Jquery.mCustomScrollbar js-->
        <script src="{{ asset('template/plugins/jquery.mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js') }}">
        </script>
        <!-- Sidebar js-->
        <script src="{{ asset('template/plugins/sidebar/sidebar.js') }}">
        </script>
        <!-- Perfect-scrollbar js-->
        <script src="{{ asset('template/plugins/perfect-scrollbar/perfect-scrollbar.min.js') }}">
        </script>
        <!-- Sticky js-->
        <script src="{{ asset('template/js/sticky.js') }}"></script>
        <!-- Custom js-->
        <script src="{{ asset('template/js/custom.js') }}"></script>

        <script src="{{ asset('js/frontend/jsTema.js') }}"></script>


        @yield('js')
      

        <script type="text/javascript">
            var vuri = window.location.host;
            if(vuri == "localhost")
            {
                vuri = window.location.origin+"/salud/dipris/public";
            }else{
                vuri = window.location.origin + '/';
            }

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