<%@page import="java.io.File"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mainPackage.EstadisticaAnual"%>
<%@page import="java.util.List"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Path"%>
<%@page import="com.google.gson.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    JsonParser parser=new JsonParser();
	Path path=Path.of("C:\\Users\\Kratox\\proyectoClase\\ProyectoManejoFicheros\\Archivos\\datos.gob.es\\Defunciones.json");
	String content=Files.readString(path);
	JsonArray jsonArray=(JsonArray) parser.parse(content);
	%>
<!DOCTYPE html>
<html>
<head>
<style>
	h1,p {text-align:center;}

	table{
  		margin-left: auto;
  		margin-right: auto;
  	}
	
  	tr,td{
  		border: 1px solid black;
  		width:200px;
	}
</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%if(request.getParameter("opcion").equals("lectura")){ %>
	<h1>Defunciones</h1>
	<table>
	  <tr>
	    <td>Año</td>
	    <td>Hombres</td>
	    <td>Mujeres</td>
	  </tr>
	  <%for(JsonElement element:jsonArray){
	  JsonObject obj=element.getAsJsonObject();%>
	  <tr>
	  	<td><%= obj.get("anio").getAsInt()%></td>
	  	<td><%= obj.get("hombres").getAsInt()%></td>
	  	<td><%= obj.get("mujeres").getAsInt()%></td>
	  </tr>
	  <%}%>
  <%}else{
  	Gson gson=new Gson();
	List<String> datosList = (ArrayList)request.getAttribute("datosLista");
	List<EstadisticaAnual> estadisticas=new ArrayList<>();
	EstadisticaAnual ea= new EstadisticaAnual(Integer.parseInt(datosList.get(0)),Integer.parseInt(datosList.get(1)),Integer.parseInt(datosList.get(2)));
	for(JsonElement element:jsonArray) {
		JsonObject obj=element.getAsJsonObject();
		int anio=obj.get("anio").getAsInt();
		int hombres=obj.get("hombres").getAsInt();
		int mujeres=obj.get("mujeres").getAsInt();
		estadisticas.add(new EstadisticaAnual(anio, hombres, mujeres));
				
	}
			estadisticas.add(ea);
			FileWriter fw = new FileWriter(path.toFile(),false);
			gson.toJson(estadisticas, fw);
			fw.close();
			%>
  <p>Escritura en fichero realizada<p>
  <%}%>
</table>
</body>
</html>