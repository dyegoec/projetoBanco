package DAO;

import javax.persistence.EntityManager;

import org.apache.catalina.Session;

import modelo.Usuario;

public class UsuarioDAO {

	public static boolean efetuarSaque(Usuario conta, double res, double limite) {

		Usuario usuario = conta;
		usuario.setSaldoAtual(res);
		usuario.setSaldoLimite(limite);

		try {
			EntityManager em = Conexao.abrirConexao();
			em.getTransaction().begin();

			em.merge(usuario);
			em.getTransaction().commit();

			em.close();
			Conexao.fecharConexao();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public static Usuario buscarUsuario(String conta, String agencia) {

		EntityManager em = Conexao.abrirConexao();
		em.getTransaction().begin();
		Usuario usuario = new Usuario();

		try {

			usuario = (Usuario) em.createNamedQuery("Usuario.transfer")
					.setParameter("numeroConta", conta)
					.setParameter("numeroAgencia", agencia).getSingleResult();

		} catch (Exception e) {
			em.close();
			Conexao.fecharConexao();
			return null;
		}
		em.close();
		Conexao.fecharConexao();
		return usuario;
	}

	public static boolean efetuaTransfer(Usuario conta, double transfer) {

		Usuario usuario = conta;
		usuario.setSaldoAtual(transfer + usuario.getSaldoAtual());

		try {
			EntityManager em = Conexao.abrirConexao();
			em.getTransaction().begin();

			em.merge(usuario);
			em.getTransaction().commit();
			em.close();
			Conexao.fecharConexao();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}
}
