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
    int idRemitente;
    int idDestinatario;
    String asunto;
    Date fecha;
    String cuerpo;
    int leido;
    
    // Constructores

    public Mensaje() {
    }

    public Mensaje(int idMensaje, int idRemitente, int idDestinatario, String asunto, Date fecha, String cuerpo, int leido) {
        this.idMensaje = idMensaje;
        this.idRemitente = idRemitente;
        this.idDestinatario = idDestinatario;
        this.asunto = asunto;
        this.fecha = fecha;
        this.cuerpo = cuerpo;
        this.leido = leido;
    }

    public Mensaje(int idRemitente, int idDestinatario, String asunto, String cuerpo) {
        this.idRemitente = idRemitente;
        this.idDestinatario = idDestinatario;
        this.asunto = asunto;
        this.cuerpo = cuerpo;
    }

    public int getIdMensaje() {
        return idMensaje;
    }

    public int getIdRemitente() {
        return idRemitente;
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

    public void setIdMensaje(int idMensaje) {
        this.idMensaje = idMensaje;
    }

    public void setIdRemitente(int idRemitente) {
        this.idRemitente = idRemitente;
    }

    public void setIdDestinatario(int idDestinatario) {
        this.idDestinatario = idDestinatario;
    }

    public void setAsunto(String asunto) {
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

    
    
    
    
}
