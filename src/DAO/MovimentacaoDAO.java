package DAO;

import java.sql.Timestamp;

import javax.persistence.EntityManager;

import modelo.Movimentacao;
import modelo.Usuario;

public class MovimentacaoDAO {
	
	public static void inserir(String tipo, int id, double valor, double juros){
		
		
		Movimentacao m = new Movimentacao();
		m.setIdUsuario(id);
		
		m.setData(new Timestamp(System.currentTimeMillis()));
		m.setTipo(tipo);
		m.setValor(valor);
		m.setJuros(juros);
		
		try {
			EntityManager em = Conexao.abrirConexao();
			em.getTransaction().begin();
			
			em.merge(m);
			em.getTransaction().commit();
			
			em.close();
			Conexao.fecharConexao();
		}catch(Exception e){
			e.printStackTrace();
		}
			
		
	}

}
