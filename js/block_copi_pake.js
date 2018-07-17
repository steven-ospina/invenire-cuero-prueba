window.onload = function(e) {
    var myInput = document.getElementById('TextBox1');
	myInput.onpaste = function(e) { //prohibe pegar
		e.preventDefault();
		alert("esta acción está prohibida");
	}
	
	myInput.oncopy = function(e) {
		e.preventDefault();
		alert("esta acción está prohibida"); //prohibe copiar
    }

    myInput.oncut = function (e) {
        e.preventDefault();
        alert("esta acción está prohibida"); //prohibe cortar
    }
}