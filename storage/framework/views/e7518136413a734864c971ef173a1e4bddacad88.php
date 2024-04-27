

<?php $__env->startSection('styles'); ?>
	<link href="<?php echo e(asset('template/plugins/datatables.net-bs4/css/dataTables.bootstrap4.min.css')); ?>" rel="stylesheet">
	<link href="<?php echo e(asset('template/plugins/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css')); ?>" rel="stylesheet">
<?php $__env->stopSection(); ?>

<?php $__env->startSection('breadcrumb'); ?>
	<li class="breadcrumb-item"><a href="<?php echo e(Route($current_route.'.index')); ?>"><?php echo $title; ?></a></li>
	<li class="breadcrumb-item active">Listado de <?php echo $title; ?></li>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('titulo'); ?>
	<small>Historial de Constancias solicitadas</small>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('titulo_panel'); ?>
	
<?php $__env->stopSection(); ?>

<?php $__env->startSection('buttons'); ?>
	<?php if($existe==0): ?>
		<a href="<?php echo e(Route($current_route.'.nueva')); ?>" class="btn btn-purple">Constancia <?php echo date('Y'); ?></a>
	<?php endif; ?>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>	
	<input type="hidden" name="hdIdregistro" id="hdIdRegistro" value="<?php echo e($id_registro); ?>">
	<div class="table-constancias"></div> 	
<?php $__env->stopSection(); ?>

<?php $__env->startSection('js'); ?>	
	<script src="<?php echo e(asset('template/plugins/datatables.net/js/jquery.dataTables.min.js')); ?>"></script>
	<script src="<?php echo e(asset('template/plugins/datatables.net-bs4/js/dataTables.bootstrap4.min.js')); ?>"></script>
	<script src="<?php echo e(asset('template/plugins/datatables.net-responsive/js/dataTables.responsive.min.js')); ?>"></script>
	<script src="<?php echo e(asset('template/plugins/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js')); ?>"></script>

	<script src="<?php echo e(asset('js/frontend/constancia/clsTable.js')); ?>"></script>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('script'); ?> 
	cargar_constancias(); 
<?php $__env->stopSection(); ?>



<?php echo $__env->make('layouts.frontend', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\laragon\www\tramites_dipris\c-dipris\resources\views/frontend/constancias/index.blade.php ENDPATH**/ ?>