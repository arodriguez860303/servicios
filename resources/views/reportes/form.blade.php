<div class="row">
  <div class="col-md-8">
    <h4 class="fw-normal">Ingresar la información solicitada</h4>
  </div>      
</div>
				
<form id="frmReporte" name="frmReporte" accept-charset="UTF-8">

	<div class="row"> 
		<div class="col-lg-6 col-md-6">
			<div class="row">
		    	<div class="col-lg-6 col-md-6">
		    		<div class="mb-4">
		      			<label class="form-label" for="cmbTipoReporte">Tipo de reporte</label>
		      			<select class="js-select2 form-select" id="cmbTipoReporte" name="cmbTipoReporte" style="width: 100%">
		      				<option value="0">Selecciona una opcion</option>
	                        <option value="1">General</option>
	                        <option value="2">Por municipios</option>
	                        <option value="3">Detallado por municipio</option>
		      			</select>
		    		</div>
		    	</div>

		    	<div class="col-lg-6 col-md-6">
		    		<div class="mb-4">
		      			<label class="form-label" for="cmbAnio">Año</label>
		      			<select class="js-select2 form-select" id="cmbAnio" name="cmbAnio" style="width: 100%">
		      				<option value="0">Seleccionar el año</option>                                        
	                        <option value="2023">2023</option>
	                        <option value="2024">2024</option>
	                        <option value="2025">2025</option>
	                        <option value="2026">2026</option>
		      			</select>
		    		</div>
		    	</div>	    	
		    </div>
			

			<div class="col-lg-12 col-md-12">
	    		<div class="mb-4">
	      			<label class="form-label" for="id_municipio">Municipio</label>
	      			<select class="js-select2 form-select" id="id_municipio" name="id_municipio" style="width: 100%"></select>
	    		</div>
	    	</div>	 

		    <div class="row">
		    	<div class="col-lg-6 col-md-6">
		    		<div class="mb-4">
				      	<label class="form-label" for="fecha_inicio">Fecha inicio</label>			      
				      	<input type="text" class="js-flatpickr form-control" id="fecha_inicio" name="fecha_inicio" data-date-format="d/m/Y" placeholder="Ingresa fecha inicial">	
				    </div>
		    	</div>

		    	<div class="col-lg-6 col-md-6">
		    		<div class="mb-4">
				      	<label class="form-label" for="fecha_fin">Fecha fin</label>			      
				      	<input type="text" class="js-flatpickr form-control" id="fecha_fin" name="fecha_fin" data-date-format="d/m/Y" placeholder="Ingresa fecha final">
				    </div>
		    	</div>
		    </div>	    
		</div>	
	</div>
</form>

<div class="pull-right" style="text-align: right;">
	<button id="btn-generar" class="btn btn-generar btn btn-outline-info btn-rounded mb-2" onclick="verifica();">Generar reporte</button>
</div>