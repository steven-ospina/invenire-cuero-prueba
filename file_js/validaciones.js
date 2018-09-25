     //solo numeross

function blocklet(e) {
    key = e.keyCode || e.which;
    especiales = "8-37-39-46";
        var unicode = e.charCode ? e.charCode : e.keyCode
        if (unicode != 8 && unicode != 43) {
            if (unicode < 48 || unicode > 57) //if not a number
            { return false } //disable key press    
        }

        tecla_especial = false
        for (var i in especiales) {
            if (key == especiales[i]) {
                tecla_especial = true;
                break;
            }
        }
    }

//solo letras
function blocknum(e){
    key = e.keyCode || e.which;
    especiales = "8-37-39-46";
       tecla = String.fromCharCode(key).toLowerCase();
       letras = " �����abcdefghijklmn�opqrstuvwxyz,";


       tecla_especial = false
       for(var i in especiales){
            if(key == especiales[i]){
                tecla_especial = true;
                break;
            }
        }

        if(letras.indexOf(tecla)==-1 && !tecla_especial){
            return false;
        }
    }