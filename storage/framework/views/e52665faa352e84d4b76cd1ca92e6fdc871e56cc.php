<div id="header" class="header navbar-default">

	<div class="navbar-header">
		<a href="<?php echo e(route('home')); ?>" class="navbar-brand"><b>DIPRIS</b> Admin</a>
		<button type="button" class="navbar-toggle" data-click="sidebar-toggled">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
	</div>
	
	<ul class="navbar-nav navbar-right">
		<li class="dropdown navbar-user">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown">					
				<span class="d-none d-md-inline"><?php echo e(Auth::User()->name); ?></span> <b class="caret"></b>
			</a>
			<div class="dropdown-menu dropdown-menu-right">
				<a href="javascript:;" class="dropdown-item"><i class="fa fa-user"></i> Mi cuenta</a>
				<div class="dropdown-divider"></div>
                <a class="dropdown-item" href="<?php echo e(route('logout')); ?>" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                    <i class="fa fa-power-off"></i> Cerrar sesión
                </a>

                <form id="logout-form" action="<?php echo e(route('logout')); ?>" method="POST" style="display: none;">
                    <?php echo csrf_field(); ?>
                </form>
			</div>
		</li>
	</ul>
</div><?php /**PATH D:\laragon\www\tramites_dipris\c-dipris\resources\views/layouts/backend-header.blade.php ENDPATH**/ ?>