<%-- 
    Document   : busqueda
    Created on : 02-05-2014, 01:49:00 AM
    Author     : daniel
--%>

<%@page import="bajavista.Informacion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bajavista.Buscador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String busqueda = request.getParameter("buscador");
    String indexES = "/home/daniel/Documentos/Programación/Java/Tecnologías de la web/Bajavista/index/IndexFileES";
    String indexNONES = "/home/daniel/Documentos/Programación/Java/Tecnologías de la web/Bajavista/index/IndexFileNONES";
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="shortcut icon" href="../../assets/ico/favicon.ico">

        <title>Busqueda</title>

        <!-- Bootstrap core CSS -->
        <link type="text/css" href="../css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="../index.jsp">Buscar</a></li>
                        <li><a href="pages/actualizar.jsp">Actualizar</a></li>
                    </ul>
                </div><!--/.nav-collapse -->
            </div>
        </div>

        <br><br><br>
        <h1>Busqueda: <%=busqueda%></h1>
        <div class="container">
            <div class="text-center">
                <%
                    Buscador buscador = new Buscador(indexES, indexNONES);
                    ArrayList<Informacion> listaResultados = buscador.buscarContenido(busqueda);

                    if (listaResultados != null) {
                        for (int i = 0; i < listaResultados.size(); i++) {
                            out.print(listaResultados.get(i).getTexto());
                %>         <br><br>
                <%
                        }
                    } else {
                        out.print("No existen coincidencias...");
                    }
                %>
            </div>
        </div>
    </body>
</html>