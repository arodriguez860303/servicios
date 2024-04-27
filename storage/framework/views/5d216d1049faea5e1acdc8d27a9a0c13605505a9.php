<div id="sidebar" class="sidebar">
	
	<div data-scrollbar="true" data-height="100%">		
		<ul class="nav">
			<li class="nav-profile">
				<a href="javascript:;" data-toggle="nav-profile">
					<div class="cover with-shadow"></div>
					<div class="image">
						<img src="<?php echo e(asset('img/avatar/user.png')); ?>" alt="" />
					</div>
					<div class="info">
						<b class="caret pull-right"></b><?php echo e(Auth::User()->roles->first()->description); ?>

						<small><?php echo e(Auth::User()->name); ?></small>
					</div>
				</a>
			</li>
			<li>
				<ul class="nav nav-profile">
					<li>
						<a class="dropdown-item" href="<?php echo e(route('logout')); ?>" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
							<i class="fa fa-power-off"></i> Cerrar sesión
						</a>
					</li>
				</ul>
			</li>
		</ul>
		
		<ul class="nav">			

			<?php echo $__env->make('layouts.menu_backend', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>

			<!-- begin sidebar minify button -->
			<li>
				<a href="javascript:;" class="sidebar-minify-btn" data-click="sidebar-minify"><i class="fa fa-angle-double-left"></i></a>
			</li>
			<!-- end sidebar minify button -->
		</ul>	
	</div>	
</div>
<div class="sidebar-bg"></div>





<?php /**PATH D:\laragon\www\tramites_dipris\c-dipris\resources\views/layouts/backend-sidebar.blade.php ENDPATH**/ ?>