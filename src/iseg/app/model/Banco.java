package iseg.app.model;

import iseg.app.persistence.PObjectLog;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "FIN_BANCO")
public class Banco extends PObjectLog{
 
	/**
	 * 
	 */
	private static final long serialVersionUID = -4702796631552663669L;

	@Id
	@GeneratedValue
	private Long id;
	 
	@Column(nullable = false,length=20)
	private String codigo;
	
	@Column(nullable = false,length=150)
	private String nome;
	 
	@ManyToOne(fetch=FetchType.LAZY)
	private AgenciaBancaria[] agencias;
	
	@Transient
	private String codigoNome;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public AgenciaBancaria[] getAgencias() {
		return agencias;
	}

	public void setAgencias(AgenciaBancaria[] agencias) {
		this.agencias = agencias;
	}

	public String getCodigoNome() {
		this.codigoNome = this.codigo+" # "+this.nome;
		return codigoNome;
	}

	public void setCodigoNome(String codigoNome) {
		this.codigoNome = codigoNome;
	}
	 
}
 
