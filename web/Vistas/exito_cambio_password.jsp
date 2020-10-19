<%-- 
    Document   : exito_cambio_password
    Created on : 16-oct-2020, 15:12:03
    Author     : luis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exito en el cambio de contraseña</title>
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
                        <p class="text-white">Te hemos enviado un correo con la nueva información. Revisa tu carpeta de spam gracias.</p>
                    </div>
                    <hr class="hr-white">

                    <!-- Formulario para registrarse -->
                    <form name="registro" action="../index.jsp" method="POST">
                        <input type="submit" class="btn" name="volver_inicio" value="Volver"/>
                    </form>
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
        <script src="Js/app.js"></script>
        <script src="Js/validacionLogin.js"></script>
    </body>
</html>
