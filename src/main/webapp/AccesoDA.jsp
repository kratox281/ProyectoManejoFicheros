<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1 align="center">Tratamiento de ficheros</h1>
<form action="ServletAccesoDA" method= "">

<!--Primer bloque del html con campos del formulario-->
<div align="left">
Formato del fichero 
<!-- Formato del fichero (XLS, CSV, JSON, XML) -->
<select name="formato">
<option value="XLS">XLS</option>
<option value="CSV">CSV</option>
<option value="JSON">JSON</option>
<option value="XML">XML</option>
</select>
<br>
<hr color="black" width="*/2">
<br>
¿Qué quieres hacer con el fichero?
<br>
<input type="radio" name="opcion" value="lectura">Lectura
<input type="radio" name="opcion" value="escritura">Escritura
</div>
<!--Primer bloque del html con campos del formulario-->
<div align="right">hola

</div>
</form>
<!-- Fin del formulario -->
</body>
</html>