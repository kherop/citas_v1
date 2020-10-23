<%-- 
    Document   : amigos
    Created on : 23-oct-2020, 21:16:11
    Author     : luis
--%>

<%@page import="Modelos.ArchivoMensaje"%>
<%@page import="Modelos.ArchivoMensajeDAO"%>
<%@page import="Auxiliar.Constantes"%>
<%@page import="Modelos.AsignacionRolesDAO"%>
<%@page import="Modelos.Mensaje"%>
<%@page import="Modelos.MensajeDAO"%>
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
        <title>amigos</title>
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
                // Recupero el usuario de forma segura sin password
                Persona usuario = PersonaDAO.obtenerPersonaSegura(email);
                // Recupero los mensajes
                LinkedList<Mensaje> mensajesRecibidos = MensajeDAO.obtenerMensajes(email);
                // Recupero el rol de usuario
                // Recupero el rol y lo guardo en la sesion
                int idUsuarioRol = PersonaDAO.obtenerID(email);
                int rolUsuario = AsignacionRolesDAO.comprobarRol(idUsuarioRol);
                session.setAttribute("rolUsuario", rolUsuario);

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
                        <a href="../Controladores/controlador_global.jsp?opc=2"><i class="material-icons">exit_to_app</i></a>
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
                            <%
                                // Si es administrador habilito la administracion
                                if (rolUsuario == 1) {
                            %>
                            <li>
                                <a href="administrar.jsp" class="relative">
                                    <i class="material-icons">edit</i>
                                    <span>Administrar</span>
                                </a>
                            </li>
                            <%
                                }

                            %>
                        </ul>
                    </aside>

                    <!-- Contenido de la pagina -->

                    <!-- Solicitudes enviadas si las hay -->
                    <div class="container">

                        <%                            // Tiene solicitudes recibidas las muestro
                            if (mensajesRecibidos != null) {

                        %>

                        <div class="row text-align-center">
                            <div class="col">
                                <h1>Mensajes recibidos (Me he quedado desarrollando por aqui, deja responder, pero no soy capaz de mostrar el archivo adjunto, creo que esta protegida la ruta)</h1>
                            </div>
                        </div>

                        <div class="row flex-wrap">
                            <%                                
                                for (Mensaje mensaje : mensajesRecibidos) {
                                    Persona remitente = PersonaDAO.obtenerPersonaSeguraID(mensaje.getIdRemitente());
                                    ArchivoMensaje archivo = ArchivoMensajeDAO.obtenerArchivo(mensaje.getIdMensaje());
                            %>
                            <article class=" col tarjeta tarjeta-mini">

                                <p>Mensaje de:</p>
                                <h3 class="text-align-center mb-1"><%=remitente.getNombre()%> <%=remitente.getApellido()%></h3>
                                <hr class="hr-red-dark">
                                <p>Asunto: <%=mensaje.getAsunto()%></p>
                                <hr class="hr-red-dark">
                                <p>Mensaje</p>
                                <p><%=mensaje.getCuerpo()%></p>
                                <hr class="hr-red-dark">
  
                                <a>ruta archivo</a>
                                
                                   <!-- Interaction -->
                                    <div class="row interaccion mb-1 justify-content-space-between">
                                        <form name="mensaje_tarjeta" action="../Controladores/controlador_mensaje.jsp" method="POST">
                                            <input type="text" name="idUsuario" value="<%=mensaje.getIdRemitente()%>" class="d-none"/>
                                            <button type="submit" name="mensaje_tarjeta">Responder<i class="material-icons">mail_outline</i></button>
                                        </form>
                                        <form name="eliminar_amistad" action="../Controladores/controlador_amigos.jsp" method="POST">
                                            <input type="text" name="idUsuario" value="<%=mensaje.getIdRemitente()%>" class="d-none"/>
                                            <button type="submit" name="eliminar_amistad" class="d-flex align-items-center" value="eliminar:mensaje"><i class="material-icons">delete_outline</i></button>
                                        </form>
                                    </div>

                            </article>
                            <%
                                }

                            %>
                        </div>

                        <%                            }

                        %>
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