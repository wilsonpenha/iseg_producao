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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;


@Entity
@NamedQueries({
	@NamedQuery(name="getDominio", query="SELECT d FROM Dominio d ORDER BY d.nome"),
	@NamedQuery(name="getCountDominio", query="SELECT Count(*) FROM Dominio d"),
	@NamedQuery(name="getDominioByNome", query = "SELECT d FROM Dominio d WHERE d.nome = :nome")})
public class Dominio extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="DOM_SEQ", sequenceName = "APP_SEQ")
	private Long id;

	@Column(name="IS_RECURSIVO")
	private Long isRecursivo;

	@Column(length=60)
	private String nome;

	private static final long serialVersionUID = 1L;

	@OneToMany(mappedBy="dominio", fetch = LAZY)
	private List<DominioEsp> dominioEspCollection;

	public Dominio() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getIsRecursivo() {
		return this.isRecursivo;
	}

	public void setIsRecursivo(Long isRecursivo) {
		this.isRecursivo = isRecursivo;
	}

	public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	/** 
	 */
	public List<DominioEsp> getDominioEspCollection() {
		return this.dominioEspCollection;
	}

	/** 
	 */
	public void setDominioEspCollection(List<DominioEsp> dominioEspCollection) {
		this.dominioEspCollection = dominioEspCollection;
	}

}
