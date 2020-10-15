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

        <div class="container">
            <!-- 1 Columna -->
            <section class="row">
                <article class="col bg-red">
                    Columna
                </article>
            </section>

            <!-- 2 Columnas -->
            <section class="row">
                <article class="col bg-blue">
                    Columna
                </article>
                <article class="col bg-blue">
                    Columna
                </article>
            </section>

            <!-- 3 Columnas -->
            <section class="row">
                <article class="col bg-red">
                    Columna
                </article>
                <article class="col bg-red">
                    Columna
                </article>
                <article class="col bg-red">
                    Columna
                </article>
            </section>

            <!-- 4 Columnas -->
            <section class="row">
                <article class="col bg-blue">
                    Columna
                </article>
                <article class="col bg-blue">
                    Columna
                </article>
                <article class="col bg-blue">
                    Columna
                </article>
                <article class="col bg-blue">
                    Columna
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
    </body>
</html>
