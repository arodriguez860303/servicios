<div class="panel panel-inverse" data-sortable-id="index-10">
	<div class="panel-heading">
		<h4 class="panel-title">Ultimos usuarios ingresados por el portal</h4>
		<div class="panel-heading-btn">
			<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
			<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-redo"></i></a>
			<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
			<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
		</div>
	</div>
	<div class="panel-body">
		<div class="table-responsive">
			<table class="table m-b-0">
				<thead>
					<tr>
						<th>#</th>
						<th>Nombre / Razon Social</th>
						<th>RFC</th>
					</tr>
				</thead>
				<tbody>
					<?php $i=0; ?>
					<?php $__currentLoopData = $lastUsers; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $u): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
					<?php $i++; ?>
					<tr>
						<td><?php echo $i; ?></td>
						<td><?php echo $u->razon_social_o_nombre; ?></td>
						<td><?php echo $u ->rfc; ?></td>
					</tr>
					<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
				</tbody>
			</table>
		</div>
	</div>
</div>
<?php /**PATH D:\laragon\www\tramites_dipris\c-dipris\resources\views/dashboard/admin/ultimos_usuarios.blade.php ENDPATH**/ ?>