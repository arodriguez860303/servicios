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

                    let download = vuri + "/tramites-hospital/documentacion/" + vrespuesta[vi].id_documento_tramite + "/descargar";

                    vhtml+='      <tr>';
                    vhtml+='        <th class="text-center" scope="row">' + (vi + 1) + '</th>';
                    vhtml+='        <td class="fw-semibold fs-sm">'+ vrespuesta[vi].nombre_documento + '</td>';
                    vhtml+='        <td class="d-none d-sm-table-cell">';
                    vhtml+='          <span class="badge badge-'+ vrespuesta[vi].status_color +'">'+ vrespuesta[vi].status +'</span>';
                    vhtml+='        </td>';
                    vhtml+='        <td class="d-none d-sm-table-cell">'+ vrespuesta[vi].extension + '</td>';
                    vhtml+='        <td class="text-center">';
                    vhtml+='          <div class="btn-group">';
                    vhtml+='            <a href="'+ download +'" target="_blank" class="btn btn-sm btn-alt-secondary" data-bs-toggle="tooltip" title="Descargar">';
                    vhtml+='              <i class="fa fa-fw fa-download"></i>';
                    vhtml+='            </a>';                
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