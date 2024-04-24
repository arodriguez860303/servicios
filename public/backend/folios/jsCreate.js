$(document).ready(function() {

    $("._folios").addClass("active");
    
    $('#chkRango').change(function(){
        if($(this).prop('checked'))
        {                   
            $('#dvUnico').hide();    
            $('#dvRango').show();    

            $('#txtFolio').val('');
        }
        else
        {
            $('#dvUnico').show();    
            $('#dvRango').hide();                

            $('#txtRangoDe').val('');
            $('#txtRangoA').val('');
        }
    });

    $('#btn-guardar').attr('onclick', 'confirmarStore()');
});


function confirmarStore()
 {

    Swal.fire({
        title: "Esta seguro de guardar el registro?",
        text: "Esta acción no se podra revertir!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "Si, estoy seguro!",
        cancelButtonText: "No, estoy seguro!",
        reverseButtons: true
    }).then(function(result) {
        if (result.value) {
            store();
        }
        else if (result.dismiss === "cancel") {
            Swal.fire("Cancelado", "El usuario cancelo la acción.", "error")
        }
    });      
 }

function store()
 {
    /**
     * Manda a llamar la URI para registrar los datos
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