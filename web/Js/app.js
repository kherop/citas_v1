// Cambio de imagen de perfil cuando se carga
function previewImg(event) {
    let url = new FileReader();
    url.onload = function () {
        let imagen = document.getElementById('img_perfil');
        imagen.style.backgroundImage = `url("${url.result}")`;
    };
    url.readAsDataURL(event.target.files[0]);
}

// Mostrar de fondo la imagen que viene de la BDD
function imgDefault(id, url){
    let imagen = document.getElementById(id);
    imagen.style.backgroundImage = `url("../Img/Perfil/${url}")`;
};

// Funcion para collapsar y expandir el menu lateral
function ctrlMenuLateral() {
    const menu = document.getElementById('menu-lateral');
    // Cambio la clase del menu
    menu.classList.toggle('menu-collapse');
    menu.classList.toggle('menu-expand');
}

