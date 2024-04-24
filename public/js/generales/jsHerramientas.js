function clearForm(vidFormulario) {
    var vformulario = document.getElementById(vidFormulario);
    for (vj = 0; vj < vformulario.elements.length; vj++) {
        if (vformulario.elements[vj].type == "text") $('#' + vformulario.elements[vj].id).val('');
        if (vformulario.elements[vj].type == "select-one") $('#' + vformulario.elements[vj].id).val(0).trigger('change');
    }
}

function validaForm(vidFormulario) {
    limpiarCSS(vidFormulario);
    var vstatus = true;
    var vformulario = document.getElementById(vidFormulario);
    for (vj = 0; vj < vformulario.elements.length; vj++) {      
        if (vformulario.elements[vj].type == "text") {
            if ($('#' + vformulario.elements[vj].id).val() == '') {
                $('#' + vformulario.elements[vj].id).addClass("parsley-error focused");
                if (vstatus) {
                    $('#' + vformulario.elements[vj].id).focus();
                }
                vstatus = false;
            }
        }
        if (vformulario.elements[vj].type == "select-one") {
            if ($('#' + vformulario.elements[vj].id).val() == '0') {
                $('#' + vformulario.elements[vj].id).addClass("input-validation-error focused");
                if (vstatus) {
                    $('#' + vformulario.elements[vj].id).focus();
                }
                vstatus = false;
            }
        }
        if (vformulario.elements[vj].type == "file") {
            return vstatus;
        }
        if (vformulario.elements[vj].type == "password") {
            if ($('#' + vformulario.elements[vj].id).val() == '') {
                $('#v' + vformulario.elements[vj].id).addClass("parsley-error focused");
                if (vstatus) {
                    $('#' + vformulario.elements[vj].id).focus();
                }
                vstatus = false;
            }
        }
    }
    return vstatus;
}

function limpiarCSS(idFormulario) {
    var vformulario = document.getElementById(idFormulario);
    for (j = 0; j < vformulario.elements.length; j++) {
        if (vformulario.elements[j].type == "text") {
            if ($("#" + vformulario.elements[j].id).hasClass("parsley-error")) {
                $("#" + vformulario.elements[j].id).removeClass("parsley-error");
            }
            if ($("#" + vformulario.elements[j].id).hasClass("focused")) {
                $("#" + vformulario.elements[j].id).removeClass("focused");
            }
        } else if (vformulario.elements[j].type == "select-one") {
            if ($("#" + vformulario.elements[j].id).hasClass("input-validation-error")) {
                $("#" + vformulario.elements[j].id).removeClass("input-validation-error");
            }
            if ($("#" + vformulario.elements[j].id).hasClass("focused")) {
                $("#" + vformulario.elements[j].id).removeClass("focused");
            }
        }
    }
}

