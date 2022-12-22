<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%
List<String> datos;
if(request.getAttribute("datos") != null) datos = (List<String>)request.getAttribute("datos"); 
else datos= null;
String opcion;
if(request.getAttribute("opcion") != null) opcion = (String)request.getAttribute("opcion");
else opcion = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<p><%=opcion %></p>
</body>
</html>