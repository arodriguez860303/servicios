$(document).on('change','input[type="file"]',function(){

	var fileName = this.files[0].name;
	var fileSize = this.files[0].size;

    if(fileSize>0)
        this.classList.add("uploadedFile");

	if(fileSize > 10000000){
        this.classList.remove("uploadedFile");
		swal({
            title: "¡ Advertencia !",
            content: {
                element: 'p',
                attributes: {
                    innerHTML: "El archivo no debe superar los 10 MB.",
                },
            },
            icon: "warning",
            showConfirmButton: false,
            timer: 1500
        });

		this.value = '';
		this.files[0].name = '';
	}else{

		// recuperamos la extensión del archivo
		var ext = fileName.split('.').pop();
		// Convertimos en minúscula porque 
		// la extensión del archivo puede estar en mayúscula
		ext = ext.toLowerCase();
    
        switch(parseInt($('#id_documento').val()))
        {
            case 1: 
            case 5: 
                if(ext != 'jpg' && ext != 'jpeg' && ext != 'png')
                {
                    this.classList.remove("uploadedFile");
                    swal({
                        title: "¡ Advertencia !",
                        content: {
                            element: 'p',
                            attributes: {
                                innerHTML: "Solo se permite archivos de imagen.",
                            },
                        },
                        icon: "warning",
                        showConfirmButton: false,
                        timer: 1500
                    });
                    this.value = ''; // reset del valor
                    this.files[0].name = '';
                }
                
            break;

            case 2: 
            case 3: 
            case 4: 
            case 6:
            case 7:  
                if(ext != 'pdf')
                {
                    this.classList.remove("uploadedFile");
                    swal({
                        title: "¡ Advertencia !",
                        content: {
                            element: 'p',
                            attributes: {
                                innerHTML: "Solo se permite archivos PDF.",
                            },
                        },
                        icon: "warning",
                        showConfirmButton: false,
                        timer: 1500
                    });
                    this.value = ''; // reset del valor
                    this.files[0].name = '';
                }
            break;
        }
	}
});

function validaFile() {   
        var status = 0;
        const sizes = [];
        document.querySelectorAll("#frmEnviar input").forEach(el => {
      
            if (el.type !== "file") return;
            if (!el.files[0]) return sizes.push({
                size: "0",
                elem: el
            });
            let _size = el.files[0].size;
            let fSExt = new Array('Bytes', 'KB', 'MB', 'GB'),
                i = 0;
            while (_size > 900) {
                _size /= 1024;
                i++;
            }
            let exactSize = (Math.round(_size * 100) / 100) + ' ' + fSExt[i];
            sizes.push({
                size: exactSize,
                elem: el
            });
        });
        sizes.forEach(el => {
        
            if (el.size === "0") {

                if (el.elem.getAttribute("data-required")) {
                    el.elem.classList.add("needsValidation");
                    status = 1;
                }
            }
            else
                el.elem.classList.remove("needsValidation");
        });

    return status;   
}