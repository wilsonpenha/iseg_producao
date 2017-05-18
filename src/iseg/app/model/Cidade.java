package iseg.app.model;

import static javax.persistence.FetchType.LAZY;
import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.persistence.PObject;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;


@Entity
@NamedQueries({
	@NamedQuery(name="getCountCidade", query="SELECT Count(*) FROM Cidade c ORDER BY c.nome"),
	@NamedQuery(name="getCidadesByUf", query="SELECT c FROM Cidade c WHERE c.uf.id = ?0 ORDER BY c.nome"),	
	@NamedQuery(name="getCidade", query="SELECT c FROM Cidade c ORDER BY c.nome")})
public class Cidade extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="CID_SEQ",sequenceName="APP_SEQ")
	private Long id;

	@Column(length=40)	
	private String nome;

	@ManyToOne(fetch=LAZY)
	private Uf uf;

	private Long bairroCollection;

	private static final long serialVersionUID = 1L;

	public Cidade() {
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

	public Uf getUf() {
		return this.uf;
	}

	public void setUf(Uf uf) {
		this.uf = uf;
	}

	public Long getBairroCollection() {
		return this.bairroCollection;
	}

	public void setBairroCollection(Long bairroCollection) {
		this.bairroCollection = bairroCollection;
	}

}
