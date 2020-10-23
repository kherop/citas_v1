<%-- 
    Document   : home
    Created on : 16-oct-2020, 9:22:11
    Author     : luis
--%>

<%@page import="Modelos.AmigoDAO"%>
<%@page import="Modelos.AmigoDAO"%>
<%@page import="java.util.Map"%>
<%@page import="Modelos.InteresesDAO"%>
<%@page import="Modelos.Intereses"%>
<%@page import="Modelos.Intereses"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Modelos.Persona"%>
<%@page import="Modelos.PersonaDAO"%>
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
                // Recupero los datos del remitente
                String email = (String) session.getAttribute("emailUsuario");
                Persona usuario = PersonaDAO.obtenerPersonaSegura(email);

                // Recupero los datos del destinatario
                int idDestinatario = (int) session.getAttribute("idDestinatario");
                Persona usuarioDest = PersonaDAO.obtenerPersonaSeguraID(idDestinatario);

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

            <!-- Cuerpo de la pagina -->
            <div class="container w-100 m-0">

                <section class="row flex-grow-1 home-flex">
                    <!-- Menu lateral -->
                    <aside class="col m-0 menu-collapse" id="menu-lateral">
                        <!-- Boton menu -->
                        <button class="btn-aside" onclick="ctrlMenuLateral()">
                            <i class="material-icons">menu</i>
                        </button>
                        <hr class="hr-white mb-0">
                        <!-- Imagen de usuario -->
                        <div class="img_perfil_aside">
                            <img src="../Img/Perfil/<%=usuario.getImgPerfil()%>">
                        </div>                    
                        <hr class="hr-white mb-0">

                        <!-- Nombre usuario -->
                        <p class="p-1"><%=usuario.getNombre()%> <%=usuario.getApellido()%></p>
                        <hr class="hr-white mb-0">
                        <!-- Menu -->
                        <ul>
                            <li>
                                <a href="../Controladores/controlador_global.jsp?opc=1"  class="relative">
                                    <i class="material-icons">house_siding</i>
                                    <span>Perfil</span>
                                </a>
                            </li>
                            <li>
                                <a href="perfil.jsp"  class="relative">
                                    <i class="material-icons">face</i>
                                    <span>Perfil</span>
                                </a>
                            </li>
                            <li>
                                <a href="amigos.jsp"  class="relative">
                                    <i class="material-icons">people_outline</i>
                                    <span>Amigos</span>
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

                    <!-- Contenido de la pagina -->

                    <div class="container justify-content-center">

                        <section class="row">
                            <article class="col login bg-red border-radius">
                                <!-- Logo formulario -->
                                <div>
                                    <h1 class="display-3 text-white">Enviar mensaje a: <%=usuarioDest.getNombre()%></h1>
                                </div>
                                <hr class="hr-white">

                                <form name="registro" action="../Controladores/controlador_enviar_mensaje.jsp" enctype="multipart/form-data" method="POST" novalidate>

                                    <!-- Asunto -->
                                    <div class="relative">
                                        <input type="text" name="asunto" id="Asunto" placeholder="Asunto" required class="campo" minlength="3" maxlength="20">
                                    </div>

                                    <!-- Mensaje -->
                                    <div class="relative">
                                        <textarea name="textarea">Mensaje...</textarea>
                                    </div>

                                    <div class="relative">
                                        <input id="txt" type = "text" value = "Selecciona un archivo" onclick ="javascript:document.getElementById('file').click();">
                                        <input id="file" type="file" name="archivo" onchange="cambiarTexto(this, 'txt');"/>
                                    </div>
                                    <hr class="hr-white">

                                    <input type="submit" class="btn" name="registro" value="Enviar"/>

                                </form>
                                <hr class="hr-white">

                                <!-- Enlace para volver -->
                                <a href="home.jsp" class="a a-white">Volver</a>

                            </article>
                        </section>
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