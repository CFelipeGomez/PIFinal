<%-- 
    Document   : editar
    Created on : 19/10/2022, 10:52:23 a. m.
    Author     : fepip
--%>

<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.apache.tomcat.dbcp.dbcp2.PoolingConnection.StatementType"%>
<%@page import="sun.tools.jconsole.ConnectDialog"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>Editar Empleado</title>
    </head>
    <body>
        <%
            String id = request.getParameter("id");
            String nombre = request.getParameter("nombre");
            String documento = request.getParameter("documento");
            String telefono = request.getParameter("telefono");
            String serial = request.getParameter("serial");
            String fotou = request.getParameter("fotou");
            String fotob = request.getParameter("fotob");

        %>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <form action="editar.jsp" method="get">
                        <div class="form-group">
                            <label for="nombre">Nombre</label>
                            <input type="text" class=form-control" id="nombre" value="<%= nombre %>" name="nombre" placeholder="Nombre" required="required">
                        </div>
                        <div class="form-group">
                            <label for="documento">Documento</label>
                            <input type="text" class=form-control" id="documento" value="<%= documento %>" name="documento" placeholder="Documento" required="required">
                        </div> 
                        <div class="form-group">
                            <label for="telefono">Telefono</label>
                            <input type="text" class=form-control" id="telefono" value="<%= telefono %>" name="telefono" placeholder="Telefono" required="required">
                        </div>
                         <div class="form-group">
                            <label for="serial">Serial</label>
                            <input type="text" class=form-control" id="serial" value="<%= serial %>" name="serial" placeholder="Serial" required="required">
                        </div>
                        <div class="form-group">
                            <label for="fotoU">Foto Usuario</label>
                            <input type="file" class=form-control" id="fotou" value="<%= fotou%>" name="fotou" placeholder="Foto Usuario" required="required">
                        </div>
                        <div class="form-group">
                            <label for="fotoB">Foto Bicicleta</label>
                            <input type="file" class=form-control" id="fotob" name="fotob" placeholder="Foto Bicicleta" required="required">
                        </div>
                        <a href="index.jsp" class="btn btn-danger">Cancelar <i class="fa fa-ban" aria-hidden="true"></i></a>
                        <button type="submit" name="enviar" class="btn btn-primary">GUARDAR <i class="fa fa-floppy-o" aria-hidden="true"></i></button>
                        <input type="hidden" name="id" value="<%= id %>">
                    </form>
                </div>  
            </div>    
        </div> 
        <%            if (request.getParameter("enviar") != null) {
                
                try {
                    Connection con = null;
                    Statement st = null;
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsps?user=root&password=");
                    st = con.createStatement();
                    st.executeUpdate("update usuarios set nombre='" + nombre + "',documento='" + documento + "',telefono='" + telefono + "',serial='" + serial + "',fotou='" + fotou + "',fotob='" + fotob + "' where id='"+id+"';");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } catch (Exception e) {
                    out.print(e);
                }
            }
        %>
    </body>
</html>
