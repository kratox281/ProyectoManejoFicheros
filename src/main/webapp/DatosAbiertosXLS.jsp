<%@page import="java.util.Map.Entry"%>
<%@page import="lecturaEscrituraXLSX.LecturaYEscritura"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
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
	if (request.getServletContext().getAttribute("datos") != null) {
		datosNuevos = (ArrayList<String>) request.getServletContext().getAttribute("datos");
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