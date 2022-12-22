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
    <form action="ServletAccesoDA" method="post">
        <table align="center">
            <tbody>
                <tr>
                    <td> Formato del fichero
                        <hr>
                        <!-- Formato del fichero (XLS, CSV, JSON, XML) -->
                        <select name="formato" display="flow">
                            <option value="XLS">XLS</option>
                            <option value="CSV">CSV</option>
                            <option value="JSON">JSON</option>
                            <option value="XML">XML</option>
                        </select>
                        <br>
                        ¿Qué quieres hacer con el fichero?
                        <br>
                        <input type="radio" name="opcion" value="lectura">Lectura
                        <input type="radio" name="opcion" value="escritura">Escritura
                        <br>
                        <input type="submit">
                    </td>
                    <td>
                        *Año de la estadistica:<input type="text" name="dato" /><br>
                        *Hombres:<input type="text" name="dato" /><br>
                        *Mujeres:<input type="text" name="dato" /><br>
                    </td>
                </tr>
                <tr>
                	<td>
                		<%if(request.getAttribute("opcion") == "null"){
					  	%>
					  	<p style="color:red;">*Tienes que elegir una opción</p>
					  	<%} %>
					  	<%if(request.getAttribute("datos") == "null"){
					  	%>
					  	<p style="color:red;">*Tienes que completar todos los datos correctamente <br> (todos los campos con * deben estar rellenados)</p>
					  	<%} %>
                	</td>
                </tr>
            </tbody>
        </table>
    </form>
</body>

</html>