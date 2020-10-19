// Cambio de imagen de perfil cuando se carga
function preview_img(event) {
    var url = new FileReader();
    url.onload = function () {
        var imagen = document.getElementById('img_perfil');
        imagen.style.backgroundImage = `url("${url.result}")`;
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