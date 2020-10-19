<%-- 
    Document   : perfil
    Created on : 19-oct-2020, 21:17:54
    Author     : luis
--%>

<%@page import="Modelos.PersonaDAO"%>
<%@page import="Modelos.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <!-- Carga archivos CSS -->
        <link type="text/css" rel="stylesheet" href="../Css/app.css"/>
        <!-- Material icons -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
    </head>
    <html lang="es">
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Inicio</title>
            <!-- Carga archivos CSS -->
            <link type="text/css" rel="stylesheet" href="../Css/app.css"/>
            <!-- Material icons -->
            <link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
        </head>
        <body class="bg-fixed">

            <%
                // Recupero el email de la sesion
                String email = (String) session.getAttribute("emailUsuario");
                // Recupero los datos de usuario de la base de datos
                Persona usuario = PersonaDAO.obtenerPersonaSegura(email);
            %>

            <!-- Barra de navegación superior -->
            <nav class="d-flex justify-content-space-between align-items-center">
                <a href="home.jsp">
                    <img src="../Img/logo_blanco.png" class="logo-nav" alt="" loading="lazy">
                </a>
                <ul class="d-flex">
                    <li>
                        <a href="#"  class="relative">
                            <i class="material-icons">mail_outline</i>
                            <span class="mensaje_info">3</span>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="relative">
                            <i class="material-icons">people_outline</i>
                            <span class="mensaje_info">14</span>
                        </a>

                    </li>
                    <li>
                        <a href="#"><i class="material-icons">exit_to_app</i></a>
                    </li>
                </ul>
            </nav>

            <!-- Menú lateral -->
            <div class="container w-100 m-0">
                <section class="row flex-grow-1 home-flex">
                    <aside class="col m-0 menu-collapse" id="menu-lateral">
                        <!-- Boton menu -->
                        <button class="btn-aside" onclick="ctrlMenuLateral()">
                            <i class="material-icons">menu</i>
                        </button>
                        <hr class="hr-white mb-0">
                        <!-- Imagen de usuario -->
                        <div class="img_perfil_home" id="img_perfil_home"></div>
                        <hr class="hr-white mb-0">
                        <!-- Nombre usuario -->
                        <p class="p-1"><%=usuario.getNombre()%> <%=usuario.getApellido()%></p>

                        <hr class="hr-white mb-0">
                        <!-- Menu -->
                        <ul>
                            <li>
                                <a href="perfil.jsp"  class="relative">
                                    <i class="material-icons">people_outline</i>
                                    <span>Perfil</span>
                                </a>
                            </li>
                            <li>
                                <a href="mensajes.jsp" class="relative">
                                    <i class="material-icons">mail_outline</i>
                                    <span>Mensajes</span>
                                </a>
                            </li>
                            <li>
                                <a href="administrar.jsp" class="relative">
                                    <i class="material-icons">edit</i>
                                    <span>Administrar</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="material-icons">exit_to_app</i>
                                    <span>Salir</span>
                                </a>
                            </li>
                        </ul>
                    </aside>

                    <!-- Perfil e intereses del usuario -->
                    <div class="col m-0 d-flex justify-content-center align-items-center flex-direction-column relative">

                        <article class="w-60 tarjeta">
                            <form name="modificar_datos_personales" action="../Controladores/controlador_registro.jsp" enctype="multipart/form-data" method="POST" novalidate>
                                <!-- Datos personales -->
                                <!-- Imagen de perfil -->
                                <div class="relative d-flex align-items-center">
                                    <div class="img_perfil_reg" id="img_perfil"></div>
                                    <input id="txt" type = "text" value = "Selecciona imagen de perfil" onclick ="javascript:document.getElementById('file').click();">
                                    <input id="file" type="file" name="img_perfil"  onload="img_default()" onchange="preview_img(event);"/>
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

                                <input type="submit" class="btn" name="modificar_datos_personales" value="Guardar datos"/>

                            </form>
                        </article>
                        <article class="w-60 tarjeta">
                            <form name="preferencias" action="../Controladores/controlador_registro.jsp" enctype="multipart/form-data" method="POST" novalidate>
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

                                <input type="submit" class="btn" name="modificar_preferencias" value="Guardar datos"/>

                            </form>
                        </article>

                    </div>
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