function datos_generales()
{    
    $.ajax({
        type: 'GET',
        url: vuri + '/mis-tramites-hospital/generales',
        dataType: "JSON",
        success: function(vresponse, vtextStatus, vjqXHR) {
            var vrespuesta=vresponse;
            
            $('#txtRazonSocial').val(vrespuesta.datos.razon_social_o_nombre);             
            $('#txtCorreo').val(vrespuesta.datos.email); 
            $('#txtTelefono').val(vrespuesta.datos.telefono); 
            $('#txtDireccion').val(vrespuesta.datos.calle +' entre '+ vrespuesta.datos.entre_calle +' y '+ vrespuesta.datos.y_calle +' No '+ vrespuesta.datos.num_exterior +', Colonia '+ vrespuesta.datos.colonia +', CP '+ vrespuesta.datos.codigo_postal); 
            $('#txtMunicipio').val(vrespuesta.datos.municipio);             
            $('#txtCurp').val(vrespuesta.datos.curp);       
            $('#txtHospital').val(vrespuesta.datos.hospital);       
        },
        error: function(vjqXHR, vtextStatus, verrorThrown){ }
    });  
}
