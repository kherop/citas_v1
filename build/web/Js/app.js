// Cambio de imagen de perfil cuando se carga
function preview_img(event) {
    var url = new FileReader();
    url.onload = function () {
        var imagen = document.getElementById('img_perfil');
        imagen.style.backgroundImage = `url("${url.result}")`;
    };
    url.readAsDataURL(event.target.files[0]);
}