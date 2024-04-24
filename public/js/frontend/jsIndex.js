
function existe_tramite()
{    
    $.ajax({
        type: 'GET',
        url: vuri + '/mis-tramites/buscar',
        dataType: "JSON",
        success: function(vresponse, vtextStatus, vjqXHR) {
            var vrespuesta=vresponse.respuesta;
            
            if(vrespuesta != null && vrespuesta != '')
            {
                $('.btn-nuevo').html('<i class="fas fa-angle-double-right"></i> Continuar trámite');                
            }            
        },
        error: function(vjqXHR, vtextStatus, verrorThrown){ }
    });  
}

function cargar_mis_tramites() {  
    $.ajax({
        type: 'GET',
        url: vuri + '/mis-tramites/expediente',
        dataType: "JSON",
        data: {
            method: 'get'
        },
        success: function(vresponse, vtextStatus, vjqXHR) {
            var vrespuesta=vresponse.respuesta;    
            var vhtml='';
            var tramiteObservado=0;
            if ( parseInt(vresponse.codigo) == 1 ) {
                vhtml+='<div class="table-responsive">';
                vhtml+='<table class="table display responsive" width="100%" id="tblTramites">';
                vhtml+='    <thead>';
                vhtml+='      <tr>';
                vhtml+='        <th class="wd-5p">#</th>';
                vhtml+='        <th class="wd-15p">Folio</th>';
                vhtml+='        <th class="wd-15p">Folio de pago</th>';
                vhtml+='        <th class="wd-20p">Status</th>';
                vhtml+='        <th class="wd-20p">Fecha inicio</th>';
                vhtml+='        <th class="wd-20p">Fecha fin</th>';              
                vhtml+='        <th class="wd-50p">Acción</th>';              
                vhtml+='      </tr>';
                vhtml+='    </thead>';
                vhtml+='    <tbody>';
                var contador=0;
                for ( vi=0; vi < vrespuesta.length; vi++ ) {                    

                   if(vrespuesta[vi].id_status==8)
                        contador++;
                    if(contador==1) $('#dvNotificaObservacion').show();    

                    var _folio = ""; var _fin = "";
                    if(vrespuesta[vi].folio != null && vrespuesta[vi].folio != '')  _folio = vrespuesta[vi].folio; else _folio = 'Pendiente de asignar';
                    if(vrespuesta[vi].fecha_fin != null && vrespuesta[vi].fecha_fin != '')  _fin = vrespuesta[vi].fecha_fin; else _fin = 'Aun en trámite';

                vhtml+='        <tr>';
                vhtml+='            <td class="text-center fs-sm">' + (vi + 1) + '</td>';
                vhtml+='            <td class="text-center fs-sm">' + _folio + '</td>';
                vhtml+='            <td class="fw-semibold fs-sm">' + vrespuesta[vi].folio_hacienda + '</td>';
                vhtml+='            <td class="fs-sm"><strong><span class="badge badge-' + vrespuesta[vi].status_color + '">' + vrespuesta[vi].status + '</span></strong></td>';
                vhtml+='            <td class="fs-sm">' + vrespuesta[vi].fecha_inicio + '</td>';
                vhtml+='            <td class="fs-sm">' + _fin + '</td>';
                vhtml+='            <td class="fs-sm"><div class="btn-icon-list">';
                if(vrespuesta[vi].id_status == 8)
                {
                    vhtml += '              <a href="' + vuri + '/mis-tramites/'+ vrespuesta[vi].id +'/observaciones" class="btn ripple btn-sm">';
                    vhtml += '                  <i class="fa fa-search fa-lg"></i>';
                    vhtml += '              </a>';
                }
                if(vrespuesta[vi].id_status == 3)
                {
                    vhtml += '              <a href="' + vuri + '/constancia/'+ vrespuesta[vi].id +'/imprimir" class="btn ripple btn-sm" target="_blank">';
                    vhtml += '                  <i class="fa fa-print fa-lg"></i>';
                    vhtml += '              </a>';
                }
                vhtml += '              <a href="' + vuri + '/mis-tramites/'+ vrespuesta[vi].id +'/detalle" class="btn ripple btn-sm">';
                vhtml += '                  <i class="fas fa-eye fa-lg"></i>';
                vhtml += '              </a>';
                vhtml+='            </div></td>';

                vhtml+='        </tr>';
                }
                vhtml+='    </tbody>';
                vhtml+='</table>';
                vhtml+='</div>';

                $('#table-tramites').html(vhtml);
                $('#tblTramites').DataTable({
                    language: {
                        searchPlaceholder: 'Buscar...',
                        sSearch: '',
                        lengthMenu: '_MENU_ Registros/pagina',
                        sInfo:           "Registros del _START_ al _END_ de un total de _TOTAL_ registros",
                        sInfoEmpty:      "Registros del 0 al 0 de un total de 0 registros",
                        sInfoFiltered:   "(Total de _MAX_ registros)",
                        sZeroRecords:   "No existe algún registro",
                        "paginate": {
                            "first": "Primero",
                            "previous": "Anterior",
                            "next": "Siguiente",
                            "last": "Ultimo"
                        }
                    },
                    responsive: true,
                    "bLengthChange": false
                });

            }
        },
        error: function(vjqXHR, vtextStatus, verrorThrown){ }
    });   
 }