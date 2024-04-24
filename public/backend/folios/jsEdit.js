$(document).ready(function(){ 

    $("._folios").addClass("active");
    
    getEdit();  
    $('#dvCheckRango').hide();
    $('#btn-guardar').attr('onclick', 'confirmarUpdate()');
});


function getEdit()
 {
    /**
     * 11 de Agosto de 2023
     * Cargar los folios
     * */
    
    $.ajax({
        type: 'GET',
        url: vuri + '/folios/listado',
        dataType: "JSON",
        data: {
            method: 'show',
            id: $('#id').val()
        },
        success: function(vresponse, vtextStatus, vjqXHR) {
            var vrespuesta=vresponse.respuesta;    
            
            if ( parseInt(vresponse.codigo) == 1 ) {
                $('#txtFolio').val(vrespuesta.folio);
            }
        },
        error: function(vjqXHR, vtextStatus, verrorThrown){ }
    });   
 }

function confirmarUpdate()
 {

    Swal.fire({
        title: "Esta seguro de actualizar el registro?",
        text: "Esta acción no se podra revertir!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "Si, estoy seguro!",
        cancelButtonText: "No, estoy seguro!",
        reverseButtons: true
    }).then(function(result) {
        if (result.value) {
            update();
        }
        else if (result.dismiss === "cancel") {
            Swal.fire("Cancelado", "El usuario cancelo la acción.", "error")
        }
    });      
 }

function update()
 {
    /**
     * Manda a llamar la URI para actualizar los datos
     * 22 de Agosto de 2023
     * */

    var vformularioFile=document.getElementById("frmFolio");
    var vformData = new FormData(vformularioFile);   
    $.ajax({
        type: 'POST',
        url: vuri + '/folios',
        data: vformData,
        processData: false,
        contentType: false,
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        beforeSend: function() {
            $(".btn-guardar").prop('disabled', true);
        },
        success: function(vresponse, vtextStatus, vjqXHR) {
          
            if( vresponse.codigo == 1 )
            {   
                Swal.fire({
                    icon: vresponse.icono,
                    title: 'Notificacion',                
                    text: vresponse.mensaje,
                    showConfirmButton: false,
                    timer: 2800
                });

                setTimeout(
                    function () {
                        window.location = vuri + '/folios';
                    },
                    1500
                );
            } 
            else
            {
                if ( vresponse.codigo == 0 )
                    $(".btn-guardar").prop('disabled', false);

                Swal.fire({
                    icon: vresponse.icono,
                    title: 'Notificacion',                
                    text: vresponse.mensaje,
                    showConfirmButton: false,
                    timer: 2800
                });
            }               

        },
        error: function(vjqXHR, vtextStatus, verrorThrown) {          
            // Swal.fire({
            //         icon: 'warning',
            //         title: 'Notificacion',                
            //         text: vjqXHR.responseJSON.message,
            //         showConfirmButton: false,
            //         timer: 2800
            //     });
            if(vjqXHR.status === 422) {                             
                verror='';                
                verror+='<div class="alert alert-danger align-items-center justify-content-between">';
                verror+='    <div class="flex-grow-1 me-3">';                
                verror+='        <h5 class="mb-1"><strong>Atencion!</strong> Hubieron errores al intentar guardar.</h5>';
                verror+='       <ul>';       
                $.each(vjqXHR.responseJSON.errors, function (ind, elem) {                    
                    verror+='           <li>'+ elem+'</li>';
                });                                          
                verror+='       </ul>';
                verror+='    </div>';                
                verror+='</div>';

                $('.dvErrors').html(verror); 

                close_alert();                        
            }
            $(".btn-guardar").prop('disabled', false);
        }
    });  
 }