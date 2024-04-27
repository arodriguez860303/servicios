

<?php $__env->startSection('styles'); ?>	
	<link href="<?php echo e(asset('template/plugins/bootstrap-datepicker/dist/css/bootstrap-datepicker.css')); ?>" rel="stylesheet">
<?php $__env->stopSection(); ?>

<?php $__env->startSection('js'); ?> 
	<script src="<?php echo e(asset('template/plugins/bootstrap-datepicker/dist/js/bootstrap-datepicker.js')); ?>"></script> 
<?php $__env->stopSection(); ?>

<?php $__env->startSection('breadcrumb'); ?>
<li class="breadcrumb-item breadcrumb-header ">
	<a href="<?php echo e(Route('dashboard.admin')); ?>">Dashboard</a>
</li>
<li class="breadcrumb-item active"><?php echo $title; ?> del administrador</li>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('buttons'); ?>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('script'); ?>
	$('#datepicker-inline').datepicker({
		todayHighlight: true
	});	 	    
<?php $__env->stopSection(); ?>


<?php $__env->startSection('content'); ?>	
	<?php echo $__env->make('dashboard.admin.registros', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
	<div class="row">
		<div class="col-md-4">
			<?php echo $__env->make('dashboard.admin.calendar', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>	
		</div>
		<div class="col-md-4">
			<?php echo $__env->make('dashboard.admin.ultimos_usuarios', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>	
		</div>
	</div>		
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.backend', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\laragon\www\tramites_dipris\c-dipris\resources\views/dashboard/admin/index.blade.php ENDPATH**/ ?>