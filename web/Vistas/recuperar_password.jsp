<%-- 
    Document   : recuperar_contraseña
    Created on : 15-oct-2020, 20:34:16
    Author     : luis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recuperar password</title>
        <!-- Carga archivos CSS -->
        <link type="text/css" rel="stylesheet" href="../Css/app.css"/>
    </head>
    <body onload="validacion()">
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
                        <h1 class="display-3 text-white">Recuperar contraseña</h1>
                    </div>
                    <hr class="hr-white">

                    <!-- Formulario de recuperacion -->
                    <form name="acceso" action="../Controladores/controlador_cambio_password.jsp" method="POST" novalidate>
                        <div class="relative">
                            <input type="email" name="email" id="email" placeholder="Introduce tu correo" required aria-describedby="emailError"
                                   class="campo" minlength="5" maxlength="20" pattern="^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*">
                            <small id="emailError" aria-live="polite"></small>
                        </div>
                        <input type="submit" class="btn" name="recuperar_password" value="Solicitar nueva contraseña"/>
                    </form>

                    <!-- Formulario para registrarse -->
                    <form name="registro" action="registro.jsp" method="POST">
                        <input type="submit" class="btn" name="registro" value="Registrate"/>
                    </form>
                    <hr class="hr-white">

                    <!-- Volver -->
                    <a href="../index.jsp" class="a a-white">Volver</a>
                </article>

                <img src="../Img/pareja-2.png" class="pareja-login">
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
        <script src="../Js/validacionRecuperacionPass.js"></script>
    </body>
</html>