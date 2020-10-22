<%-- 
    Document   : home
    Created on : 16-oct-2020, 9:22:11
    Author     : luis
--%>

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
        <body>

            <%
                // Recupero el email de la sesion
                String email = (String) session.getAttribute("emailUsuario");
                // Recupero los datos de usuario de la base de datos
                LinkedList<Persona> usuarios = PersonaDAO.obtenerPersonas();
                // Recupero los intereses del usuario
                Intereses intereses;
                // Recupero el usuario de forma segura sin password
                Persona usuario = PersonaDAO.obtenerPersonaSegura(email);
                // Recupero la tabla de compatibilidad
                Map<Integer, Integer> puntuacion = (Map<Integer, Integer>) session.getAttribute("puntuacion");

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

            <!-- Cuerpo de l pagina -->
            <div class="container w-100 m-0">

                <section class="row flex-grow-1 home-flex">
                    <!-- Menu laterial -->
                    <aside class="col m-0 menu-collapse" id="menu-lateral">
                        <!-- Boton menu -->
                        <button class="btn-aside" onclick="ctrlMenuLateral()">
                            <i class="material-icons">menu</i>
                        </button>
                        <hr class="hr-white mb-0">
                        <!-- Imagen de usuario -->
                        <div class="img_perfil_aside">
                            <img src="../Img/Perfil/<%=usuario.getImgPerfil()%>">
                        </div>                    <hr class="hr-white mb-0">
                        <!-- Nombre usuario -->
                        <p class="p-1"><%=usuario.getNombre()%> <%=usuario.getApellido()%></p>

                        <hr class="hr-white mb-0">
                        <!-- Menu -->
                        <ul>
                            <li>
                                <a href="home.jsp"  class="relative">
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

                    <div class="container">
                        <div class="row text-align-center">
                            <div class="col">
                                <h1>Amistades sugeridas...</h1>
                                </form>
                            </div>
                        </div>

                        <div class="row flex-wrap">
                            <%
                                // Recorro las puntuaciones posibles
                                // 0 mas compatible
                                // 32 menso compatible
                                for (int i = 0; i <= 32; i++) {
                                    // Recorro el map para buscar coincidencia con el indice
                                    for (Map.Entry<Integer, Integer> entry : puntuacion.entrySet()) {
                                        if (entry.getValue() == i) {
                                            // Si hay coincidencia en esa puntuacion recupero el id del usuario para mostarlo
                                            Persona uaux = PersonaDAO.obtenerPersonaSeguraID(entry.getKey());
                                            // Tambien recupero sus intereses
                                            Intereses intaux = InteresesDAO.obtenerIntereses(uaux.getEmail());
                            %>
                            <article class=" col tarjeta tarjeta-mini">
                                <!-- Datos personales -->
                                <!-- Imagen de perfil -->
                                <div class="relative d-flex align-items-center img_perfil_container">
                                    <div class="img_perfil_admin">
                                        <img src="../Img/Perfil/<%=uaux.getImgPerfil()%>" id="imgPerfil">
                                    </div>
                                </div>
                                <hr class="hr-red-dark">
                                <!-- Nombre -->
                                <h3 class="text-align-center mb-1"><%=uaux.getNombre()%> <%=uaux.getApellido()%></h3>
                                <hr class="hr-red-dark">

                                <!-- Iconos de interes --->
                                <div class="row intereses">
                                    <div class="col icono">
                                        <p>Busca:</p>
                                        <%
                                            intereses = InteresesDAO.obtenerIntereses(uaux.getEmail());
                                            if (intereses.getBusca().equals("chicos")) {
                                        %>
                                        <p>Chico</p>
                                        <img src="../Img/png/chico.png"/>
                                        <%
                                        } else if (intereses.getBusca().equals("chicas")) {
                                        %>
                                        <p>Chica</p>
                                        <img src="../Img/png/chica.png"/>
                                        <%
                                        } else {
                                        %>
                                        <p>Chico/Chica</p>
                                        <img src="../Img/png/chico_chica.png"/>
                                        <%
                                            }
                                        %>
                                    </div>
                                    <div class="col icono">
                                        <p>Busca:</p>
                                        <%
                                            if (intereses.getTipoRelacion().equals("amistad")) {
                                        %>
                                        <p>Amistad</p>
                                        <img src="../Img/png/amistad.png"/>
                                        <%
                                        } else {
                                        %>
                                        <p>Seria</p>
                                        <img src="../Img/png/serio.png"/>
                                        <%
                                            }
                                        %>
                                    </div>
                                    <div class="col icono">
                                        <p>Interesa:</p>
                                        <%
                                            if (intereses.getHijos().equals("si")) {
                                        %>
                                        <p>Si</p>
                                        <img src="../Img/png/hijos.png"/>
                                        <%
                                        } else {
                                        %>
                                        <p>No</p>
                                        <img src="../Img/png/hijos.png"/>
                                        <%
                                            }
                                        %>
                                    </div>
                                </div>
                                <hr class="hr-red-dark">

                                <!-- Barras de interes -->
                                <div class="row flex-direction-column intereses mb-1">
                                    <div class="col barras">
                                        <label for="file">Artísticos:</label>
                                        <progress value="<%=intereses.getArtisticos()%>" max="10"></progress>
                                    </div>
                                    <div class="col barras">
                                        <label for="file">Políticos:</label>
                                        <progress value="<%=intereses.getPoliticos()%>" max="10"></progress>
                                    </div>
                                    <div class="col barras">
                                        <label for="file">Deportivos:</label>
                                        <progress value="<%=intereses.getDeportivos()%>" max="10"></progress>
                                    </div>
                                </div>
                                <hr class="hr-red-dark">

                                <!-- Interaction -->
                                <div class="row interaccion mb-1 justify-content-space-between">
                                    <form name="mensaje_tarjeta" action="../Controladores/controlador_mensaje.jsp" method="POST">
                                        <button type="submit" name="mensaje_tarjeta"><i class="material-icons">mail_outline</i></button>
                                    </form>
                                    <form name="me_gusta_tarjeta" action="../Controladores/controlador_me_gusta.jsp" method="POST">
                                        <button type="submit" name="me_gusta_tarjeta" class="d-flex justify-content-center">Me gusta <i class="material-icons">favorite</i></button>
                                    </form>
                                </div>

                            </article>
                            <%                        }
                                    }
                                }
                            %>
                        </div>
                    </div>
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