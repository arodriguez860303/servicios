

<?php $__env->startSection('styles'); ?>
	<link href="<?php echo e(asset('template/plugins/datatables.net-bs4/css/dataTables.bootstrap4.min.css')); ?>" rel="stylesheet">
	<link href="<?php echo e(asset('template/plugins/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css')); ?>" rel="stylesheet">
	<link href="<?php echo e(asset('css/tooltip.css')); ?>" rel="stylesheet">
<?php $__env->stopSection(); ?>

<?php $__env->startSection('js'); ?> 
	<script src="<?php echo e(asset('template/plugins/datatables.net/js/jquery.dataTables.min.js')); ?>"></script>  
	<script src="<?php echo e(asset('template/plugins/datatables.net-bs4/js/dataTables.bootstrap4.min.js')); ?>"></script>  
	<script src="<?php echo e(asset('template/plugins/datatables.net-responsive/js/dataTables.responsive.min.js')); ?>"></script>  
	<script src="<?php echo e(asset('template/plugins/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js')); ?>"></script>   
	<script src="<?php echo e(asset('js/backend/constancias/clsTable.js')); ?>"></script>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('breadcrumb'); ?>
<li class="breadcrumb-item breadcrumb-header ">
	<a href="<?php echo e(Route('rev-constancias.index')); ?>">Constancias</a>
</li>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('script'); ?>	
	fill_table('<?php echo e(URL::route('constancia.lstConstancias')); ?>',  {"anio": $('#anio').val() });    

	function searhss(data){
    	clean_table();
		let route= "";		
		fill_table('<?php echo e(URL::route('constancia.lstConstancias')); ?>', data);		  	
	};
	$('#collapseTwo').collapse();	    
<?php $__env->stopSection(); ?>


<?php $__env->startSection('content'); ?>
	<div class="note note-secondary m-b-15">
		<div class="note-content">
			<?php echo Form::hidden('anio', 2023,['id'=>'anio', 'class'=>'form-control gui-input']); ?>

			<h4>
				<b>Constancias emitidas por año:  
					<a href="#" onclick="por_anio(2022)"><span id="y2022" class="label label-default year">2022</span></a> 
					<a href="#" onclick="por_anio(2023)"><span id="y2023" class="label label-primary year">2023</span></a>  					
					<a href="#" onclick="por_anio(0)"><span id="y0" class="label label-default year">Todos</span></a> 
				</b>
			</h4>
			<p>
				A continuación se listan las <b>Constancias</b> solicitadas en el año actual <b><?php echo e(date('Y')); ?></b>. En caso de necesitar mas información seleccione el año correspondiente. 
			</p>
		</div>
	</div>

	<div class="panel panel-inverse">		
		<div class="panel-body">
			<table id="dt_default" class="table table-striped table-bordered display responsive" width="100%">
			</table>
		</div>
	</div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.backend', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\laragon\www\tramites_dipris\c-dipris\resources\views/backend/constancias/index.blade.php ENDPATH**/ ?>