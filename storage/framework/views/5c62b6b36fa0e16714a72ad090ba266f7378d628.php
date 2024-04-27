<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
		<title>DIPRIS | Admin</title>
		<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
		<meta content="" name="description" />
		<meta content="" name="author" />
		<?php echo $__env->yieldContent('meta'); ?>
		
		<link href="<?php echo e(asset('template/css/default/app.min.css')); ?>" rel="stylesheet">
		<link href="<?php echo e(asset('template/plugins/jvectormap-next/jquery-jvectormap.css')); ?>" rel="stylesheet">
		<link href="<?php echo e(asset('template/plugins/gritter/css/jquery.gritter.css')); ?>" rel="stylesheet">
		<link href="<?php echo e(asset('css/my-style.css')); ?>" rel="stylesheet">
		<link href="<?php echo e(asset('css/css_efectos.css')); ?>" rel="stylesheet">
		<link rel="icon" type="image/png" href="<?php echo e(asset('img/icono.ico')); ?>" sizes="16x16">

		<?php echo $__env->yieldContent('styles'); ?>		
	</head>
	<body>
		<!-- begin #page-loader -->
		<div id="page-loader" class="fade show">
			<span class="spinner"></span>
		</div>
		<!-- end #page-loader -->
	
		<!-- begin #page-container -->
		<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
			<?php echo $__env->make('layouts.backend-header', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
			<?php echo $__env->make('layouts.backend-sidebar', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>			
			<?php echo $__env->make('layouts.backend-content', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
		</div>
		<!-- end #page-container -->
		        
        <script src="<?php echo e(asset('template/js/app.min.js')); ?>"></script>		
        <script src="<?php echo e(asset('template/js/theme/default.min.js')); ?>"></script>		
        <script src="<?php echo e(asset('template/plugins/gritter/js/jquery.gritter.js')); ?>"></script>

        <?php echo $__env->yieldContent('js'); ?>

        <script type="text/javascript">
        	var vuri = window.location.origin ;
        	vuri = vuri +"/tramites_dipris";
        	<?php echo $__env->yieldContent('script'); ?>
        </script>
	</body>
</html><?php /**PATH D:\laragon\www\tramites_dipris\c-dipris\resources\views/layouts/backend.blade.php ENDPATH**/ ?>