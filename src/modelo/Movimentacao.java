package modelo;

import java.io.Serializable;
import javax.persistence.*;
import java.sql.Timestamp;


/**
 * The persistent class for the "Movimentacao" database table.
 * 
 */
@Entity
@Table(name="\"Movimentacao\"")
@NamedQuery(name="Movimentacao.findAll", query="SELECT m FROM Movimentacao m")
public class Movimentacao implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@SequenceGenerator(name="MOVIMENTACAO_ID_GENERATOR" )
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="MOVIMENTACAO_ID_GENERATOR")
	@Column(unique=true, nullable=false)
	private Integer id;

	private Timestamp data;

	@Column(name="id_usuario")
	private Integer idUsuario;

	private double juros;

	@Column(length=50)
	private String tipo;

	private double valor;

	public Movimentacao() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Timestamp getData() {
		return this.data;
	}

	public void setData(Timestamp data) {
		this.data = data;
	}

	public Integer getIdUsuario() {
		return this.idUsuario;
	}

	public void setIdUsuario(Integer idUsuario) {
		this.idUsuario = idUsuario;
	}

	public double getJuros() {
		return this.juros;
	}

	public void setJuros(double juros) {
		this.juros = juros;
	}

	public String getTipo() {
		return this.tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public double getValor() {
		return this.valor;
	}

	public void setValor(double valor) {
		this.valor = valor;
	}

}