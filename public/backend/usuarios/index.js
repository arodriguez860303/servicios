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
     * 23 de Agosto de 2023
     * Cargar los usuarios
     * */
    
    $.ajax({
        type: 'GET',
        url: vuri + '/usuarios/get-results',
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
                vhtml+='        <th>Nombre</th>';
                vhtml+='        <th>Nickname</th>';
                vhtml+='        <th>Correo</th>';
                vhtml+='        <th>Rol</th>';
                vhtml+='        <th>Fecha creación</th>';
                vhtml+='        <th>Acción</th>';
                vhtml+='      </tr>';
                vhtml+='    </thead>';
                vhtml+='    <tbody>';
                for ( vi=0; vi < vrespuesta.length; vi++ ) {
                
                vhtml+='        <tr id="trId_'+ vrespuesta[vi].id +'">';
                vhtml+='            <td class="text-center fs-sm">' + (vi + 1) + '</td>';
                vhtml+='            <td class="text-right fs-sm">' + vrespuesta[vi].name + '</td>';            
                vhtml+='            <td class="fs-sm">' + vrespuesta[vi].nickname + '</td>';
                vhtml+='            <td class="fs-sm">' + vrespuesta[vi].email + '</td>';
                vhtml+='            <td class="fs-sm">' + vrespuesta[vi].rol + '</td>';
                vhtml+='            <td class="text-muted fs-sm">' + vrespuesta[vi].fecha_creacion + '</td>';
                vhtml+='            <td class="fs-sm">';
                vhtml+='                <div class="btn-group">';
                vhtml+='                    <a href="'+ vuri +'/usuarios/'+ vrespuesta[vi].id +'/edit" class="btn btn-sm btn-alt-secondary" data-bs-toggle="tooltip" title="Ver">';
                vhtml+='                        <i class="fa fa-fw fa-user-pen"></i>';
                vhtml+='                    </a>';
                vhtml+='                    <a onclick="confirmDestroy('+ vrespuesta[vi].id +')" class="btn btn-eliminar btn-sm btn-alt-warning" data-bs-toggle="tooltip" title="Ver">';
                vhtml+='                        <i class="fa fa-fw fa-trash"></i>';
                vhtml+='                    </a>';
                vhtml+='                </div>';              
                vhtml+='            </td>';           
                vhtml+='        </tr>';
                }
                vhtml+='    </tbody>';
                vhtml+='</table>';



                $('#table-usuarios').html(vhtml);

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


function confirmDestroy(id)
{  
   Swal.fire({
        title: "¿ Esta seguro de eliminar este usuario ?",
        text: "Esta acción no se podra revertir!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "Si, estoy seguro!",
        cancelButtonText: "No, estoy seguro!",
        reverseButtons: true
    }).then(function(result) {
        if (result.value) {
            eliminar_usuario(id);
        }
        else if (result.dismiss === "cancel") {
            Swal.fire("Cancelado", "El usuario cancelo la acción.", "error")
        }
    }); 
}

function eliminar_usuario(id)
{
    $.ajax({
        type: 'DELETE',
        url: vuri + '/usuarios/' + id,
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        dataType: "JSON",        
        success: function(vresponse, vtextStatus, vjqXHR) {            
          
            Swal.fire({
                icon: vresponse.icono,
                title: 'Notificación',                
                text: vresponse.mensaje,
                showConfirmButton: false,
                timer: 1500
            });

            if( vresponse.codigo == 1 )
            {
                $('#trId_'+id).remove();
            }
           
            
        },
        error: function(vjqXHR, vtextStatus, verrorThrown){ }
    });  
}