package iseg.app.model;


import static javax.persistence.FetchType.LAZY;
import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;


@Entity
@NamedQueries({
	@NamedQuery(name="getEndosso", query="SELECT e FROM Endosso e ORDER BY e.nome"),
	@NamedQuery(name="getCountEndosso", query="SELECT Count(*) FROM Endosso e"),
	@NamedQuery(name="getEndossoOrdered", query = "SELECT e FROM Endosso e ORDER BY e.nome"),
	@NamedQuery(name="getEndossoByNome", query = "SELECT e FROM Endosso e WHERE e.nome = ?0 ORDER BY e.nome"),
	@NamedQuery(name="getEndossoByRamo", query = "SELECT e FROM Endosso e WHERE e.ramo.id = ?0 and e.isAtivo=true ORDER BY e.nome")})
public class Endosso extends PObject implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="EDSO_SEQ", sequenceName = "APP_SEQ")
	private Long id;

	@Column(length=50)
	private String nome;

	@Column(length=200)
	private String descricao;

	@ManyToOne
	private Ramo ramo;

	@Column(name="IS_ATIVO")
	private Boolean isAtivo;

	@OneToMany(mappedBy="tipoEndosso", fetch = LAZY)
	private List<Proposta> propostaCollection;

	public Endosso() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public List<Proposta> getPropostaCollection() {
		return this.propostaCollection;
	}

	public void setPropostaCollection(List<Proposta> propostaCollection) {
		this.propostaCollection = propostaCollection;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Ramo getRamo() {
		return ramo;
	}

	public void setRamo(Ramo ramo) {
		this.ramo = ramo;
	}

	public Boolean getIsAtivo() {
		return isAtivo;
	}

	public void setIsAtivo(Boolean isAtivo) {
		this.isAtivo = isAtivo;
	}

}