<%-- 
    Document   : home
    Created on : 16-oct-2020, 9:22:11
    Author     : luis
--%>

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
    <body>
        <!-- Barra de navegación superior -->
        <nav>
            <a href="index.jsp">
                <img src="../Img/logo_blanco.png" class="logo-nav" alt="" loading="lazy">
            </a>
        </nav>

        <!-- Cuerpo de la página -->

        <div class="container justify-content-center">
            <section class="row">
                <article class="col w-20 bg-red">
                    <i class="material-icons">face</i>
                    side bar
                </article>
                <article class="col bg-blue">
                    cuerpo
                </article>
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
