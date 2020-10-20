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
 * Clase para controlar el acceso a la BDD de la clase intereses
 * -------------------------------------------------------------
 *
 * @author Luis Quesada Romero
 * @version 1.0
 */
public class InteresesDAO {

    // Atributo para coger la sentencia sql las sentencias SQL
    private static java.sql.Statement Sentencia_SQL;

    // Atributo para almacenar el resultado de la consulta SQL
    private static java.sql.ResultSet Resultado_SQL;

    // Atributo para preparar la sentencia SQL
    private static PreparedStatement SQL_Preparada;

    // Método para crear un nuevo grupo de intereses con una subconsulta para
    // obtener el idUsuario mediante el email
    public static void nuevosIntereses(String email, String busca, String tipoRelacion, String hijos, int artisticos, int deportivos, int politicos) {
        try {
            // Creo una conexion
            ConexionEstatica.nuevaConexion();

            // Creo la consulta SQL, la ejecuto y la guardo
            String sentencia = "INSERT INTO preferencias (idUsuario, busca, tipoRelacion, hijos, artisticos, deportivos, politicos)"
                    + " VALUES((SELECT idUsuario FROM usuarios WHERE email = ?), ?, ?, ?, ?, ?, ?);";

            // Preparo la sentencia SQL
            SQL_Preparada = ConexionEstatica.getConexion().prepareStatement(sentencia);
            SQL_Preparada.setString(1, email);
            SQL_Preparada.setString(2, busca);
            SQL_Preparada.setString(3, tipoRelacion);
            SQL_Preparada.setString(4, hijos);
            SQL_Preparada.setInt(5, artisticos);
            SQL_Preparada.setInt(6, deportivos);
            SQL_Preparada.setInt(7, politicos);

            // Ejecuto la sentencia
            SQL_Preparada.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PersonaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Cierro la conexión con la BDD
        ConexionEstatica.cerrarBDD();
    }

    // Método para recuperar los intereses de un usuario de la BDD
    public static Intereses obtenerIntereses(String email) {
        Intereses intereses = null;

        try {
            // Creo una conexion
            ConexionEstatica.nuevaConexion();
            // Creo la consulta SQL, la ejecuto y la guardo
            String sentencia = "SELECT * FROM preferencias WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE email = ?);";

            // Preparo la sentencia SQL
            SQL_Preparada = ConexionEstatica.getConexion().prepareStatement(sentencia);
            SQL_Preparada.setString(1, email);

            // Ejecuto la sentencia SQL y la guardo
            Resultado_SQL = SQL_Preparada.executeQuery();

            // Si trae un resultado lo guardo en un objeto persona
            if (Resultado_SQL.next()) {
                intereses = new Intereses(Resultado_SQL.getInt("idPreferencias"),
                        Resultado_SQL.getInt("idUsuario"),
                        Resultado_SQL.getString("busca"),
                        Resultado_SQL.getString("tipoRelacion"),
                        Resultado_SQL.getString("hijos"),
                        Resultado_SQL.getInt("artisticos"),
                        Resultado_SQL.getInt("deportivos"),
                        Resultado_SQL.getInt("politicos"));
            }

        } catch (SQLException ex) {
            Logger.getLogger(ConexionEstatica.class.getName()).log(Level.SEVERE, null, ex);
        }
        // Cierro la conexión con la BDD y devuelvo el valor
        ConexionEstatica.cerrarBDD();
        return intereses;
    }

    // Método para actualizar intereses
    public static void actualizarIntereses(String busca, String tipoRelacion, String hijos, int artisticos, int deportivos, int politicos, String email) {
        try {
            // Creo una conexion
            ConexionEstatica.nuevaConexion();

            // Creo la consulta SQL, la ejecuto y la guardo
            String sentencia = "UPDATE preferencias SET busca = ?, tipoRelacion = ?, hijos = ?, artisticos = ?, deportivos = ?, politicos = ? WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE email = ?);";

            // Preparo la sentencia SQL
            SQL_Preparada = ConexionEstatica.getConexion().prepareStatement(sentencia);
            SQL_Preparada.setString(1, busca);
            SQL_Preparada.setString(2, tipoRelacion);
            SQL_Preparada.setString(3, hijos);
            SQL_Preparada.setInt(4, artisticos);
            SQL_Preparada.setInt(5, deportivos);
            SQL_Preparada.setInt(6, politicos);
            SQL_Preparada.setString(7, email);

            // Ejecuto la sentencia
            SQL_Preparada.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PersonaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Cierro la conexión con la BDD
        ConexionEstatica.cerrarBDD();
    }

}
