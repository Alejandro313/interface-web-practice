package ar.org.centro8.curso.java.web.managed.bean;

import java.io.Serializable;
import java.util.Arrays;
import java.util.List;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;
import ar.org.centro8.curso.java.web.enums.Tipo;

@Named()
@SessionScoped
public class TipoMB implements Serializable{
    public List<Tipo>getTipos(){
        return Arrays.asList(Tipo.values());
    }
}
