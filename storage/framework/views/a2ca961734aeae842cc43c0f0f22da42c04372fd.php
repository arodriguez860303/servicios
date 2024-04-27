

<?php $__env->startSection('meta'); ?>
    <meta name="csrf-token" content="<?= csrf_token() ?>">
<?php $__env->stopSection(); ?>

<?php $__env->startSection('css'); ?>
  <link href="<?php echo e(asset('template_backend/css/cssHeader.css')); ?>" type="text/css" rel="stylesheet">  
<?php $__env->stopSection(); ?>

<?php $__env->startSection('title'); ?>
  USUARIOS
<?php $__env->stopSection(); ?>

<?php $__env->startSection('descripcion'); ?>
  Creación de nueva cuenta de usuario
<?php $__env->stopSection(); ?>

<?php $__env->startSection('buttons'); ?>  
    <a href="<?php echo e(route($current_route.'.index')); ?>" class="btn btn-outline-secondary"><i class="fa fa-fw fa-arrow-rotate-left"></i> Regresar</a>
    <button type="button" class="btn btn-outline-success btn-guardar" id="btn-guardar"><i class="fa fa-fw fa-save"></i> Guardar</button>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?> 
  	<?php echo $__env->make('helpers.headerSimple', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?> 

  	<div class="block block-rounded">
	  	<div class="block-content">
	  		<div id="dvErrors" class="dvErrors"></div>
		    <div class="row">
		    	<div class="col-md-12 col-lg-12">
		        	<form id="frmUsuario" name="frmUsuario" onsubmit="return false;">
						<?php echo $__env->make('catalogos.usuarios.form', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
					</form>
				</div>
			</div>
		</div>
	</div>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('js'); ?>
  <script src="<?php echo e(asset('backend/usuarios/create.js')); ?>"></script>
  <script src="<?php echo e(asset('backend/usuarios/showPass.js')); ?>"></script>
  <script src="<?php echo e(asset('backend/validate.js')); ?>"></script>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('script'); ?>  
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.backend', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\laragon\www\salud\dipris\resources\views/catalogos/usuarios/create.blade.php ENDPATH**/ ?>