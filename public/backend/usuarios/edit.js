$(document).ready(function(){ 
    $("._usuarios").addClass("active");
    getEdit();

    $('#btn-guardar').attr('onclick', 'confirmarUpdate()');
});


function getEdit()
 {
 	/**
     * 23 de Agosto de 2023
     * Cargar los datos de un usuario
     * */

    $.ajax({
        type: 'GET',
        url: vuri + '/usuarios/get-results',
        dataType: "JSON",
        data: {
            method: 'show',
            id: $('#id').val()
        },
        success: function(vresponse, vtextStatus, vjqXHR) {
            var vrespuesta=vresponse.respuesta;
            if ( parseInt(vresponse.codigo) == 1 ) {          
                $.each(vresponse.respuesta, function ( key, data ) {  
                	    
                    if ( data != null && data != '' ) {   
                        switch ( key ) { 
                        	case 'id_rol':
                                getRoles(data);
                              break;                               
                            case 'name':
                                $('#txtNombre').val(data);
                              break;
                            case 'email':
                                $('#txtCorreo').val(data);
                              break;
                            case 'nickname':
                                $('#txtNickname').val(data);
                              break;                            
                            case 'recovery_pass':
                            	$('#txtPassword').val(atob(data));                              
                              break;
                        }                                               
                    }
                });                
            }                
        },
        error: function(vjqXHR, vtextStatus, verrorThrown){ }
    });   
 }

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
     * Manda a llamar la URI para acutualizar los datos
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