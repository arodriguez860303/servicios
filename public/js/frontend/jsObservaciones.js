function cargar_observaciones() {	
	$.ajax({
        type: 'GET',
        url: vuri + '/mis-tramites/observaciones/results',
        dataType: "JSON",
        data: {
            method: 'get',
            id_tramite: $('#id_tramite').val()
        },
        success: function(vresponse, vtextStatus, vjqXHR) {
            var vrespuesta=vresponse.respuesta;    
            var vhtml='';
         	var solventados=0;
            if ( parseInt(vresponse.codigo) == 1 ) {
                vhtml+='<div class="table-responsive">';
                vhtml+='<table class="table table-bordered mg-b-0" width="100%" id="tblObservaciones">';
                vhtml+='    <thead>';
                vhtml+='      <tr>';
                vhtml+='        <th>#</th>';
                vhtml+='        <th>Documento</th>';
                vhtml+='        <th>Observación</th>';              
                vhtml+='        <th>Fecha</th>';              
                vhtml+='        <th>Acción</th>';              
                vhtml+='      </tr>';
                vhtml+='    </thead>';
                vhtml+='    <tbody>';
                var totalObs = vrespuesta.length;
                for ( vi=0; vi < vrespuesta.length; vi++ ) { 
                	if(vrespuesta[vi].solventado==1)
                		solventados++;

                	if(solventados==totalObs)
                		$('#btn-enviar-solv').show();


                vhtml+='        <tr>';
                vhtml+='            <td scope="row">' + (vi + 1) + '</td>';
                vhtml+='            <td>' + vrespuesta[vi].documento + '</td>';
                vhtml+='            <td>' + vrespuesta[vi].observacion + '</td>';
                vhtml+='            <td class="fs-sm">' + vrespuesta[vi].fecha + '</td>';               
                vhtml+='            <td class="fs-sm">';
                if(vrespuesta[vi].solventado==0){
                	vhtml += '              <a href="#" onclick="mdl_observacion('+ vrespuesta[vi].id +', \''+ vrespuesta[vi].documento +'\''+', \''+ vrespuesta[vi].observacion +'\''+', \''+ vrespuesta[vi].id_c_documento +'\')" class="btn ripple btn-sm">';
                	vhtml += '                  <i class="fas fa-upload fa-lg text-primary"></i>';
                	vhtml += '              </a>';
            	}
            	else
            		vhtml+='Solventado';
                vhtml+='            </td>';
                vhtml+='        </tr>';
                }
                vhtml+='    </tbody>';
                vhtml+='</table>';
                vhtml+='</div>';

                $('#table-observaciones').html(vhtml);              
            }
        },
        error: function(vjqXHR, vtextStatus, verrorThrown){ }
    });   
}

function mdl_observacion(id_observacion, txt_documento, txt_observacion, id_c_documento) {

    $("#idObservacion").val(id_observacion);
    $("#id_documento").val(id_c_documento);
    $("#mdl_lbl_documento").html(txt_documento);
    $("#textObservacion").html(txt_observacion);
    $("#mdl_solventacion").modal();
}

function upload_solventacion(form_name) {
    swal({
        title: "¡ Advertencia !",
        text: "¿ Realmente desea solventar la observacion el documento ?",
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
            store_solventacion();
        }
    });
}

function store_solventacion()
 {
    var vformularioFile=document.getElementById("frmEnviar");
    var vformData = new FormData(vformularioFile);

    $.ajax({
        type: "POST",
        url: vuri + '/mis-tramites/solventar-observacion',
        data: vformData,
        processData: false,
        contentType: false,
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        beforeSend: function() {
            $('.spinner_wait').show(); 
            $('.spinner_no_wait').hide();    
        },        
        success: function(json) {
            messages_validation(json.data, false);
            swal({
                type: 'success',
                title: 'Confirmación',
                icon: "success",
                content: {
                    element: 'p',
                    attributes: {
                        innerHTML: json.msg,
                    },
                },
                showConfirmButton: false,
                timer: 1500
            }).then(function() {
                $('.spinner_wait').hide(); 
                $('.spinner_no_wait').show();                 
                $("#mdl_solventacion").modal("toggle");

                cargar_observaciones();
                clearFileInput();
            });
        },
        error: function(json) {
            var jsonString = json.responseJSON;
            if (json.status === 422) {
                messages_validation(null, false);
                str_errors = 'Hay campos pendientes o que han sido llenados con información incorrecta. <br> Porfavor verifique la información.';
                messages_validation(jsonString.errors, true);
            }
            if (json.status === 409) {
                str_errors = jsonString.msg;
            }

            $('.spinner_wait').hide(); 
            $('.spinner_no_wait').show();

            swal({
                title: "¡ Advertencia !",
                content: {
                    element: 'p',
                    attributes: {
                        innerHTML: str_errors,
                    },
                },
                icon: "warning",
                buttons: {
                    confirm: {
                        text: 'Confirmar',
                        value: true,
                        visible: true,
                        className: 'btn btn-primary',
                        closeModal: true
                    }
                }
            });
        }
    });
 }

function clearFileInput() {
    $('input[type=file]').val(null);
}

function messages_validation(fields, show) {
    if (show == true) {
        $.each(fields, function(key, value) {
            $('#el-' + key).html(value);
            $('#' + key).addClass('is-invalid');
        });
    } else {
        $('.lbl-error').html("");
        $('.lbl-error').removeClass('is-invalid');
        $('.form-control').removeClass('is-invalid');
    }
}

function enviar_solventaciones()
{
	swal({
        title: "¡ Advertencia !",
        text: "¿ Esta seguro de enviar estas solventaciones ?",
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
            enviar();
        }
    });
}

function enviar()
{
	$.ajax({
        type: 'POST',
        url: vuri + '/mis-tramites/solventaciones/enviar',
        dataType: "JSON",
        data: {
        	id_tramite: $('#id_tramite').val()
        },
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        beforeSend: function() {
            $(".btn-enviar-solv").prop('disabled', true);
        },
        success: function(vresponse, vtextStatus, vjqXHR) {
          
            if( vresponse.codigo == 1 )
            {
                swal({
                    type: 'success',
                    title: 'Confirmación',
                    icon: vresponse.icono,
                    content: {
                        element: 'p',
                        attributes: {
                            innerHTML: vresponse.mensaje,
                        },
                    },
                    showConfirmButton: false,
                    timer: 1500
                });

                setTimeout(function() { 
                    if(vresponse.url!=""){ window.location = vresponse.url; }
                }, 1500);
            }
            else
            {
                if ( vresponse.codigo == 0 )
                        $(".btn-enviar-solv").prop('disabled', false);
               
                    swal({
                        type: 'warning',
                        title: 'Confirmación',
                        icon: vresponse.icono,
                        content: {
                            element: 'p',
                            attributes: {
                                innerHTML: vresponse.mensaje,
                            },
                        },
                        showConfirmButton: false,
                        timer: 1500
                    });
            }
        },
        error: function(vjqXHR, vtextStatus, verrorThrown) { 
            $(".btn-enviar-solv").prop('disabled', false);
        }
    });
}