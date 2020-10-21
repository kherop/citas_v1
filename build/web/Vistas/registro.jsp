<%-- 
    Document   : registro
    Created on : 13-oct-2020, 11:49:41
    Author     : luis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <!-- Carga archivos CSS -->
        <link type="text/css" rel="stylesheet" href="../Css/app.css"/>
    </head>
    <body onload="validacion(); captcha()">
        <!-- Barra de navegación superior -->
        <nav>
            <a href="../index.jsp">
                <img src="../Img/logo_blanco.png" class="logo-nav" alt="" loading="lazy">
            </a>
        </nav>

        <!-- Cuerpo de la página -->

        <div class="container justify-content-center">
            <section class="row">
                <article class="col login bg-red border-radius">
                    <!-- Logo formulario -->
                    <div>
                        <h1 class="display-3 text-white">Enhorabuena...</h1>
                        <p class="text-white">...estas a un paso de vivir grandes aventuras</p>
                    </div>
                    <hr class="hr-white">

                    <form name="registro" action="../Controladores/controlador_registro.jsp" enctype="multipart/form-data" method="POST" novalidate>
                        <!-- Datos personales -->
                        <!-- Imagen de perfil -->
                        <div class="relative d-flex align-items-center">
                            <div class="img_perfil_aside m-1">
                                <img src="../Img/Perfil/dAPJ.png" id="imgPerfil">
                            </div>
                            <input id="txt" type = "text" value = "Selecciona imagen de perfil" onclick ="javascript:document.getElementById('file').click();">
                            <input id="file" type="file" name="img_perfil" onchange="previewImg(event);"/>
                        </div>

                        <!-- Nombre -->
                        <div class="relative">
                            <input type="text" name="nombre" id="nombre" placeholder="Introduce tu nombre" required aria-describedby="nombreError"
                                   class="campo" minlength="3" maxlength="20" pattern="[A-Z]{1}[a-z]+">
                            <small id="nombreError" aria-live="polite"></small>
                        </div>

                        <!-- Apellidos -->
                        <div class="relative">
                            <input type="text" name="apellido" id="apellido" placeholder="Introduce tu apellido" required aria-describedby="apellidoError"
                                   class="campo" minlength="3" maxlength="20" pattern="[A-Z]{1}[a-z]+">
                            <small id="apellidoError" aria-live="polite"></small>
                        </div>

                        <!-- Genero -->
                        <div class="relative">
                            <select name="genero" id="genero" required aria-describedby="generoError">
                                <option value="" disabled selected>Selecciona tu genero</option>
                                <option value="hombre">Hombre</option>
                                <option value="mujer">Mujer</option>
                            </select>
                            <small id="generoError" aria-live="polite"></small>
                        </div>

                        <!-- Email -->
                        <div class="relative">
                            <input type="email" name="email" id="email" placeholder="Introduce tu correo" required aria-describedby="emailError"
                                   class="campo" minlength="5" maxlength="20" pattern="^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*">
                            <small id="emailError" aria-live="polite"></small>
                        </div>

                        <!-- Password -->
                        <div class="relative">
                            <input type="password" name="password" id="password" placeholder="Introduce tu contraseña" required aria-describedby="passwordError"
                                   class="campo" minlength="2" maxlength="10" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,10}">
                            <small id="passwordError" aria-live="polite"></small>
                        </div>

                        <hr class="hr-white">

                        <!-- Interes -->
                        <h2 class="text-white">Intereses</h2>

                        <!-- Tipo de relación -->
                        <div class="relative">
                            <select name="tipoRelacion" id="tipoRelacion" required aria-describedby="tipoRelacion">
                                <option value="" disabled selected>Que relación buscas</option>
                                <option value="seria">Seria</option>
                                <option value="amistad">Amistad</option>
                            </select>
                            <small id="tipoRelacionError" aria-live="polite"></small>
                        </div>

                        <!-- Interesado en -->
                        <div class="relative">
                            <select name="busca" id="busca" required aria-describedby="buscaError">
                                <option value="" disabled selected>Te interesan</option>
                                <option value="chicos">Chicos</option>
                                <option value="chicas">Chicas</option>
                                <option value="daIgual">Me da igual</option>
                            </select>
                            <small id="buscaError" aria-live="polite"></small>
                        </div>

                        <!-- Hijos -->
                        <div class="relative">
                            <select name="hijos" id="hijos" required aria-describedby="hijosError">
                                <option value="" disabled selected>Hijos</option>
                                <option value="no">No quiero por el momento</option>
                                <option value="noImp">No tengo, pero no me importaría</option>
                                <option value="si">Si, tengo tengos</option>
                            </select>      
                            <small id="hijosError" aria-live="polite"></small>

                        </div>

                        <!-- Artísticos -->
                        <label for="artisticos" class="text-white">Artístico: (0 - 10) Por defecto 5</label>
                        <input type="range" id="artisticos" name="artisticos" min="0" max="10">

                        <!-- Deportivos -->
                        <label for="deportivos" class="text-white">Deportivos: (0 - 10)Por defecto 5</label>
                        <input type="range" id="deportivos" name="deportivos" min="0" max="10">

                        <!-- Políticos -->
                        <label for="politicos" class="text-white">Políticos: (0 - 10)Por defecto 5</label>
                        <input type="range" id="politicos" name="politicos" min="0" max="10">
                        
                        <!-- Captcha -->
                        <div class="relative captcha">
                            <canvas id="captcha"></canvas>
                            <br>
                            <input type="button" class="btn btn-dark w-auto" id="refresh" value="Refrescar" onclick="captcha();"/>
                            <input type="text" class="input w-auto" id="txtInput" placeholder="Introduce el texto para hablitar el envio">
                            <input id="button1" class="btn btn-dark w-auto" type="button" value="Validar" onclick="validCaptcha('txtInput');"/>
                        </div>
                        <input type="submit" class="btn" name="registro" value="Registrar" id="btnEnvio" disabled="true"/>


                    </form>
                    <hr class="hr-white">

                    <!-- Enlace para volver -->
                    <a href="../index.jsp" class="a a-white">Volver</a>

                </article>
            </section>
        </div>

        <!-- Footer -->
        <footer>
            <div>© 2020 Copyright:
                <a href="https://luisquesadadesign.com" class="a a-red"> Luis Quesada Design</a>
            </div>
        </footer>

        <!-- Carga archivos JS -->
        <script src="../Js/app.js"></script>
        <script src="../Js/validacionRegistro.js"></script>
        <script src="../Js/captchaNumerico.js"></script>
    </body>
</html>

