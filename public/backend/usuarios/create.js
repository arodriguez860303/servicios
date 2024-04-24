$(document).ready(function(){ 
    $("._usuarios").addClass("active");
    getRoles();

    $('#btn-guardar').attr('onclick', 'confirmarStore()');
});


function getRoles(selectOpt=0)
 {
    $.ajax({
        type: "GET",
        url: vuri + '/tipo/roles',
        data: {
            method: 'get'
        },
        success: function(response) {
            var html ='';
                html+='<option value="">--- Seleccionar rol ---</option>';
            for ( var i=0; i<response.respuesta.length; i++ ) {
                html+='<option value='+response.respuesta[i].id+'>'+response.respuesta[i].description+'</option>';
            }
            $('#id_rol').html(html);
            if (selectOpt != 0 ) $('#id_rol').val(selectOpt).trigger('change');
        },
        error: function(json) { }
    });
 }

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
     * 23 de Agosto de 2023
     * */

    var vformularioFile=document.getElementById("frmUsuario");
    var vformData = new FormData(vformularioFile); 

    if ( validaForm('frmUsuario') ) {  
        $.ajax({
            type: 'POST',
            url: vuri + '/usuarios',
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

                    setTimeout(function() { 
                        if(vresponse.url!=""){ window.location = vresponse.url; }
                    }, 1500);
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
 }