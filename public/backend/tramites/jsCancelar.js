function comfirmCancelarTramite()
{  
   Swal.fire({
        title: "¿ Esta seguro de cancelar este trámite ?",
        text: "Esta acción no se podra revertir!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "Si, estoy seguro!",
        cancelButtonText: "No, estoy seguro!",
        reverseButtons: true
    }).then(function(result) {
        if (result.value) {
            cancelar_tramite();
        }
        else if (result.dismiss === "cancel") {
            Swal.fire("Cancelado", "El usuario cancelo la acción.", "error")
        }
    }); 
}

function cancelar_tramite()
{
    $.ajax({
        type: 'POST',
        url: vuri + '/tramites/cancelar', 
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        data: {
            id_tramite: $('#id_tramite').val()
        },
        dataType: "JSON",
        beforeSend: function() {
            $(".btn-cancelar-tramite").prop('disabled', true);
        },
        success: function(vresponse, vtextStatus, vjqXHR) {
          
            if( vresponse.codigo == 1 )
            {
                Swal.fire({
                    icon: vresponse.icono,
                    title: 'Notificación',                
                    text: vresponse.mensaje,
                    showConfirmButton: false,
                    timer: 1500
                });           

                setTimeout(function() { 
                    if(vresponse.url!=""){ window.location = vresponse.url; }
                }, 1500);
            }
            else
            {
                Swal.fire({
                    icon: vresponse.icono,
                    title: 'Notificación',                
                    text: vresponse.mensaje,
                    showConfirmButton: false,
                    timer: 1500
                });                 
            }          
        },
        error: function(vjqXHR, vtextStatus, verrorThrown) { 
            $(".btn-cancelar-tramite").prop('disabled', false);
        }
    });
}