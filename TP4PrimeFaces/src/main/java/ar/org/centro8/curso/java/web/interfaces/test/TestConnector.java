package ar.org.centro8.curso.java.web.interfaces.test;

import ar.org.centro8.curso.java.web.interfaces.connectors.Connector;
import java.sql.Connection;
import java.sql.ResultSet;
import java.time.LocalTime;
public class TestConnector {
    public static void main(String[] args) {
        System.out.println(LocalTime.now());
        try (Connection conn=Connector.getConnection()){
            System.out.println(LocalTime.now());
            ResultSet rs=conn.createStatement().executeQuery("select version()");
            if(rs.next())
                System.out.println(rs.getString(1));
            else
                System.out.println("No se pudo conectar al server!");
            System.out.println(LocalTime.now());
        } catch (Exception e) {
            System.out.println(e);
            System.out.println("No se pudo conectar al server!");
        }
        System.out.println(LocalTime.now());
    }
}