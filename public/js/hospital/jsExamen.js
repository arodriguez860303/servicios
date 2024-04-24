var vradiosButon=[];

$(document).ready(function() {

    $("#wizardExamen").steps({
        headerTag: "h4",
        bodyTag: "section",
        transitionEffect: "fade",
        enableAllSteps: true,
        transitionEffectSpeed: 300 
    });
    // Custom Steps Jquery Steps
    $('.wizard > .steps li a').click(function(){
        $(this).parent().addClass('checked');
        $(this).parent().prevAll().addClass('checked');
        $(this).parent().nextAll().removeClass('checked');
    });
    
    $("a[href$='next']").hide();
    $("a[href$='previous']").hide();
    $("a[href$='finish']").hide();

    $('.prev').click(function(){
        $('#wizardExamen').steps('previous');
    });
});

function store_evaluacion(inputObject, vnumPregunta, vrespuesta)
{ 
    swal({
        title: "¡ Advertencia !",
        text: "¿ Esta seguro de enviar la evalución ?",
        icon: "warning",
        buttons: {
            cancel: {
                text: 'Cancelar',
                value: false,
                visible: true,
                className: 'btn btn-default',
                closeModal: true,
            },
            confirm: {
                text: 'Confirmar',
                value: true,
                visible: true,
                className: 'btn btn-primary',
                closeModal: true
            }
        }
    }).then((result) => {
        if (result) {
           store_(inputObject, vnumPregunta, vrespuesta);          
        }
    });
}

function store_(inputObject, vnumPregunta, vrespuesta)
{
    if( validar_pregunta(inputObject, vnumPregunta, vrespuesta) ) {       
        $.ajax({
            type: 'POST',
            url: vuri + '/mis-tramites-hospital/examen/store',
            dataType: "JSON",
            data: $('#frmquestion').serialize(), 
            success: function(vresponse, vtextStatus, vjqXHR) {

            	if(vresponse.codigo==1)
            	{
            		swal({
    	              title: "Exito!",
    	              text: vresponse.mensaje,
    	              icon:  "success",
    	              timer: 2000,                        
    	              buttons: {               
    	                        confirm: {                 
    	                            visible: false
    	                        }
    	                    }
    	            }); 	            	            	
    	            calificacion();            
            	}
                           
            },
            error: function(vjqXHR, vtextStatus, verrorThrown){ 

            }
        });
    }   
}

function calificacion()
{
    $.ajax({
        type: 'GET',
        url: vuri + '/mis-tramites-hospital/examen/resultados',
        dataType: "JSON",
        success: function(vresponse, vtextStatus, vjqXHR) {
            var vrespuesta=vresponse;           
            var vhtml = '';

            if  (     
                    vrespuesta.datos_constancia.id_status_requerimiento  ==1 && 
                    vrespuesta.datos_constancia.id_status_video          ==1 && 
                    vrespuesta.datos_constancia.id_status_examen         ==1
                )
                    $('#btn-enviar-tramite').show();
            else
                    $('#btn-enviar-tramite').hide();


            if(vrespuesta.datos_constancia.id_status_examen==1){
                $('#btn-new-evaluacion').hide();
                $('#iconExamen').removeClass("fa-question-circle text-danger");
                $('#iconExamen').addClass("fas fa-check-circle fa-lg text-success");
            }
            else
                $('#iconExamen').addClass("fas fa-question-circle fa-lg text-danger");


            if(vrespuesta.total > 0)
            {
                $('#dvExamenPreguntas').hide();
                $('#dvCalificacionExamen').show();
            }
            else
            {
                $('#dvExamenPreguntas').show();
                $('#dvCalificacionExamen').hide();
            }

            if(vrespuesta.porcentaje>=80)			
				vhtml+='<h1 class="text-success text-center"><span class="fa fa-check-circle fa-3x"></span><br>Felicidades usted ha aprobado el examen</h1>';			
			else
				vhtml+='<h1 class="text-danger text-center"><span class="fa fa-times-circle fa-3x"></span><br>Lo sentimos pero usted no ha aprobado el examen</h1>';

			vhtml+='<table class="table m-b-0">				';
			vhtml+='	<tbody>';
			vhtml+='		<tr>';
			vhtml+='			<td><h5>Preguntas contestadas correctamente</h5></td>';
			vhtml+='			<td><h5>'+ vrespuesta.correctas +'</h5></td>';
			vhtml+='		</tr>';
			vhtml+='		<tr>';
			vhtml+='			<td><h5>Preguntas contestadas incorrectamente</h5></td>';
			vhtml+='			<td><h5>'+ vrespuesta.incorrectas +'</h5></td>';
			vhtml+='		</tr>';
			vhtml+='		<tr>';
			vhtml+='			<td><h5>Total de preguntas del examen</h5></td>';
			vhtml+='			<td><h5>'+ vrespuesta.total +'</h5></td>';
			vhtml+='		</tr>';
			vhtml+='		<tr style="background-color: #CBCDCE;">';
			vhtml+='			<td><h5>Porcentaje obtenido del examen</h5></td>';
			vhtml+='			<td><h5>'+ vrespuesta.porcentaje +' %</h5></td>';
			vhtml+='		</tr>';
			vhtml+='	</tbody>';
			vhtml+='</table>';

			vhtml+='<div class="alert alert-warning">';
			vhtml+='	<b><i class="fa fa-info-circle fa-lg m-r-5 pull-left m-t-2"></i> Para dar por aprobado un examen es necesario que usted obtenga un porcentaje de 80% o mayor, de las preguntas que se plantean en el examen.</b>';
			vhtml+='</div>';
					

			$('#dvDetalleCalificacion').html(vhtml); 
                      
        },
        error: function(vjqXHR, vtextStatus, verrorThrown){ }
    });  
}

function validar_pregunta(inputObject, vnumPregunta, vrespuesta)
{
    var chkBoxes = document.getElementsByName('cbxbtn_' + vnumPregunta + '[]');
    var vstatusPregunta = false;

    for (var i = 0; i < chkBoxes.length; i++) {
        if (chkBoxes[i].checked ) {
            //console.log(chkBoxes[i].value);
            vstatusPregunta=true;            
        }
    }

    if( vstatusPregunta ) {
        $('#wizardExamen').steps('next');
    }
    else {
        swal( '¡ Advertencia !', 'Aun no has contestado la pregunta ', 'warning' );
    }
    return vstatusPregunta;
}

function nuevo_examen()
{ 
    swal({
        title: "¡ Advertencia !",
        text: "¿ Esta seguro de volver a presentar la evalución ?",
        icon: "warning",
        buttons: {
            cancel: {
                text: 'Cancelar',
                value: false,
                visible: true,
                className: 'btn btn-default',
                closeModal: true,
            },
            confirm: {
                text: 'Confirmar',
                value: true,
                visible: true,
                className: 'btn btn-primary',
                closeModal: true
            }
        }
    }).then((result) => {
        if (result) {
            store_nuevo_examen();          
        }
    });
}

function store_nuevo_examen()
{  
    $.ajax({
            type: 'POST',
            url: vuri + '/mis-tramites-hospital/examen/nuevo',
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }, 
            success: function(vresponse, vtextStatus, vjqXHR) {

                if(vresponse.code==201)
                {
                    swal({
                      title: "Exito!",
                      text: vresponse.msg,
                      icon:  "success",
                      timer: 2000,                        
                      buttons: {               
                                confirm: {                 
                                    visible: false
                                }
                            }
                    });

                    setTimeout(function() { 
                        if(vresponse.route_redirect!=""){ window.location = vresponse.route_redirect; }
                    }, 2000);
                }
                           
            },
            error: function(vjqXHR, vtextStatus, verrorThrown){ 

            }
        });
}
