function statusConstancia()
{

    $.ajax({
        type: 'GET',
        url: vuri + '/mis-tramites-hospital/datos-diploma',
        dataType: "JSON",
        success: function(vresponse, vtextStatus, vjqXHR) {
            var vrespuesta=vresponse.respuesta;         

            $('#iconGeneral').addClass("fa fa-check-circle fa-lg text-success");

            if(vrespuesta != null)
            {        

                if(vrespuesta.id_status_requerimiento==1 && vrespuesta.id_status_video==1 && vrespuesta.id_status_examen==1)
                {
                    $('#btn-enviar-tramite').show();
                    //$('#btn-cancelar').hide();
                }
                else
                {
                    $('#btn-enviar-tramite').hide();
                    //$('#btn-cancelar').show();
                }

                if(vrespuesta.id_status_requerimiento==1)
                {
                    $('#iconDocumentos').removeClass("fa-question-circle text-danger");
                    $('#iconDocumentos').addClass("fa fa-check-circle fa-lg text-success");          
                }  
                else
                    $('#iconDocumentos').addClass("fa fa-question-circle fa-lg text-danger"); 

                if(vrespuesta.id_status_video==1)
                {
                    $('#iconVideo').removeClass("fa-question-circle text-danger");
                    $('#iconVideo').addClass("fa fa-check-circle fa-lg text-success");

                    $('#dvShowVideo').hide();
                    $('#dvVideoFinalizado').show();
                    $('#btnPlayPause').hide();
                    $('#btnContinuar').hide();
                }  
                else
                    $('#iconVideo').addClass("fa fa-question-circle fa-lg text-danger"); 

                if(vrespuesta.id_status_examen==1)
                {  
                    $('#iconExamen').removeClass("fa-question-circle text-danger");
                    $('#iconExamen').addClass("fa fa-check-circle fa-lg text-success");
                    calificacion(); 
                }
                else{
                    $('#iconExamen').addClass("fa fa-question-circle fa-lg text-danger");
                    calificacion(); 
                }

            }           
        },
        error: function(vjqXHR, vtextStatus, verrorThrown){ }
    });  
}