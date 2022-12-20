<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<style>
  h1 {color:red;
  		text-align:center;}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1><%= exception.getMessage() %></h1>
<hr>
<p><% exception.printStackTrace(new java.io.PrintWriter(out));%>
	</p>
</body>
</html>