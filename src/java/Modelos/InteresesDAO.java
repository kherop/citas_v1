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
    public static void nuevosIntereses(String email, String busca, String tipoRelacion, String hijos, int artisticos, int deportivos, int politicos){
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
    
    
}
