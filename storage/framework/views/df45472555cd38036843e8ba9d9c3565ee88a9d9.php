<li>
	<a href="<?php echo e(Route('tramites.inicio')); ?>">
		<i class="fas fa-home"></i> 
		<span>Incio</span>
	</a>
</li>
<li class="has-sub">
	<a href="javascript:;">
		<i class="fas fa-archive"></i>
		<span>Tramites</span>
		<b class="caret"></b>
	</a>
	<ul class="sub-menu">
		<li><a href="<?php echo e(Route('constancia.index')); ?>">Contancias</a></li>
		<!--<li><a href="<?php echo e(Route('licencia-funcionamiento.index')); ?>">Licencia de Funcionamiento</a></li>-->
		<!--<li><a href="#" onclick="verifica_tramites();">Nuevo tramite</a></li>-->		
	</ul>
</li>

<li>
	<a href="<?php echo e(route('logout')); ?>" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
		<i class="fas fa-key"></i> 
		<span>Cerrar sesi&oacute;n</span>
	</a>
</li>			
<li class="menu-control menu-control-left">
	<a href="javascript:;" data-click="prev-menu"><i class="fa fa-angle-left"></i></a>
</li>
<li class="menu-control menu-control-right">
	<a href="javascript:;" data-click="next-menu"><i class="fa fa-angle-right"></i></a>
</li><?php /**PATH D:\laragon\www\tramites_dipris\c-dipris\resources\views/layouts/menu_frontend.blade.php ENDPATH**/ ?>