/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var code = '';
let btn = document.getElementById('btnEnvio'); // boton envio

function captcha() {

    let tipoOperacion = Math.floor((Math.random() * 3) + 1); // Número entre 1 y 3 para ver el tipo de operacion, no hago división
    let num1= Math.floor((Math.random() * 5) + 1); // Primer numero entre 1 y 5
    let num2 = Math.floor((Math.random() * 5) + 1); // Segundo numero numero entre 1 y 5
    let signo;
    let resultado;

    // Evaluo y realizo la operación
    switch (tipoOperacion) {
        case 1: // Suma
            resultado = num1 + num2;
            signo = '+';
            break;
        case 2: // Resta
            if (num1 > num2) {
                resultado = num1 - num2;
            } else {
                var aux = num2;
                num2 = num1;
                num1 = aux;
                resultado = num1 - num2;
            }
            signo = '-'
            break;
        case 3: // Multiplicacion
            resultado = num1 * num2;
            signo = 'x';
        default:
            break;
    }
    code = num1 + ' '  + signo + ' ' + num2;
    crearCookie('codigo', resultado, 120000);
    creaIMG(code);
}


function validCaptcha(txtInput) {
    var string1 = removeSpaces(leerCookie('codigo'));
    var string2 = removeSpaces(document.getElementById(txtInput).value);
   
    if (string1 === string2) {
        document.getElementById("btnEnvio").disabled = false;
        return true;
    }
    else {
        console.log('true');
        captcha();
        return false;
    }
}
function removeSpaces(string) {
    return string.split(' ').join('');
}

function creaIMG(texto) {
    var ctxCanvas = document.getElementById('captcha').getContext('2d');
    var fontSize = "30px";
    var fontFamily = "Arial";
    var width = 85;
    var height = 50;
    //tamaño
    ctxCanvas.canvas.width = width;
    ctxCanvas.canvas.height = height;
    //color de fondo
    ctxCanvas.fillStyle = "#fff";
    ctxCanvas.fillRect(0, 0, width, height);
    //puntos de distorsión
    ctxCanvas.setLineDash([7, 10]);
    ctxCanvas.lineDashOffset = 5;
    ctxCanvas.beginPath();
    var line;
    for (var i = 0; i < (width); i++) {
        line = i * 5;
        ctxCanvas.moveTo(line, 0);
        ctxCanvas.lineTo(0, line);
    }
    ctxCanvas.stroke();
    //formato texto
    ctxCanvas.direction = 'ltr';
    ctxCanvas.font = fontSize + " " + fontFamily;
    //texto posicion
    var x = (width / 9);
    var y = (height / 3) * 2;
    //color del borde del texto
    ctxCanvas.strokeStyle = "yellow";
    ctxCanvas.strokeText(texto, x, y);
    //color del texto
    ctxCanvas.fillStyle = "red";
    ctxCanvas.fillText(texto, x, y);
}

// Funcion para crear una cookies
function crearCookie(nombre, valor, exsegun) {
    var d = new Date();
    d.setTime(d.getTime() + (exsegun));
    var expires = "expires=" + d.toUTCString();
    document.cookie = nombre + "=" + valor + ";" + expires;
}

// Funcion para leer una cookies
function leerCookie(nombre) {
    var name = nombre + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}