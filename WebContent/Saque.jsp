<%@page import="DAO.MovimentacaoDAO"%>
<%@page import="DAO.UsuarioDAO"%>
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
		//String acao = request.getParameter("acao");

		//if( acao != "sacar"){

		if (session.getAttribute("usuario") == null) {
			response.sendRedirect("Login.jsp");
		} else {

			Usuario u = (Usuario) session.getAttribute("usuario");
			double juros;
			double limite = u.getSaldoLimite();
			double saque = Double.parseDouble(request
					.getParameter("txtSaque"));
			double res;
			out.println("Bem vindo " + u.getNome());
	%><br>
	<%
		if (saque != 0) { //caso houver saque
				if (saque <= u.getSaldoAtual()) { //se o saque for menor o saldo 
					res = u.getSaldoAtual() - saque; //saque recebe o restante
					if (UsuarioDAO.efetuarSaque(u, res, limite)) {
						out.println("Saque efetuado com sucesso !!!");
						MovimentacaoDAO.inserir("Saque", u.getId(), saque,
								0);
					} else {
						out.println("Saque não efetuado !!!");
					}

				} else if (saque <= u.getSaldoAtual() + u.getSaldoLimite()
						&& u.getSaldoAtual() >= 0) {
					juros = ((saque - u.getSaldoAtual()) * 11.15) / 100;
					limite = limite - (saque - u.getSaldoAtual());
					res = u.getSaldoAtual() - saque - juros;
					if (UsuarioDAO.efetuarSaque(u, res, limite)) {
						out.println("Saque efetuado com sucesso !!!");
						MovimentacaoDAO.inserir("Saque", u.getId(), saque,
								juros);

					} else {
						out.println("Saque não efetuado !!!");
					}
				} else if (saque <= u.getSaldoLimite()) {
					juros = (saque * 11.15) / 100;
					limite = u.getSaldoLimite() - saque;
					res = u.getSaldoAtual() - saque - juros;
					if (UsuarioDAO.efetuarSaque(u, res, limite)) {
						out.println("Saque efetuado com sucesso !!!");
						MovimentacaoDAO.inserir("Saque", u.getId(), saque,
								juros);

					} else {
						out.println("Saque não efetuado !!!");
					}
				} else {
					out.print("Dinheiro inssuficiente");
				}

			}
		}
	%>
	<br>
	<form action='Saque.jsp'>
		R$<input type='text' name='txtSaque' /> <input type='submit'
			value='Sacar' /><br>
	</form>
	<form action="Principal.jsp">
		<input type='submit' value='Voltar' />
	</form>

</body>
</html>