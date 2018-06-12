     //solo numeros

    function numbersonly(e) {
        var unicode = e.charCode ? e.charCode : e.keyCode
        if (unicode != 8 && unicode != 44) {
            if (unicode < 48 || unicode > 57) //if not a number
            { return false } //disable key press    
        }
    }