<%-- 
    Document   : controlador_registro
    Created on : 13-oct-2020, 11:35:56
    Author     : luis
--%>

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
                    if (campo.getName() == "") {
                        datosUsuario.add("dAPJ.png");
                    } else {
                        // Si es un fichero, guardamos la imagen en la ruta del servidor
                        // Pero antes le cambio el nombre mediante la fecha para hacerla unica
                        Calendar cal = Calendar.getInstance();
                        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss-mm");
                        String nuevoNombre = (dateFormat.format(cal.getTime()) + campo.getName()).replace(" ","");
                        
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

            /*
                    // Se prepara todo para insertar el nuevo usuario en la BDD
                    String tabla = "usuarios";
                    String apodo = datosUsuario.get(1);
                    String correo = datosUsuario.get(2);
                    String password = datosUsuario.get(3);
                    int victorias = 0;
                    int derrotas = 0;
                    String rol = datosUsuario.get(4);
                    String img_nombre = datosUsuario.get(0);
            
                    // Inserto en la base de datos
                    ConexionEstatica.insertarUsuario(tabla, apodo, correo, password, victorias, derrotas, rol, img_nombre);

                    // Guardo datos en la sesion para tener una referencia al usuario
                    session.setAttribute("correoUsuario", correo);
                    session.setAttribute("rolUsuario", rol);
                    response.sendRedirect("../Vistas/exito_registro.jsp");
             */
        %>

    </body>
</html>
