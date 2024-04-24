function mostrarContrasena(){
    var tipo = document.getElementById("txtPassword");
    if(tipo.type == "password")
    {
    	$('#iconPass').removeClass('fa-eye');
    	$('#iconPass').addClass('fa-eye-slash');
       	tipo.type = "text";
    }
    else
    {
    	$('#iconPass').removeClass('fa-eye-slash');
    	$('#iconPass').addClass('fa-eye');
       	tipo.type = "password";
    }
}