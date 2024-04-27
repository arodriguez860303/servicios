

<?php $__env->startSection('styles'); ?>
	<link href="<?php echo e(asset('template/plugins/datatables.net-bs4/css/dataTables.bootstrap4.min.css')); ?>" rel="stylesheet">
	<link href="<?php echo e(asset('template/plugins/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css')); ?>" rel="stylesheet">
	<link href="<?php echo e(asset('css/tooltip.css')); ?>" rel="stylesheet">
<?php $__env->stopSection(); ?>

<?php $__env->startSection('js'); ?> 
	<script src="<?php echo e(asset('template/plugins/sweetalert/dist/sweetalert.min.js')); ?>"></script>
	<script src="<?php echo e(asset('template/plugins/datatables.net/js/jquery.dataTables.min.js')); ?>"></script>  
	<script src="<?php echo e(asset('template/plugins/datatables.net-bs4/js/dataTables.bootstrap4.min.js')); ?>"></script>  
	<script src="<?php echo e(asset('template/plugins/datatables.net-responsive/js/dataTables.responsive.min.js')); ?>"></script>  
	<script src="<?php echo e(asset('template/plugins/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js')); ?>"></script>   
	<script src="<?php echo e(asset('js/catalogos/usuarios/clsTable.js')); ?>"></script>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('breadcrumb'); ?>
<li class="breadcrumb-item breadcrumb-header ">
	<a href="<?php echo e(Route('usuarios.index')); ?>">Usuarios</a>
</li>
<li class="breadcrumb-item active"><?php echo $title; ?></li>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('buttons'); ?>
	<a href="<?php echo e(Route($current_route.'.create')); ?>" class="btn btn-info btn-sm"><i class="fa fa-plus"></i> Nuevo usuario</a>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('script'); ?>	
	cargar_usuarios(); 	    
<?php $__env->stopSection(); ?>


<?php $__env->startSection('content'); ?>	
<div class="row">
	<div class="col-xl-12 col-md-12 col-sm-12">
		<div class="panel panel-inverse" data-sortable-id="form-stuff-1">
			<div class="panel-heading">
				<h4 class="panel-title">Listado de usuarios registrados en el sistema</h4>
				<div class="panel-heading-btn">
					<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
					<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-redo"></i></a>
					<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
					<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
				</div>
			</div>
			<div class="panel-body">
				<input type="hidden" name="_token" id="_token" value="<?php echo e(csrf_token()); ?>" />
				<div class="table-usuarios"></div>
				
			</div>
		</div>
	</div>
</div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.backend', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\laragon\www\tramites_dipris\c-dipris\resources\views/catalogos/usuarios/index.blade.php ENDPATH**/ ?>