package iseg.app.model;

import static javax.persistence.FetchType.LAZY;
import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.persistence.PObject;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;


@Entity
@Table(name="sms_telefones_produtor")
@NamedQueries({
	@NamedQuery(name="getCountSmsTelefonesProdutorByProdutor", query="SELECT Count(*) FROM SmsTelefonesProdutor b where b.produtor.id = ?0"),
	@NamedQuery(name="getSmsTelefonesProdutorByProdutor", query="SELECT b FROM SmsTelefonesProdutor b where b.produtor.id = ?0"),
	@NamedQuery(name="getNroCelularDeProdutores", query="SELECT p FROM SmsTelefonesProdutor p where p.telefoneCelular = ?0"),
	@NamedQuery(name="getSmsTelefonesProdutor", query="SELECT b FROM SmsTelefonesProdutor b")
	})
public class SmsTelefonesProdutor  extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="STP_SEQ",sequenceName="APP_SEQ")
	private Long id;

	@ManyToOne(fetch=LAZY, cascade={CascadeType.REFRESH})
	@JoinColumn(name="produtor_id")
	private Produtor produtor;
	
	@Column(name="telefone_celular")
	private String telefoneCelular;
	
	private String descricao;
	
	@Column(name="is_ativo")
	private Boolean isAtivo;

	private static final long serialVersionUID = 1L;

	public SmsTelefonesProdutor() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Produtor getProdutor() {
		return this.produtor;
	}

	public void setProdutor(Produtor produtor) {
		this.produtor = produtor;
	}

	public String getTelefoneCelular() {
		return telefoneCelular;
	}

	public void setTelefoneCelular(String telefoneCelular) {
		this.telefoneCelular = telefoneCelular;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Boolean getIsAtivo() {
		return isAtivo;
	}

	public void setIsAtivo(Boolean isAtivo) {
		this.isAtivo = isAtivo;
	}
}