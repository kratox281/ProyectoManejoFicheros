<%@page import="javax.swing.JFileChooser"%>
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
    pageEncoding="ISO-8859-1" errorPage="Error.jsp"%>
    <%
    JsonParser parser=new JsonParser();
	Path path=Path.of(System.getProperty("user.dir") + "/Archivos/datos.gob.es/Defunciones.json");
	//Lee todo el contenido del fichero
	%>
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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% if(request.getParameter("opcion").equals("escritura")){
	String content=Files.readString(path);
	JsonArray jsonArray=(JsonArray) parser.parse(content);
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
		<%
	}
	String content=Files.readString(path);
	JsonArray jsonArray=(JsonArray) parser.parse(content);
%>
<header>
		<h1>Defunciones</h1>
	</header>
	<section>
	<img class="imagenes"
		src="https://static.vecteezy.com/system/resources/previews/001/193/565/non_2x/skull-sketch-png.png"/>
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
	 </table>
</body>
<p>Escritura en fichero realizada<p>
<footer>
    <p>© 2022-2023 Acceso a Datos, Estadísticas de Muertes</p>
 </footer>
</html>