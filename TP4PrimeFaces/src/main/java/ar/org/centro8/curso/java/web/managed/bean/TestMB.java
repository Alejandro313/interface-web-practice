package ar.org.centro8.curso.java.web.managed.bean;

import java.io.Serializable;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

@Named()
@SessionScoped
public class TestMB implements Serializable {
    private String texto="Hoy es Viernes!";

    
    public void mostrar(){
        System.out.println("************************************");
        System.out.println(texto);
        System.out.println("************************************");
    }
    
    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }
    
    
}
