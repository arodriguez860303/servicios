<div class="my-5 page" size="A4">
        <div class="p-5">
            <section class="top-content bb d-flex justify-content-between">
                <div class="logo">
                    <img src="<?php echo e(asset('img/logos/logo-dipris.jpg')); ?>" alt="" class="img-fluid" />
                </div>
                <center><h2 class="titulo">Dirección de Protección contra Riesgos Sanitarios</h2></center>
                <div class="top-left">
                    <div class="graphic-path">
                        <p><Detalle></Detalle></p>
                    </div>
                    <div class="position-relative">                    	
                        <p>Folio No. <span><b><?php echo $datos->folio; ?></b></span></p>
                    </div>
                </div>
            </section>

            <section class="store-user mt-5">
                <div class="col-12">
                    <div class="row bb pb-3">
                        <h4><?php echo $msgPago; ?></h4>
                    </div>
                </div>
                <div class="col-10">
                    <div class="row bb pb-3">
                        <div class="col-7">
                            <p>Razon social / Nombre:</p>
                            <h2><?php echo $datos->razon_social; ?></h2>
                            <p class="address"><b>Folio de pago:</b> <?php echo $datos->folio_hacienda; ?><br> <b>Telefono:</b> <?php echo $datos->telefono; ?>, <br> <b>Correo:</b> <?php echo $datos->email; ?>, <br><b>Status:</b> <span class="label label-<?php echo e($datos->color); ?>"><?php echo $datos->status; ?></span></p>                            
                        </div>
                        <div class="col-5">
                            <p>RFC:</p>
                            <h2><?php echo $datos->rfc; ?></h2>
                            <p class="address"> <b>Domicilio:</b> <?php echo $datos->calle; ?>, no <?php echo $datos->num_exterior; ?>, colonia <?php echo $datos->colonia; ?>, cp <?php echo $datos->codigo_postal; ?>, <?php echo $datos->municipio; ?> </p>                            
                        </div>
                    </div>
                    <div class="row extra-info pt-3">
                        <div class="col-7">
                            <p>Tipo tramite: <span><?php echo $datos->clave.'-'.$datos->tipo_tramite; ?></span></p>
                        </div>
                        <div class="col-5">
                            <p>Fecha inicio: <span><?php echo $datos->fecha_inicio; ?></span></p>
                        </div>
                    </div>
                </div>
            </section>
            <center><h3 class="subtitulo">Documentación recibida</h3></center>

            <div id="dvDoctos" class="dvDoctos"></div>           

            <section class="balance-info">
                <div class="row">
                    <div class="col-12">
                        <p class="m-0 font-weight-bold"> Nota: </p>
                        <p>Toda la documenttacion puede ser descargada, y almacenarla en su equipo local.</p>
                    </div>
                </div>
            </section>

            <section>
            	<center><h3 class="subtitulo">Resultados de la evaluación</h3></center>
            	<table class="table m-b-0">				
				<tbody>
					<tr>
						<td><h5>Preguntas contestadas correctamente</h5></td>
						<td><h5><?php echo $correctas; ?></h5></td>
					</tr>
					<tr>
						<td><h5>Preguntas contestadas incorrectamente</h5></td>
						<td><h5><?php echo $incorrectas; ?></h5></td>
					</tr>
					<tr>
						<td><h5>Total de preguntas</h5></td>
						<td><h5><?php echo $total; ?></h5></td>
					</tr>
                    <tr>
                        <td><h5>Numero de intentos</h5></td>
                        <td><h5><?php echo $datos->no_oportunidades; ?></h5></td>
                    </tr>
					<tr style="background-color: #CBCDCE;">
						<td><h5>Porcentaje obtenido</h5></td>
						<td><h5><?php echo $porcentaje; ?>%</h5></td>
					</tr>				
				</tbody>
			</table>
            </section>

            <section>
                <center><h3 class="subtitulo">Seguimientos</h3></center>
                <div id="dvObservaciones" class="dvObservaciones"></div>   
            </section>
            <footer>
                <hr>
                <p class="m-0 text-center">
                    Dirección de Protección contra Riesgos Sanitarios
                </p>
            </footer>
        </div>
    </div><?php /**PATH D:\laragon\www\tramites_dipris\c-dipris\resources\views/backend/constancias/detalle.blade.php ENDPATH**/ ?>