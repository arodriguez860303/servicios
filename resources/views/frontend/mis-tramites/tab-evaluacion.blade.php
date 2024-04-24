<h3 class="mb-4">Evaluación</h3>

<div class="row">
	<div class="col-md-12">
		<p>A continuación se presenta la evaluación, para la obtencion de la <b>Constancia de Manejo Higiénico de Alimentos.</b> Contestar todas las preguntas para poder obtener la calificación aprobatoria.</p>
	</div>
</div>

<style>
	.steps
	{
		display: none;
	}

	.wizard > .actions > ul > li.disabled {
	  display: none;
	}
</style>

<form name="frmquestion" id="frmquestion" onsubmit="return false;">
	@csrf

	<div class="text-center m-b-md" id="wizardControl">
        <!-- Begin WizardControl -->
        @foreach($preguntas as $vpregunta)
        <a  class="btn btn-outline btn-primary" 
            href="#pregunta_{{ $vpregunta->id }}" 
            data-toggle="tab" 
            style="display: none"> Pregunta {!! $vpregunta->id !!}
        </a>
        @endforeach
        <!-- End: Botton WizardControl -->
    </div> 

    <div id="wizardExamen">
    	<?php 
            $vi=1;
            $vactivoValor=1;
            $vtotalArrayPreguntas=count($preguntas);
            $varrayResponseJSONImage=json_decode($vpregunta->fldimagen);
        ?>
        @foreach($preguntas as $vpregunta)
        <?php
            $vactivo='';
            if ( $vactivoValor == 1 ){
                $vactivo="active";
                $vactivoValor++;
            } 
        ?>

        <h3>Tab_{{ $vpregunta->id }}</h3>
        <section id="pregunta_{{ $vpregunta->id }}" class="{{ $vactivo }}">
        	<h4 class="text-info text-center">{!! $vi . '.- ' . $vpregunta->fldpregunta !!}</h4>
            <input type="hidden" name="idPregunta[]" value="{{ $vpregunta->id }}">

            <?php
                // Si en dado caso es de Obsión Multiple
                $vciclo=1;                                                
                $varrayResponseJSON=[];
                $varrayResponseJSON=json_decode($vpregunta->fldtexto_opcion);
            ?>

            <div class="table-responsive">
				<table class="table mg-b-0" width="100%">						
					<tbody>
						<tr>
							<td width="5%">
								<input  type="radio"  
	                                	value="a" 
	                                	id="cmb_opc_{{ $vpregunta->id }}_a"                                
	                                	name="cbxbtn_{{ $vpregunta->id }}[]" style="display: inline; width: 25px;" />
							</td>
							<td>
								<label for="cmb_opc_{{ $vpregunta->id }}_a">
		                            a) {!! $vpregunta->fldopc_a !!}
		                        </label>
							</td>									
						</tr>
						<tr>
							<td width="5%">
								<input  type="radio"  
		                                value="b" 
		                                id="cmb_opc_{{ $vpregunta->id }}_b"                                
		                                name="cbxbtn_{{ $vpregunta->id }}[]" style="display: inline; width: 25px;" />
							</td>
							<td>
								<label for="cmb_opc_{{ $vpregunta->id }}_b">
		                            b) {!! $vpregunta->fldopc_b !!}
		                        </label>
							</td>
						</tr>
						<tr>
							<th width="5%">
								<input  type="radio"  
		                                value="c" 
		                                id="cmb_opc_{{ $vpregunta->id }}_c"                                
		                                name="cbxbtn_{{ $vpregunta->id }}[]" style="display: inline; width: 25px;" />
							</th>
							<td>
								<label for="cmb_opc_{{ $vpregunta->id }}_c">
		                            c) {!! $vpregunta->fldopc_c !!}
		                        </label>
							</td>									
						</tr>
					</tbody>
				</table>
			</div>

			<hr />           
        
        	<div class="row">  
        		<div class="col-md-2">
        			@if ( ($vi != 1) ) 
		                <a class="btn ripple btn-outline-primary prev" href="#">
		                    <i class="fa fa-angle-left"></i>&nbsp;&nbsp;Atras
		                </a>
		            @endif
        		</div>

        		<div class="col-md-8"></div>
        		<div class="col-md-2">
        			@if ( ($vi != $vtotalArrayPreguntas) )
		                <a 
		                    class="btn ripple btn-outline-primary next"
		                    onclick="validar_pregunta(this, {!! $vpregunta->id !!})" 
		                    id="btnpregunta_{{ $vpregunta->id }}" 
		                    href="#"
		                >Siguiente&nbsp;&nbsp;
		                    <i class="fa fa-angle-right"></i>
		                </a>
		            @endif
		        	
		        	 @if ( $vi == $vtotalArrayPreguntas )
		                <a class="btn ripple btn-outline-success submitWizard" href="#" onclick="store_evaluacion(this, {!! $vpregunta->id !!})">
		                    Enviar evaluación<i class="fa fa-send"></i>
		                </a>
		            @endif
        		</div>
        	</div>    	
        </section>

        <?php 
            ++$vi;
        ?>
        @endforeach
    </div>                                      
   
</form>