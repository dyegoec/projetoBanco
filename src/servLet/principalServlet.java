package servLet;

import java.awt.List;
import java.util.*;
import java.io.IOException;

import modelo.Movimentacao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class principalServlet
 */
public class principalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public principalServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//String id = request.getParameter("id");		
		//new List<Movimentacao> m = new List<Movimentacao>(); 
		//m = buscarMovimentacao(id);
		response.sendRedirect("exibirExtrato.jsp");
	}
	
	
	
}
