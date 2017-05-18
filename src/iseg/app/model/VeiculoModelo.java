package iseg.app.model;

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
import javax.persistence.Table;


@Entity
@Table(name="VEICULO_MODELO")
@NamedQueries({
	@NamedQuery(name="findAllModeloByFabricanteId", query="SELECT v FROM VeiculoModelo v WHERE v.fabricante.id = ?0 ORDER BY v.descricao")})
public class VeiculoModelo extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="VIM_SEQ", sequenceName = "APP_SEQ")
	private Long id;

	private String descricao;

	@Column(name="ANO_DE")
	private String anoDe;

	@Column(name="ANO_ATE")
	private String anoAte;

	@Column(name="CODIGO_FIPE")
	private String codigoFipe;

	@ManyToOne
	private Fabricante fabricante;

	private static final long serialVersionUID = 1L;

	public VeiculoModelo() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDescricao() {
		return this.descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getAnoDe() {
		return this.anoDe;
	}

	public void setAnoDe(String anoDe) {
		this.anoDe = anoDe;
	}

	public String getAnoAte() {
		return this.anoAte;
	}

	public void setAnoAte(String anoAte) {
		this.anoAte = anoAte;
	}

	public String getCodigoFipe() {
		return this.codigoFipe;
	}

	public void setCodigoFipe(String codigoFipe) {
		this.codigoFipe = codigoFipe;
	}

	public Fabricante getFabricante() {
		return this.fabricante;
	}

	public void setFabricante(Fabricante fabricante) {
		this.fabricante = fabricante;
	}

}
