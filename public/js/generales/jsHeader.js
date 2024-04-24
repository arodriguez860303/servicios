function encabezado()
{
    $.ajax({
        type: 'GET',
        url: vuri + '/registro/header',
        dataType: "JSON",
        success: function(vresponse, vtextStatus, vjqXHR) {
            var vrespuesta=vresponse;
            var ruta_logo = vuri + "/img/logos/avatar.jpg";            
            var vhtml ='';

            vhtml+='<div class="md-card">';
            vhtml+='    <div class="user_heading md-bg-gob2-500">';
            vhtml+='        <div class="user_heading_avatar">';
            vhtml+='            <div class="thumbnail">';
            vhtml+='                <img src="'+ruta_logo+'" class="" alt="usuario" width="100%">';
            vhtml+='            </div>';
            vhtml+='        </div>';
            vhtml+='    <div class="user_heading_content">';
            vhtml+='        <h2 class="heading_b uk-margin-bottom">';
            vhtml+='            <span class="uk-text-truncate">'+ vrespuesta.encabezado.razon_social_o_nombre +'</span>';
            vhtml+='            <span class="sub-heading"></span>';
            vhtml+='        </h2>';
            vhtml+='        <ul class="user_stats">';
            vhtml+='            <li>'; 
            vhtml+='                <span class="uk-margin-right">';
            vhtml+='                    <i class="fas fa-id-card"></i>';
            vhtml+='                    <span class="uk-text-small">R.F.C. '+ vrespuesta.encabezado.rfc +'</span>';
            vhtml+='                </span>';
            vhtml+='                <span class="uk-margin-right">';
            vhtml+='                    <i class="fas fa-phone"></i>';
            vhtml+='                    <span class="uk-text-small">Telefono '+ vrespuesta.encabezado.telefono +'</span>';
            vhtml+='                </span>';
            vhtml+='                <span class="uk-margin-right">';
            vhtml+='                    <i class="far fa-envelope"></i>';
            vhtml+='                    <span class="uk-text-small">Correo '+ vrespuesta.encabezado.email +'</span>';
            vhtml+='                </span>';            
            vhtml+='            </li>';
            vhtml+='            <li>';
            vhtml+='                <span class="uk-margin-right">';
            vhtml+='                    <span class="uk-text-small"></i>';
            vhtml+='                        Domicilio fiscal '+ vrespuesta.encabezado.calle +' entre '+ vrespuesta.encabezado.entre_calle +' y '+ vrespuesta.encabezado.y_calle +', No. '+ vrespuesta.encabezado.num_exterior +', Colonia '+ vrespuesta.encabezado.colonia +', CP '+ vrespuesta.encabezado.codigo_postal +', '+ vrespuesta.encabezado.municipio +', Chiapas';
            vhtml+='                    </span>';
            vhtml+='                </span>';
            vhtml+='            </li>';
            vhtml+='            <li>';
            vhtml+='                <span class="uk-margin-left">';
            vhtml+='                    <h4>Únicamente se proporcionará información al interesado.</h4>';
            vhtml+='                </span>';
            vhtml+='            </li>';
            vhtml+='        </ul>';
            vhtml+='        </div>';
            vhtml+='    </div>';
            vhtml+='</div>';
              
            $('.dvHeader').html(vhtml);
        },
        error: function(vjqXHR, vtextStatus, verrorThrown){ }
    });  
}