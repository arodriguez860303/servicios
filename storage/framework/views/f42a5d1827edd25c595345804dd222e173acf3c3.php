<!DOCTYPE html>
<html lang="<?php echo e(str_replace('_', '-', app()->getLocale())); ?>">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">

    <title><?php echo e(config('app.name', 'DIPRIS | Plataforma Digital para la Atención de Trámites Administrativos')); ?></title>

    <meta name="description" content="Constancia de Manejo Higiénico de Alimentos">
    <meta name="author" content="Unidad de Informatica y Desarrollo Digital">
    <meta name="csrf-token" content="<?= csrf_token() ?>">
    <?php echo $__env->yieldContent('meta'); ?>

    <!-- Icons -->
    <link rel="shortcut icon" href="<?php echo e(asset('template_backend/media/favicons/favicon.png')); ?>">
    <link rel="icon" type="image/png" sizes="192x192" href="<?php echo e(asset('template_backend/media/favicons/favicon-192x192.png')); ?>">
    <link rel="apple-touch-icon" sizes="180x180" href="<?php echo e(asset('template_backend/media/favicons/apple-touch-icon-180x180.png')); ?>">

    <!-- Stylesheets -->
    <link rel="stylesheet" id="css-main" href="<?php echo e(asset('template_backend/css/oneui.min.css')); ?>">

    <?php if(Auth::user()->theme  != '' && Auth::user()->theme  != null): ?>
      <link rel="stylesheet" id="css-theme" href="<?php echo e(asset('template_backend/css/themes/'.Auth::user()->theme.'.min.css')); ?>">
    <?php endif; ?>

    <link rel="stylesheet" id="css-theme" href="<?php echo e(asset('template_backend/js/plugins/sweetalert2/sweetalert2.min.css')); ?>">
    <link href="<?php echo e(asset('template_backend/css/loader.css')); ?>" type="text/css" rel="stylesheet">
   
    <style type="text/css">
        .bg-dark-arb-light {
          background-color: #ced4da !important;
        }

        .text-dark-arb {
          color: #343a40 !important;
        }        
    </style>

    <?php echo $__env->yieldContent('css'); ?>
  </head>

  <body> 
     
    <div id="overlay">
      <div class="cv-spinner">
        <!--<span class="spinner"></span>-->
        <span class="loader"></span>
      </div>
    </div>

    <div id="page-container" class="sidebar-o sidebar-dark page-header-dark enable-page-overlay side-scroll page-header-fixed main-content-narrow">
    
      <nav id="sidebar" aria-label="Main Navigation">
        <div class="content-header">
          <!-- Logo -->
          <a class="fw-semibold text-dual" href="#">
            <span class="smini-visible">
              <i class="fa fa-circle-notch text-primary"></i>
            </span>
            <span class="smini-hide fs-5 tracking-wider">DIP<span class="fw-normal">RIS</span></span>
          </a>
          <!-- Fin Logo -->

          <div>
            <!-- Modo oscuro --> 
            <button type="button" class="btn btn-sm btn-alt-secondary" onclick="mode_dark();" data-toggle="layout" data-action="dark_mode_toggle">
              <i class="far fa-moon"></i>
            </button>
            <!-- Fin modo oscuro -->

            <div class="dropdown d-inline-block ms-1">
              <button type="button" class="btn btn-sm btn-alt-secondary" id="sidebar-themes-dropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fa fa-brush"></i>
              </button>
              <div class="dropdown-menu dropdown-menu-end fs-sm smini-hide border-0" aria-labelledby="sidebar-themes-dropdown">
                <!-- Inicio temas -->
                <a class="dropdown-item d-flex align-items-center justify-content-between fw-medium" onclick="change_theme('');" href="#">
                  <span>Default</span>
                  <i class="fa fa-circle text-default"></i>
                </a>
                <a class="dropdown-item d-flex align-items-center justify-content-between fw-medium" onclick="change_theme('amethyst');" href="#">
                  <span>Amethyst</span>
                  <i class="fa fa-circle text-amethyst"></i>
                </a>
                <a class="dropdown-item d-flex align-items-center justify-content-between fw-medium" onclick="change_theme('city');" href="#">
                  <span>City</span>
                  <i class="fa fa-circle text-city"></i>
                </a>
                <a class="dropdown-item d-flex align-items-center justify-content-between fw-medium" onclick="change_theme('flat');" href="#">
                  <span>Flat</span>
                  <i class="fa fa-circle text-flat"></i>
                </a>
                <a class="dropdown-item d-flex align-items-center justify-content-between fw-medium" onclick="change_theme('modern');" href="#">
                  <span>Modern</span>
                  <i class="fa fa-circle text-modern"></i>
                </a>
                <a class="dropdown-item d-flex align-items-center justify-content-between fw-medium" onclick="change_theme('smooth');" href="#">
                  <span>Smooth</span>
                  <i class="fa fa-circle text-smooth"></i>
                </a>
                <!-- Fin temas -->
              </div>
            </div>

            <a class="d-lg-none btn btn-sm btn-alt-secondary ms-1" data-toggle="layout" data-action="sidebar_close" href="javascript:void(0)">
              <i class="fa fa-fw fa-times"></i>
            </a>
          </div>

        </div>

        <!-- INICIO Menu -->
        <div class="js-sidebar-scroll">
          <div class="content-side">
            <ul class="nav-main">
              <?php if(Auth::User()->hasRole(['admin'])): ?>
              <li class="nav-main-item">
                <a class="nav-main-link _dashboard" href="<?php echo e(route('dashboard.index')); ?>">
                  <i class="nav-main-link-icon si si-speedometer"></i>
                  <span class="nav-main-link-name">Dashboard</span>
                </a>
              </li>
              <?php endif; ?>
              
              <?php if(Auth::User()->hasRole(['ventanilla'])): ?>
              <li class="nav-main-heading">Tramites alimentos</li>
              <li class="nav-main-item">
                <a class="nav-main-link _proceso" href="<?php echo e(route('tramites.proceso')); ?>">
                  <i class="nav-main-link-icon si si-info"></i>
                  <span class="nav-main-link-name">Proceso</span>
                </a>
              </li>

              <li class="nav-main-item">
                <a class="nav-main-link _observado" href="<?php echo e(route('tramites.observados')); ?>">
                  <i class="nav-main-link-icon si si-magnifier"></i>
                  <span class="nav-main-link-name">Observados</span>
                </a>
              </li>

              <li class="nav-main-item">
                <a class="nav-main-link _solventado" href="<?php echo e(route('tramites.solventados')); ?>">
                  <i class="nav-main-link-icon si si-magnifier-add"></i>
                  <span class="nav-main-link-name">Solventados</span>
                </a>
              </li>

              <li class="nav-main-item">
                <a class="nav-main-link _aceptado" href="<?php echo e(route('tramites.aceptados')); ?>">
                  <i class="nav-main-link-icon si si-like"></i>
                  <span class="nav-main-link-name">Aceptados</span>
                </a>
              </li>

              <li class="nav-main-item">
                <a class="nav-main-link _concluido" href="<?php echo e(route('tramites.concluidos')); ?>">
                  <i class="nav-main-link-icon si si-check"></i>
                  <span class="nav-main-link-name">Concluidos</span>
                </a>
              </li>

              <li class="nav-main-item">
                <a class="nav-main-link _cancelado" href="<?php echo e(route('tramites.cancelados')); ?>">
                  <i class="nav-main-link-icon si si-close"></i>
                  <span class="nav-main-link-name">Cancelados</span>
                </a>
              </li>
              <?php endif; ?>

              <?php if(Auth::User()->hasRole(['ventanilla'])): ?>
              <li class="nav-main-heading">Tramites hospital</li>

              <li class="nav-main-item">
                <a class="nav-main-link _procesoH" href="<?php echo e(route('tramites-hospital.proceso')); ?>">
                  <i class="nav-main-link-icon si si-info"></i>
                  <span class="nav-main-link-name">Proceso</span>
                </a>
              </li>

              <li class="nav-main-item">
                <a class="nav-main-link _observadoH" href="<?php echo e(route('tramites-hospital.observados')); ?>">
                  <i class="nav-main-link-icon si si-magnifier"></i>
                  <span class="nav-main-link-name">Observados</span>
                </a>
              </li>

              <li class="nav-main-item">
                <a class="nav-main-link _solventadoH" href="<?php echo e(route('tramites-hospital.solventados')); ?>">
                  <i class="nav-main-link-icon si si-magnifier-add"></i>
                  <span class="nav-main-link-name">Solventados</span>
                </a>
              </li>

              <li class="nav-main-item">
                <a class="nav-main-link _aceptadoH" href="<?php echo e(route('tramites-hospital.aceptados')); ?>">
                  <i class="nav-main-link-icon si si-like"></i>
                  <span class="nav-main-link-name">Aceptados</span>
                </a>
              </li>

              <li class="nav-main-item">
                <a class="nav-main-link _concluidoH" href="<?php echo e(route('tramites-hospital.concluidos')); ?>">
                  <i class="nav-main-link-icon si si-check"></i>
                  <span class="nav-main-link-name">Concluidos</span>
                </a>
              </li>

              <li class="nav-main-item">
                <a class="nav-main-link _canceladoH" href="<?php echo e(route('tramites-hospital.cancelados')); ?>">
                  <i class="nav-main-link-icon si si-close"></i>
                  <span class="nav-main-link-name">Cancelados</span>
                </a>
              </li>
              <?php endif; ?>


              <?php if(Auth::User()->hasRole(['admin'])): ?>              
              <li class="nav-main-heading">Mantenimiento</li>

              <li class="nav-main-item">
                <a class="nav-main-link _folios" href="<?php echo e(route('folios.index')); ?>">
                  <i class="nav-main-link-icon si si-layers"></i>
                  <span class="nav-main-link-name">Folios</span>
                </a>
              </li>

              <li class="nav-main-item">
                <a class="nav-main-link _eliminar" href="<?php echo e(route('admin.tramites.index')); ?>">
                  <i class="nav-main-link-icon si si-trash"></i>
                  <span class="nav-main-link-name">Eliminar Constancias</span>
                </a>
              </li>

              <li class="nav-main-item">
                <a class="nav-main-link _eliminarH" href="<?php echo e(route('admin.tramites-hospital.index')); ?>">
                  <i class="nav-main-link-icon si si-trash"></i>
                  <span class="nav-main-link-name">Eliminar Diplomas</span>
                </a>
              </li>

              <li class="nav-main-item">
                <a class="nav-main-link _reportes" href="<?php echo e(route('reportes')); ?>">
                  <i class="nav-main-link-icon si si-book-open"></i>
                  <span class="nav-main-link-name">Reportes</span>
                </a>
              </li>

              <li class="nav-main-heading">Usuarios</li>
              <li class="nav-main-item">
                <a class="nav-main-link _usuarios" href="<?php echo e(route('usuarios.index')); ?>">
                  <i class="nav-main-link-icon si si-users"></i>
                  <span class="nav-main-link-name">Usuarios</span>
                </a>
              </li>              
              <?php endif; ?>
            </ul>
          </div>
        </div>
        <!-- FIN Menu -->
      </nav>

      <!-- Header -->
      <header id="page-header">
        <div class="content-header">

          <div class="d-flex align-items-center">
            <!-- Toggle Sidebar -->
            <button type="button" class="btn btn-sm btn-alt-secondary me-2 d-lg-none" data-toggle="layout" data-action="sidebar_toggle">
              <i class="fa fa-fw fa-bars"></i>
            </button>
            <!-- END Toggle Sidebar -->

            <!-- Toggle Mini Sidebar -->
            <button type="button" class="btn btn-sm btn-alt-secondary me-2 d-none d-lg-inline-block" data-toggle="layout" data-action="sidebar_mini_toggle">
              <i class="fa fa-fw fa-ellipsis-v"></i>
            </button>
            <!-- END Toggle Mini Sidebar -->

            <!-- Open Search Section (visible on smaller screens) -->
            <button type="button" class="btn btn-sm btn-alt-secondary d-md-none" data-toggle="layout" data-action="header_search_on">
              <i class="fa fa-fw fa-search"></i>
            </button>
            <!-- END Open Search Section -->

            <!-- busqueda -->
            <form class="d-none d-md-inline-block" action="#" method="POST">
              <div class="input-group input-group-sm">
                <input type="text" class="form-control form-control-alt" placeholder="Buscar.." id="page-header-search-input2" name="page-header-search-input2">
                <span class="input-group-text border-0">
                  <i class="fa fa-fw fa-search"></i>
                </span>
              </div>
            </form>
            <!-- Fin busqueda -->
          </div>

          <div class="d-flex align-items-center">
            <!-- Menu usuario -->
            <div class="dropdown d-inline-block ms-2">
              <button type="button" class="btn btn-sm btn-alt-secondary d-flex align-items-center" id="page-header-user-dropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <img class="rounded-circle" src="<?php echo e(asset('template_backend/media/avatars/avatar10.jpg')); ?>" alt="Header Avatar" style="width: 21px;">
                <span class="d-none d-sm-inline-block ms-2">Adrian</span>
                <i class="fa fa-fw fa-angle-down d-none d-sm-inline-block opacity-50 ms-1 mt-1"></i>
              </button>
              <div class="dropdown-menu dropdown-menu-md dropdown-menu-end p-0 border-0" aria-labelledby="page-header-user-dropdown">
                <div class="p-3 text-center bg-body-light border-bottom rounded-top">
                  <img class="img-avatar img-avatar48 img-avatar-thumb" src="<?php echo e(asset('template_backend/media/avatars/avatar10.jpg')); ?>" alt="">
                  <p class="mt-2 mb-0 fw-medium">Adrian</p>
                  <p class="mb-0 text-muted fs-sm fw-medium">Administrador General</p>
                </div>
                <div class="p-2">               
                  <a class="dropdown-item d-flex align-items-center justify-content-between" href="javascript:void(0)">
                    <span class="fs-sm fw-medium">Mi perfil</span>
                  </a>
                </div>
                <div role="separator" class="dropdown-divider m-0"></div>
                <div class="p-2">                  
                  <a class="dropdown-item d-flex align-items-center justify-content-between" href="<?php echo e(route('logout')); ?>" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                    <span class="fs-sm fw-medium">Cerrar sesión</span>
                  </a>
                  <form id="logout-form" action="<?php echo e(route('logout')); ?>" method="POST" style="display: none;">
                      <?php echo csrf_field(); ?>
                  </form>
                </div>
              </div>
            </div>
            <!-- Fin menu usuario -->

            <!-- Notificaciones -->
            <div class="dropdown d-inline-block ms-2">
              <button type="button" class="btn btn-sm btn-alt-secondary" id="page-header-notifications-dropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fa fa-fw fa-bell"></i>
                <span class="text-primary">•</span>
              </button>
              <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end p-0 border-0 fs-sm" aria-labelledby="page-header-notifications-dropdown">
                <div class="p-2 bg-body-light border-bottom text-center rounded-top">
                  <h5 class="dropdown-header text-uppercase">Notificationes</h5>
                </div>
                <ul class="nav-items mb-0">
                  <li>
                    <a class="text-dark d-flex py-2" href="javascript:void(0)">
                      <div class="flex-shrink-0 me-2 ms-3">
                        <i class="fa fa-fw fa-check-circle text-success"></i>
                      </div>
                      <div class="flex-grow-1 pe-2">
                        <div class="fw-semibold">Tu tienes una notificacion</div>
                        <span class="fw-medium text-muted">15 min ago</span>
                      </div>
                    </a>
                  </li>                  
                </ul>
                <div class="p-2 border-top text-center">
                  <a class="d-inline-block fw-medium" href="javascript:void(0)">
                    <i class="fa fa-fw fa-arrow-down me-1 opacity-50"></i> Ver mas..
                  </a>
                </div>
              </div>
            </div>
            <!-- Fin Notificationes -->

          </div>
        </div>

        <!-- Header Search -->
        <div id="page-header-search" class="overlay-header bg-body-extra-light">
          <div class="content-header">
            <form class="w-100" action="be_pages_generic_search.html" method="POST">
              <div class="input-group">
                <!-- Layout API, functionality initialized in Template._uiApiLayout() -->
                <button type="button" class="btn btn-alt-danger" data-toggle="layout" data-action="header_search_off">
                  <i class="fa fa-fw fa-times-circle"></i>
                </button>
                <input type="text" class="form-control" placeholder="Search or hit ESC.." id="page-header-search-input" name="page-header-search-input">
              </div>
            </form>
          </div>
        </div>
        <!-- END Header Search -->
      </header>

      <!-- Main Container -->
      <main id="main-container">
          <div id="overlay">
            <div class="cv-spinner">
              <span class="loader"></span>
            </div>
          </div>

        <div class="content">
          <div class="d-flex flex-column flex-md-row justify-content-md-between align-items-md-center py-2 text-center text-md-start">
            <div class="flex-grow-1 mb-1 mb-md-0">
              <h1 class="h3 fw-bold mb-2">
                <?php echo $__env->yieldContent('title'); ?>
              </h1>
              <h2 class="h6 fw-medium fw-medium text-muted mb-0">
                <?php echo $__env->yieldContent('descripcion'); ?>
              </h2>
            </div>
            <div class="mt-3 mt-md-0 ms-md-3 space-x-1">             
              <div class="dropdown d-inline-block">
                  <?php echo $__env->yieldContent('buttons'); ?>        
              </div>
            </div>
          </div>
        </div>

        <!-- Content -->
        <div class="content">
            <?php echo $__env->yieldContent('dash-content'); ?>
            <div class="block block-rounded">     
              <?php echo $__env->yieldContent('content'); ?>
            </div>
        </div>
        <!-- Fin Content -->
      </main>
      <!-- Fin Main Container -->

      <!-- Footer -->
      <footer id="page-footer" class="bg-body-light">
        <div class="content py-3">
          <div class="row fs-sm">
            <div class="col-sm-6 order-sm-2 py-1 text-center text-sm-end">
              Creado por <a class="fw-semibold" href="#">Unidad de Informatica y Desarrollo Digital</a>
            </div>
            <div class="col-sm-6 order-sm-1 py-1 text-center text-sm-start">
              <a class="fw-semibold" href="#" target="_blank">Direcci&oacute;n de Protecci&oacute;n contra Riesgos Sanitarios (Dipris)</a> &copy; <span data-toggle="year-copy"></span>
            </div>
          </div>
        </div>
      </footer>
      <!-- END Footer -->
    </div>
    <!-- END Page Container --> 

    <script src="<?php echo e(asset('template_backend/js/oneui.app.min.js')); ?>"></script> 
    <script src="<?php echo e(asset('template_backend/js/lib/jquery.min.js')); ?>"></script> 
    <script src="<?php echo e(asset('backend/tema.js')); ?>"></script> 
    <script src="<?php echo e(asset('template_backend/js/plugins/sweetalert2/sweetalert2.all.min.js')); ?>"></script>
    <script src="<?php echo e(asset('backend/helpers.js')); ?>"></script>
    <script src="<?php echo e(asset('template_backend/js/plugins/bootstrap-notify/bootstrap-notify.min.js')); ?>"></script>

    <?php echo $__env->yieldContent('js'); ?>

      <script type="text/javascript">
        
        var vuri = window.location.host;
          if(vuri == "localhost")
          {
            vuri = window.location.origin+"/salud/dipris/public";
          }else{
            vuri = window.location.origin + '/';
          }

          /*if(<?php echo e(Auth::user()->dark_mode); ?> == 1){
            $('#page-container').addClass('page-header-dark dark-mode');           
          }*/

          <?php echo $__env->yieldContent('script'); ?>
      </script>
  </body>
</html>
<?php /**PATH D:\laragon\www\salud\dipris\resources\views/layouts/backend.blade.php ENDPATH**/ ?>