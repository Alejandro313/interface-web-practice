package ar.org.centro8.curso.java.web.managed.bean;

import java.io.Serializable;
import java.util.Arrays;
import java.util.List;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;
import ar.org.centro8.curso.java.web.enums.EspecieRecomendada;

@Named()
@SessionScoped
public class EspecieRecomendadaMB implements Serializable{
    public List<EspecieRecomendada>getEspecieRecomendadas(){
        return Arrays.asList(EspecieRecomendada.values());
    }
}
