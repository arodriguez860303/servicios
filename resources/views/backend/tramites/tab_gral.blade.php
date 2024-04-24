<div class="row">
	<div class="col-md-12 col-lg-12">
		<div class="invoice">         
         <div class="invoice-company text-inverse f-w-600">
          	<div class="row" style="margin-bottom: -20px;">
          		<div class="col-md-9 col-lg-9">
          			<h3 class="text-inverse"><span id="spSolicitante"></span></h3>
          		</div>
          		<div class="col-md-3 col-lg-3 text-end">
                @if($id_status != 7)
          			<a href="{{ route('constancia.imprimir', [$id_tramite]) }}"  class="btn rounded-0 btn-white imprimir-constancia" target="_blank"><i class="fa fa-file-pdf t-plus-1 fa-fw fa-lg"></i> Vista previa</a>
                @endif
          		</div>
          	</div>              	      
         </div>         
         <!-- begin invoice-header -->
         <div class="invoice-header">
            <div class="invoice-from">
               <address class="m-t-5 m-b-5">
                  <strong class="text-inverse">Folio de pago: <span id="spFolioPago"></span></strong><br>
                  Status: <span id="spStatus"></span><br>
                  Curp: <span id="spCurp"></span><br>
                  Telefono: <span id="spTelefono"></span>
                </address>
            </div>
           
            <div class="invoice-date">
               <div class="date text-inverse m-t-5">Domicilio</div>
               <div class="invoice-detail">
               		<span id="spDomicilio"></span><br>
                  	C.P. <span id="spCP"></span><br>
                  	<span id="spMunicipio"></span>
                </div>
            </div>
         </div>
         <!-- end invoice-header -->     
         <div class="invoice-content">    
         	<h3 id="folio_constancia" style="display: none;">Folio: <span id="spFolioConstancia"></span></h3>
         	<div class="row">
         		<div class="col-md-12 col-lg-12 mt-1">
         			<div class="block block-rounded">
		                <ul class="nav nav-tabs nav-tabs-block align-items-center" role="tablist">
		                  <li class="nav-item">
		                    <button class="nav-link active" id="btabswo-generales-tab" data-bs-toggle="tab" data-bs-target="#btabswo-generales" role="tab" aria-controls="btabswo-generales" aria-selected="true" onclick="datos_generales();"><i class="fe fe-layers"></i> Generales</button>
		                  </li>
		                  <li class="nav-item">
		                    <button class="nav-link" id="btabswo-documentacion-tab" data-bs-toggle="tab" data-bs-target="#btabswo-documentacion" role="tab" aria-controls="btabswo-documentacion" aria-selected="false" onclick="datos_documentos();"><i class="far fa-address-book"></i> Documentación</button>
		                  </li>
		                  <li class="nav-item">
		                    <button class="nav-link" id="btabswo-evaluacion-tab" data-bs-toggle="tab" data-bs-target="#btabswo-evaluacion" role="tab" aria-controls="btabswo-evaluacion" aria-selected="false" onclick="datos_evaluacion();"><i class="fas fa-clipboard-list"></i> Evaluación</button>
		                  </li>
                      <li class="nav-item" style="display: none;" id="lnkObservacion">
                        <button class="nav-link" id="btabswo-observacion-tab" data-bs-toggle="tab" data-bs-target="#btabswo-observacion" role="tab" aria-controls="btabswo-observacion" aria-selected="false" onclick="load_observaciones();"><i class="fa fa-magnifying-glass"></i> Observaciones</button>
                      </li>
                      <li class="nav-item" style="display: none;" id="lnkSolventacion">
                        <button class="nav-link" id="btabswo-solventacion-tab" data-bs-toggle="tab" data-bs-target="#btabswo-solventacion" role="tab" aria-controls="btabswo-solventacion" aria-selected="false" onclick="loadSolventaciones();"><i class="fa fa-check-circle"></i> Solventaciones</button>
                      </li>
		                </ul>
		                <div class="block-content tab-content">
		                  <div class="tab-pane active" id="btabswo-generales" role="tabpanel" aria-labelledby="btabswo-generales-tab" tabindex="0">
		                    <h4 class="fw-normal">Datos generales del solicitante</h4>
		                    @include('backend.tramites.tbGeneral')
		                  </div>
		                  <div class="tab-pane" id="btabswo-documentacion" role="tabpanel" aria-labelledby="btabswo-documentacion-tab" tabindex="1">
		                    <h4 class="fw-normal">Documentación</h4>
		                    @include('backend.tramites.tbDocumentacion')
		                  </div>
		                  <div class="tab-pane" id="btabswo-evaluacion" role="tabpanel" aria-labelledby="btabswo-evaluacion-tab" tabindex="2">		                    
		                    @include('backend.tramites.tbExamen')
		                  </div>
                      <div class="tab-pane" id="btabswo-observacion" role="tabpanel" aria-labelledby="btabswo-observacion-tab" tabindex="3" >
                        <h4 class="fw-normal">Observaciones</h4>  
                        <div id="dvTblObservacion" name="dvTblObservacion"></div>                     
                      </div>
                      <div class="tab-pane" id="btabswo-solventacion" role="tabpanel" aria-labelledby="btabswo-solventacion-tab" tabindex="3" >
                        <h4 class="fw-normal">Solventaciones</h4>  
                        <div id="dvTblSolventacion" name="dvTblSolventacion"></div>                     
                      </div>               
		                </div>
		            </div>
         		</div>
         	</div>      
          	
         </div>  
      </div>
	</div>
</div>