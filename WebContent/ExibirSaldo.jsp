<%@page import="modelo.Usuario"%>
<%@page import="java.text.NumberFormat"%>
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
	%>
		
		
			 
	
	<div align = "center">
		
		<table>	
		
		<tr>
			<td>Exibir Saldo</td>
		</tr>
		
		<tr>
			<td>Saldo disponivel: </td> <td><%out.println(NumberFormat.getCurrencyInstance().format(u.getSaldoAtual()));%></td>
		</tr>
			
		<tr>
			<td>Limite disponivel: </td> <td><%out.println(NumberFormat.getCurrencyInstance().format(u.getSaldoLimite()));%></td>		
		</tr>
		 	
		<tr>	
			<form action = 'Principal.jsp'>
			<td><input type = 'submit' value ='voltar'></td>
			</form>
		</tr>
		
		</table>
	</div>
	<%} %>
	
</body>
</html>