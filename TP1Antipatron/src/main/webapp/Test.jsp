<%-- 
    Document   : Test
    Created on : 10 sep. 2021, 20:06:06
    Author     : carlos
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <%
            //Código Java
            out.println("<h1>Hola Mundo!!</h1>");
            System.out.println("Esto sale en consola del server");
            
            String nombre=request.getParameter("nombre");
            out.println("<h2>Hola "+nombre+"</h2>");
            
            int nro1=Integer.parseInt(request.getParameter("nro1"));
            int nro2=Integer.parseInt(request.getParameter("nro2"));
            try{
                //int nro1=Integer.parseInt(request.getParameter("nro1"));
                //int nro2=Integer.parseInt(request.getParameter("nro2"));

                int suma=nro1+nro2;
                out.println("<h2>Total: "+suma+"</h2>");
            }catch(Exception e){
                out.println("<h2>Hay que ingresar parametros nro1 y nro2");
            }
            
            List<String>list=List.of("Primavera","Verano","Otoño","Invierno");

        %>
        
        <h3>Aprendiendo JSP</h3>
        
        <% 
            list.forEach(System.out::println);
            //list.forEach(out::println);
            for(String s:list) out.println(s+"<br>");
        %>
        
    </body>
</html>
