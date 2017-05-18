package iseg.app.model;

import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;


@Entity
@NamedQueries({
	@NamedQuery(name="findAllFabricante", query="SELECT f FROM Fabricante f ORDER BY f.nome")})
public class Fabricante extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="FAB_SEQ", sequenceName = "APP_SEQ")
	private Long id;

	private String nome;

	@OneToMany(mappedBy="fabricante")
	private Set<VeiculoModelo> veiculoModeloCollection;

	private static final long serialVersionUID = 1L;

	public Fabricante() {
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

	public Set<VeiculoModelo> getVeiculoModeloCollection() {
		return this.veiculoModeloCollection;
	}

	public void setVeiculoModeloCollection(Set<VeiculoModelo> veiculoModeloCollection) {
		this.veiculoModeloCollection = veiculoModeloCollection;
	}

}
