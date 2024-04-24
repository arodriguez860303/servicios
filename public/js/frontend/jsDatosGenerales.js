function datos_generales()
{    
    $.ajax({
        type: 'GET',
        url: vuri + '/mis-tramites/datos-generales',
        dataType: "JSON",
        success: function(vresponse, vtextStatus, vjqXHR) {
            var vrespuesta=vresponse;
            
            $('#txtRazonSocial').val(vrespuesta.datos.razon_social_o_nombre); 
            $('#txtRFC').val(vrespuesta.datos.rfc); 
            $('#txtCorreo').val(vrespuesta.datos.email); 
            $('#txtTelefono').val(vrespuesta.datos.telefono); 
            $('#txtDireccion').val(vrespuesta.datos.calle +' entre '+ vrespuesta.datos.entre_calle +' y '+ vrespuesta.datos.y_calle +' No '+ vrespuesta.datos.num_exterior +', Colonia '+ vrespuesta.datos.colonia +', CP '+ vrespuesta.datos.codigo_postal); 
            $('#txtMunicipio').val(vrespuesta.datos.municipio);             
            $('#txtCurp').val(vrespuesta.datos.curp);             
        },
        error: function(vjqXHR, vtextStatus, verrorThrown){ }
    });  
}

function datos_folio_pago()
{

    $.ajax({
        type: 'GET',
        url: vuri + '/mis-tramites/datos-folio-hacienda',
        dataType: "JSON",
        success: function(vresponse, vtextStatus, vjqXHR) {
            var vrespuesta=vresponse.respuesta;         

            if(vrespuesta != null)
            {        

                if(vrespuesta.folio_hacienda != null && vrespuesta.id_status_requerimiento==1 && vrespuesta.id_status_video==1 && vrespuesta.id_status_examen==1)
                {
                    $('#btn-enviar').show();
                    $('#btn-cancelar').hide();
                }
                else
                {
                    $('#btn-enviar').hide();
                    $('#btn-cancelar').show();
                }
                   
                if(vrespuesta.folio_hacienda != null && vrespuesta.folio_hacienda != '')
                {
                   $('#txtFolioPago').val(vrespuesta.folio_hacienda); 
                   $('#iconGeneral').removeClass("fa-question-circle text-danger");
                   $('#iconGeneral').addClass("fas fa-check-circle fa-lg text-success"); 
                   $('#tabDocumentacion').show();
                   $('#tabVideo').show();
                }

                if(vrespuesta.id_status_video==1)
                {
                    $('#iconVideo').removeClass("fa-question-circle text-danger");
                    $('#iconVideo').addClass("fas fa-check-circle fa-lg text-success");

                    $('#dvShowVideo').hide();
                    $('#dvVideoFinalizado').show();
                    $('#tabEvaluacion').show();
                    $('#btnPlayPause').hide();
                    $('#btnContinuar').hide();
                }  
                else
                    $('#iconVideo').addClass("fas fa-question-circle fa-lg text-danger"); 

                if(vrespuesta.id_status_examen==1)
                {  
                    $('#iconExamen').removeClass("fa-question-circle text-danger");
                    $('#iconExamen').addClass("fas fa-check-circle fa-lg text-success");
                    calificacion(); 
                }
                else{
                    $('#iconExamen').addClass("fas fa-question-circle fa-lg text-danger");
                    calificacion(); 
                }

            }
            else 
            {                
                $('#iconGeneral').addClass("fas fa-question-circle fa-lg text-danger");                
            }
        },
        error: function(vjqXHR, vtextStatus, verrorThrown){ }
    });  
}

function confirmarStoreFolio() {
    swal({
        title: "¡ Advertencia !",
        text: "¿ Realmente es el folio de pago ?",
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
            store_folio_pago();          
        }
    });
}

function store_folio_pago()
{
    var vformularioFile=document.getElementById("frmGenerales");
    var vformData = new FormData(vformularioFile);
  
    $.ajax({
        type: 'POST',
        url: vuri + '/mis-tramites/guardar-folio-hacienda',
        data: vformData,
        processData: false,
        contentType: false,
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        success: function(vresponse, vtextStatus, vjqXHR) {
            swal({
                type: 'success',
                title: 'Confirmación',
                content: {
                    element: 'p',
                    attributes: {
                        innerHTML: vresponse.msg,
                    },
                },
                showConfirmButton: false,
                timer: 1500
            });
            datos_folio_pago();
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