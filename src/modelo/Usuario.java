package modelo;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the "Usuario" database table.
 * 
 */
@Entity
@Table(name="\"Usuario\"")
@NamedQueries({
@NamedQuery(name="Usuario.login", query="SELECT u FROM Usuario u WHERE u.numeroAgencia = :numeroAgencia AND u.numeroConta = :numeroConta AND u.senha = :senha"),
@NamedQuery(name="Usuario.saque", query="SELECT u FROM Usuario u WHERE u.id =:id"),
@NamedQuery(name="Usuario.transfer", query="SELECT u FROM Usuario u WHERE u.numeroAgencia =:numeroAgencia AND u.numeroConta = :numeroConta")
})
public class Usuario implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@SequenceGenerator(name="USUARIO_ID_GENERATOR" )
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="USUARIO_ID_GENERATOR")
	@Column(unique=true, nullable=false)
	private Integer id;

	private double limite;

	@Column(length=50)
	private String nome;

	@Column(name="numero_agencia", length=50)
	private String numeroAgencia;

	@Column(name="numero_conta", length=50)
	private String numeroConta;

	@Column(name="saldo_atual")
	private double saldoAtual;

	@Column(name="saldo_limite")
	private double saldoLimite;

	@Column(length=50)
	private String senha;

	public Usuario() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public double getLimite() {
		return this.limite;
	}

	public void setLimite(double limite) {
		this.limite = limite;
	}

	public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getNumeroAgencia() {
		return this.numeroAgencia;
	}

	public void setNumeroAgencia(String numeroAgencia) {
		this.numeroAgencia = numeroAgencia;
	}

	public String getNumeroConta() {
		return this.numeroConta;
	}

	public void setNumeroConta(String numeroConta) {
		this.numeroConta = numeroConta;
	}

	public double getSaldoAtual() {
		return this.saldoAtual;
	}

	public void setSaldoAtual(double saldoAtual) {
		this.saldoAtual = saldoAtual;
	}

	public double getSaldoLimite() {
		return this.saldoLimite;
	}

	public void setSaldoLimite(double saldoLimite) {
		this.saldoLimite = saldoLimite;
	}

	public String getSenha() {
		return this.senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

}