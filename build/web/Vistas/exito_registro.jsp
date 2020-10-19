<%-- 
    Document   : exito_registro
    Created on : 18-oct-2020, 16:21:30
    Author     : luis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exito registro</title>
    </head>
    <body>
        <html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exito registro</title>
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
                        <h1 class="display-3 text-white">Enhorabuena...</h1>
                        <p class="text-white">...ya solo queda un paso, uno de nuestros adminitradores evaluara su pedición y activara su cuenta lo antes posibles, muchas gracias por su paciencia.</p>
                    </div>
                    <hr class="hr-white">

                    <!-- Enlace para recuperar la contraseña -->
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
        <script src="../Js/validacionLogin.js"></script>
    </body>
</html>
    </body>
</html>
