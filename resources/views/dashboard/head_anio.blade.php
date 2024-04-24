<div class="row">
  	<div class="col-xl-12 col-xxl-12 d-flex flex-column">    
    	<div class="block block-rounded flex-grow-1 d-flex flex-column">
    		<div class="block-content bg-body-light">
    			<div class="note note-secondary m-b-15">
					<div class="note-content">
						{!! Form::hidden('anio', date('Y'),['id'=>'anio']) !!}
						<h4>
							<b>Solicitudes 
								<a href="#" onclick="por_anio(2023)"><span id="y2023" class="badge bg-primary year">2023</span></a> 
								<a href="#" onclick="por_anio(2024)"><span id="y2024" class="badge bg-black-50 year">2024</span></a> 
								<a href="#" onclick="por_anio(2025)"><span id="y2025" class="badge bg-black-50 year">2025</span></a> 
								<a href="#" onclick="por_anio(0)"><span id="y0" class="badge bg-black-50 year">Todos</span></a> 
							</b>
						</h4>
						<p>
							A continuación se muestran las estadisticas de las <b>solicitudes</b> realizados en el año actual <b>{{ date('Y') }}</b>. En caso de necesitar mas información seleccione el año correspondiente. 
						</p>
					</div>
				</div>
    		</div>
    	</div>
	</div>
</div>