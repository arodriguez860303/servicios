 

<?php $__env->startSection('meta'); ?>
    <meta name="csrf-token" content="<?= csrf_token() ?>">
<?php $__env->stopSection(); ?>

<?php $__env->startSection('css'); ?>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('title'); ?>
  DASHBOARD
<?php $__env->stopSection(); ?>

<?php $__env->startSection('descripcion'); ?>
  Estadisticas
<?php $__env->stopSection(); ?>

<?php $__env->startSection('buttons'); ?> 	
<?php $__env->stopSection(); ?>

<?php $__env->startSection('dash-content'); ?>
	<?php echo $__env->make('dashboard.head_anio', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
	<?php echo $__env->make('dashboard.targets_status', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
	<?php echo $__env->make('dashboard.targets_graph', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
	<?php echo $__env->make('dashboard.targets_recent', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('js'); ?> 	
	<script src="<?php echo e(asset('template_backend/js/plugins/chart.js/chart.min.js')); ?>"></script>
	<script src="<?php echo e(asset('backend/dashboard/jsIndex.js')); ?>"></script>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('script'); ?>	
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.backend', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\laragon\www\salud\dipris\resources\views/dashboard/index.blade.php ENDPATH**/ ?>