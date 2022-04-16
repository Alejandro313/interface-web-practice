<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="trabajo.dao.entities.Articulo"%>
<%@page import="trabajo.dao.interfaces.utils.html.HtmlTable"%>
<%@page import="trabajo.dao.interfaces.connectors.Connector"%>
<%@page import="trabajo.dao.repositories.jdbc.ArticuloRepository"%>
<%@page import="trabajo.dao.repositories.interfaces.I_ArticuloRepository"%>

<%I_ArticuloRepository ar = new ArticuloRepository(Connector.getConnection());%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Borrar Articulo</title>
        <link href="css/estilos.css" type="text/css" rel="stylesheet"/>
    </head>
    <body>
        <div id="title">
            <h1>Se borrara un articulo!</h1>
        </div>
        <div id="tabla">
            <% 
                //out.println(cr.getById(Integer.parseInt(request.getParameter("id"))));
                List<Articulo>list=new ArrayList();
                list.add(ar.getById(Integer.parseInt(request.getParameter("id"))));
                out.println(new HtmlTable().getTable(list));
            %>
        </div>
        <div id="form">
            Desea Borrar?
            <form action="ArticulosDAO.jsp">
                <input type="text" name="borrar" value="no" hidden/>
                <input type="submit" value="No"/>
            </form>
            <form action="ArticulosDAODelete2.jsp"> 
                <input type="text" name="borrar" value="si" hidden/>
                <input type="text" name="id" value="<%out.println(request.getParameter("id"));%>" hidden/>
                <input type="submit" value="Si"/>
            </form>
            <%
                String borrar=request.getParameter("borrar");
                if(borrar!=null && borrar.equals("si")){
                    System.out.println("***************************");
                    System.out.println("***************************");
                    ar.remove(ar.getById(Integer.parseInt(request.getParameter("id"))));
                    System.out.println("***************************");
                    System.out.println("***************************");
                }
            %>
        </div>
    </body>
</html>
