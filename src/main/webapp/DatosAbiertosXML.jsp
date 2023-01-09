<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="mainPackage.EstadisticaAnual"%>
<%@ page import="xml.LecturaSAX" %>
<%@ page import="xml.GeneradorDOM" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<style>
		body{
    		background-color: #dbdbdb;
   		}
        table{
            border: 2px;
            border-style: solid;
            border-collapse: collapse;
            margin: auto;
        }
        th{
            font-size: 23px;
        }
        td{
            border: 1px;
            border-style: solid;
            padding: 10px;
            font-size: 18px;
            font-family: Arial, Helvetica, sans-serif;
        }
        p{
        	text-align: center;
        }
        h1{
        	text-align: center;
        	font-size: 45px;
        }
        section{
            font-size: large;
            text-align: center;
            background-color: #e0e0e0;;
        }
        .imagenes{
            position: fixed;
            opacity: 20%;
            top: 12%;
            left:55%;
            filter: blur(1px);
            transform: rotate(20deg);
            width: 200px;
        	height: auto;
        }
        footer{
            position: fixed;
            margin: auto;
            text-align: center;
            background-color: gray;
            color: white;
            width: 100%;
            height: 6%;
            bottom: 0;
        }
</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%! LecturaSAX lector; %>
<% lector = new LecturaSAX(); %>
<%! ArrayList<EstadisticaAnual> estadisticasAnuales; %>
<% estadisticasAnuales = lector.getAniodefs(); %>

<% if(request.getParameter("opcion").equals("escritura")){ %>
	<%! EstadisticaAnual estadisticaEscribir; %>
	<% estadisticaEscribir = (EstadisticaAnual) request.getAttribute("datos");%>
	
	<%! GeneradorDOM generar; %>
	<% generar = new GeneradorDOM(); %>
	<% generar.generarEtiquetasInicio(); %>
	<% generar.generarDocumentoLeido(estadisticasAnuales); %>
	<% generar.generarDocument(estadisticaEscribir); %>
	<% generar.generarXML(); %>
	<% lector = new LecturaSAX(); %>
	<% estadisticasAnuales = lector.getAniodefs(); %>
<%}%>

	<table border="1">
	<tr><td>Año</td><td>Hombres</td><td>Mujeres</td></tr>
	<% for(EstadisticaAnual estadisticaAnual : estadisticasAnuales) { %>
		<tr><td><%= estadisticaAnual.getAnio() %></td>
		<td><%= estadisticaAnual.getHombres() %></td>
		<td><%= estadisticaAnual.getMujeres() %></td></tr>
	<% } %>
	</table>
</body>
</html>