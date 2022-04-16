package ar.org.centro8.curso.java.web.interfaces.test;

import java.util.Date;


public class TestDate {
    public static void main(String[] args) {
        Date date=new Date();
        System.out.println(date);
        String fecha="";
        fecha+=(date.getYear()+1900)+"/"+(date.getMonth()+1)+"/"+(date.getDate());
        System.out.println(fecha);
    }
}
