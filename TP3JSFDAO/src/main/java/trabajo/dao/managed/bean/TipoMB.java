package trabajo.dao.managed.bean;

import java.io.Serializable;
import java.util.Arrays;
import java.util.List;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;
import trabajo.dao.enums.Tipo;

@Named()
@SessionScoped
public class TipoMB implements Serializable{
    public List<Tipo>getTipos(){
        return Arrays.asList(Tipo.values());
    }
}
