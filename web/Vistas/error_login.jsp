<%-- 
    Document   : error_login
    Created on : 16-oct-2020, 9:22:02
    Author     : luis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error login</title>
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
                <article class="col login bg-red error-login">
                    <!-- Logo formulario -->
                    <div>
                        <h1 class="display-3 text-white">Error</h1>
                        <p class="text-white">Los datos introducidos son incorrectos, por favor vuelve a intentarlo.</p>
                    </div>
                    <hr class="hr-white">
                    <!-- Formulario de entrada -->
                    <form name="acceso" action="../Controladores/controlador_login.jsp" method="POST" novalidate>
                        <div class="relative">
                            <input type="email" name="email" id="email" placeholder="Introduce tu correo" required aria-describedby="emailError"
                                   class="campo" minlength="5" maxlength="20" pattern="^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*">
                            <small id="emailError" aria-live="polite"></small>
                        </div>
                        <div class="relative">
                            <input type="password" name="password" id="password" placeholder="Introduce tu contraseña" required aria-describedby="emailPassword"
                                   class="campo" minlength="2" maxlength="10" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,10}">
                            <small id="passwordError" aria-live="polite"></small>
                        </div>
                        <div>
                            <input type="submit" class="btn" name="entrar_login" value="Entrar"/>
                        </div>
                    </form>

                    <!-- Formulario para registrarse -->
                    <form name="registro" action="../Controladores/controlador_registro.jsp" method="POST">
                        <input type="submit" class="btn" name="registro" value="Registrate"/>
                    </form>
                    <hr class="hr-white">

                    <!-- Enlace para recuperar la contraseña -->
                    <a href="recuperar_password.jsp" class="a a-white">He olvidado mi contraseña</a>
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
        <script src="../Js/validacionLogin.js"></script>
    </body>
</html>