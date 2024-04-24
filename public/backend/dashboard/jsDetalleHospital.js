var table;

$(document).ready(function(){ 

    $('#searchData').on( 'keyup', function () {
        table.search( this.value ).draw();
    }); 

    $('#ExportReporttoExcel').on('click', function() {
      $('.buttons-excel').click()
    });
    $('#ExportReporttoPdf').on('click', function() {
      $('.buttons-pdf').click()
    });
});

function loadData(status)
 {   
    /**
     * 25 de Agosto de 2023
     * Cargar las solicitudes
     * */
    
    $.ajax({
        type: 'GET',
        url: vuri + '/dashboard/get-solicitudes-hospital',
        dataType: "JSON",
        data: {
            method: 'get',
            id_status: status,
            anio: $('#anio').val()
        },
        success: function(vresponse, vtextStatus, vjqXHR) {
            var vrespuesta=vresponse.respuesta;    
            var vhtml='';

            if ( parseInt(vresponse.codigo) == 1 ) {
                if(vrespuesta.length >0 )
                {
                    $('#ExportReporttoExcel').show();
                    $('#ExportReporttoPdf').show();

                    vhtml+='<table class="table table-bordered table-striped table-vcenter js-dataTable-responsive">';
                    vhtml+='    <thead>';
                    vhtml+='      <tr>';
                    vhtml+='        <th>#</th>';
                    vhtml+='        <th>Folio</th>';
                    vhtml+='        <th>Status</th>';
                    vhtml+='        <th>Solicitante</th>';
                    vhtml+='        <th>Curp</th>';
                    vhtml+='        <th>Inicio</th>';
                    vhtml+='        <th>Fin</th>';
                    vhtml+='        <th>Telefono</th>';
                    vhtml+='      </tr>';
                    vhtml+='    </thead>';
                    vhtml+='    <tbody>';
                    for ( vi=0; vi < vrespuesta.length; vi++ ) {

                        var _folio = ""; var _fin = "";
                        if(vrespuesta[vi].folio != null && vrespuesta[vi].folio != '')  _folio = vrespuesta[vi].folio; else _folio = 'Pendiente de asignar';
                        if(vrespuesta[vi].fecha_fin != null && vrespuesta[vi].fecha_fin != '')  _fin = vrespuesta[vi].fecha_fin; else _fin = 'Aun en trámite';
                    vhtml+='        <tr>';
                    vhtml+='            <td class="text-center fs-sm">' + (vi + 1) + '</td>';
                    vhtml+='            <td class="text-center fs-sm">' + _folio + '</td>';            
                    vhtml+='            <td class="fw-semibold fs-sm"><strong><span class="fs-xs fw-semibold d-inline-block py-1 px-3 rounded-pill bg-' + vrespuesta[vi].status_color + '-light text-' + vrespuesta[vi].status_color + '">' + vrespuesta[vi].status + '</span></strong></td>';
                    vhtml+='            <td class="fs-sm">' + vrespuesta[vi].razon_social_o_nombre + '</td>';
                    vhtml+='            <td class="fs-sm">' + vrespuesta[vi].curp + '</td>';
                    vhtml+='            <td class="text-muted fs-sm">' + vrespuesta[vi].fecha_inicio + '</td>';
                    vhtml+='            <td class="text-muted fs-sm">' + _fin + '</td>';
                    vhtml+='            <td class="text-muted fs-sm">' + vrespuesta[vi].telefono + '</td>';          
                    vhtml+='        </tr>';
                    }
                    vhtml+='    </tbody>';
                    vhtml+='</table>';

                    $('#table-tramites').html(vhtml);

                    table = $(".js-dataTable-responsive").DataTable(
                    {
                        pagingType:"full_numbers",
                        pageLength:10,
                        lengthMenu:[[5,10,15,20],[5,10,15,20]],
                        autoWidth:!1,
                        responsive:!0,
                        bLengthChange: false,
                        dom: 'Bfrtip',
                        language: {
                            url: vuri + '/backend/spanish.json'
                        },
                        buttons: [
                            {
                                extend: 'excel',
                                className: "buttonsToHide"
                            },
                            {
                                extend: 'pdf',
                                className: "buttonsToHide",
                                orientation: 'landscape',
                                pageSize: 'LEGAL'
                            },
                        ]
                    });
                }
                else
                {
                    $('#ExportReporttoExcel').hide();
                    $('#ExportReporttoPdf').hide();

                    vhtml+='<div class="row g-0 justify-content-center text-center">';
                    vhtml+='    <div class="col-md-10 pt-3 pb-5">';
                    vhtml+='        <div class="d-inline-flex align-items-center space-x-1 fs-sm mb-2 p-2">';
                    vhtml+='            <i class="si si-info fa-5x text-warning"></i>';
                    vhtml+='        </div>';
                    vhtml+='        <h1 class="fs-2 fw-bold mb-3">';
                    vhtml+='            Notificación';
                    vhtml+='        </h1>';
                    vhtml+='        <p class="fs-5 fw-medium text-muted mb-4 mx-xl-8">';
                    vhtml+='            Por el momento no hay datos que mostrar, es posible que no haya registros en esta <span class="text-body-color fw-semibold">Sección</span>. Verifique en las demas secciones.';
                    vhtml+='        </p>';
                    vhtml+='    </div>';
                    vhtml+='</div>';
                    $('#table-tramites').html(vhtml);
                }
            }
        },
        error: function(vjqXHR, vtextStatus, verrorThrown){ }
    });   
 }