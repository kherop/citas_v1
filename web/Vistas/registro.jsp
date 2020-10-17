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
    <body onload="validacion()">
        <!-- Barra de navegación superior -->
        <nav>
            <a href="index.jsp">
                <img src="../Img/logo_blanco.png" class="logo-nav" alt="" loading="lazy">
            </a>
        </nav>

        <!-- Cuerpo de la página -->

        <div class="container justify-content-center">
            <section class="row">
                <article class="col login bg-red">
                    <!-- Logo formulario -->
                    <div>
                        <h1 class="display-3 text-white">Enhorabuena...</h1>
                        <p class="text-white">...estas a un paso de vivir grandes aventuras</p>
                    </div>
                    <hr class="hr-white">

                    <form name="acceso" action="Controladores/controlador_registro.jsp" enctype="multipart/form-data" method="POST" novalidate>
                        <!-- Datos personales -->
                        <!-- Imagen de perfil -->
                        <div class="relative d-flex">
                            <div class="img_perfil_reg" id="img_perfil"></div>
                            <input id="txt" type="text" value="Elige imagen de perfil" onclick="javascript:document.getElementById('file').click();">
                            <input id="file" type="file" style="visibility: hidden;" name="img_perfil" onchange="preview_img(event); cambiarTexto(this, 'txt');"/>
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
                        <!-- Sexo -->
                        <div class="relative">
                            <select class="custom-select" name="rol" required>
                                <option disabled selected>Selecciona tu genero</option>
                                <option value="usuario">Hombre</option>
                                <option value="administrador">Mujer</option>
                            </select>                        
                        </div>

                        <!-- Email -->
                        <div class="relative">
                            <input type="email" name="email" id="email" placeholder="Introduce tu correo" required aria-describedby="emailError"
                                   class="campo" minlength="5" maxlength="20" pattern="^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*">
                            <small id="emailError" aria-live="polite"></small>
                        </div>

                        <!-- Password -->
                        <div class="relative">
                            <input type="password" name="password" id="password" placeholder="Introduce tu contraseña" required aria-describedby="emailPassword"
                                   class="campo" minlength="2" maxlength="10" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,10}">
                            <small id="passwordError" aria-live="polite"></small>
                        </div>

                        <hr class="hr-white">

                        <!-- Interes -->
                        <h2 class="text-white">Intereses</h2>

                        <!-- Tipo de relación -->
                        <div class="relative">
                            <select class="custom-select" name="rol" required>
                                <option disabled selected>Que relación buscas</option>
                                <option value="usuario">Seria</option>
                                <option value="administrador">Amistad</option>
                            </select>                        
                        </div>

                        <!-- Hijos -->
                        <div class="relative">
                            <select class="custom-select" name="rol" required>
                                <option disabled selected>Hijos</option>
                                <option value="usuario">No quiero por el momento</option>
                                <option value="administrador">No tengo, pero no me importaría</option>
                                <option value="administrador">Si, tengo tengos</option>
                            </select>                        
                        </div>

                        <!-- Artísticos -->
                        <label for="artisticos" class="text-white">Artístico: (0 - 10) 5 Por defecto</label>
                        <input type="range" id="artisticos" name="artisticos" min="0" max="10">

                        <!-- Deportivos -->
                        <label for="deportivos" class="text-white">Deportivos: (0 - 10) 5 Por defecto</label>
                        <input type="range" id="deportivos" name="deportivos" min="0" max="10">

                        <!-- Políticos -->
                        <label for="politicos" class="text-white">Políticos: (0 - 10) 5 Por defecto</label>
                        <input type="range" id="politicos" name="politicos" min="0" max="10">

                        <input type="submit" class="btn" name="entrar_login" value="Entrar"/>

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
        <script src="../Js/validacionLogin.js"></script>
    </body>
</html>

