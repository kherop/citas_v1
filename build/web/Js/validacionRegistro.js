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

    // EventListener nombre
    nombre.addEventListener('input', function (e) {
        // Si es valido eliminamos el error
        if (nombre.validity.valid) {
            nombreError.innerHTML = '';
            nombreError.className = 'error';
        } else { // Si tiene un error lo mostramos
            mostrarNombreError();
        }
    });

    // EventListener apellido
    apellido.addEventListener('input', function (e) {
        // Si es valido eliminamos el error
        if (apellido.validity.valid) {
            apellidoError.innerHTML = '';
            apellidoError.className = 'error';
        } else { // Si tiene un error lo mostramos
            mostrarApellidoError();
        }
    });

    // EventListener genero
    genero.addEventListener('select', function (e) {
        // Si es valido eliminamos el error
        if (genero.Validity.valid) {
            generoError.innerHTML = '';
            generoError.className = 'error';
        } else { // Si tiene un error lo mostramos
            mostrarGeneroError();
        }
    });

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

    // EventListener tipoRelacion
    tipoRelacion.addEventListener('input', function (e) {
        // Si es valido eliminamos el error
        if (tipoRelacion.validity.valid) {
            tipoRelacionError.innerHTML = '';
            tipoRelacionError.className = 'error';
        } else { // Si tiene un error lo mostramos
            mostrarTipoRelacionError();
        }
    });

    // EventListener busca
    busca.addEventListener('input', function (e) {
        // Si es valido eliminamos el error
        if (busca.validity.valid) {
            buscaError.innerHTML = '';
            buscaError.className = 'error';
        } else { // Si tiene un error lo mostramos
            mostrarBuscaError();
        }
    });

    // EventListener hijos
    hijos.addEventListener('input', function (e) {
        // Si es valido eliminamos el error
        if (hijos.validity.valid) {
            hijosError.innerHTML = '';
            hijosError.className = 'error';
        } else { // Si tiene un error lo mostramos
            mostrarHijosError();
        }
    });

    // EvenListener para controlar el envio del formulario
    formulario.addEventListener('submit', function (event) {
        // Comprobamos que todos los campos son correcto para dejar enviar al formulario
        if (!nombre.validity.valid) {
            mostrarNombreError();
            event.preventDefault();
        }
        if (!apellido.validity.valid) {
            mostrarApellidoError();
            event.preventDefault();
        }
        if (!genero.validity.valid) {
            mostrarGeneroError();
            event.preventDefault();
        }
        if (!email.validity.valid) {
            mostrarEmailError();
            event.preventDefault();
        }
        if (!password.validity.valid) {
            mostrarPasswordError();
            event.preventDefault();
        }
        if (!tipoRelacion.validity.valid) {
            mostrarTipoRelacionError();
            event.preventDefault();
        }
        if (!busca.validity.valid) {
            mostrarBuscaError();
            event.preventDefault();
        }
        if (!hijos.validity.valid) {
            mostrarHijosError();
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

/* Con estos eventListener controlo la perdida de focus y cuando lo ganan para mostrar y quitar el error */
// Email
email.addEventListener("blur", function (e) {
    emailError.className = 'error';
    emailError.innerHTML = '';
}, true);

email.addEventListener("focus", function (e) {
    mostrarEmailError();
}, true);

// Password
password.addEventListener("blur", function (e) {
    passwordError.className = 'error';
    passwordError.innerHTML = '';
}, true);

password.addEventListener("focus", function (e) {
    mostrarPasswordError();
}, true);

// Nombre
nombre.addEventListener("blur", function (e) {
    nombreError.className = 'error';
    nombreError.innerHTML = '';
}, true);

nombre.addEventListener("focus", function (e) {
    mostrarNombreError();
}, true);

// Apellido
apellido.addEventListener("blur", function (e) {
    apellidoError.className = 'error';
    apellidoError.innerHTML = '';
}, true);

apellido.addEventListener("focus", function (e) {
    mostrarApellidoError();
}, true);

// Apellido, este listene arregla un bug que lo deja activo, si me la tiempo lo depurare
genero.addEventListener("blur", function (e) {
    generoError.className = 'error';
    generoError.innerHTML = '';
}, true);

/*
 * Para los select no hago el efecto de pone el mensaje al poner y quitar el 
 * focus porque queda muy incomodo para el usuario
 */