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

file.addEventListener('change', function() {  
  preview.src = URL.createObjectURL(this.files[0]);
}, false);

