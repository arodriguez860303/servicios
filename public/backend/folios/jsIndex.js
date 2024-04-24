var table;

$(document).ready(function(){ 
    $("._folios").addClass("active");
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
        url: vuri + '/folios/listado',
        dataType: "JSON",
        data: {
            method: 'get'
        },
        success: function(vresponse, vtextStatus, vjqXHR) {
            var vrespuesta=vresponse.respuesta;    
            var vhtml='';

            if ( parseInt(vresponse.codigo) == 1 ) {

                vhtml+='<table class="table table-bordered table-striped table-vcenter js-dataTable-responsive">';
                vhtml+='    <thead>';
                vhtml+='      <tr>';
                vhtml+='        <th>#</th>';
                vhtml+='        <th>Tipo tramite</th>';
                vhtml+='        <th>Folio</th>';
                vhtml+='        <th>Ocupado</th>';
                vhtml+='        <th>Fecha</th>';;
                vhtml+='        <th>Acción</th>';
                vhtml+='      </tr>';
                vhtml+='    </thead>';
                vhtml+='    <tbody>';
                for ( vi=0; vi < vrespuesta.length; vi++ ) {
                vhtml+='        <tr>';
                vhtml+='            <td class="text-center fs-sm">' + (vi + 1) + '</td>';
                vhtml+='            <td class="text-right fs-sm">' + vrespuesta[vi].clave + '-' + vrespuesta[vi].tipo_tramite + '</td>';            
                vhtml+='            <td class="fs-sm">' + vrespuesta[vi].folio + '</td>';
                vhtml+='            <td class="fs-sm">';
                if(vrespuesta[vi].ocupado==0)
                    vhtml+='            <span class="fs-xs fw-semibold d-inline-block py-1 px-3 rounded-pill bg-warning-light text-warning">Pendiente de utilizar</span>';
                else
                    vhtml+='            <span class="fs-xs fw-semibold d-inline-block py-1 px-3 rounded-pill bg-success-light text-success">Folio utilizado</span>';
                vhtml+='            </td>';
                vhtml+='            <td class="fs-sm">' + vrespuesta[vi].fecha + '</td>';          
                vhtml+='            <td class="fs-sm">';
                if(vrespuesta[vi].ocupado==0)
                {                    
                    vhtml+='                <a href="'+ vuri +'/folios/'+ vrespuesta[vi].id +'/edit" class="btn btn-sm btn-alt-secondary" data-bs-toggle="tooltip" title="Editar">';
                    vhtml+='                    <i class="fa fa-fw fa-edit"></i>';
                    vhtml+='                </a>'; 
                }             
                else
                    vhtml+='<i class="si si-check fa-2x text-success"></i>';
                vhtml+='            </td>';           
                vhtml+='        </tr>';
                }
                vhtml+='    </tbody>';
                vhtml+='</table>';

                $('#table-folios').html(vhtml);

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