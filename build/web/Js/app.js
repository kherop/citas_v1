// Cambio de imagen de perfil cuando se carga
function previewImg(event) {
    let url = new FileReader();
    url.onload = function () {
        let imagen = document.getElementById('imgPerfil');
        imagen.src = url.result;
    };
    url.readAsDataURL(event.target.files[0]);
}

// Funcion para collapsar y expandir el menu lateral
function ctrlMenuLateral() {
    const menu = document.getElementById('menu-lateral');
    // Cambio la clase del menu
    menu.classList.toggle('menu-collapse');
    menu.classList.toggle('menu-expand');
}

var file = document.getElementById('file');
var preview = document.getElementById('preview');

file.addEventListener('change', function () {
    preview.src = URL.createObjectURL(this.files[0]);
}, false);


// Funcion para cambiar indicar al usuario que ha subido un archivo en el mensaje
function cambiarTexto(oFileInput, sTargetID) {

    document.getElementById(sTargetID).value = "Archivo seleccionado";
}

