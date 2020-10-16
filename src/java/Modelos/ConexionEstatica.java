/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

import Auxiliar.Constantes;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;

/**
 * Clase para conectar la app con la BDD -------------------------------------
 *
 * @author Luis Quesada
 * @version 1.0
 */
public class ConexionEstatica {

    // Atributo para crear la conexion
    private static java.sql.Connection Conexion;
    
    // Atributo para ejecutar las sentencias SQL
    private static java.sql.Statement Sentencia_SQL;

    // Método para crear una conextion
    public static void nuevaConexion() {
        try {
            // Cargar el driver/controlado
            final String controlador = "com.mysql.jdbc.Driver";

            // Ruta de acceso a la BDD
            final String URL_BD = "jdbc:mysql://127.0.0.1:3306/" + Constantes.BBDD;
            
            // Creamos la conexión al a base de datos
            Conexion = java.sql.DriverManager.getConnection(URL_BD, Constantes.usuario, Constantes.password);
            
            // Creamos el objeto Statement
            Sentencia_SQL = Conexion.createStatement();
                        
            // Mandamos un mensaje por consola si la conexión ha tenido éxito
            System.out.println("Conexion realizada con éxito");

        } catch (SQLException e) {
            System.err.println("Exception" + e.getMessage());
        }
    }
    
    // Método para cerrar la conexión con la BDD
    public static void cerrarBDD(){
        try {
            Conexion.close();
            System.out.println("Desconectado de la base de datos");
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Error de Desconexion", JOptionPane.ERROR_MESSAGE);

        }
    }

    // Método getter
    public static Statement getSentencia_SQL() {
        return Sentencia_SQL;
    }

    public static Connection getConexion() {
        return Conexion;
    }
    
}
