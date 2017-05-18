package iseg.app.model;

import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;


@Entity
@NamedQueries({
	@NamedQuery(name="getCountUf", query="SELECT Count(*) FROM Uf u ORDER BY u.nome"),
	@NamedQuery(name="getUf", query="SELECT u FROM Uf u ORDER BY u.nome")
	})
public class Uf extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="UF_SEQ", sequenceName = "APP_SEQ")
	private Long id;
	
	@Column(length=30)
	private String nome;

	@Column(length=2)
	private String uf;

	@OneToMany(mappedBy="uf")
	private Set<Cidade> cidadeCollection;

	private static final long serialVersionUID = 1L;

	public Uf() {
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

	public String getUf() {
		return this.uf;
	}

	public void setUf(String uf) {
		this.uf = uf;
	}

	public Set<Cidade> getCidadeCollection() {
		return this.cidadeCollection;
	}

	public void setCidadeCollection(Set<Cidade> cidadeCollection) {
		this.cidadeCollection = cidadeCollection;
	}

}
