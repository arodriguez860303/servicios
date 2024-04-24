function validarCurp(input) {
    var curp = input.value.toUpperCase(),
        resultado = document.getElementById("resCurp"),
        valido = "No válido";
    
    if(curp=='')
            $('#resCurp').hide();
        else
            $('#resCurp').show();

    if (curpValida(curp)) {
        valido = "Válido";
        resultado.classList.add("ok");
    } else {
        resultado.classList.remove("ok");
    }
        
    resultado.innerText = "CURP: " + curp + "\nFormato: " + valido;
}

function validarCurpAutorizada(input) {
    var curp = input.value.toUpperCase(),
        resultado = document.getElementById("resCurpAutorizada"),
        valido = "No válido";
    
    if(curp=='')
            $('#resCurpAutorizada').hide();
        else
            $('#resCurpAutorizada').show();

    if (curpValida(curp)) {
        valido = "Válido";
        resultado.classList.add("ok");
    } else {
        resultado.classList.remove("ok");
    }
        
    resultado.innerText = "CURP: " + curp + "\nFormato: " + valido;
}

function curpValida(curp) {
    var re = /^([A-Z][AEIOUX][A-Z]{2}\d{2}(?:0\d|1[0-2])(?:[0-2]\d|3[01])[HM](?:AS|B[CS]|C[CLMSH]|D[FG]|G[TR]|HG|JC|M[CNS]|N[ETL]|OC|PL|Q[TR]|S[PLR]|T[CSL]|VZ|YN|ZS)[B-DF-HJ-NP-TV-Z]{3}[A-Z\d])(\d)$/,
        validado = curp.match(re);
    
    if (!validado)  /*Coincide con el formato general?*/
        return false;
    
    /*Validar que coincida el dígito verificador*/
    function digitoVerificador(curp17) {
        /*Fuente https://consultas.curp.gob.mx/CurpSP/*/
        var diccionario  = "0123456789ABCDEFGHIJKLMNÑOPQRSTUVWXYZ",
            lngSuma      = 0.0,
            lngDigito    = 0.0;
        for(var i=0; i<17; i++)
            lngSuma= lngSuma + diccionario.indexOf(curp17.charAt(i)) * (18 - i);
        lngDigito = 10 - lngSuma % 10;
        if(lngDigito == 10)
            return 0;
        return lngDigito;
    }
    if (validado[2] != digitoVerificador(validado[1])) 
        return false;
        
    return true; 
}

/*Handler para el evento cuando cambia el input*/
/*Lleva la RFC a mayúsculas para validarlo*/
function validarRFC(input) {
    var rfc = input.value.toUpperCase(),
        resultado = document.getElementById("resRfc"),
        valido = "No válido";

    if(rfc=='')
            $('#resRfc').hide();
        else
            $('#resRfc').show();
        
    if (rfcValido(rfc)) { /* Acá se comprueba */
        valido = "Válido";
        resultado.classList.add("ok");
    } else {
        resultado.classList.remove("ok");
    }
        
    resultado.innerText = "RFC: " + rfc + "\nFormato: " + valido;
}

function validarRFCAutorizada(input) {
    var rfc = input.value.toUpperCase(),
        resultado = document.getElementById("resRfcAutorizada"),
        valido = "No válido";

    if(rfc=='')
            $('#resRfcAutorizada').hide();
        else
            $('#resRfcAutorizada').show();
        
    if (rfcValido(rfc)) { /* Acá se comprueba */
        valido = "Válido";
        resultado.classList.add("ok");
    } else {
        resultado.classList.remove("ok");
    }
        
    resultado.innerText = "RFC: " + rfc + "\nFormato: " + valido;
}

function validarRFCMoral(input) {
    var rfc = input.value.toUpperCase(),
        resultado = document.getElementById("resRfcMoral"),
        valido = "No válido";

    if(rfc=='')
            $('#resRfcMoral').hide();
        else
            $('#resRfcMoral').show();
        
    if (rfcValido(rfc)) { /* Acá se comprueba */        
        valido = "Válido";
        resultado.classList.add("ok");
    } else {
        resultado.classList.remove("ok");
    }
        
    resultado.innerText = "RFC Moral: " + rfc + "\nFormato: " + valido;
}

/*Función para validar un RFC*/
function rfcValido(rfc, aceptarGenerico = true) { 

    const re       = /^([A-ZÑ&]{3,4})?(\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\d|3[01]))?([A-Z\d]{2})([A\d])$/;
    var   validado = rfc.match(re);

    if (!validado)  /*Coincide con el formato general del regex?*/
        return false;

    /*Separar el dígito verificador del resto del RFC*/
    const digitoVerificador = validado.pop(),
          rfcSinDigito      = validado.slice(1).join(''),
          len               = rfcSinDigito.length,

    /*Obtener el digito esperado*/
          diccionario       = "0123456789ABCDEFGHIJKLMN&OPQRSTUVWXYZ Ñ",
          indice            = len + 1;
    var   suma,
          digitoEsperado;

    if (len == 12) suma = 0
    else suma = 481; /*Ajuste para persona moral*/

    for(var i=0; i<len; i++)
        suma += diccionario.indexOf(rfcSinDigito.charAt(i)) * (indice - i);
    digitoEsperado = 11 - suma % 11;
    if (digitoEsperado == 11) digitoEsperado = 0;
    else if (digitoEsperado == 10) digitoEsperado = "A";

    /*El dígito verificador coincide con el esperado?*/
    /*o es un RFC Genérico (ventas a público general)?*/
    if ((digitoVerificador != digitoEsperado)
     && (!aceptarGenerico || rfcSinDigito + digitoVerificador != "XAXX010101000"))
        return false;
    else if (!aceptarGenerico && rfcSinDigito + digitoVerificador == "XEXX010101000")
        return false;
    return rfcSinDigito + digitoVerificador;
}


function validarCorreo(input) {
    var correo = input.value,
        resultado = document.getElementById("resCorreo"),
        valido = "No válido";

        if(correo=='')
            $('#resCorreo').hide();
        else
            $('#resCorreo').show();

        if (isValidEmailAddress(correo)) { /* Acá se comprueba */        
            valido = "Válido";
            resultado.classList.add("ok");
        } else {
            resultado.classList.remove("ok");
        }

        resultado.innerText = "Correo: " + correo + "\nFormato: " + valido;
}

function isValidEmailAddress(emailAddress) {
    var pattern = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
    return pattern.test(emailAddress);
}