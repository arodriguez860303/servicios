

<?php $__env->startSection('styles'); ?>
	<link href="<?php echo e(asset('css/card.css')); ?>" rel="stylesheet">
	<link href="<?php echo e(asset('css/botonesOutline.css')); ?>" rel="stylesheet">
<?php $__env->stopSection(); ?>

<?php $__env->startSection('breadcrumb'); ?>
	<li class="breadcrumb-item"><a href="<?php echo e(Route('tramites.inicio')); ?>">Inicio</a></li>
	<li class="breadcrumb-item active">Panel principal</li>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('titulo'); ?>
	<small><?php echo e(Auth::User()->name); ?></small>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('titulo_panel'); ?>
	Vista prinicipal
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>	
<div class="cards">
	<h1>Servicios proporcionados</h1>
	<div class="services">
		<div class="contentC content-1">
			<div class="fab fa fa-file-alt"></div>
			<h2>Constancia de Salud</h2>
			<p>Las acciones de control sanitario de alimentos, se realizan en coordinación con las Autoridades Sanitarias Estatales bajo el marco del Programa de Alimentos.</p>
			<a href="<?php echo e(Route('constancia.index')); ?>" class="btn success">Solicitar</a>
		</div>

		<div class="contentC content-2">
			<div class="fab fa fa-address-card"></div>
			<h2>Licencia</h2>
			<p>Lorem ipsum dolor sit amet consectetur adipisicing, elit. Recusandae atque officiis quibusdam perferendis excepturi nemo, asperiores voluptate alias.</p>
			<a href="#">Solicitar</a>
		</div>

		<div class="contentC content-3">
			<div class="fab fa fa-question-circle"></div>
			<h2>Otro</h2>
			<p>Lorem ipsum dolor sit amet consectetur adipisicing, elit. Recusandae atque officiis quibusdam perferendis excepturi nemo, asperiores voluptate alias.</p>
			<a href="#">Solicitar</a>
		</div>
	</div>
</div>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('js'); ?>		
<?php $__env->stopSection(); ?>

<?php $__env->startSection('script'); ?>  		
<?php $__env->stopSection(); ?>



<?php echo $__env->make('layouts.frontend', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\laragon\www\tramites_dipris\c-dipris\resources\views/frontend/index.blade.php ENDPATH**/ ?>