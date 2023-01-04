<%@page import="java.util.Arrays"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileWriter"%>
<%@page import="com.opencsv.CSVWriter"%>
<%@page import="com.opencsv.CSVReader"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.FileReader"%>
<%@page import="mainPackage.EstadisticaAnual"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%
//MANEJO DEL FICHERO
File file = new File("Defunciones.csv");
if(!file.exists()){
	file.createNewFile();
}
EstadisticaAnual estadisticaEscritura;
List<EstadisticaAnual> estadisticas  = new ArrayList<EstadisticaAnual>();
if(request.getAttribute("datos") != null) estadisticaEscritura = (EstadisticaAnual)request.getAttribute("datos"); 
else estadisticaEscritura = null;
String opcion;
if(request.getAttribute("opcion") != null) opcion = (String)request.getAttribute("opcion");
else opcion = null;

//LECTURA DE CSV
	List<String[]> archivo = new ArrayList<String[]>();
	CSVReader reader = new CSVReader(new FileReader(file));
	archivo = reader.readAll();
	if(file.length() > 0){
		for(String[] linea:archivo){
			estadisticas.add(new EstadisticaAnual(Integer.valueOf(linea[0]),Integer.valueOf(linea[1]),Integer.valueOf(linea[2])));
		}
	}
//ESCRITURA DE CSV
if(opcion.equalsIgnoreCase("escritura") && estadisticaEscritura != null){
	CSVWriter writer = new CSVWriter(new FileWriter(file,true));
	writer.writeNext(estadisticaEscritura.getArrayString());
	estadisticas.add(estadisticaEscritura);
	writer.close();
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Estadísticas en CSV</title>
</head>
<body>
<div style="margin: auto;width: 50%;">
<h1>DATOS</h1>
<table border="1">
<tr>
<th>Año</th>
<th>Hombres</th>
<th>Mujeres</th>
</tr>
<%for(EstadisticaAnual estadisticaTabla:estadisticas){
%>
<tr>
<td><%=estadisticaTabla.getAnio()%></td>
<td><%=estadisticaTabla.getHombres()%></td>
<td><%=estadisticaTabla.getMujeres()%></td>
</tr>
<%}%>

</table>
</div>
</body>
</html>