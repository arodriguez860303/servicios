$(document).ready(function(){ 
    $("._dashboard").addClass("active");
    loadData();

    $('._proceso').hover(function(){        
          $(this).css('cursor', 'pointer');
    });

    $('._observado').hover(function(){        
          $(this).css('cursor', 'pointer');
    });

    $('._solventado').hover(function(){        
          $(this).css('cursor', 'pointer');
    });

    $('._aceptado').hover(function(){        
          $(this).css('cursor', 'pointer');
    });

    $('._concluido').hover(function(){        
          $(this).css('cursor', 'pointer');
    });

    $('._cancelado').hover(function(){        
          $(this).css('cursor', 'pointer');
    });
});


function por_anio(anio) {
    $('span.year').removeClass('bg-primary');
    $('span.year').addClass('bg-black-50');

    $('#y'+anio).removeClass('bg-black-50');
    $('#y'+anio).addClass('bg-primary');
    $("#anio").val(anio);     
    loadData()
}

function loadData()
{
	let _anio = $("#anio").val();

	$.ajax({
        type: 'GET',
        url: vuri + '/dashboard/get-datos',
        dataType: "JSON", 
        data: {
            anio: _anio
        },
        beforeSend: function() {
            $("#overlay").show();
        },     
        success: function(vresponse, vtextStatus, vjqXHR) {
                         
            if(vresponse.codigo==1)
            {
                var vrespuesta=vresponse.respuesta;

                $('#spProceso').html(vrespuesta.totalProceso);
                $('#spObservado').html(vrespuesta.totalObservado);
                $('#spSolventado').html(vrespuesta.totalSolventado);
                $('#spAceptado').html(vrespuesta.totalAceptado);
                $('#spConcluido').html(vrespuesta.totalConcluido);
                $('#spCancelado').html(vrespuesta.totalCancelado);

                $('#spProcesoHospital').html(vrespuesta.totalProcesoHospital);
                $('#spObservadoHospital').html(vrespuesta.totalObservadoHospital);
                $('#spSolventadoHospital').html(vrespuesta.totalSolventadoHospital);
                $('#spAceptadoHospital').html(vrespuesta.totalAceptadoHospital);
                $('#spConcluidoHospital').html(vrespuesta.totalConcluidoHospital);
                $('#spCanceladoHospital').html(vrespuesta.totalCanceladoHospital);         

                $('#spTotalConstancias').html(vrespuesta.global);
                $('#spTotalDiplomas').html(vrespuesta.globalHospital);
                $('#spGlobal').html(vrespuesta.global + vrespuesta.globalHospital);
              
                grafica(vrespuesta.dataGraph, vrespuesta.dataGrapHospital);
                ultimos(vrespuesta.ultimos);            
                getUltimosHospital(vrespuesta.ultimosHospital);            
            }               
        },
        complete: function() {
            $("#overlay").hide();              
        },
        error: function(vjqXHR, vtextStatus, verrorThrown){ }
    });   
}

let myChart;
const valores = [];
function grafica(data, dataHospital)
{
	var ctx = document.getElementById("bar-chart").getContext('2d');
    if (myChart) {
        myChart.destroy();
    }
    

	myChart = new Chart(ctx, {
	    type: 'bar',
	    data: {
	      labels: ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"],
	      datasets: [
	        {
	          label: "Constancias de alimentos",
	          // backgroundColor: ["#6B8C91", "#638979", "#8B85AE", "#8EADA5", "#5368C1", "#24476B", "#5E3253", "#70C0D9", "#775D63", "#A451D2", "#999999", "#D9DFEB"],	          
              backgroundColor: ["#6B8C91"],
              data: [
                        data.enero, 
                        data.febrero, 
                        data.marzo, 
                        data.abril, 
                        data.mayo, 
                        data.junio, 
                        data.julio, 
                        data.agosto, 
                        data.septiembre, 
                        data.octubre, 
                        data.noviembre, 
                        data.diciembre
                    ]
	        },
            {
              label: "Diplomas de hospital",              
              backgroundColor: ["#8B85AE"],
              data: [
                        dataHospital.enero, 
                        dataHospital.febrero, 
                        dataHospital.marzo, 
                        dataHospital.abril, 
                        dataHospital.mayo, 
                        dataHospital.junio, 
                        dataHospital.julio, 
                        dataHospital.agosto, 
                        dataHospital.septiembre, 
                        dataHospital.octubre, 
                        dataHospital.noviembre, 
                        dataHospital.diciembre
                    ]
            }
	      ]
	    },
	    options: {
	      legend: { display: false },
	      title: {
	        display: true,
	        text: 'Predicted world population (millions) in 2050'
	      }
	    }
	});
}

function ultimos(data)
{
	var vhtml='';
	vhtml+='<div class="table-responsive">';
    vhtml+='  <table class="table table-hover table-vcenter">';
    vhtml+='    <thead>';
    vhtml+='      <tr>';
    vhtml+='        <th>#</th>';
    //vhtml+='        <th class="d-none d-xl-table-cell">CURP</th>';
    vhtml+='        <th>NOMBRE</th>';
    vhtml+='        <th class="d-none d-sm-table-cell text-start">FOLIO DE PAGO</th>';
    vhtml+='        <th class="d-none d-sm-table-cell text-start">STATUS</th>';
    vhtml+='        <th class="d-none d-sm-table-cell text-start">FECHA INICIO</th>';
    vhtml+='      </tr>';
    vhtml+='    </thead>';
    vhtml+='    <tbody class="fs-sm">';
    for ( vi=0; vi < data.length; vi++ ) {
    vhtml+='      <tr>';
    vhtml+='        <td>' + (vi + 1) + '</td>';
    //vhtml+='        <td class="d-none d-xl-table-cell">'+ data[vi].curp +'</td>';
    vhtml+='        <td>'+ data[vi].razon_social_o_nombre +'</td>';
    vhtml+='        <td class="d-none d-sm-table-cell">'+ data[vi].folio_hacienda +'</td>';
    vhtml+='        <td class="d-none d-sm-table-cell fw-semibold text-muted text-start">';
    vhtml+='			<span class="fs-xs fw-semibold d-inline-block py-1 px-3 rounded-pill bg-'+ data[vi].status_color +'-light text-'+ data[vi].status_color +'">'+ data[vi].status +'</span>';
    vhtml+='		</td>';
    vhtml+='        <td class="d-none d-sm-table-cell text-start">';
    vhtml+='          <strong>'+ data[vi].fecha_inicio +'</strong>';
    vhtml+='        </td>';
    vhtml+='      </tr>';
	}
    vhtml+='    </tbody>';
    vhtml+='  </table>';
    vhtml+='</div>';

    $('#dvUltimos').html(vhtml);
}

function getUltimosHospital(data)
{
    var vhtml='';
    vhtml+='<div class="table-responsive">';
    vhtml+='  <table class="table table-hover table-vcenter">';
    vhtml+='    <thead>';
    vhtml+='      <tr>';
    vhtml+='        <th>#</th>';
    vhtml+='        <th class="d-none d-sm-table-cell text-start">FOLIO</th>';
    vhtml+='        <th>NOMBRE</th>';    
    vhtml+='        <th class="d-none d-sm-table-cell text-start">STATUS</th>';
    vhtml+='        <th class="d-none d-sm-table-cell text-start">FECHA INICIO</th>';
    vhtml+='      </tr>';
    vhtml+='    </thead>';
    vhtml+='    <tbody class="fs-sm">';
    for ( vi=0; vi < data.length; vi++ ) {
    vhtml+='      <tr>';
    vhtml+='        <td>' + (vi + 1) + '</td>';
    vhtml+='        <td class="d-none d-sm-table-cell">'+ data[vi].folio +'</td>';
    vhtml+='        <td>'+ data[vi].razon_social_o_nombre +'</td>';    
    vhtml+='        <td class="d-none d-sm-table-cell fw-semibold text-muted text-start">';
    vhtml+='            <span class="fs-xs fw-semibold d-inline-block py-1 px-3 rounded-pill bg-'+ data[vi].status_color +'-light text-'+ data[vi].status_color +'">'+ data[vi].status +'</span>';
    vhtml+='        </td>';
    vhtml+='        <td class="d-none d-sm-table-cell text-start">';
    vhtml+='          <strong>'+ data[vi].fecha_inicio +'</strong>';
    vhtml+='        </td>';
    vhtml+='      </tr>';
    }
    vhtml+='    </tbody>';
    vhtml+='  </table>';
    vhtml+='</div>';

    $('#dvUltimosHospital').html(vhtml);
}

function load_detalle(status)
{
	var anio = $('#anio').val();
	window.location = vuri + '/dashboard/tramites/'+ status +'/anio/'+ anio +'/detalles';	
}

function load_detalle_hospital(status)
{
    var anio = $('#anio').val();
    window.location = vuri + '/dashboard/tramites-hospital/'+ status +'/anio/'+ anio +'/detalles';   
}