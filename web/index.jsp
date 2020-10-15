<%-- 
    Document   : index
    Created on : 11-oct-2020, 15:53:23
    Author     : luis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <!-- Carga archivos CSS -->
        <link type="text/css" rel="stylesheet" href="Css/app.css"/>
    </head>
    <body>
        <!-- Barra de navegación superior -->
        <nav>
            <a href="index.jsp">
                <img src="Img/logo_blanco.png" class="logo-nav" alt="" loading="lazy">
            </a>
        </nav>

        <!-- Cuerpo de la página -->

        <div class="container justify-content-center">
            <section class="row">
                <article class="col login bg-red">
                    <!-- Logo formulario -->
                    <div>
                        <img src="Img/logo_blanco.png" class="logo-nav" alt="" loading="lazy">
                    </div>

                    <!-- Formulario de entrada -->
                    <form name="acceso" action="Controladores/controlador_login.jsp" method="POST">
                        <div>
                            <input type="email" name="correo" placeholder="Introduce tu correo" required
                                   minlength="5" maxlength="20" pattern="^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*">
                        </div>
                        <div>
                            <input type="password" name="password" placeholder="Introduce tu contraseña" required
                                   minlength="2" maxlength="10" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,10}">
                        </div>
                        <div>
                            <input type="submit" class="btn" name="entrar_home" value="Entrar"/>
                        </div>
                    </form>

                    <!-- Formulario para registrarse -->
                    <form name="registro" action="Controladores/controlador_registro.jsp" method="POST">
                        <input type="submit" class="btn" name="registro_home" value="Registrate"/>
                    </form>
                    <hr class="hr-white">

                    <!-- Enlace para recuperar la contraseña -->
                    <a href="Vistas/cambiar_password.jsp" class="a a-white">He olvidado mi contraseña</a>
                </article>

                <img src="Img/pareja-2.png" class="pareja-login">
            </section>
        </div>

        <!-- Footer -->
        <footer>
            <div>© 2020 Copyright:
                <a href="https://luisquesadadesign.com" class="a a-red"> Luis Quesada Design</a>
            </div>
        </footer>

        <!-- Carga archivos JS -->
        <script src="Js/app.js"></script>
    </body>
</html>
