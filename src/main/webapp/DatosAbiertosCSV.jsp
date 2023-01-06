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
<html lang="en">
    <style>
        table{
            border: 2px;
            border-style: solid;
            border-collapse: collapse;
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
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Datos CSV</title>
</head>
<body style="background-color: #dbdbdb;">
	<header>
		<h1 style="text-align: center;font-size: 45px;">Defunciones</h1>
	</header>
	<section>
		<img class="imagenes" src="https://static.vecteezy.com/system/resources/previews/001/193/565/non_2x/skull-sketch-png.png" 
	                    style="width: 200px;height: auto;"/>
		<table style="margin: auto;">
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
	</section>
</body>
 <footer>
    <p>© 2022-2023 Acceso a Datos, Estadísticas de Muertes</p>
 </footer>
</html>