package ar.org.centro8.curso.java.web.managed.bean;

import ar.org.centro8.curso.java.web.enums.TipoDocumento;
import java.io.Serializable;
import java.util.Arrays;
import java.util.List;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

@Named()
@SessionScoped
public class TipoDocumentoMB implements Serializable{
    public List<TipoDocumento>getTipoDocumentos(){
        return Arrays.asList(TipoDocumento.values());
    }
}
