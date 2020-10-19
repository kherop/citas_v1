/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

import java.util.Random;

/**
 * Definición de la clase persona ------------------------------
 *
 * @author Luis Quesada
 * @version 1.0
 */
public class Persona {

    // Atributos de instancia
    int idUsuario;
    String nombre;
    String apellido;
    String genero;
    String email;
    String password;
    String imgPerfil;
    int activado; // Boolean

    // Constructor por defecto
    public Persona() {
    }

    // Constuctor con parametros
    public Persona(int idUsuario, String nombre, String apellido, String genero, String email, String password, String imgPerfil, int activado) {
        this.idUsuario = idUsuario;
        this.nombre = nombre;
        this.apellido = apellido;
        this.genero = genero;
        this.email = email;
        this.password = password;
        this.imgPerfil = imgPerfil;
        this.activado = activado;
    }
    
    // Constuctor sin id de usuario para lo genere la BDD de forma automatica y desactivado, activado = 0 esta default en la BDD
    public Persona(String nombre, String apellido, String genero, String email, String password, String imgPerfil) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.genero = genero;
        this.email = email;
        this.password = password;
        this.imgPerfil = imgPerfil;

    }
    
    // Constuctor recuperar una persona sin password por seguridad
    public Persona(String nombre, String apellido, String genero, String email, String imgPerfil) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.genero = genero;
        this.email = email;
        this.imgPerfil = imgPerfil;

    }

    // Métodos setter
    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setImgPerfil(String imgPerfil) {
        this.imgPerfil = imgPerfil;
    }

    public void setActivado(int activado) {
        this.activado = activado;
    }

    // Métodos getter
    public int getIdUsuario() {
        return idUsuario;
    }

    public String getGenero() {
        return genero;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getImgPerfil() {
        return imgPerfil;
    }

    public int isActivado() {
        return activado;
    }

    // Método toString
    @Override
    public String toString() {
        return "Persona{" + "idUsuario=" + idUsuario + ", genero=" + genero + ", nombre=" + nombre + ", apellido=" + apellido + ", email=" + email + ", password=" + password + ", imgPerfil=" + imgPerfil + ", activado=" + activado + '}';
    }

    // Métodos de clase
    // Metodo para generar una nueva contraseña
    public static String nuevoPass() {
        String pass = "";
        String simbolos[] = {"!", "#", "¡", "%", "_", "-", "&"};
        String simbolo;

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

        // Genero un simbolo
        simbolo = simbolos[(int) (Math.random() * simbolos.length)];

        pass += simbolo;

        return pass;
    }

}
