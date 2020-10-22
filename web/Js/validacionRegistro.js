/*
 * Validación del formulario de login y personalización
 * de los mensajes de error
 */

// Variables
//
// Formulario
const formulario = document.getElementsByTagName('form')[0];

// Nombre
const nombre = document.getElementById('nombre');
const nombreError = document.getElementById('nombreError');

// Apellido
const apellido = document.getElementById('apellido');
const apellidoError = document.getElementById('apellidoError');

// Genero
const genero = document.getElementById('genero');
const generoError = document.getElementById('generoError');

// Tipo de relacion
const tipoRelacion = document.getElementById('tipoRelacion');
const tipoRelacionError = document.getElementById('tipoRelacionError');

// Busca
const busca = document.getElementById('busca');
const buscaError = document.getElementById('buscaError');

// Hijos
const hijos = document.getElementById('hijos');
const hijosError = document.getElementById('hijosError');

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

    /* Con estos eventListener controlo la perdida de focus y cuando lo ganan para mostrar y quitar el error */
    // Email
    email.addEventListener("blur", function (e) {
        emailError.className = 'error';
        emailError.innerHTML = '';
    }, true);

    email.addEventListener("focus", function (e) {
        mostrarEmailError();
        quitarError(emailError);

    }, true);

    // Password
    password.addEventListener("blur", function (e) {
        passwordError.className = 'error';
        passwordError.innerHTML = '';
    }, true);

    password.addEventListener("focus", function (e) {
        mostrarPasswordError();
        quitarError(passwordError);

    }, true);

    // Nombre
    nombre.addEventListener("blur", function (e) {
        nombreError.className = 'error';
        nombreError.innerHTML = '';
    }, true);

    nombre.addEventListener("focus", function (e) {
        mostrarNombreError();
        quitarError(nombreError);

    }, true);

    // Apellido
    apellido.addEventListener("blur", function (e) {
        apellidoError.className = 'error';
        apellidoError.innerHTML = '';
    }, true);

    apellido.addEventListener("focus", function (e) {
        mostrarApellidoError();
        quitarError(apellidoError);

    }, true);

    // Este listene arregla un bug que lo deja activo, si me la tiempo lo depurare
    genero.addEventListener("blur", function (e) {
        generoError.className = 'error';
        generoError.innerHTML = '';
    }, true);

    // EvenListener para controlar el envio del formulario
    formulario.addEventListener('submit', function (event) {
        // Comprobamos que todos los campos son correcto para dejar enviar al formulario
        if (!nombre.validity.valid) {
            mostrarNombreError();
            quitarError(nombreError);
            event.preventDefault();
        }
        if (!apellido.validity.valid) {
            mostrarApellidoError();
            quitarError(apellidoError);
            event.preventDefault();
        }
        if (!genero.validity.valid) {
            mostrarGeneroError();
            quitarError(generoError);
            event.preventDefault();
        }
        if (!email.validity.valid) {
            mostrarEmailError();
            quitarError(emailError);
            event.preventDefault();
        }
        if (!password.validity.valid) {
            mostrarPasswordError();
            quitarError(passwordError);
            event.preventDefault();
        }
        if (!tipoRelacion.validity.valid) {
            mostrarTipoRelacionError();
            quitarError(tipoRelacionError);
            event.preventDefault();
        }
        if (!busca.validity.valid) {
            mostrarBuscaError();
            quitarError(buscaError);
            event.preventDefault();
        }
        if (!hijos.validity.valid) {
            mostrarHijosError();
            quitarError(hijosError);
            event.preventDefault();
        }
    });

}

// Función para mostrar los errores del nombre
function mostrarNombreError() {
    if (nombre.validity.valueMissing) {
        // Si el campo está vacío
        nombreError.textContent = 'Introduzca su nombre por favor.';
    } else if (nombre.validity.typeMismatch) {
        // Si el campo no contiene un nombre valido
        nombreError.textContent = 'Debe introducir un nombre valido';
    } else if (nombre.validity.tooShort) {
        // Si los datos son demasiado cortos
        nombreError.textContent = `El nombre debe tener al menos ${ nombre.minLength } caracteres.`;
    } else if (nombre.validity.patternMismatch) {
        // No coincide con el patron
        nombreError.textContent = `El nombre debe empezar con mayusculas seguida de minusculas y no terminar en espacios`;
    }
    // Establece el estilo apropiado sino es valido
    if (!nombre.validity.valid) {
        nombreError.className = 'error tooltip';
    }
}

// Función para mostrar los errores del apellido
function mostrarApellidoError() {
    if (apellido.validity.valueMissing) {
        // Si el campo está vacío
        apellidoError.textContent = 'Introduzca su apellido por favor.';
    } else if (apellido.validity.typeMismatch) {
        // Si el campo no contiene un apellido valido
        apellidoError.textContent = 'Debe introducir un apellido valido';
    } else if (apellido.validity.tooShort) {
        // Si los datos son demasiado cortos
        apellidoError.textContent = `El apellido debe tener al menos ${ nombre.minLength } caracteres.`;
    } else if (apellido.validity.patternMismatch) {
        // No coincide con el patron
        apellidoError.textContent = `El apellido debe empezar con mayusculas seguida de minusculas y no terminar en espacios`;
    }
    // Establece el estilo apropiado sino es valido
    if (!apellido.validity.valid) {
        apellidoError.className = 'error tooltip';
    }
}

// Función para mostrar los errores del genero
function mostrarGeneroError() {
    if (genero.validity.valueMissing) {
        // Si el campo está vacío
        generoError.textContent = 'Debe seleccionar un genero.';
    }
    // Establece el estilo apropiado sino es valido
    if (!genero.validity.valid) {
        generoError.className = 'error tooltip';
    }
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
    } else if (password.validity.patternMismatch) {
        // Si los datos son demasiado cortos
        passwordError.textContent = '8-10 caracteres, un simbolo, una letra mayuscula y una minuscula.';
    } else if (password.validity.tooShort) {
        // Si el campo no contiene una dirección de correo electrónico
        passwordError.textContent = '8-10 caracteres, un simbolo, una letra mayuscula y una minuscula.';
    }

    // Establece el estilo apropiado sino es valido
    if (!password.validity.valid) {
        passwordError.className = 'error tooltip';
    }
}

// Función para mostrar errores del tipo de relacion
function mostrarTipoRelacionError() {
    if (tipoRelacion.validity.valueMissing) {
        // Si el campo está vacío
        tipoRelacionError.textContent = 'Debe seleccionar un tipo de relacion.';
    }
    // Establece el estilo apropiado sino es valido
    if (!tipoRelacion.validity.valid) {
        tipoRelacionError.className = 'error tooltip';
    }
}

// Función para mostrar errores de lo que busca
function mostrarBuscaError() {
    if (busca.validity.valueMissing) {
        // Si el campo está vacío
        buscaError.textContent = 'Debe seleccionar que tipo de relacion estas buscando.';
    }
    // Establece el estilo apropiado sino es valido
    if (!busca.validity.valid) {
        buscaError.className = 'error tooltip';
    }
}

// Función para mostrar errores de los hijos
function mostrarHijosError() {
    if (hijos.validity.valueMissing) {
        // Si el campo está vacío
        hijosError.textContent = 'Debe seleccionar si tienes hijos o no.';
    }
    // Establece el estilo apropiado sino es valido
    if (!hijos.validity.valid) {
        hijosError.className = 'error tooltip';
    }
}

// Funcion para eliminar el error al segundo y medio de hacer focus y no molestar al usuario
function quitarError(campo) {
    setTimeout(function () {
        campo.className = 'error';
        campo.innerHTML = '';
    }, 1500);

}