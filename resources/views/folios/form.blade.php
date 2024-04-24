<div class="row">
  <div class="col-md-8">
    <h4 class="fw-normal">Ingresar la información solicitada</h4>
  </div>      
</div>
<div class="row">  
  <div class="col-lg-6 col-md-6">  

    <div class="mb-4" id="dvCheckRango">
      <a href="#">Marque la casilla si desea insertar folios por rango</a>
      <div class="form-check form-switch">
        <input class="form-check-input" type="checkbox" id="chkRango" name="chkRango">
        <label class="form-check-label" for="chkRango"></label>
      </div>
    </div>

    <div class="mb-4" id="dvUnico" name="dvUnico">
      <label class="form-label" for="txtFolio">No de Folio</label>
      <input type="text" class="form-control" id="txtFolio" name="txtFolio" placeholder="Ingresa el numero de folio">
      <small class="f-s-12 text-grey-darker">Este es el numero que aparecera en la impresion de cada servicio solicitado</small>
    </div>

    <div class="row" id="dvRango" name="dvRango" style="display: none;">
      <div class="col-md-6 col-lg-6">
        <div class="mb-4">
          <label class="form-label" for="txtRangoDe">Rango inicial</label>
          <input type="text" class="form-control" id="txtRangoDe" name="txtRangoDe" placeholder="Ingresa el numero de folio">
        </div>
      </div>

      <div class="col-md-6 col-lg-6">
        <div class="mb-4">
          <label class="form-label" for="txtRangoA">Rango final</label>
          <input type="text" class="form-control" id="txtRangoA" name="txtRangoA" placeholder="Ingresa el numero de folio">
        </div>
      </div>
    </div>
  </div>
</div>
          
       