<%-- 
    Document   : registro
    Created on : 13-oct-2020, 11:49:41
    Author     : luis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <!-- Carga archivos CSS -->
        <link type="text/css" rel="stylesheet" href="Css/app.min.css"/>
    </head>
    <body class="min-vh-100 d-flex flex-column">
        <!-- Barra de navegación superior -->
        <nav class="navbar navbar-light bg-warning">
            <a class="navbar-brand text-white font-weight-bold" href="index.jsp">
                <img src="Img/logo.png" height="50" class="d-inline-block align-top" alt="" loading="lazy">
            </a>
        </nav>

        <!-- Cuerpo de la página -->
        <div class="container flex-grow-1 d-flex justify-content-center align-items-center">
            <div class="row w-50 m-5 p-3 shadow-lg rounded">
                <div class="col">

                    <!-- Intro registro -->
                    <div class="d-flex justify-content-center">
                        <h1>Registro de usuario</h1>
                    </div>
                    <hr>

                    <!-- Formulario de registro -->
                    <form name="acceso" action="../Controladores/controlador_registro.jsp" enctype="multipart/form-data" method="POST">
                        <!-- Imagen de perfil -->
                        <div class="form-group">
                            <!--
                            <img src="../Img/dAPJ.png" height="60" class="d-inline-block align-top mr-2" alt="" loading="lazy">
                            -->
                            <label>Imagen de perfil</label>
                            <input type="file" class="form" name="imagen">
                        </div>
                        <hr>
                        <!-- Campos datos formulario -->
                        <div class="form-group">
                            <input type="text" class="form-control" name="apodo" required placeholder="Introduce tu apodo">
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-control" name="correo" required placeholder="Introduce tu correo">
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control"  name="password" required placeholder="Introduce tu contraseña">
                        </div>
                        <div class="form-group">
                            <select class="custom-select" name="rol" required>
                                <option disabled selected>Selecciona una rol</option>
                                <option value="usuario">Usuario
                                <option value="administrador">Administrador</option>
                            </select>                        
                        </div>
                        <div class="form-group">
                            <input type="submit" class="btn btn-info w-100" name="registrarse_registro" value="Registrar"/>
                        </div>
                    </form>

                    <!-- Boton para volver -->
                    <form name="registro" action="../Controladores/controlador.jsp" method="POST">
                        <input type="submit" class="btn btn-outline-info w-100" name="volver_registro" value="Volver"/>
                    </form>
                    <hr>

                    <!-- Enlace para recuperar la contraseña -->
                    <a href="../Vistas/cambiar_pass.jsp" class="text-info">He olvidado mi contraseña</a>
                    
                </div>
            </div>
        </div>

        <!-- Footer -->
        <footer class="page-footer font-small cyan darken-3 bg-danger text-white">
            <div class="footer-copyright text-center py-3">© 2020 Copyright:
                <a class="text-light"href="https://luisquesadadesign.com"> Luis Quesada Design</a>
            </div>
        </footer>

        <!-- Carga archivos JS -->
        <script src="Js/jquery-3.5.1.min.js"></script>
        <script src="Js/bootstrap.bundle.min.js"></script>
        <script src="Js/app.js"></script>
    </body>
</html>
