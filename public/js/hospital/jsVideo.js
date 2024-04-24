var video="";
var timeStarted=-1;
var timePlayed=0;
var duration=0;

function configMovie()
{
    video = document.getElementById("video");  
    
    if(video.readyState > 0) {
        getDuration.call(video);
    }
    else {
        video.addEventListener('loadedmetadata', getDuration);
    }

    video.addEventListener("play", videoStartedPlaying);
    video.addEventListener("playing", videoStartedPlaying);

    video.addEventListener("ended", videoStoppedPlaying);
    video.addEventListener("pause", videoStoppedPlaying);   
 }

function playPauseVideo() {
    player = document.getElementById("video");
    if (player.paused || player.ended) {        
        player.play();
    }
  }

function videoStartedPlaying() 
{
  timeStarted = new Date().getTime()/1000;
}

function videoStoppedPlaying(event) 
{
    // Start time less then zero means stop event was fired vidout start event
    if(timeStarted > 0) {
        var playedFor = new Date().getTime()/1000 - timeStarted;
        timeStarted = -1;
        // add the new ammount of seconds played
        timePlayed+=playedFor;
    }
    document.getElementById("played").innerHTML = Math.round(timePlayed)+"";
    // Count as complete only if end of video was reached
    if(timePlayed >= duration && event.type == "ended") {
        //aqui se hace lo que sigue despues de ver el videotutorial        
        cursoterminado();
    }
}

function getDuration() 
{
    duration = video.duration;
    document.getElementById("duration").appendChild(new Text(Math.round(duration)+""));
    //console.log("Duration: ", duration);
}

function confirmarContinuarSinVer() {
    swal({
        title: "¡ Advertencia !",
        text: "MANIFIESTO BAJO PROTESTA DE DECIR VERDAD: En mi carácter de solicitante, que he finalizado el curso de capacitación, para obtener la Constancia de Manejo Higiénico de Alimentos.",
        icon: "warning",
        buttons: {
            cancel: {
                text: 'Cancelar',
                value: false,
                visible: true,
                className: 'btn btn-default',
                closeModal: true,
            },
            confirm: {
                text: 'Confirmar',
                value: true,
                visible: true,
                className: 'btn btn-primary',
                closeModal: true
            }
        }
    }).then((result) => {
        if (result) {
            cursoterminado();          
        }
    });
}

function  cursoterminado()
{

    $.ajax({
        type: "POST",
        url: vuri + '/mis-tramites-hospital/terminar-capacitacion',
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        success: function(json) {                                     
           swal({                                    
                type: 'success',
                title: 'Confirmación',
                icon:  "success",
                content: {
                element: 'p',
                attributes: {
                            innerHTML: json.msg,
                        },
                    }, 
                    showConfirmButton: false,
                        timer:             2500
                });

            $('#iconVideo').removeClass("fa-question-circle text-danger");
            $('#iconVideo').addClass("fa fa-check-circle fa-lg text-success");

            if(json.data.id_status_video == 1)
            {
                $('#dvShowVideo').hide();
                $('#dvVideoFinalizado').show();
                $('#tabEvaluacion').show();
                $('#btnPlayPause').hide();
                $('#btnContinuar').hide();

                statusConstancia();
            }
        },
        error: function(json)
        {
            var jsonString= json.responseJSON;           
            if(json.status === 409) {                
                str_errors= jsonString.msg;                           
            }
            swal({
                title:  "¡ Advertencia !",
                content: {
                    element: 'p',
                    attributes: {
                      innerHTML: str_errors,
                    },
                },  
                icon: "warning",               
                buttons: {
                    confirm: {
                        text: 'Confirmar',
                        value: true,
                        visible: true,
                        className: 'btn btn-primary',
                        closeModal: true
                    }
                }
            });   
        }
    });

}