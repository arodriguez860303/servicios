var table;

$(document).ready(function(){ 

    loadData();    
    
    $('#searchData').on( 'keyup', function () {
        table.search( this.value ).draw();
    }); 

});

function loadData()
 {
    /**
     * 11 de Agosto de 2023
     * Cargar las solicitudes
     * */
    
    $.ajax({
        type: 'GET',
        url: vuri + '/tramites-hospital/get-results',
        dataType: "JSON",
        data: {
            method: 'get',
            id_status: 8
        },
        success: function(vresponse, vtextStatus, vjqXHR) {
            var vrespuesta=vresponse.respuesta;    
            var vhtml='';

            if ( parseInt(vresponse.codigo) == 1 ) {

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
                vhtml+='        <th>Acción</th>';
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
                vhtml+='            <td class="fs-sm">';
                vhtml+='                <div class="btn-group">';
                vhtml+='                    <a href="'+ vuri +'/tramites-hospital/'+ vrespuesta[vi].id +'/detalle" class="btn btn-sm btn-alt-secondary" data-bs-toggle="tooltip" title="Ver">';
                vhtml+='                        <i class="fa fa-fw fa-eye"></i>';
                vhtml+='                    </a>';
                vhtml+='                </div>';              
                vhtml+='            </td>';           
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
                    language: {
                        url: vuri + '/backend/spanish.json'
                    }
                });

            }
        },
        error: function(vjqXHR, vtextStatus, verrorThrown){ }
    });   
 }