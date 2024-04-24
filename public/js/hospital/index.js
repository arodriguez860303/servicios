
$(document).ready(function(e){   
    loadTable();     
}); 


function existe_tramite()
{    
    $.ajax({
        type: 'GET',
        url: vuri + '/mis-tramites-hospital/buscar',
        dataType: "JSON",
        success: function(vresponse, vtextStatus, vjqXHR) {
            var vrespuesta=vresponse.respuesta;
            
            if(vrespuesta != null && vrespuesta != '')
            {
                $('.btn-nuevo').html('<i class="fa fa-angle-double-right"></i> Continuar trámite');                
            }            
        },
        error: function(vjqXHR, vtextStatus, verrorThrown){ }
    });  
}

function loadTable()
{
    $.ajax({
        type: 'GET',
        url: vuri + '/mis-tramites-hospital/historial',
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
                vhtml+='    <table class="table table-bordered table-striped" id="tblTramites">';
                vhtml+='        <thead>';
                vhtml+='            <tr>';
                vhtml+='                <th>#</th>';
                vhtml+='                <th>Folio</th>';
                vhtml+='                <th>Hospital</th>';
                vhtml+='                <th>Status</th>';
                vhtml+='                <th>Fecha inicio</th>';
                vhtml+='                <th>Fecha fin</th>';
                vhtml+='                <th>Accion</th>';
                vhtml+='            </tr>';
                vhtml+='        </thead>';
                vhtml+='        <tbody>';
                var contador=0;
                for ( vi=0; vi < vrespuesta.length; vi++ ) {
                    var _fin = ""; var _folio = "";
                    if(vrespuesta[vi].folio != null && vrespuesta[vi].folio != '')  _folio = vrespuesta[vi].folio; else _folio = 'Pendiente de asignar';
                    if(vrespuesta[vi].fecha_fin != null && vrespuesta[vi].fecha_fin != '')  _fin = vrespuesta[vi].fecha_fin; else _fin = 'Aun en trámite';

                    vhtml+='            <tr>';
                    vhtml+='                <td>' + (vi + 1) + '</td>';
                    vhtml+='                <td>' + _folio + '</td>';
                    vhtml+='                <td>' + vrespuesta[vi].hospital + '</td>';
                    vhtml+='                <td><strong><span class="badge badge-' + vrespuesta[vi].status_color + '">' + vrespuesta[vi].status + '</span></strong></td>';
                    vhtml+='                <td>' + vrespuesta[vi].fecha_inicio + '</td>';
                    vhtml+='                <td>' + _fin + '</td>';
                    vhtml+='                <td>';
                    vhtml+= '                   <a href="' + vuri + '/mis-tramites-hospital/'+ vrespuesta[vi].id +'/show" class="btn ripple btn-sm">';
                    vhtml+= '                       <i class="fa fa-eye fa-lg"></i>';
                    vhtml+= '                   </a>';

                    if(vrespuesta[vi].id_status == 3)
                    {
                        vhtml += '              <a href="' + vuri + '/tramites-hospital/diploma/'+ vrespuesta[vi].id +'/imprimir" class="btn ripple btn-sm" target="_blank">';
                        vhtml += '                  <i class="fa fa-file-pdf-o fa-lg"></i>';
                        vhtml += '              </a>';
                    }

                    if(vrespuesta[vi].id_status == 8)
                    {
                        vhtml += '              <a href="' + vuri + '/mis-tramites-hospital/'+ vrespuesta[vi].id +'/observaciones" class="btn ripple btn-sm">';
                        vhtml += '                  <i class="fa fa-search fa-lg"></i>';
                        vhtml += '              </a>';
                    }

                    vhtml+='                </td>';
                    vhtml+='            </tr>';
                }
                vhtml+='        </tbody>';
                vhtml+='    </table>';
                vhtml+='</div>';


                $('#table-tramites').html(vhtml);
                $('#tblTramites').DataTable({
                    "order": [],
                    "columnDefs": [{
                        "targets": 'no-sort',
                        "orderable": false,
                    }],
                    pageLength : 10,
                    "bLengthChange" : false,
                    language: {
                                searchPlaceholder: 'Buscar registro...',
                                sSearch: '',
                                lengthMenu: '_MENU_ Registros/pagina',
                                sInfo:           "Registros del _START_ al _END_ de un total de _TOTAL_ registros",
                                sInfoEmpty:      "Registros del 0 al 0 de un total de 0 registros",
                                sInfoFiltered:   "(Total de _MAX_ registros)",
                                sZeroRecords:   "No existe algún registro",
                                "paginate": {
                                    "first": "<span class='ti-angle-double-left'></span>",
                                    "previous": "<span class='ti-angle-left'></span>",
                                    "next": "<span class='ti-angle-right'></span>",
                                    "last": "<span class='ti-angle-double-right'></span>"
                                }
                            }
                });

                $('.dataTables_filter input[type="search"]').css(
                    {'width':'450px','display':'inline-block', 'background':'#efefef', 'border-color':'#8990A2'}
                );
            }
        },
        error: function(vjqXHR, vtextStatus, verrorThrown){ }
    });   
}