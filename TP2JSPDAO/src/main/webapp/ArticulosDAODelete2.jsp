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
        
        <div id="form">
            <%
                try {
                    ar.remove(ar.getById(Integer.parseInt(request.getParameter("id"))));
                    out.println("<h3>Se borro un articulo!</h3>");
                } catch (Exception e) {
                    System.out.println(e);
                    out.println("<h3>No se borro un articulo!</h3>");
                }
            %>
        </div>
        
        <div id="form">
          <form action="ArticulosDAO.jsp">
              <input type="submit" value="Volver"/>
          </form>
        </div>
    </body>
</html>
