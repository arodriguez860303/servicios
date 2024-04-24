function cargar_documentos(){
    $.ajax({
        type: 'GET',
        url: vuri + "/documentacion-hospital/tramite",
        dataType: "JSON",
        success: function(vresponse, vtextStatus, vjqXHR) {
            var vrespuesta=vresponse.respuesta;

            var vhtml='';
            var  j =  0;

            var total_cargados=0;

            if(vrespuesta.length > 0)
            {
                vhtml+= '<table class="table table-hover">'; 
                $.each(vrespuesta, function (i, valor) {  
                    var id_st = 0; var texAlert = '';
                    id_st = valor.id_status;

                    if(id_st == 2)
                        texAlert = 'text-success';

                    j++;
                    vhtml+= '<tr>';
                    vhtml+= '   <td>'+ j +'</td>';
                    vhtml+= '   <td class="'+ texAlert +'">'+ valor.documento +'</td>';
                    vhtml+= '   <td width="20%" class="text-right">';

                    if(valor.id_tramite_documento!=null){
                        total_cargados++;                                              
                        vhtml+= ' <a href="#" onclick="eliminar_adjunto('+ valor.id_tramite_documento +')" class="text-danger"><i class="fa fa-trash fa-lg"></i></a>';
                    } else {                                               
                        vhtml+= ' <a href="#" onclick="mdl_documento('+ valor.id +', \''+ valor.documento +'\')">'+ '<i class="fa fa-upload fa-lg"></i></a>';
                    }
                    vhtml+= '   </td>';
                    vhtml+= '</tr>';
                });  
                vhtml+= '</table>';
            } 
            if(total_cargados == 3)
            {
                $('#iconDocumentos').removeClass("fa-question-circle text-danger");
                $('#iconDocumentos').addClass("fas fa-check-circle fa-lg text-success");
            }
            else
                $('#iconDocumentos').addClass("fas fa-question-circle fa-lg text-danger");

            $("#doctos").html(vhtml);
        },
        error: function(vjqXHR, vtextStatus, verrorThrown){ }
    });      
}

function mdl_documento(id_documento, txt_documento) {
    $("#id_documento").val(id_documento);
    $("#mdl_lbl_documento").html(txt_documento);
    $("#mdl_documento").modal();
}

function upload_file(form_name) {
    swal({
        title: "¡ Advertencia !",
        text: "¿ Realmente desea subir el documento ?",
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
            store_documento();           
        }
    });
}

function store_documento()
 {
    var vformularioFile=document.getElementById("frm-subir-adjunto");
    var vformData = new FormData(vformularioFile);

    $.ajax({
        type: "POST",
        url: vuri + '/mis-tramites-hospital/upload-file',
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
            clearFileInput();
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
                $("#mdl_documento").modal("toggle");              
                cargar_documentos();
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

function clearFileInput() {
    $('input[type=file]').val(null);
}

function eliminar_adjunto(id) {
    swal({
        title: '¡ Advertencia !',
        text: "Esta seguro de eliminar este documento adjunto ?",
        icon:               "warning",
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
            destroy_adjunto(id);
        }                 
    });
}

function destroy_adjunto(id)
{
    $.ajax({
        type: 'DELETE',
        url: vuri + '/documentacion-hospital/' + id +'/eliminar',
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        dataType: "JSON",        
        success: function(vresponse, vtextStatus, vjqXHR) { 
            swal({
                type: 'success',
                title: '¡ Eliminado !',
                content: {
                    element: 'p',
                    attributes: {
                        innerHTML: vresponse.respuesta,
                    },
                },
                showConfirmButton: false,
                timer: 1500
            });
            cargar_documentos();            
        },
        error: function(vjqXHR, vtextStatus, verrorThrown){ }
    });
}