package ar.org.centro8.curso.java.web.interfaces.test;

import ar.org.centro8.curso.java.web.entities.Cliente;
import ar.org.centro8.curso.java.web.entities.Direccion;
import ar.org.centro8.curso.java.web.enums.TipoDocumento;
import ar.org.centro8.curso.java.web.interfaces.connectors.Connector;
import ar.org.centro8.curso.java.web.repositories.interfaces.I_ClienteDireccionRepository;
import ar.org.centro8.curso.java.web.repositories.interfaces.I_ClienteRepository;
import ar.org.centro8.curso.java.web.repositories.jdbc.ClienteDireccionRepository;
import ar.org.centro8.curso.java.web.repositories.jdbc.ClienteRepository;
import ar.org.centro8.curso.java.web.repositories.list.ClienteRepositoryFactory;

public class TestRepository1 {
    public static void main(String[] args) {
        //I_ClienteRepository cr=ClienteRepositoryFactory.getClienteRepository();
        I_ClienteRepository cr=new ClienteRepository(Connector.getConnection());
        
        //cr.save(new Cliente("Juan1", "Perez", "2005/05/05", TipoDocumento.DNI, "1221111", "222222", "nada@nada", new Direccion("Viel", 10, "", "", "", "1111", "CABA", "CABA", "Argentina"), ""));
        //cr.save(new Cliente("Laura2", "Mendez", "2005/05/05", TipoDocumento.DNI, "1331112", "222222", "nada@nada", new Direccion("Viel", 10, "", "", "", "1111", "CABA", "CABA", "Argentina"), ""));
        //cr.save(new Cliente("Jose3", "Gomez", "2005/05/05", TipoDocumento.DNI, "1441113", "222222", "nada@nada", new Direccion("Viel", 10, "", "", "", "1111", "CABA", "CABA", "Argentina"), ""));
        //cr.save(new Cliente("Ana4", "Lopez", "2005/05/05", TipoDocumento.DNI, "1551114", "222222", "nada@nada", new Direccion("Viel", 10, "", "", "", "1111", "CABA", "CABA", "Argentina"), ""));
        
        cr.remove(cr.getById(24));
        
        cr.getAll().forEach(System.out::println);
        System.out.println("****************************************************");
        cr.getLikeApellido("go").forEach(System.out::println);
        System.out.println("****************************************************");
        
        System.out.println("****************************************************");
        System.out.println("****************************************************");
        I_ClienteDireccionRepository cdr=new ClienteDireccionRepository(Connector.getConnection());
        cdr.getAll().forEach(System.out::println);
        System.out.println("****************************************************");
        cdr.getLikeNombre("go").forEach(System.out::println);
        
    }
}
