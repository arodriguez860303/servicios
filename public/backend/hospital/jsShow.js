var globalStatus;

$(document).ready(function()
 { 
    globalStatus = $('#id_status_gral_tramite').val();

    if(globalStatus == 2)
        $("._procesoH").addClass("active");
    else if(globalStatus == 8)
        $("._observadoH").addClass("active");
    else if(globalStatus == 5 || globalStatus == 9)
        $("._solventadoH").addClass("active");
    else if(globalStatus == 10)
        $("._aceptadoH").addClass("active");
    else if(globalStatus == 3)
        $("._concluidoH").addClass("active");
    else if(globalStatus == 7)
        $("._canceladoH").addClass("active");

    loadDatosSolicitante(); 
    datos_generales();

    if(globalStatus == 5 || globalStatus == 9 || globalStatus == 3 || globalStatus == 10 || globalStatus == 7)
    {
        $('#lnkSolventacion').show();        
    }

    if(globalStatus == 3)
    {
        $('.imprimir-constancia').html('<i class="fa fa-print t-plus-1 fa-fw fa-lg"></i> Imprimir constancia');
    }
 });

function datos_generales()
 {    
    $.ajax({
        type: 'GET',
        url: vuri + '/tramites-hospital/generales-tramite',
        dataType: "JSON",
        data: {
            method: 'show',
            id_tramite: $('#id_tramite').val()
        },
        success: function(vresponse, vtextStatus, vjqXHR) {
            var vrespuesta=vresponse.respuesta;
            var observados = vresponse.total_observados;

            $('#txtRazonSocial').html(vrespuesta.razon_social_o_nombre); 
            $('#txtHospital').html(vrespuesta.hospital);
            $('#txtCurp').html(vrespuesta.curp);   

            //Si el tramite esta en proceso
            if(globalStatus == 10)
            {
                $('#btn-autorizar-tramite').show();
            }

            if(observados > 0)
            {
                $('#lnkObservacion').show();
                if(globalStatus != 8 && globalStatus != 5 && globalStatus != 10 && globalStatus != 3 && globalStatus != 7){
                   $('#btn-observar-tramite').show();
                }
            }  
        },
        error: function(vjqXHR, vtextStatus, verrorThrown){ }
    });  
 }

function loadDatosSolicitante()
 {
    /**
     * 11 de Agosto de 2023
     * Cargar los datos de un solicitante
     * */
    
    $.ajax({
        type: 'GET',
        url: vuri + '/tramites-hospital/datos-solicitante',
        dataType: "JSON",
        data: {
            method: 'show',
            id_tramite: $('#id_tramite').val()
        },
        success: function(vresponse, vtextStatus, vjqXHR) {
            var vrespuesta=vresponse.respuesta;     

            if ( parseInt(vresponse.codigo) == 1 ) {
                $('#spSolicitante').html(vrespuesta.razon_social_o_nombre);
                $('#spFolio').html(vrespuesta.folio);
                $('#spStatus').html('<span class="fs-xs fw-semibold d-inline-block py-1 px-3 rounded-pill bg-' + vrespuesta.status_color + '-light text-' + vrespuesta.status_color + '">'+ vrespuesta.status +'</span>');
                $('#spCurp').html(vrespuesta.curp);
                $('#spHospitalHead').html(vrespuesta.hospital);
                
            }
        },
        error: function(vjqXHR, vtextStatus, verrorThrown){ }
    });   
 }

function datos_documentos()
 {
    $.ajax({
        type: 'GET',
        url: vuri + '/tramites-hospital/datos-documentacion',
        dataType: "JSON",
        data: {
            method: 'get',
            id_tramite: $('#id_tramite').val()
        },
        success: function(vresponse, vtextStatus, vjqXHR) {
            var vrespuesta=vresponse.respuesta;
            var vhtml='';
            var i=0;
            var observados = 0;
            if ( parseInt(vresponse.codigo) == 1 ) {
                var total = vrespuesta.length;

                vhtml+='<table class="table table-hover table-vcenter">';
                vhtml+='    <thead>';
                vhtml+='      <tr>';
                vhtml+='        <th class="text-center" style="width: 50px;">#</th>';
                vhtml+='        <th>Documento</th>';
                vhtml+='        <th class="d-none d-sm-table-cell" style="width: 10%;">Status</th>';
                vhtml+='        <th class="d-none d-sm-table-cell" style="width: 10%;">Tipo</th>';
                vhtml+='        <th class="text-center" style="width: 100px;">Actions</th>';
                vhtml+='      </tr>';
                vhtml+='    </thead>';
                vhtml+='    <tbody>';
                for ( vi=0; vi < vrespuesta.length; vi++ ) {

                    var cssText="";

                    if(vrespuesta[vi].id_status == 8)
                    {
                        observados++;
                        cssText="warning";
                    }
                    else if(vrespuesta[vi].id_status == 10)
                    {
                        cssText="success";
                    }

                    let download = vuri + "/tramites-hospital/documentacion/" + vrespuesta[vi].id_documento_tramite + "/descargar";

                    vhtml+='      <tr>';
                    vhtml+='        <th class="text-center" scope="row">' + (vi + 1) + '</th>';
                    vhtml+='        <td class="fw-semibold fs-sm"><span class="text-'+ cssText +'">'+ vrespuesta[vi].nombre_documento + '</span></td>';
                    vhtml+='        <td class="d-none d-sm-table-cell">';
                    vhtml+='          <span class="fs-xs fw-semibold d-inline-block py-1 px-3 rounded-pill bg-'+ vrespuesta[vi].status_color +'-light text-'+ vrespuesta[vi].status_color +'">'+ vrespuesta[vi].status +'</span>';
                    vhtml+='        </td>';
                    vhtml+='        <td class="d-none d-sm-table-cell">'+ vrespuesta[vi].extension + '</td>';
                    vhtml+='        <td class="text-center">';
                    vhtml+='          <div class="btn-group">';
                    vhtml+='            <a href="'+ download +'" target="_blank" class="btn btn-sm btn-alt-secondary" data-bs-toggle="tooltip" title="Descargar">';
                    vhtml+='              <i class="fa fa-fw fa-download"></i>';
                    vhtml+='            </a>';
                    if(vrespuesta[vi].id_status == 2){                    
                    vhtml+='            <a onclick="mdl_observacion(' + vrespuesta[vi].id_c_documento + ', \'' + vrespuesta[vi].nombre_documento + '\',' + vrespuesta[vi].id_documento_tramite + ')"" class="btn btn-sm btn-alt-secondary" data-bs-toggle="tooltip" title="Observar documento">';
                    vhtml+='              <i class="fa fa-fw fa-magnifying-glass-plus"></i>';
                    vhtml+='            </a>';
                    vhtml+='            <a onclick="aceptarDocumento(' + vrespuesta[vi].id_documento_tramite + ')" class="btn btn-sm btn-alt-secondary" data-bs-toggle="tooltip" title="Aceptar documento">';
                    vhtml+='              <i class="fa fa-fw fa-check-circle"></i>';
                    vhtml+='            </a>';
                    }
                    vhtml+='          </div>';
                    vhtml+='        </td>';
                    vhtml+='      </tr>  ';
                }
                vhtml+='    </tbody>';
                vhtml+='</table>';

                $('#dvDocumentacion').html(vhtml);  
            }                 
        },
        error: function(vjqXHR, vtextStatus, verrorThrown){ }
    });
 }

function datos_evaluacion()
 {
     $.ajax({
        type: 'GET',
        url: vuri + '/tramites-hospital/resultados-evaluacion',
        dataType: "JSON",
        data: {
            method: 'show',
            id_tramite: $('#id_tramite').val()
        },
        success: function(vresponse, vtextStatus, vjqXHR) {
            var vrespuesta=vresponse;           
            var vhtml = '';     

            if(vrespuesta.porcentaje>=80)           
                vhtml+='<h2 class="text-success text-center"><span class="fa fa-check-circle fa-2x"></span><br>El solicitante aprobo el examen</h2>';           
            else
                vhtml+='<h2 class="text-danger text-center"><span class="fa fa-times-circle fa-2x"></span><br>El solicitante no pudo aprobar el examen</h2>';

            vhtml+='<table class="table m-b-0">             ';
            vhtml+='    <tbody>';
            vhtml+='        <tr>';
            vhtml+='            <td>Preguntas contestadas correctamente</td>';
            vhtml+='            <td>'+ vrespuesta.correctas +'</td>';
            vhtml+='        </tr>';
            vhtml+='        <tr>';
            vhtml+='            <td>Preguntas contestadas incorrectamente</td>';
            vhtml+='            <td>'+ vrespuesta.incorrectas +'</td>';
            vhtml+='        </tr>';
            vhtml+='        <tr>';
            vhtml+='            <td>Total de preguntas del examen</td>';
            vhtml+='            <td>'+ vrespuesta.total +'</td>';
            vhtml+='        </tr>';
            vhtml+='        <tr class="bg-primary-dark-op">';
            vhtml+='            <td><h5 class="text-white">Porcentaje obtenido del examen</h5></td>';
            vhtml+='            <td><h5 class="text-white">'+ vrespuesta.porcentaje +' %</h5></td>';
            vhtml+='        </tr>';
            vhtml+='    </tbody>';
            vhtml+='</table>';

            vhtml+='<div class="alert alert-warning">';
            vhtml+='    <b><i class="fa fa-info-circle fa-lg m-r-5 pull-left m-t-2"></i> Para dar por aprobado un examen es necesario que usted obtenga un porcentaje de 80% o mayor, de las preguntas que se plantean en el examen.</b>';
            vhtml+='</div>';
                    

            $('#dvDetalleCalificacion').html(vhtml);            
        },
        error: function(vjqXHR, vtextStatus, verrorThrown){ }
    });
 }

function mdl_observacion(id_c_documento, txt_documento, id_documento_tramite) 
 {
    $("#id_c_documento").val(id_c_documento);
    $("#id_documento_tramite").val(id_documento_tramite);
    $("#mdl_lbl_documento").html(txt_documento);
    var myModal = new bootstrap.Modal(document.getElementById('mdlObservacion'));
    myModal.show();
 }

function agregarObservacion()
 {
   Swal.fire({
        title: "Esta seguro de agregar la observacion?",
        text: "Esta acción no se podra revertir!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "Si, estoy seguro!",
        cancelButtonText: "No, estoy seguro!",
        reverseButtons: true
    }).then(function(result) {
        if (result.value) {
            store_observacion();
        }
        else if (result.dismiss === "cancel") {
            Swal.fire("Cancelado", "El usuario cancelo la acción.", "error")
        }
    });  
 }

function store_observacion()
 {
    var vformularioFile=document.getElementById("frmObservacion");
    var vformData = new FormData(vformularioFile);

    if ( validaForm('frmObservacion') ) {
        $.ajax({
            type: "POST",
            url: vuri + '/tramites-hospital/documentacion/observar',
            data: vformData,
            processData: false,
            contentType: false,
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            beforeSend: function() {
                $(".btn-guardar-observacion").prop('disabled', true);
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
                        limpiaModal();
                        datos_generales();
                        datos_documentos();
                        load_observaciones();
                    } 
                    else
                    {
                        if ( vresponse.codigo == 0 )
                            $(".btn-guardar-observacion").prop('disabled', false);

                        Swal.fire({
                            icon: vresponse.icono,
                            title: 'Observacion',                
                            text: vresponse.mensaje,
                            showConfirmButton: false,
                            timer: 2800
                        });
                    }   
            },
            error: function(vjqXHR, vtextStatus, verrorThrown) { 
                $(".btn-guardar-observacion").prop('disabled', false);
            }
        });
    }
 }

 function limpiaModal()
 {
    $('#txtObservacion').val('');
    $('#id_c_documento').val(0);
    $('#id_documento_tramite').val(0);
    
    $('#mdlObservacion').modal('hide');  
 }

function load_observaciones()
 {    
    $.ajax({
        type: 'GET',
        url: vuri + '/tramites-hospital/get-observaciones',
        dataType: "JSON",
        data: {
            method: 'get',
            id_tramite: $('#id_tramite').val()
        },
        success: function(vresponse, vtextStatus, vjqXHR) {
            var vrespuesta=vresponse.respuesta;
            var vhtml='';
            var i=0;
            if ( parseInt(vresponse.codigo) == 1 ) {              
                vhtml+='<table class="table table-hover table-vcenter">';
                vhtml+='    <thead>';
                vhtml+='      <tr>';
                vhtml+='        <th class="text-center" style="width: 50px;">#</th>';
                vhtml+='        <th style="width: 40%;">Documento</th>';
                vhtml+='        <th class="d-none d-sm-table-cell" style="width: 40%;">Observacion</th>';
                vhtml+='        <th class="d-none d-sm-table-cell">Fecha observacion</th>';
                vhtml+='      </tr>';
                vhtml+='    </thead>';
                vhtml+='    <tbody>';
                for ( vi=0; vi < vrespuesta.length; vi++ ) {  
                    var documento = vrespuesta[vi].documento.substring(0, vrespuesta[vi].documento.length - 1);
                    vhtml+='      <tr>';
                    vhtml+='        <th class="text-center" scope="row">' + (vi + 1) + '</th>';
                    vhtml+='        <td class="fw-semibold fs-sm">'+ documento + '</td>';                
                    vhtml+='        <td class="d-none d-sm-table-cell">'+ vrespuesta[vi].observacion + '</td>';                    
                    vhtml+='        <td class="d-none d-sm-table-cell">'+ vrespuesta[vi].fecha + '</td>';                    
                    vhtml+='      </tr>  ';
                }
                vhtml+='    </tbody>';
                vhtml+='</table>'; 

                $('#dvTblObservacion').html(vhtml);
            }                 
        },
        error: function(vjqXHR, vtextStatus, verrorThrown){ }
    }); 
 }

function aceptarDocumento(id_documento_tramite)
 {  
   Swal.fire({
        title: "Esta seguro de aceptar el documento ?",
        text: "Esta acción no se podra revertir!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "Si, estoy seguro!",
        cancelButtonText: "No, estoy seguro!",
        reverseButtons: true
    }).then(function(result) {
        if (result.value) {
            documento_valido(id_documento_tramite);
        }
        else if (result.dismiss === "cancel") {
            Swal.fire("Cancelado", "El usuario cancelo la acción.", "error")
        }
    }); 
 }

function documento_valido(id_documento_tramite)
 {
    $.ajax({
        type: 'POST',
        url: vuri + '/tramites-hospital/documentacion/aceptar',
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        data: {
            id_documento_tramite: id_documento_tramite
        },
        dataType: "JSON",
        success: function(vresponse, vtextStatus, vjqXHR) {          

            if( vresponse.codigo == 1 )
                {
                    Swal.fire({
                            icon: vresponse.icono,
                            title: 'Notificación',                
                            text: vresponse.mensaje,
                            showConfirmButton: false,
                            timer: 2800
                        }); 
                    
                    if(vresponse.status_tramite == 10)
                        $('#btn-autorizar-tramite').show();

                    datos_documentos(); 
                }
                else
                {                   
                    Swal.fire({
                        icon: vresponse.icono,
                        title: 'Notificación',                
                        text: vresponse.mensaje,
                        showConfirmButton: false,
                        timer: 2800
                    });
                }          
        },
        error: function(vjqXHR, vtextStatus, verrorThrown){
            var jsonString= vjqXHR.responseJSON;
        }
    }); 
 }

function confirmarEnvioObs()
 {  
   Swal.fire({
        title: "Esta seguro de enviar las observaciones ?",
        text: "Esta acción no se podra revertir!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "Si, estoy seguro!",
        cancelButtonText: "No, estoy seguro!",
        reverseButtons: true
    }).then(function(result) {
        if (result.value) {
            send_observaciones();
        }
        else if (result.dismiss === "cancel") {
            Swal.fire("Cancelado", "El usuario cancelo la acción.", "error")
        }
    });
 }

function send_observaciones()
 {
    $.ajax({
        type: 'POST',
        url: vuri + '/tramites-hospital/'+ $('#id_tramite').val() +'/send-observaciones',      
        processData: false,
        contentType: false,
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        beforeSend: function() {
            $(".btn-observar-tramite").prop('disabled', true);
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
        },
        error: function(vjqXHR, vtextStatus, verrorThrown) { 
            $(".btn-observar-tramite").prop('disabled', false);
        }
    });
 }

function loadSolventaciones()
 {
    $.ajax({
        type: 'GET',
        url: vuri + '/tramites-hospital/load-solventaciones',
        dataType: "JSON",
        data: {
            method: 'get',
            id_tramite: $('#id_tramite').val()
        },
        success: function(vresponse, vtextStatus, vjqXHR) {
            var vrespuesta=vresponse.respuesta;
            var vhtml='';
            var i=0;
            var aceptados=0;
            if ( parseInt(vresponse.codigo) == 1 ) {
              
                vhtml+='<table class="table table-hover table-vcenter">';
                vhtml+='    <thead>';
                vhtml+='      <tr>';
                vhtml+='        <th class="text-center" style="width: 50px;">#</th>';
                vhtml+='        <th style="width: 75%;">Documento observado</th>';
                vhtml+='        <th style="width: 10%;" class="text-center">Archivo</th>';
                vhtml+='        <th class="d-none d-sm-table-cell text-center">Acción</th>';
                vhtml+='      </tr>';
                vhtml+='    </thead>';
                vhtml+='    <tbody>';
                for ( vi=0; vi < vrespuesta.length; vi++ ) {  
                    var documento = vrespuesta[vi].documento.substring(0, vrespuesta[vi].documento.length - 1);
                    let download = vuri + "/tramites-hospital/documentacion/" + vrespuesta[vi].id_documento_tramite + "/descargar";

                    vhtml+='      <tr>';
                    vhtml+='        <th class="text-center" scope="row">' + (vi + 1) + '</th>';
                    vhtml+='        <td class="fw-semibold fs-sm">'+ documento + '</td>';                
                    vhtml+='        <td class="fw-semibold fs-sm text-center">';
                    vhtml+='            <a href="'+ download +'" target="_blank" class="btn btn-sm btn-alt-secondary" data-bs-toggle="tooltip" title="Descargar">';
                    vhtml+='              <i class="fa fa-fw fa-download"></i>';
                    vhtml+='            </a>';
                    vhtml+='        </td>';                
                    vhtml+='        <td class="d-none d-sm-table-cell text-center">';
                    if(vrespuesta[vi].aceptado == 0)
                    {
                    vhtml+='          <div class="btn-group">';                   
                    vhtml+='            <a onclick="aceptarSolventacion(' + vrespuesta[vi].id_observacion + ')" class="btn btn-sm btn-alt-success" data-bs-toggle="tooltip" title="Aceptar solventacion">';
                    vhtml+='              <i class="fa fa-check-circle fa-lg"></i>';
                    vhtml+='            </a>';
                    vhtml+='            <a onclick="negarSolventacion(' + vrespuesta[vi].id_observacion + ')" class="btn btn-sm btn-alt-danger" data-bs-toggle="tooltip" title="Negar documento">';
                    vhtml+='              <i class="fa fa-times-circle fa-lg"></i>';
                    vhtml+='            </a>';
                    vhtml+='          </div>';
                    }
                    else if(vrespuesta[vi].aceptado == 10){
                        vhtml+='<i class="fa fa-check-circle fa-lg text-success"></i> Aceptado';
                        aceptados++;
                    }
                    else if(vrespuesta[vi].aceptado == 4)
                        vhtml+='<i class="fa fa-times-circle fa-lg text-danger"></i> Rechazado';
                    vhtml+='        </td>';                    
                    vhtml+='      </tr>  ';
                }
                vhtml+='    </tbody>';
                vhtml+='</table>'; 

                if(aceptados == vrespuesta.length){
                    if(globalStatus != 3 && globalStatus != 7)
                        $('#btn-autorizar-tramite').show();
                }

                $('#dvTblSolventacion').html(vhtml);
            }                 
        },
        error: function(vjqXHR, vtextStatus, verrorThrown){ }
    }); 
 }

function aceptarSolventacion(id_observacion)
 {  
   Swal.fire({
        title: "¿ Esta seguro de aceptar esta solventacion ?",
        text: "Esta acción no se podra revertir!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "Si, estoy seguro!",
        cancelButtonText: "No, estoy seguro!",
        reverseButtons: true
    }).then(function(result) {
        if (result.value) {
            solventacion_valida(id_observacion);
        }
        else if (result.dismiss === "cancel") {
            Swal.fire("Cancelado", "El usuario cancelo la acción.", "error")
        }
    }); 
 }

function solventacion_valida(id_observacion)
 {
    $.ajax({
        type: 'POST',
        url: vuri + '/tramites-hospital/solventaciones/aceptar',
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        data: {
            id_observacion: id_observacion
        },
        dataType: "JSON",
        success: function(vresponse, vtextStatus, vjqXHR) {          

            if( vresponse.codigo == 1 )
                {
                    Swal.fire({
                            icon: vresponse.icono,
                            title: 'Notificación',                
                            text: vresponse.mensaje,
                            showConfirmButton: false,
                            timer: 2800
                        }); 

                    loadSolventaciones();
                    //datos_documentos(); 
                }
                else
                {                   
                    Swal.fire({
                        icon: vresponse.icono,
                        title: 'Notificación',                
                        text: vresponse.mensaje,
                        showConfirmButton: false,
                        timer: 2800
                    });
                }          
        },
        error: function(vjqXHR, vtextStatus, verrorThrown){
            var jsonString= vjqXHR.responseJSON;
        }
    }); 
 }

function negarSolventacion(id_observacion)
 {  
   Swal.fire({
        title: "¿ Esta seguro de negar esta solventacion ?",
        text: "Esta acción no se podra revertir!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "Si, estoy seguro!",
        cancelButtonText: "No, estoy seguro!",
        reverseButtons: true
    }).then(function(result) {
        if (result.value) {
            solventacion_negada(id_observacion);
        }
        else if (result.dismiss === "cancel") {
            Swal.fire("Cancelado", "El usuario cancelo la acción.", "error")
        }
    }); 
 }

function solventacion_negada(id_observacion)
 {
    $.ajax({
        type: 'POST',
        url: vuri + '/tramites-hospital/solventaciones/negar',
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        data: {
            id_observacion: id_observacion
        },
        dataType: "JSON",
        success: function(vresponse, vtextStatus, vjqXHR) {          

            if( vresponse.codigo == 1 )
                {
                    Swal.fire({
                            icon: vresponse.icono,
                            title: 'Notificación',                
                            text: vresponse.mensaje,
                            showConfirmButton: false,
                            timer: 2800
                        }); 

                    loadSolventaciones();
                    //datos_documentos(); 
                }
                else
                {                   
                    Swal.fire({
                        icon: vresponse.icono,
                        title: 'Notificación',                
                        text: vresponse.mensaje,
                        showConfirmButton: false,
                        timer: 2800
                    });
                }          
        },
        error: function(vjqXHR, vtextStatus, verrorThrown){
            var jsonString= vjqXHR.responseJSON;
        }
    }); 
 }

function confirmarConclusion()
 {
   Swal.fire({
        title: "¿ Esta seguro de autorizar este trámite ?",
        text: "Esta acción no se podra revertir!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "Si, estoy seguro!",
        cancelButtonText: "No, estoy seguro!",
        reverseButtons: true
    }).then(function(result) {
        if (result.value) {
            concluir();
        }
        else if (result.dismiss === "cancel") {
            Swal.fire("Cancelado", "El usuario cancelo la acción.", "error")
        }
    });  
 }

function concluir()
 {
    $.ajax({
        type: 'POST',
        url: vuri + '/tramites-hospital/autorizar', 
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        data: {
            id_tramite: $('#id_tramite').val()
        },
        dataType: "JSON",
        beforeSend: function() {
            $(".btn-autorizar-tramite").prop('disabled', true);
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
            $(".btn-autorizar-tramite").prop('disabled', false);
        }
    });
 }

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
        url: vuri + '/tramites-hospital/cancelar', 
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