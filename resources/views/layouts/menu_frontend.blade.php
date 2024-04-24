<li class="nav-item">
    <a class="nav-link" href="{{ url('mis-tramites') }}">
        <i class="fe fe-airplay"></i> Inicio
    </a>
</li>

<li class="nav-item">
    <a class="nav-link" href="#" onclick="mode_dark();"><i class="fe fe-layers"></i> Modo oscuro</a>               
</li>

<li class="nav-item">
    <a class="nav-link" href="#mdlAtencion" data-toggle="modal"><i class="fe fe-phone-call"></i> Atencion telefonica</a>               
</li>

<li class="nav-item">
	<a href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();" class="nav-link">
		<i class="fe fe-log-out"></i> 
		<span>Cerrar sesi&oacute;n</span>
	</a>
</li>			
