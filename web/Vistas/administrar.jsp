<%-- 
    Document   : administrar_usuarios
    Created on : 20-oct-2020, 20:44:29
    Author     : luis
--%>

<%@page import="java.util.LinkedList"%>
<%@page import="Modelos.InteresesDAO"%>
<%@page import="Modelos.PersonaDAO"%>
<%@page import="Modelos.Intereses"%>
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
                LinkedList<Persona> usuarios = PersonaDAO.obtenerPersonas();
                // Recupero los intereses del usuario
                Intereses intereses = InteresesDAO.obtenerIntereses(email);

                // Recupero el usuario de forma segura sin password
                Persona usuario = PersonaDAO.obtenerPersonaSegura(email);
                // Recupero el rol de usuario
                int rolUsuario = (int) session.getAttribute("rolUsuario");

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

            <!-- Menú lateral -->
            <div class="container w-100 m-0">
                <section class="row flex-grow-1 home-flex">
                    <!-- aside -->
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

                    <div class="container">
                        <div class="row text-align-center">
                            <div class="col">
                                <h1>Administar</h1>
                                <form name="modificar_datos_personales" action="nuevo_admin.jsp" method="POST" novalidate>
                                    <input type="submit" class="btn bg-green w-50" name="nuevo_admin" value="Nuevo usuario"/>
                                </form>
                            </div>
                        </div>

                        <div class="row flex-wrap">
                            <%
                                for (Persona uaux : usuarios) {
                            %>
                            <article class=" col tarjeta tarjeta-mini">
                                <form name="modificar_datos_personales" action="../Controladores/controlador_admin.jsp" method="POST" novalidate>
                                    <!-- Datos personales -->
                                    <!-- Imagen de perfil -->
                                    <div class="relative d-flex align-items-center img_perfil_container">
                                        <div class="img_perfil_admin">
                                            <img src="../Img/Perfil/<%=uaux.getImgPerfil()%>" id="imgPerfil">
                                        </div>
                                    </div>
                                    <hr class="hr-red-dark">
                                    <!-- Nombre -->
                                    <div class="relative">
                                        <input type="text" name="nombre" id="nombre" placeholder="Introduce tu nombre" required aria-describedby="nombreError"
                                               class="campo" minlength="3" maxlength="20" pattern="[A-Z]{1}[a-z]+" value="<%=uaux.getNombre()%>">
                                        <small id="nombreError" aria-live="polite"></small>
                                    </div>

                                    <!-- Apellidos -->
                                    <div class="relative">
                                        <input type="text" name="apellido" id="apellido" placeholder="Introduce tu apellido" required aria-describedby="apellidoError"
                                               class="campo" minlength="3" maxlength="20" pattern="[A-Z]{1}[a-z]+" value="<%=uaux.getApellido()%>">
                                        <small id="apellidoError" aria-live="polite"></small>
                                    </div>

                                    <!-- Genero -->
                                    <div class="relative">
                                        <select name="genero" id="genero" required aria-describedby="generoError">
                                            <%
                                                if (uaux.getGenero().equals("hombre")) {
                                            %>
                                            <option value="hombre" selected>Hombre</option>
                                            <option value="mujer">Mujer</option>

                                            <%
                                            } else {
                                            %>
                                            <option value="hombre">Hombre</option>
                                            <option value="mujer" selected>Mujer</option>

                                            <%
                                                }
                                            %>
                                        </select>
                                        <small id="generoError" aria-live="polite"></small>
                                    </div>

                                    <!-- Email -->
                                    <div class="relative">
                                        <input type="email" name="email" id="email" placeholder="Introduce tu correo" required aria-describedby="emailError"
                                               class="campo" minlength="5" maxlength="20" pattern="^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*"
                                               value="<%=uaux.getEmail()%>">
                                        <small id="emailError" aria-live="polite"></small>
                                    </div>

                                    <!-- Password -->
                                    <div class="relative">
                                        <input type="password" name="password" id="password" placeholder="Introduce una nueva contraseña" required aria-describedby="passwordError"
                                               class="campo" minlength="2" maxlength="10" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,10}">
                                        <small id="passwordError" aria-live="polite"></small>
                                    </div>
                                    <hr class="hr-red-dark">

                                    <input type="submit" class="btn" name="modificar_admin" value="Guardar"/>
                                    <input type="submit" class="btn bg-red" name="eliminar_admin" value="Borrar"/>
                                    <%

                                        if (PersonaDAO.usuarioActivado(uaux.getEmail())) {
                                    %>
                                    <input type="submit" class="btn bg-green" name="desactivar_admin" value="Desactivar"/>

                                    <%
                                    } else {

                                    %>
                                    <input type="submit" class="btn bg-green" name="activar_admin" value="Activar"/>
                                    <%    }

                                    %>

                                </form>
                            </article>
                            <%                        }
                            %>
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