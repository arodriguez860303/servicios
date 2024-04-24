let array;

$(document).ready(function() {
	initializeObject();
	$('#cmbTipoReporte').on('change', function() { 
		if(this.value==0) initializeObject();
		else if(this.value==1) objGeneral();
		else if(this.value==2) objMunicipio();
		else if(this.value==3) objDetallado();
	});
});

function verifica()
{
	var tipo = $('#cmbTipoReporte').val();

	if(tipo == 1) { 
		array = [];
		array =[{ "tipo":tipo, "anio": $('#cmbAnio').val() }]; 
	}
	else if(tipo == 2){
		array = [];
		array =[{ "tipo":tipo, "fecha_inicio": $('#fecha_inicio').val(), "fecha_fin": $('#fecha_fin').val() }]; 
	}
	else if(tipo == 3){
		array = [];
		array =[{ "tipo":tipo, "id_municipio": $('#id_municipio').val(), "fecha_inicio": $('#fecha_inicio').val(), "fecha_fin": $('#fecha_fin').val() }]; 
	}

	printReport(array);
}

function printReport(json)
{
    var data='';
    let tipo = json[0]['tipo'];
    if(tipo == 1) data ='tipo='+ tipo + '&anio=' + json[0]['anio'];
    if(tipo == 2) data ='tipo='+ tipo + '&fecha_inicio=' + json[0]['fecha_inicio'] + '&fecha_fin='+ json[0].fecha_fin;
    if(tipo == 3) data ='tipo='+ tipo + '&fecha_inicio=' + json[0]['fecha_inicio'] + '&fecha_fin='+ json[0].fecha_fin +'&id_municipio='+ json[0].id_municipio;

    var link = document.createElement("a")
    link.href = vuri + "/reportes/generar?" + data;

    link.target = "_blank";
    link.click();
}

function initializeObject()
{
	  $('#cmbAnio').val(0).change();  
  	$('#id_municipio').val(0).change();  
  	$('#fecha_inicio').val('');
  	$('#fecha_fin').val('');

  	$("#fecha_inicio").attr('disabled','disabled');
  	$("#fecha_fin").attr('disabled','disabled');
  	$("#cmbAnio").attr('disabled','disabled');
  	$("#id_municipio").attr('disabled','disabled');
}

function objGeneral()
{
	initializeObject();
    $("#fecha_inicio").attr('disabled','disabled');
  	$("#fecha_fin").attr('disabled','disabled');  
  	$("#id_municipio").attr('disabled','disabled');  
	$("#cmbAnio").removeAttr('disabled');
}

function objMunicipio()
{
	initializeObject();
    $("#fecha_inicio").removeAttr('disabled');
	$("#fecha_fin").removeAttr('disabled');
	$("#cmbAnio").attr('disabled','disabled');
	$("#id_municipio").attr('disabled','disabled');
}

function objDetallado()
{
	initializeObject();
    $("#fecha_inicio").removeAttr('disabled');
	$("#fecha_fin").removeAttr('disabled');
	$("#id_municipio").removeAttr('disabled');
	$("#cmbAnio").attr('disabled','disabled');
	getMunicipios();
}

function getMunicipios(selectOpt=0)
 {
    $.ajax({
        type: "GET",
        url: vuri + '/tipo/get-municipios',
        data: {
            method: 'get',
            id_estado: 7
        },
        success: function(response) {
            var html ='';
                html+='<option value="">--- Seleccionar municipio ---</option>';
            for ( var i=0; i<response.respuesta.length; i++ ) {
                html+='<option value='+response.respuesta[i].id+'>'+ response.respuesta[i].clave +' - '+response.respuesta[i].nombre+'</option>';
            }
            $('#id_municipio').html(html);
            if (selectOpt != 0 ) $('#id_municipio').val(selectOpt).trigger('change');
        },
        error: function(json) { }
    });
 }