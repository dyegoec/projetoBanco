<%@page import="modelo.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<%
	
	if(session.getAttribute("usuario") == null){
		response.sendRedirect("Login.jsp");		
	}else{
		Usuario u = (Usuario) session.getAttribute("usuario");	
	}
	
	
	%>
	
	<form action = 'principalServlet' >
		 <select>
  			<option value="1">Janeiro</option>
  			<option value="2">Fevereiro</option>
  			<option value="3">Março</option>
  			<option value="4">Abril</option>
  			<option value="5">Maio</option>
  			<option value="6">Junho</option>
  			<option value="7">Julho</option>
  			<option value="8">Agosto</option>
  			<option value="9">Setembro</option>
  			<option value="10">Outubro</option>
  			<option value="11">Novembro</option>
  			<option value="12">Dezembro</option>
		</select>
		<input type = 'text' value ='2015'> ate 
		
		 <select>
  			<option value="1">Janeiro</option>
  			<option value="2">Fevereiro</option>
  			<option value="3">Março</option>
  			<option value="4">Abril</option>
  			<option value="5">Maio</option>
  			<option value="6">Junho</option>
  			<option value="7">Julho</option>
  			<option value="8">Agosto</option>
  			<option value="9">Setembro</option>
  			<option value="10">Outubro</option>
  			<option value="11">Novembro</option>
  			<option value="12">Dezembro</option>
		</select>
		<input type = 'text' value ='2015'/><br>
		<input type = 'submit' value = 'Consultar'/>
		
	</form>
	
</body>
</html>