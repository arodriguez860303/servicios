<div class="row">
	<!-- begin col-3 -->
	<div class="col-xl-3 col-md-6">
		<div class="widget widget-stats bg-blue">
			<div class="stats-icon"><i class="fa fa-desktop"></i></div>
			<div class="stats-info">
				<h4>TOTAL FOLIOS</h4>
				<p><?php echo $total_folios; ?></p>	
			</div>
			<div class="stats-link">
				<a href="<?php echo e(Route('folios.index')); ?>">Ver folios <i class="fa fa-arrow-alt-circle-right"></i></a>
			</div>
		</div>
	</div>
	<!-- end col-3 -->
	<!-- begin col-3 -->
	<div class="col-xl-3 col-md-6">
		<div class="widget widget-stats bg-info">
			<div class="stats-icon"><i class="fa fa-users"></i></div>
			<div class="stats-info">
				<h4>USUARIOS REVISORES</h4>
				<p><?php echo $total_usuarios; ?></p>	
			</div>
			<div class="stats-link">
				<a href="<?php echo e(Route('usuarios.index')); ?>">Ver usuarios <i class="fa fa-arrow-alt-circle-right"></i></a>
			</div>
		</div>
	</div>
	<!-- end col-3 -->
	<!-- begin col-3 -->
	<div class="col-xl-3 col-md-6">
		<div class="widget widget-stats bg-orange">
			<div class="stats-icon"><i class="fa fa-users"></i></div>
			<div class="stats-info">
				<h4>TOTAL TRAMITES</h4>
				<p><?php echo $total_tramites; ?></p>	
			</div>
			<div class="stats-link">
				<a href="javascript:;">Ver tramites <i class="fa fa-arrow-alt-circle-right"></i></a>
			</div>
		</div>
	</div>
	<!-- end col-3 -->
</div><?php /**PATH D:\laragon\www\tramites_dipris\c-dipris\resources\views/dashboard/admin/registros.blade.php ENDPATH**/ ?>