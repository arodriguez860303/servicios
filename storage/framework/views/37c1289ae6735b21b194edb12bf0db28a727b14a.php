

<?php $__env->startSection('styles'); ?>	
<?php $__env->stopSection(); ?>

<?php $__env->startSection('js'); ?>	
	<script src="<?php echo e(asset('template/plugins/bootstrap-show-password/dist/bootstrap-show-password.js')); ?>"></script>	
	<script src="<?php echo e(asset('js/registro/crear-cuenta.js')); ?>"></script>	
	<script src="<?php echo e(asset('js/registro/jsExpresionesRegulares.js')); ?>"></script>	
<?php $__env->stopSection(); ?>

<?php $__env->startSection('breadcrumbs'); ?>    
<?php $__env->stopSection(); ?>

<?php $__env->startSection('script'); ?>	
	getMunicipios();
	getTipoTramite();
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
<style>
#resCurp {
    background-color: red;
    color: white;
    font-weight: bold;
}
#resCurp.ok {
    background-color: green;
}

#resRfc {
    background-color: red;
    color: white;
    font-weight: bold;
}
#resRfc.ok {
    background-color: green;
}

#resCorreo {
    background-color: red;
    color: white;
    font-weight: bold;
}
#resCorreo.ok {
    background-color: green;
}
</style>

	<h3>Crear cuenta para constancia de manejo higiénico de alimentos</h3>
	<div class="panel panel-inverse">
		<div class="panel-heading ui-sortable-handle">			
			<h4 class="panel-title">Información del registro</h4>
		</div>		
		<div class="panel-body">
		    <?php echo Form::open(['route' => $current_route.'.store', 'method' => 'POST' , 'files' => true, 'id' => 'frm-1', 'enctype'=>'multipart/form-data', 'accept-charset'=>'UTF-8'], ['role' => 'form']); ?> 		    	
		        <div class="hpanel">
		            <div class="panel-body">
		                <?php echo $__env->make('frontend.crear-cuenta.form', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
		            </div>
		        </div>
		    <?php echo Form::close(); ?>

		</div>
	</div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.frontend_cuenta', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\laragon\www\salud\dipris\resources\views/frontend/crear-cuenta/create.blade.php ENDPATH**/ ?>