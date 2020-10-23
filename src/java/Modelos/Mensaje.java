package Modelos;


import java.sql.Date;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Definicion de la clase Mensaje
 -------------------------------
 * @author Luis Quesada
 * @version 1.0
 */
public class Mensaje {
    
    // Atributos de clase
    int idMensaje;
    int ideRemitente;
    int idDestinatario;
    String asunto;
    Date fecha;
    String cuerpo;
    String archivo;
    int leido;
    
    // Constructores

    public Mensaje() {
    }

    public Mensaje(int idMensaje, int ideRemitente, int idDestinatario, String asunto, Date fecha, String cuerpo, String archivo, int leido) {
        this.idMensaje = idMensaje;
        this.ideRemitente = ideRemitente;
        this.idDestinatario = idDestinatario;
        this.asunto = asunto;
        this.fecha = fecha;
        this.cuerpo = cuerpo;
        this.archivo = archivo;
        this.leido = leido;
    }

    public Mensaje(int ideRemitente, int idDestinatario, String asunto, String cuerpo, String archivo) {
        this.ideRemitente = ideRemitente;
        this.idDestinatario = idDestinatario;
        this.asunto = asunto;
        this.cuerpo = cuerpo;
        this.archivo = archivo;
    }

    public Mensaje(int ideRemitente, int idDestinatario, String asunto, String cuerpo) {
        this.ideRemitente = ideRemitente;
        this.idDestinatario = idDestinatario;
        this.asunto = asunto;
        this.cuerpo = cuerpo;
    }
    
    
    // Métodos setter

    public void setIdMensaje(int idMensaje) {
        this.idMensaje = idMensaje;
    }

    public void setIdeRemitente(int ideRemitente) {
        this.ideRemitente = ideRemitente;
    }

    public void setIdDestinatario(int idDestinatario) {
        this.idDestinatario = idDestinatario;
    }

    public void setAsusnto(String asunto) {
        this.asunto = asunto;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public void setCuerpo(String cuerpo) {
        this.cuerpo = cuerpo;
    }

    public void setLeido(int leido) {
        this.leido = leido;
    }

    public void setArchivo(String archivo) {
        this.archivo = archivo;
    }
    
    // Métodos getter

    public int getIdMensaje() {
        return idMensaje;
    }

    public int getIdeRemitente() {
        return ideRemitente;
    }

    public int getIdDestinatario() {
        return idDestinatario;
    }

    public String getAsunto() {
        return asunto;
    }

    public Date getFecha() {
        return fecha;
    }

    public String getCuerpo() {
        return cuerpo;
    }

    public int getLeido() {
        return leido;
    }

    public String getArchivo() {
        return archivo;
    }

    // Método toString

    @Override
    public String toString() {
        return "Mensaje{" + "idMensaje=" + idMensaje + ", ideRemitente=" + ideRemitente + ", idDestinatario=" + idDestinatario + ", asunto=" + asunto + ", fecha=" + fecha + ", cuerpo=" + cuerpo + ", archivo=" + archivo + ", leido=" + leido + '}';
    }
    
    
    
}
