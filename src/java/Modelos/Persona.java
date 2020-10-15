/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

import java.util.Random;

/**
 * Definición de la clase persona
 * ------------------------------
 * @author Luis Quesada
 * @version 1.0
 */
public class Persona {

    // Atributos de instancia
    int idUsuario;
    String nombre;
    String apellido;
    String correo;
    String password;
    String imgPerfil;

    // Constructor por defecto
    public Persona() {
    }

    // Constuctor con parametros
    public Persona(int idUsuario, String nombre, String apellido, String correo, String password, String imgPerfil) {
        this.idUsuario = idUsuario;
        this.nombre = nombre;
        this.apellido = apellido;
        this.correo = correo;
        this.password = password;
        this.imgPerfil = imgPerfil;
    }

    // Métodos setter
    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setImgPerfil(String imgPerfil) {
        this.imgPerfil = imgPerfil;
    }

    // Métodos getter
    public int getIdUsuario() {
        return idUsuario;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public String getCorreo() {
        return correo;
    }

    public String getPassword() {
        return password;
    }

    public String getImgPerfil() {
        return imgPerfil;
    }

    // Método toString

    @Override
    public String toString() {
        return "Persona{" + "idUsuario=" + idUsuario + ", nombre=" + nombre + ", apellido=" + apellido + ", correo=" + correo + ", password=" + password + ", imgPerfil=" + imgPerfil + '}';
    }


    // Métodos de clase
    // Metodo para generar una nueva contraseña
    public static String nuevoPass() {
        String pass = "";

        // Genero 7 números
        for (int i = 0; i < 7; i++) {
            int numero = (int) (Math.random() * 9);
            pass += String.valueOf(numero);
        }

        // Genero letra mayúscula
        Random r = new Random();
        int c = r.nextInt(26) + (byte) 'a';
        char letra = (char) c;
        
        pass += Character.toUpperCase(letra);
        
        // Genero letra manistucla
        c = r.nextInt(26) + (byte) 'a';
        letra = (char) c;
        
        pass += letra;
                
        return pass;
    }
}
