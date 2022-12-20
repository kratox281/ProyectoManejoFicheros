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
    <form action="ServletAccesoDA" method="">
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
                        Dato 1:<input type="text" name="dato" /><br>
                        Dato 2:<input type="text" name="dato" /><br>
                        Dato 3:<input type="text" name="dato" /><br>
                        Dato 4:<input type="text" name="dato" /><br>
                        Dato 5:<input type="text" name="dato" /><br>
                        Dato 6:<input type="text" name="dato" /><br>
                        <p style="color: red;">Los campos con (*) son obligatorios</p>
                    </td>
                </tr>
            </tbody>
        </table>
       
    </form>
  
</body>

</html>