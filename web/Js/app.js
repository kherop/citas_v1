// Cambio de texto en la caja de seleccion de la imagen de perfil
function cambiarTexto(oFileInput, sTargetID) {
    document.getElementById(sTargetID).value = oFileInput.value;
}


// Cambio de imagen de perfil cuando se carga
function preview_img(event) {
    var url = new FileReader();
    url.onload = function () {
        var imagen = document.getElementById('img_perfil');
        imagen.style.backgroundImage = `url("${url.result}")`;
    };
    url.readAsDataURL(event.target.files[0]);
}