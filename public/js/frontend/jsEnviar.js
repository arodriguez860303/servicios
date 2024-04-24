function enviar_tramite(idFormulario) {
    swal({
        title: "¡ Advertencia !",
        text: "¿ Realmente deseas enviar este tramite ?",
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
            send_tramite(idFormulario);          
        }
    });
}

function send_tramite(idFormulario)
{
    var vformularioFile=document.getElementById(idFormulario);
    var vformData = new FormData(vformularioFile);
   
    $.ajax({
        type: 'POST',
        url: vuri + '/mis-tramites',
        data: vformData,
        processData: false,
        contentType: false,
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        beforeSend: function() {
            $(".btn-enviar").prop('disabled', true);
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
                        $(".btn-enviar").prop('disabled', false);
               
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
            $(".btn-enviar").prop('disabled', false);
        }
    });
  
}

function cancelar_tramite(idFormulario) {
    swal({
        title: "¡ Advertencia !",
        text: "¿ Realmente deseas cancelar este tramite ? Esta acción no se podra revertir",
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
            cancela_tramite(idFormulario);          
        }
    });
}

function cancela_tramite()
{ 
    $.ajax({
        type: 'POST',
        url: vuri + '/mis-tramites/cancelar',        
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        beforeSend: function() {
            $(".btn-cancelar").prop('disabled', true);
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
                        $(".btn-cancelar").prop('disabled', false);
               
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
            $(".btn-cancelar").prop('disabled', false);
        }
    });
}

