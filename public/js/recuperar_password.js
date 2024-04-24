function recuperarPass()
{
    var el = $('#frmRecuperarPass');   
    var str_errors;
    $.ajax({
        type: "GET",
        url:  vuri+'/password/recuperar',
        data: el.serialize(),        
        success: function(json) {
            messages_validation(json.data, false);
           
            $('.dvRecupera').hide();
            $('.spNota').html('Sus datos de acceso son los siguientes.');

            $('#lblNombre').html(json.data.nombre);
            $('#lblUsuario').html(json.data.usuario);
            $('#lblContrasenia').html(json.data.contrasenia);   
            $('.dvContrasenia').show();


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
            //l.ladda('stop'); 
        }
    });
}


function salir_modal()
 {
    $('.dvRecupera').hide();
    $('.spNota').html('Los datos requeridos son obligatorios porque a traves de ellos se realizara la busqueda, de no ser asi se omitira.');

    $('#txtCurp').val('');
    $('#txtCorreo').val('');
    $('#lblNombre').html('');
    $('#lblUsuario').html('');
    $('#lblContrasenia').html('');   
    $('.dvContrasenia').hide();
    $('.dvRecupera').show();

    $('#modal-alert').modal('toggle');
 }


function messages_validation(fields, show){

    if(show==true){
        $.each(fields, function(key, value) {
            $('#el-'+key).html(value);            
            $('#'+key).addClass('is-invalid');
        });
    }else{        
        $('.lbl-error').html("");
        $('.lbl-error').removeClass('is-invalid');
        $('.form-control').removeClass('is-invalid');
        
    }

}
