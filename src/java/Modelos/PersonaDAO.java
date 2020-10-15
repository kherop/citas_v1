/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

import java.sql.SQLException;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import Modelos.Persona;
import java.sql.PreparedStatement;

/**
 * Clase para controlar el acceso a la BDD de la clase Persona
 * -----------------------------------------------------------
 *
 * @author Luis Quesada
 * @version 1.0
 */
public class PersonaDAO {

    // Atributo para preparar la sentencia SQL
    private static PreparedStatement SQL_Preparada;

    // Atributo para coger la sentencia sql las sentencias SQL
    private static java.sql.Statement Sentencia_SQL;

    // Atributo para almacenar el resultado de la consulta SQL
    private static java.sql.ResultSet Resultado_SQL;

    // Método para obtener todos los registros de la BDD
    public static LinkedList obtenerPersonas() {

        // Declaro una LinkedList y un objeto persona para guardar y manejar el resultado de la consulta
        LinkedList personasBD = new LinkedList<>();
        Persona persona = null;

        try {
            // Creo una conexion
            ConexionEstatica.nuevaConexion();
            // Creo la consulta SQL, la ejecuto y la guardo
            Sentencia_SQL = ConexionEstatica.getSentencia_SQL();
            String sentencia = "SELECT * FROM usuarios;";
            Resultado_SQL = Sentencia_SQL.executeQuery(sentencia);

            // Si trae resultados voy creando personas y las añado al LinkedList
            while (Resultado_SQL.next()) {
                persona = new Persona(Resultado_SQL.getInt("idUsuario"),
                        Resultado_SQL.getString("nombre"),
                        Resultado_SQL.getString("apellido"),
                        Resultado_SQL.getString("correo"),
                        Resultado_SQL.getString("password"),
                        Resultado_SQL.getString("img_perfil"));
                personasBD.add(persona);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ConexionEstatica.class.getName()).log(Level.SEVERE, null, ex);
        }
        // Cierro la conexión con la BDD y devuelvo los valores
        ConexionEstatica.cerrarBDD();
        return personasBD;
    }
    
    // Método para comprabar si existe una persona pasandole el correo
    public static Persona obtenerPersona(String correo) {
        Persona persona = null;

        try {
            // Creo una conexion
            ConexionEstatica.nuevaConexion();
            // Creo la consulta SQL, la ejecuto y la guardo
            Sentencia_SQL = ConexionEstatica.getSentencia_SQL();

            String sentencia = "SELECT * FROM usuarios WHERE correo = '" + correo + "';";
            Resultado_SQL = Sentencia_SQL.executeQuery(sentencia);

            // Si trae un resultado lo guardo en un objeto persona
            if (Resultado_SQL.next()) {
                persona = new Persona(Resultado_SQL.getInt("idUsuario"),
                        Resultado_SQL.getString("nombre"),
                        Resultado_SQL.getString("apellido"),
                        Resultado_SQL.getString("correo"),
                        Resultado_SQL.getString("password"),
                        Resultado_SQL.getString("img_perfil"));
            }

        } catch (SQLException ex) {
            Logger.getLogger(ConexionEstatica.class.getName()).log(Level.SEVERE, null, ex);
        }
        // Cierro la conexión con la BDD y devuelvo el valor
        ConexionEstatica.cerrarBDD();
        return persona;
    }

}
