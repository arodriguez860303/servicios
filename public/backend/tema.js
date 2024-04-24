function change_theme(value)
{    
    $.ajax({
        type: "POST",
        url: vuri + '/tema/cambiar',
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        dataType: "JSON",
        data: {
            tema: value
        },               
        success: function(vresponse, vtextStatus, vjqXHR) {   

            if(vresponse.codigo==1)
            {                
                One.helpers('jq-notify', {type: 'info', icon: 'fa fa-info-circle me-1', message: vresponse.mensaje });
                setTimeout(function () {
                    location.reload();
                }, 800); 
            }             
                           
        },
        error: function(vjqXHR, vtextStatus, verrorThrown) {
            var jsonString= vjqXHR.responseJSON;                     
        }
    });
    
}


function mode_dark()
{    
    $.ajax({
        type: "POST",
        url: vuri + '/modo-oscuro',
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },               
        success: function(vresponse, vtextStatus, vjqXHR) {   

            if(vresponse.codigo==1)
            {
                One.helpers('jq-notify', {type: 'info', icon: 'fa fa-info-circle me-1', message: vresponse.mensaje });
                setTimeout(function () {
                    location.reload();
                }, 800); 
            }             
                           
        },
        error: function(vjqXHR, vtextStatus, verrorThrown) {
            var jsonString= vjqXHR.responseJSON;                     
        }
    });
    
}