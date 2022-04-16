package trabajo.dao.interfaces.test;

import trabajo.dao.entities.Articulo;
import trabajo.dao.entities.Cliente;
import trabajo.dao.entities.Direccion;
import trabajo.dao.enums.EspecieRecomendada;
import trabajo.dao.enums.Tipo;
import trabajo.dao.enums.TipoDocumento;
import trabajo.dao.interfaces.connectors.Connector;
import trabajo.dao.repositories.interfaces.I_ClienteRepository;
import trabajo.dao.repositories.interfaces.I_ArticuloRepository;
import trabajo.dao.repositories.jdbc.ClienteRepository;
import trabajo.dao.repositories.jdbc.ArticuloRepository;

public class TestRepository {
    public static void main(String[] args) {
        I_ClienteRepository cr=new ClienteRepository(Connector.getConnection());
        
        cr.save(new Cliente("Juan1", "Perez", "2005/05/05", TipoDocumento.DNI, "1221111", "222222", "nada@nada", new Direccion("Viel", 10, "", "", "", "1111", "CABA", "CABA", "Argentina"), ""));
        cr.save(new Cliente("Laura2", "Mendez", "2005/05/05", TipoDocumento.DNI, "1331112", "222222", "nada@nada", new Direccion("Viel", 10, "", "", "", "1111", "CABA", "CABA", "Argentina"), ""));
        cr.save(new Cliente("Jose3", "Gomez", "2005/05/05", TipoDocumento.DNI, "1441113", "222222", "nada@nada", new Direccion("Viel", 10, "", "", "", "1111", "CABA", "CABA", "Argentina"), ""));
        cr.save(new Cliente("Ana4", "Lopez", "2005/05/05", TipoDocumento.DNI, "1551114", "222222", "nada@nada", new Direccion("Viel", 10, "", "", "", "1111", "CABA", "CABA", "Argentina"), ""));
        
        cr.getAll().forEach(System.out::println);
        System.out.println("****************************************************");
        cr.getLikeApellido("go").forEach(System.out::println);
        System.out.println("****************************************************");
        
        I_ArticuloRepository ar=new ArticuloRepository(Connector.getConnection());
        
        ar.save(new Articulo("Cat chow", "Pescado", Tipo.ALIMENTO, EspecieRecomendada.FELINO, 400, 600, 10, 3, 20, "sin", true));
        ar.save(new Articulo("Pedi gree", "Carne", Tipo.ALIMENTO, EspecieRecomendada.CANINO, 500, 700, 10, 3, 20, "sin", true));
        ar.save(new Articulo("Collar pet", "Rojo", Tipo.ACCESORIO, EspecieRecomendada.CANINO, 300,500, 20, 5, 30, "sin", false));
        ar.save(new Articulo("almohada", "Amarilla", Tipo.PRENDA, EspecieRecomendada.CANINO, 600,800, 5, 3, 20, "sin", false));
        
        System.out.println("****************************************");
        System.out.println("Mostrar todo");
        ar.getAll().forEach(System.out::println);
        System.out.println("****************************************");
        System.out.println("Consulta por nombre");
        ar.getLikeNombre("Ca").forEach(System.out::println);
        System.out.println("****************************************");
        System.out.println("Consulta por prenda");
        ar.getLikeTipo(Tipo.PRENDA).forEach(System.out::println);
        System.out.println("****************************************");
        System.out.println("Consulta por activo");
        ar.getLikeActivo(true).forEach(System.out::println);
        
        ar.remove(ar.getById(2));
        
        
        Articulo a=ar.getById(4);
        a.setActivo(true);
        ar.update(a);
        System.out.println("****************************************");
        System.out.println("Consulta por nombre");
        ar.getLikeNombre("almohada").forEach(System.out::println);
        
    }
}
