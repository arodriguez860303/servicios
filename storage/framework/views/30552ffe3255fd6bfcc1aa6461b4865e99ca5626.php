<?php if(Auth::User()->hasRole(['admin'])): ?>
<li class="nav-header">INICIO</li>
<li class="active">
	<a href="<?php echo e(Route('dashboard.admin')); ?>"><i class="fa fa-th-large"></i><span>Dashboard</span></a>
</li>
<?php endif; ?>


<?php if(Auth::User()->hasRole(['revisor'])): ?>
<li class="nav-header">Servicios</li>

<li class="active">
	<a href="<?php echo e(Route('rev-constancias.index')); ?>"><i class="fa fa-file-alt"></i><span>Constancias</span></a>
</li>
<li class="active">
	<a href="<?php echo e(Route('usuarios.index')); ?>"><i class="fa fa-users"></i><span>Usuarios</span></a>
</li>
<?php endif; ?>

<?php if(Auth::User()->hasRole(['ventanilla'])): ?>
<li class="nav-header">Servicios</li>

<li class="active">
	<a href="<?php echo e(Route('tramites-lf.index')); ?>"><i class="fa fa-file-alt"></i><span>Licencias de func.</span></a>
</li>
<?php endif; ?>

<?php if(Auth::User()->hasRole(['tecnica'])): ?>
<li class="nav-header">Servicios</li>

<li class="active">
	<a href="<?php echo e(Route('tramites-lf-tecnica.index')); ?>"><i class="fa fa-file-alt"></i><span>Licencias de func.</span></a>
</li>
<?php endif; ?>

<?php if(Auth::User()->hasRole(['admin'])): ?>
<li class="nav-header">Catalogos</li>

<li class="active">
	<a href="<?php echo e(Route('folios.index')); ?>"><i class="fa fa-tasks"></i><span>Folios</span></a>
</li>

<li class="active">
	<a href="<?php echo e(Route('usuarios.index')); ?>"><i class="fa fa-users"></i><span>Usuarios</span></a>
</li>

<li class="active">
	<a href="<?php echo e(Route('reportes.constancias')); ?>"><i class="fa fa-file-alt"></i><span>Reportes constancias</span></a>
</li>

<li class="active">
	<a href="<?php echo e(Route('solicitantes.index')); ?>"><i class="fa fa-users"></i><span>Solicitantes</span></a>
</li>
<?php endif; ?><?php /**PATH D:\laragon\www\tramites_dipris\c-dipris\resources\views/layouts/menu_backend.blade.php ENDPATH**/ ?>