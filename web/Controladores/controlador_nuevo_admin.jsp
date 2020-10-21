<%-- 
    Document   : controlador_registro
    Created on : 13-oct-2020, 11:35:56
    Author     : luis
--%>

<%@page import="Modelos.AsignacionRolesDAO"%>
<%@page import="Modelos.InteresesDAO"%>
<%@page import="Modelos.PersonaDAO"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Auxiliar.Constantes"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="java.io.File"%>
<%@page import="java.util.List"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
    </head>
    <body>

        <%
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);

            // Guardo todos los datos del formulario para luego pasarselos a la consulta
            LinkedList<String> datosUsuario = new LinkedList();

            // Recuperamos todos los campos que nos vengan del formulario
            List items = upload.parseRequest(request);

            // Se recorren todos los items, que son de tipo FileItem
            for (Object item : items) {
                FileItem campo = (FileItem) item;

                // Hay que comprobar si es un campo de formulario. Si no lo es, se guarda el fichero
                // subido donde nos interese.
                if (!campo.isFormField()) {

                    // Controlo si es usuario no introduce imagen propia, en ese caso pongo una
                    if (campo.getName().isEmpty()) {
                        datosUsuario.add("dAPJ.png");
                    } else {
                        // Si es un fichero, guardamos la imagen en la ruta del servidor
                        // Pero antes le cambio el nombre mediante la fecha para hacerla unica
                        Calendar cal = Calendar.getInstance();
                        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss-mm");
                        String nuevoNombre = (dateFormat.format(cal.getTime()) + campo.getName()).replace(" ", "");

                        // Se crea el archivo y se guarda en el directorio
                        File fichero = new File(Constantes.rutaImgPerfiles, nuevoNombre);
                        campo.write(fichero);

                        // Guardo el nombre en los datos del usuarios
                        datosUsuario.add(nuevoNombre);
                    }
                } else {
                    //Si es un campo de formulario (no fichero) extraemos su valor de la siguiente manera.
                    // Para obtener clave y valor de los campos formulario.
                    String key = campo.getFieldName();
                    String valor = campo.getString();
                    // Guardo el valor en el LinkedList
                    datosUsuario.add(valor);
                }
            }

            for (String string : datosUsuario) {
                System.out.println(string);
            }

            // Preparado los datos del formulario
            String img_perfil = datosUsuario.get(0);
            String nombre = datosUsuario.get(1);
            String apellido = datosUsuario.get(2);
            String genero = datosUsuario.get(3);
            String email = datosUsuario.get(4);
            String password = datosUsuario.get(5);
            String busca = datosUsuario.get(6);
            String tipoRelacion = datosUsuario.get(7);
            String hijos = datosUsuario.get(8);
            int artisticos = Integer.parseInt(datosUsuario.get(9));
            int deportivos = Integer.parseInt(datosUsuario.get(10));
            int politicos = Integer.parseInt(datosUsuario.get(11));

            /* Cuando se registra un usuario hay que insertar en 3 tablas
             * Tabla de usuario -> Datos de usuario
             * Tabla de intereses -> Intereses de usuario
             * Tabla de asiginación de roles, el rol por defecto sera usuario,
             * despues si el administrador podra cambiar este rol en su
             * panel de control
             */
            
            // Insert en la tabla usuarios con activacion a 0 por defecto y con idUsuario asignado por la BDD
            PersonaDAO.nuevaPersona(nombre, apellido, genero, email, password, img_perfil);
            
            // Guardo los intereses del usuario asociados al email
            InteresesDAO.nuevosIntereses(email, busca, tipoRelacion, hijos, artisticos, deportivos, politicos);
            
            // Establezco el rol por defecto
            AsignacionRolesDAO.nuevoRol(email);

            // Guardo datos en la sesion para tener una referencia al usuario
            response.sendRedirect("../Vistas/exito_registro.jsp");

        %>

    </body>
</html>
