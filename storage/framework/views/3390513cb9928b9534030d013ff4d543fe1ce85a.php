

<?php $__env->startSection('meta'); ?>
    <meta name="csrf-token" content="<?= csrf_token() ?>">
<?php $__env->stopSection(); ?>

<?php $__env->startSection('css'); ?>
  <?php echo $__env->make('helpers.cssTable', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
  <link href="<?php echo e(asset('template_backend/css/cssHeader.css')); ?>" type="text/css" rel="stylesheet">  
<?php $__env->stopSection(); ?>

<?php $__env->startSection('title'); ?>
  USUARIOS
<?php $__env->stopSection(); ?>

<?php $__env->startSection('descripcion'); ?>
  Listado de usuarios registrados en el sistema
<?php $__env->stopSection(); ?>

<?php $__env->startSection('buttons'); ?>  
    <a href="<?php echo e(route($current_route.'.create')); ?>" class="btn btn-outline-info"><i class="fas fa-plus"></i> <b>Nuevo usuario</b></a>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
  <style>
    .dataTables_filter, .dataTables_info { display: none; }    
  </style>
  <?php echo $__env->make('helpers.headerWithSearch', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>

  <div class="block-content block-content-full">
      <div id="table-usuarios" class="table-usuarios"></div>
  </div>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('js'); ?>
  <?php echo $__env->make('helpers.jsTable', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
  <script src="<?php echo e(asset('backend/usuarios/index.js')); ?>"></script>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('script'); ?>
  $("._usuarios").addClass("active");
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.backend', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\laragon\www\salud\dipris\resources\views/catalogos/usuarios/index.blade.php ENDPATH**/ ?>