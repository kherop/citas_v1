/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

/**
 * Definción de la clase ArchivoMensaje
 -------------------------------------
 * @author Luis Quesada
 */
public class ArchivoMensaje {
    
    // Atributos de clase
    int idArchivos;
    int idMensaje;
    String rutaArchivo;

    // Constructores
    public ArchivoMensaje() {
    }

    public ArchivoMensaje(int idMensaje, String rutaArchivo) {
        this.idMensaje = idMensaje;
        this.rutaArchivo = rutaArchivo;
    }

    public ArchivoMensaje(int idArchivos, int idMensaje, String rutaArchivo) {
        this.idArchivos = idArchivos;
        this.idMensaje = idMensaje;
        this.rutaArchivo = rutaArchivo;
    }

    // Getter
    public int getIdArchivos() {
        return idArchivos;
    }

    public int getIdMensaje() {
        return idMensaje;
    }

    public String getRutaArchivo() {
        return rutaArchivo;
    }

    // Setter
    public void setIdArchivos(int idArchivos) {
        this.idArchivos = idArchivos;
    }

    public void setIdMensaje(int idMensaje) {
        this.idMensaje = idMensaje;
    }

    public void setRutaArchivo(String rutaArchivo) {
        this.rutaArchivo = rutaArchivo;
    }

    // toString
    @Override
    public String toString() {
        return "ArchivosMensajes{" + "idArchivos=" + idArchivos + ", idMensaje=" + idMensaje + ", rutaArchivo=" + rutaArchivo + '}';
    }
    
    
    
}
