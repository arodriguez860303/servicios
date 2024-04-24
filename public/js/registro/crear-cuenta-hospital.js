var buttonpressed;

$(document).ready(function(e){   
    getHospitales();       
});

function getHospitales(selectOpt=0)
{
    $.ajax({
        type: "GET",
        url:   vuri + '/tipo/get-hospitales',
        dataType: "JSON",
        data:{
            method: 'get'                   
        },                
        success:  function (json) { 

            var string='';
            string+= '<option value=0>Seleccionar hospital...</option>';
            for(var i=0; i<json.respuesta.length; i++)
            {
                string+= '<option value='+json.respuesta[i].id+'>'+ json.respuesta[i].clave +' - '+ json.respuesta[i].nombre+'</option>';              
            }                               
            $('#id_hospital').html(string); 
            if (selectOpt != 0 ) $('#id_hospital').val(selectOpt).trigger('change');
        },
        error:function(){
        }
    });
}

function save(button){    

    swal({
      title: "Estas seguro?",
      text: "No podras revertir los cambios!",
      type: "warning",
      showCancelButton: true,     
      confirmButtonText: "Si, Estoy seguro!",
      cancelButtonText: "No, estoy seguro!",
      closeOnConfirm: false,
      closeOnCancel: false
    },
    function(isConfirm) {
      if (isConfirm) {
        $("#frm-1").submit(); 
      } else {
        swal({
            title: "Cancelado",
            text: "El registro no fue guardado",
            type: "error",
            confirmButtonClass: "btn-primary",
            confirmButtonText: "Aceptar",
        });
      }
    }); 
}

$('#frm-1').on('submit', function(e) {
    var el = $('#frm-1'); e.preventDefault();
    var str_errors;
    $.ajax({
        type: "POST",
        url:  el.attr('action'),
        data:  new FormData(this),
        processData: false,
        contentType: false,       
        success:  function(json) {
            messages_validation(json.data, false);
            if(json.route_redirect!=""){ window.location = json.route_redirect; }       
      },
      error: function(json)
      {
        var jsonString= json.responseJSON;

        if(json.status === 422) {
            messages_validation(null, false);
            str_errors= 'Hay campos pendientes o que han sido llenados con información incorrecta. Por favor verifique la información.';
            messages_validation(jsonString.errors, true);
        } 
        if(json.status === 409) {                
            str_errors= jsonString.msg;                           
        }

        swal({
            title: "¡ Advertencia !",       
            text: str_errors,                
            type: "warning",
            confirmButtonClass: "btn-primary",
            confirmButtonText: "Aceptar",
        });


    }           
    });
});

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