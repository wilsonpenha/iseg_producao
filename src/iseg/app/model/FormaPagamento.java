package iseg.app.model;

import iseg.app.persistence.PObject;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;


@Entity
@NamedQueries({
	@NamedQuery(name="getFormaPagamento", query = "SELECT fp FROM FormaPagamento fp"),
	@NamedQuery(name="getFormaPagamentoByCodigo", query = "SELECT fp FROM FormaPagamento fp")})
@Table(name="FORMA_PAGAMENTO")	
public class FormaPagamento extends PObject implements Serializable {
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	@SequenceGenerator(name="FPA_SEQ", sequenceName = "APP_SEQ")
	private Long id;

	private Long codigo;

	@Column(length=60)
	private String nome;
	 
	public FormaPagamento() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getCodigo() {
		return codigo;
	}

	public void setCodigo(Long codigo) {
		this.codigo = codigo;
	}

	public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}
}