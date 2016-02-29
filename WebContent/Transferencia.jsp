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
		if (session.getAttribute("usuario") == null) {
			response.sendRedirect("Login.jsp");
		} else {
			Usuario u1 = (Usuario) session.getAttribute("usuario");

			double transfer = Double.parseDouble(request
					.getParameter("valorTransferencia"));
			double res;
			double limite = u1.getSaldoLimite();
			double juros;

			if (transfer != 0) {

				String agencia = request.getParameter("txtNAgencia");
				String conta = request.getParameter("txtNConta");

				Usuario u2 = new Usuario();
				u2 = UsuarioDAO.buscarUsuario(conta, agencia);

				if (u2 != null) {

					if (transfer <= u1.getSaldoAtual()) {

						res = u1.getSaldoAtual() - transfer; //saque recebe o restante
						if (UsuarioDAO.efetuarSaque(u1, res, limite)) {
							if (UsuarioDAO.efetuaTransfer(u2, transfer)) {
								out.println("Transferencia efetuada com sucesso !!!");
								MovimentacaoDAO.inserir("- transferencia",
										u1.getId(), -transfer, 0);
								MovimentacaoDAO.inserir("+ transferencia",
										u2.getId(), transfer, 0);
							}
						} else {
							out.println("Transferencia não efetuada !!!");
						}
					} else if (transfer <= u1.getSaldoAtual()
							+ u1.getSaldoLimite()
							&& u1.getSaldoAtual() >= 0) {
						juros = ((transfer - u1.getSaldoAtual()) * 11.15) / 100;
						limite = limite - (transfer - u1.getSaldoAtual());
						res = u1.getSaldoAtual() - transfer - juros;

						if (UsuarioDAO.efetuarSaque(u1, res, limite)) {
							if (UsuarioDAO.efetuaTransfer(u2, transfer)) {
								out.println("Transferencia efetuada com sucesso !!!");
								MovimentacaoDAO.inserir("- transferencia",
										u1.getId(), -transfer, juros);
								MovimentacaoDAO.inserir("+ transferencia",
										u2.getId(), transfer, 0);
							}
						}
					} else if (transfer <= u1.getSaldoLimite()) {
						juros = (transfer * 11.15) / 100;
						limite = u1.getSaldoLimite() - transfer;
						res = u1.getSaldoAtual() - transfer - juros;
						if (UsuarioDAO.efetuarSaque(u1, res, limite)) {
							if (UsuarioDAO.efetuaTransfer(u2, transfer)) {
								out.println("Transferencia efetuada com sucesso !!!");
								MovimentacaoDAO.inserir("- transferencia",
										u1.getId(), -transfer, juros);
								MovimentacaoDAO.inserir("+ transferencia",
										u2.getId(), transfer, 0);
							}
						}
					}else out.println("Dinheiro inssuficiente !!!");
				} else {
					out.println("Numero de conta e agencia invalidos");
				}

			}
		}
	%>

	<form action=Transferencia.jsp>
		<br>
		<table>
			<tr>
				<td>N. Agencia:</td>
				<td><input type='text' name='txtNAgencia'></td>
			</tr>
			<tr>
				<td>N. Conta:</td>
				<td><input type='text' name='txtNConta'></td>
			</tr>
			<tr>
				<td>R$</td>
				<td><input type='text' name='valorTransferencia'></td>
				<td><input type='submit' value='Transferir'></td>
			</tr>
			</form>
			<tr>
				<form action='Principal.jsp'>
					<td></td>
					<td><input type='submit' value='Voltar'></td>
				</form>
			</tr>

		</table>
</body>
</html>