/*
 * Validación del formulario de login y personalización
 * de los mensajes de error
 */

// Variables
//
// Formulario
const formulario = document.getElementsByTagName('form')[0];

// Correo
const email = document.getElementById('email');
const emailError = document.getElementById('emailError');

// Password
const password = document.getElementById('password');
const passwordError = document.getElementById('passwordError');

/* ----------- Función para controlar la validación del formulario ---------- */
// Esta función se carga con la página y esta pendiente de informar al
// usuario si hay errores o no mientras interactua con el formulario
function validacion() {

    // EventListener email
    email.addEventListener('input', function (e) {
        // Si es valido eliminamos el error
        if (email.validity.valid) {
            emailError.innerHTML = '';
            emailError.className = 'error';
        } else { // Si tiene un error lo mostramos
            mostrarEmailError();
        }
    });

    // EventListener password
    password.addEventListener('input', function (e) {
        // Si es valido eliminamos el error
        if (password.validity.valid) {
            passwordError.innerHTML = '';
            passwordError.className = 'error';
        } else { // Si tiene un error lo mostramos
            mostrarPasswordError();
        }
    });

    // EvenListener para controlar el envio del formulario
    formulario.addEventListener('submit', function (event) {
        // Comprobamos que todos los campos son correcto para dejar enviar al formulario
        if (!email.validity.valid) {
            mostrarEmailError();
            event.preventDefault();
        }
        if (!password.validity.valid) {
            mostrarPasswordError();
            event.preventDefault();
        }
    });

}

// Función para mostrar los errores del email
function mostrarEmailError() {
    if (email.validity.valueMissing) {
        // Si el campo está vacío
        emailError.textContent = 'Debe introducir una dirección de correo electrónico.';
    } else if (email.validity.typeMismatch) {
        // Si el campo no contiene una dirección de correo electrónico
        emailError.textContent = 'El valor introducido debe ser una dirección de correo electrónico.';
    } else if (email.validity.tooShort) {
        // Si los datos son demasiado cortos
        emailError.textContent = 'El correo electrónico debe tener al menos ${ email.minLength } caracteres; ha introducido ${ email.value.length }.';
    }

    // Establece el estilo apropiado sino es valido
    if (!email.validity.valid) {
        emailError.className = 'error tooltip';
    }
}

// Función para mostrar los errores del password
function mostrarPasswordError() {
    if (password.validity.valueMissing) {
        // Si el campo está vacío
        passwordError.textContent = 'Debe introducir una contraseña.';
    } else if (password.validity.typeMismatch) {
        // Si los datos son demasiado cortos
        passwordError.textContent = '8-10 caracteres, debe tener un número, una letra mayuscula y una minuscula.';
    } else if (password.validity.tooShort) {
        // Si el campo no contiene una dirección de correo electrónico
        passwordError.textContent = '8-10 caracteres, debe tener un número, una letra mayuscula y una minuscula.';
    }
    
    // Establece el estilo apropiado sino es valido
    if (!password.validity.valid) {
        passwordError.className = 'error tooltip';
    }
}

/* Con estos eventListener controlo la perdida de focus y cuando lo ganan para mostrar y quitar el error */
// Email
email.addEventListener("blur", function(e) {
    emailError.className = 'error';
    emailError.innerHTML = '';
}, true);

email.addEventListener("focus", function(e) {
    mostrarEmailError();
}, true);

// Password
password.addEventListener("blur", function(e) {
    passwordError.className = 'error';
    passwordError.innerHTML = '';
}, true);

password.addEventListener("focus", function(e) {
    mostrarPasswordError();
}, true);

