package DAO;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class Conexao {
	
	static EntityManagerFactory emf;
	static EntityManager em;
	
	static{ //primeira coisa feita no projeto 
		emf = Persistence.createEntityManagerFactory("Trabalho2"); //name persistence-unit persistence.xml
	}
	
	public static EntityManager abrirConexao(){
		return emf.createEntityManager();
	}
	
	public static void fecharConexao(){
		emf.close();
	}
}
