

<?php $__env->startSection('styles'); ?>	
	<link href="<?php echo e(asset('template/plugins/select2/dist/css/select2.min.css')); ?>" rel="stylesheet">
<?php $__env->stopSection(); ?>

<?php $__env->startSection('js'); ?> 	 
	<script src="<?php echo e(asset('template/plugins/sweetalert/dist/sweetalert.min.js')); ?>"></script> 
	<script src="<?php echo e(asset('template/plugins/select2/dist/js/select2.min.js')); ?>"></script> 
	<script src="<?php echo e(asset('js/catalogos/usuarios/clsEdit.js')); ?>"></script>
	<script src="<?php echo e(asset('js/catalogos/usuarios/clsGuardar.js')); ?>"></script>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('breadcrumb'); ?>
<li class="breadcrumb-item breadcrumb-header ">
	<a href="<?php echo e(Route($current_route.'.index')); ?>">Usuarios</a>
</li>
<li class="breadcrumb-item active">Editar un usuario</li>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('buttons'); ?>
	<a href="<?php echo e(Route($current_route.'.index')); ?>" class="btn btn-inverse btn-sm"><i class="fa fa-reply"></i> Atras</a>
	<button id="btn-guardar" class="btn btn-success btn-sm"><i class="fa fa-save"></i> Guardar</button>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('script'); ?>	
	roles(); 	   
	$("#id").val(<?php echo e($id); ?>); 
	$("#id_rol").select2();
	edit();
	$('#btn-guardar').attr('onclick', 'registrar("frmUsuario")');
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>		
<form id="frmUsuario" name="frmUsuario" class="form-horizontal">
	<?php echo csrf_field(); ?>
	<input type="hidden" name="id" id="id" value="0">
	<?php echo $__env->make('catalogos.usuarios.form', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
</form>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.backend', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\laragon\www\tramites_dipris\c-dipris\resources\views/catalogos/usuarios/edit.blade.php ENDPATH**/ ?>