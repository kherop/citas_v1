/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Método para controlar el acceso a la BDD de la clase asignacionRoles
 * --------------------------------------------------------------------
 * @author Luis Quesada Romero
 * @version 1.0
 */
public class AsignacionRolesDAO {
    
    // Atributo para coger la sentencia sql las sentencias SQL
    private static java.sql.Statement Sentencia_SQL;

    // Atributo para almacenar el resultado de la consulta SQL
    private static java.sql.ResultSet Resultado_SQL;

    // Atributo para preparar la sentencia SQL
    private static PreparedStatement SQL_Preparada;
    
    // Método para aisgnar un nuevo rol con una subconsulta para
    // obtener el idUsuario mediante el email
    public static void nuevoRol(String email){
        try {
            // Creo una conexion
            ConexionEstatica.nuevaConexion();

            // Creo la consulta SQL, la ejecuto y la guardo
            String sentencia = "INSERT INTO asignacionRoles (idUsuario)  VALUES((SELECT idUsuario FROM usuarios WHERE email = ?));";

            // Preparo la sentencia SQL
            SQL_Preparada = ConexionEstatica.getConexion().prepareStatement(sentencia);
            SQL_Preparada.setString(1, email);

            // Ejecuto la sentencia
            SQL_Preparada.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PersonaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Cierro la conexión con la BDD
        ConexionEstatica.cerrarBDD();
    }
    
    // Método para eliminar rol
    public static void eliminarAsignacion(String email) {
        try {
            // Creo una conexion
            ConexionEstatica.nuevaConexion();

            // Creo la consulta SQL, la ejecuto para eliminar de la tabla usuarios
            String sentencia = "DELETE FROM asignacionRoles WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE email = ?);";

            // Preparo la sentencia SQL
            SQL_Preparada = ConexionEstatica.getConexion().prepareStatement(sentencia);
            SQL_Preparada.setString(1, email);

            // Ejecuto la sentencia
            SQL_Preparada.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(PersonaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Cierro la conexión con la BDD
        ConexionEstatica.cerrarBDD();
    }
    
    // Método para comprobar el rol de usuario
    // Método para comprabar si existe una persona pasandole el email
    public static int comprobarRol(int idUsuario) {
        int rol = 0;

        try {
            // Creo una conexion
            ConexionEstatica.nuevaConexion();
            // Creo la consulta SQL, la ejecuto y la guardo
            String sentencia = "SELECT idRol FROM asignacionRoles WHERE idUsuario = ?;";

            // Preparo la sentencia SQL
            SQL_Preparada = ConexionEstatica.getConexion().prepareStatement(sentencia);
            SQL_Preparada.setInt(1, idUsuario);

            // Ejecuto la sentencia SQL y la guardo
            Resultado_SQL = SQL_Preparada.executeQuery();

            // Si trae un resultado lo guardo en un objeto persona
            if (Resultado_SQL.next()) {
                rol = Resultado_SQL.getInt("idRol");
            }

        } catch (SQLException ex) {
            Logger.getLogger(ConexionEstatica.class.getName()).log(Level.SEVERE, null, ex);
        }
        // Cierro la conexión con la BDD y devuelvo el valor
        ConexionEstatica.cerrarBDD();
        return rol;
    }
    
}
