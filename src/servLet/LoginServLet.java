package servLet;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.Usuario;
import DAO.Conexao;

/**
 * Servlet implementation class LoginServLet
 */
public class LoginServLet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoginServLet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		String acao = request.getParameter("acao");
		
		if (request.getParameter("acao") != null) {

			if (acao.equals("Entrar")) {

				String agencia = request.getParameter("numeroAgencia");
				String conta = request.getParameter("numeroConta");
				String senha = request.getParameter("senha");

				if (!agencia.isEmpty() && !conta.isEmpty() && !senha.isEmpty()) { // verificando
																					// se
																					// ha
																					// algum
																					// campo
																					// vazio

					EntityManager em = Conexao.abrirConexao();
					em.getTransaction().begin();
					Usuario usuario = new Usuario();
					
					try {
						System.out.println(agencia);
						usuario = (Usuario) em.createNamedQuery("Usuario.login").setParameter("numeroConta", conta).setParameter("numeroAgencia", agencia).setParameter("senha", senha).getSingleResult();
						
					} catch (Exception e) {
						em.close();
						Conexao.fecharConexao();
						response.sendRedirect("Login.jsp");
						
						return;
					}
					em.close();
					Conexao.fecharConexao();

					if (usuario != null) {
						request.getSession().invalidate();
						request.getSession().setAttribute("usuario", usuario);
						request.getSession().setMaxInactiveInterval(60);
						response.sendRedirect("Principal.jsp");
					} else {
						
						response.sendRedirect("Login.jsp");
					}
				}else response.sendRedirect("Login.jsp");
			} else if (acao.equals("Sair")) {
				request.getSession().setAttribute("usuario", null);
				response.sendRedirect("Login.jsp");
			} else {
				response.sendRedirect("Login.jsp");
			}
		} else {	
			response.sendRedirect("Login.jsp");
		}

	}

}
