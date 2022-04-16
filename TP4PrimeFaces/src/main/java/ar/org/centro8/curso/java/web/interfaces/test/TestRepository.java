package ar.org.centro8.curso.java.web.interfaces.test;

import ar.org.centro8.curso.java.web.entities.Cliente;
import ar.org.centro8.curso.java.web.entities.Direccion;
import ar.org.centro8.curso.java.web.enums.TipoDocumento;
import ar.org.centro8.curso.java.web.repositories.interfaces.I_ClienteRepository;
import ar.org.centro8.curso.java.web.repositories.list.ClienteRepositoryFactory;

public class TestRepository {
    public static void main(String[] args) {
        I_ClienteRepository cr=ClienteRepositoryFactory.getClienteRepository();
        cr.save(new Cliente("Juan", "Perez", "2005/05/05", TipoDocumento.DNI, "11111", "222222", "nada@nada", new Direccion("Viel", 10, "", "", "", "1111", "CABA", "CABA", "Argentina"), ""));
        cr.save(new Cliente("Laura", "Mendez", "2005/05/05", TipoDocumento.DNI, "11111", "222222", "nada@nada", new Direccion("Viel", 10, "", "", "", "1111", "CABA", "CABA", "Argentina"), ""));
        cr.save(new Cliente("Jose", "Gomez", "2005/05/05", TipoDocumento.DNI, "11111", "222222", "nada@nada", new Direccion("Viel", 10, "", "", "", "1111", "CABA", "CABA", "Argentina"), ""));
        cr.save(new Cliente("Ana", "Lopez", "2005/05/05", TipoDocumento.DNI, "11111", "222222", "nada@nada", new Direccion("Viel", 10, "", "", "", "1111", "CABA", "CABA", "Argentina"), ""));
        
        cr.getAll().forEach(System.out::println);
        System.out.println("****************************************************");
        cr.getLikeApellido("go").forEach(System.out::println);
        System.out.println("****************************************************");
        
    }
}
