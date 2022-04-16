<%@page import="trabajo.dao.repositories.jdbc.ClienteRepository"%>
<%@page import="trabajo.dao.interfaces.connectors.Connector"%>
<%@page import="trabajo.dao.repositories.interfaces.I_ClienteRepository"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% I_ClienteRepository cr=new ClienteRepository(Connector.getConnection()); %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Borrar Cliente</title>
        <link href="css/estilos.css" type="text/css" rel="stylesheet"/>
    </head>
    <body>
        <div id="title">
            <h1>Se borrara un cliente!</h1>
        </div>
        
        <div id="form">
            <%
                try {
                    cr.remove(cr.getById(Integer.parseInt(request.getParameter("id"))));
                    out.println("<h3>Se borro un cliente!</h3>");
                } catch (Exception e) {
                    System.out.println(e);
                    out.println("<h3>No se borro un cliente!</h3>");
                }
            %>
        </div>
        
        <div id="form">
          <form action="ClientesDAO.jsp">
              <input type="submit" value="Volver"/>
          </form>
        </div>
    </body>
</html>
