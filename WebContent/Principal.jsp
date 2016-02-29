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
	<div align="center">
	<%
		if(session.getAttribute("usuario") != null){
			Usuario u = (Usuario) session.getAttribute("usuario");
			
			out.println("Bem vindo "+ u.getNome());
					
		}else{
			response.sendRedirect("Login.jsp");
		}
	%>
	</div>
			<form>
			<div align="center">
				<br><br>
				<a href =ExibirSaldo.jsp>Exibir Saldo</a><br>
				<a href =PeriodoTransfer.jsp>Exibir Extrato</a><br>
				<a href =Saque.jsp?txtSaque=0>Efetuar saque</a><br>
				<a href =Transferencia.jsp?valorTransferencia=0>Efetuar transferencia</a><br>
				<a href =LoginServLet?acao=Sair>Desconectar</a><br>
				
			</div>	
			
			</form>
</body>
</html>