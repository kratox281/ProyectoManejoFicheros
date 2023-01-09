<%@page import="java.util.Map.Entry"%>
<%@page import="lecturaEscrituraXLSX.LecturaYEscritura"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
	<%!LecturaYEscritura lYE = new LecturaYEscritura();%>
	<%!String eleccion;%>

	<%
	if (request.getParameter("opcion") != null) {
		eleccion = request.getParameter("opcion");
	} else {
		eleccion = "nulo";
	}
	%>

	<!-- Aqui comienzan los metodos de escritura -->
	<%
	if (eleccion.equals("escritura")) {
	%>
	<%!ArrayList<String> datosNuevos;%>
	<%
	//Recoge los datos insertados en la web de acceso
	if (request.getServletContext().getAttribute("datosLista") != null) {
		datosNuevos = (ArrayList<String>) request.getServletContext().getAttribute("datosLista");
	} else {
		datosNuevos = new ArrayList();
		datosNuevos.add("dato 1");
		datosNuevos.add("dato 2");
		datosNuevos.add("dato 3");
	}

	//Llama al metodo en la clase externa para escribir los datos en el fichero
	lYE.escritura(datosNuevos);
	%>
	<!--Se indica al usuario que su peticion de registro de datos se ha realizado correctamente y que se le mostrará a continueació -->
	<p>Se ha registrado con exito,se le mostrará el documento
		resultante</p>
	<%
	}
	%>
	<!-- Aqui acaba la escritura debajo de esta linea está la lectura que la hace por defecto para demostrar que se han registrado los nuevos datos -->
	<%!Map<Integer, Object[]> mapa;%>
	<table border="3">
		<%
		mapa = lYE.lectura();
		Set<Integer> set = mapa.keySet();

		for (Integer clave : set) {
		%>
		<tr>
			<%
			Object[] datos = mapa.get(clave);
			for (Object dato : datos) {
			%>
			<td><%=dato.toString()%></td>
			<%
			}
			%>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>