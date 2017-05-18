package iseg.app.model;

import iseg.app.persistence.PObjectLog;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "FIN_AGENCIA_BANCARIA")
public class AgenciaBancaria extends PObjectLog{
 
	/**
	 * 
	 */
	private static final long serialVersionUID = -395260905058407532L;

	@Id
	@GeneratedValue
	private Long id;
	 
	@Column(nullable = false,length=10)
	private String codigo;
	
	@Column(nullable = false,length=2)
	private String digito;
	
	@Column(nullable = false,length=150)
	private String nome;
	
	@ManyToOne(fetch=FetchType.LAZY)
	private Banco banco;
	
	@ManyToOne(fetch=FetchType.LAZY)
	private Cidade cidade;

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

	public String getDigito() {
		return digito;
	}

	public void setDigito(String digito) {
		this.digito = digito;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Banco getBanco() {
		return banco;
	}

	public void setBanco(Banco banco) {
		this.banco = banco;
	}

	public Cidade getCidade() {
		return cidade;
	}

	public void setCidade(Cidade cidade) {
		this.cidade = cidade;
	}
	 
}
 
