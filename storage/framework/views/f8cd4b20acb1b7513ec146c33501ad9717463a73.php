<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<title>DIPRIS | Clientes</title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	<?php echo $__env->yieldContent('meta'); ?>
	
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
	<link href="<?php echo e(asset('template/css/default/app.min.css')); ?>" rel="stylesheet">
	<link href="<?php echo e(asset('css/css_efectos.css')); ?>" rel="stylesheet">
	<link rel="icon" type="image/png" href="<?php echo e(asset('img/icono.ico')); ?>" sizes="16x16">

	<?php echo $__env->yieldContent('styles'); ?>	
</head>
<body>
	<!-- begin #page-loader -->
	<!--<div id="page-loader" class="fade show">
		<span class="spinner"></span>
	</div>-->
	<!-- end #page-loader -->
	
	<!-- begin #page-container -->
	<div id="page-container" class="page-container fade page-without-sidebar page-header-fixed page-with-top-menu">
		<!-- begin #header -->
		<div id="header" class="header navbar-default">
			<!-- begin navbar-header -->
			<div class="navbar-header">
				<a href="index.html" class="navbar-brand"><span class="navbar-logo"></span> <b>Dipris</b> Clientes</a>
				<button type="button" class="navbar-toggle" data-click="top-menu-toggled">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
			</div>
			<!-- end navbar-header --><!-- begin header-nav -->
			<ul class="navbar-nav navbar-right">
				<li class="navbar-form">
					<form action="" method="POST" name="search">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Ingresa el dato" />
							<button type="submit" class="btn btn-search"><i class="fa fa-search"></i></button>
						</div>
					</form>
				</li>
				<li class="dropdown">
					<a href="#" data-toggle="dropdown" class="dropdown-toggle f-s-14">
						<i class="fa fa-bell"></i>
						<span class="label">5</span>
					</a>
					<div class="dropdown-menu media-list dropdown-menu-right">
						<div class="dropdown-header">NOTIFICACIONES (5)</div>					
						
						<a href="javascript:;" class="dropdown-item media">
							<div class="media-left">
								<i class="fa fa-plus media-object bg-silver-darker"></i>
							</div>
							<div class="media-body">
								<h6 class="media-heading"> New User Registered</h6>
								<div class="text-muted f-s-10">1 hour ago</div>
							</div>
						</a>						
						<div class="dropdown-footer text-center">
							<a href="javascript:;">Ver mas</a>
						</div>
					</div>
				</li>
				<li class="dropdown navbar-user">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<img src="<?php echo e(asset('img/avatar/user.jpg')); ?>" alt="" /> 
						<span class="d-none d-md-inline"><?php echo e(Auth::User()->name); ?></span> <b class="caret"></b>
					</a>
					<div class="dropdown-menu dropdown-menu-right">									
						<div class="dropdown-divider"></div>
						<a href="<?php echo e(route('logout')); ?>" onclick="event.preventDefault(); document.getElementById('logout-form').submit();" class="dropdown-item">Cerrar sesión</a>
                		<form id="logout-form" action="<?php echo e(route('logout')); ?>" method="POST" style="display: none;">
                    		<?php echo csrf_field(); ?>
                		</form>
					</div>
				</li>
			</ul>
			<!-- end header-nav -->
		</div>
		<!-- end #header -->
		
		<!-- begin #top-menu -->
		<div id="top-menu" class="top-menu">
			<!-- begin nav -->
			<ul class="nav">
				<?php echo $__env->make('layouts.menu_frontend', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>	
			</ul>
			<!-- end nav -->
		</div>
		<!-- end #top-menu -->
		
		<!-- begin #content -->
		<div id="content" class="content">
			<!-- begin breadcrumb -->
			<ol class="breadcrumb">
				<?php echo $__env->yieldContent('breadcrumb'); ?>								
											
			</ol>
			<div class="float-xl-right">
				<?php echo $__env->yieldContent('buttons'); ?>
			</div>
			<!-- end breadcrumb -->
			<!-- begin page-header -->
			<h1 class="page-header">
				<?php echo $__env->yieldContent('titulo'); ?>				
			</h1>
			<!-- end page-header -->
			
			<!-- begin panel -->
			<div class="panel panel-inverse">
				<div class="panel-heading">
					<h4 class="panel-title"><?php echo $__env->yieldContent('titulo_panel'); ?></h4>
					<div class="panel-heading-btn">
						<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
						<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-redo"></i></a>
						<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
					</div>
				</div>
				<div class="panel-body">
					<?php echo $__env->yieldContent('content'); ?>
				</div>
			</div>
			<!-- end panel -->
		</div>
		<!-- end #content -->
		
		
		<!-- begin scroll to top btn -->
		<a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>
		<!-- end scroll to top btn -->
	</div>
	<!-- end page container -->
	
	<script src="<?php echo e(asset('template/js/app.min.js')); ?>"></script>	
	<script src="<?php echo e(asset('template/js/theme/default.min.js')); ?>"></script>

	<script src="<?php echo e(asset('template/plugins/sweetalert/dist/sweetalert.min.js')); ?>"></script>	
	<script src="<?php echo e(asset('js/frontend/valida_ruta.js')); ?>"></script>	

	<?php echo $__env->yieldContent('js'); ?>

    <script type="text/javascript">
    	var vuri = window.location.origin;
		vuri = vuri + "/tramites_dipris";
    	$(document).ready(function(e){   
			<?php echo $__env->yieldContent('script'); ?>     
		});    	    	
    </script>	
</body>
</html><?php /**PATH D:\laragon\www\tramites_dipris\c-dipris\resources\views/layouts/frontend.blade.php ENDPATH**/ ?>