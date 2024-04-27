

<?php $__env->startSection('styles'); ?>	
	<link href="<?php echo e(asset('css/invoice.css')); ?>" rel="stylesheet">
<?php $__env->stopSection(); ?>

<?php $__env->startSection('js'); ?> 	
	<script src="<?php echo e(asset('template/plugins/sweetalert/dist/sweetalert.min.js')); ?>"></script> 
	<script src="<?php echo e(asset('js/backend/constancias/clsDocumentosTramite.js')); ?>"></script>
	<script src="<?php echo e(asset('js/backend/constancias/clsRechazo.js')); ?>"></script>
	<script src="<?php echo e(asset('js/backend/constancias/clsTerminar.js')); ?>"></script>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('breadcrumb'); ?>
<li class="breadcrumb-item breadcrumb-header ">
	<a href="<?php echo e(Route('rev-constancias.index')); ?>">Constancias</a>
</li>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('buttons'); ?>
	<a href="<?php echo e(route('constancia.vista-previa', [$id_constancia])); ?>" class="btn btn-default btn-sm" target="_blank">
		<i class="fa fa-file-pdf"></i> Vista previax
	</a>
	<?php if($datos->id_status==2): ?>	
		<a href="#" class="btn btn-danger btn-sm btn-borrar-tramite" type="button" id="btn-borrar-tramite">
			<i class="fa fa-ban"></i> Eliminar trámite
		</a>	

		<button type="button" class="btn btn-sm btn-green btn-terminar" id="btn-terminar">
			<i class="fa fa-check"></i> Aceptar y generar constancia
		</button>

		<a href="#" class="btn btn-danger btn-sm" type="button" onclick="rechazar(<?php echo e($id_constancia); ?>)">
			<i class="fa fa-ban"></i> Rechazar trámite
		</a>
	<?php endif; ?>
	<a href="<?php echo e(Route($current_route.'.index')); ?>" class="btn btn-sm btn-inverse">
		<i class="fa fa-reply"></i> Regresar
	</a>

	<form id="frmTerminar" name="frmTerminar">
		<?php echo csrf_field(); ?>		
	</form>

	<form id="frmBorrarTramite" name="frmBorrarTramite">
		<?php echo csrf_field(); ?>		
	</form>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('script'); ?>	
	documentos_tramite();	    
	observaciones();
	$('#btn-enviar').attr('onclick', 'enviar_rechazo("frmRechazar")');
	$('#btn-terminar').attr('onclick', 'terminar_tramite("frmTerminar")');
	$('#btn-foto').attr('onclick', 'actualizar_foto("frmFoto")'); 

	$('#btn-borrar-tramite').attr('onclick', 'eliminar_tramite("frmBorrarTramite")');
<?php $__env->stopSection(); ?>


<?php $__env->startSection('content'); ?>
	<input type="hidden" name="hdIdTramite" id="hdIdTramite" value="<?php echo e($datos->id_tramite); ?>" />
	<input type="hidden" name="hdIdConstancia" id="hdIdConstancia" value="<?php echo e($id_constancia); ?>" />

	<?php echo $__env->make('backend.constancias.detalle', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
	<?php echo $__env->make('backend.constancias.mdRechazar', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
	<?php echo $__env->make('backend.constancias.mdFoto', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.backend', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\laragon\www\tramites_dipris\c-dipris\resources\views/backend/constancias/show.blade.php ENDPATH**/ ?>