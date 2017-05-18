package iseg.app.model;

import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="tipo_cobertura")
@SequenceGenerator(name="seq_tipo_cobertura", sequenceName = "seq_tipo_cobertura")
@NamedQueries({
	@NamedQuery(name="getTipoCobertura", query="SELECT a FROM TipoCobertura a"),
	@NamedQuery(name="getCountTipoCobertura", query="SELECT Count(*) FROM TipoCobertura a")
})
public class TipoCobertura extends PObject implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "seq_tipo_cobertura")
	private Long id;

	@Column(name="descricao")
	private String descricao;

	@Column(name="codigo_suzep")
	private String codigoSuzep;

	@OneToMany(mappedBy="tipoCobertura")
	private List<OrcamentoSeguro> orcamentoSeguroCollection;

	@Column(name="COD_BRADESCO")
	private Integer codBradesco;

	private static final long serialVersionUID = 1L;

	public TipoCobertura() {
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

	public String getCodigoSuzep() {
		return this.codigoSuzep;
	}

	public void setCodigoSuzep(String codigoSuzep) {
		this.codigoSuzep = codigoSuzep;
	}

	public List<OrcamentoSeguro> getOrcamentoSeguroCollection() {
		return this.orcamentoSeguroCollection;
	}

	public void setOrcamentoSeguroCollection(List<OrcamentoSeguro> orcamentoSeguroCollection) {
		this.orcamentoSeguroCollection = orcamentoSeguroCollection;
	}

	public Integer getCodBradesco() {
		return codBradesco;
	}

	public void setCodBradesco(Integer codBradesco) {
		this.codBradesco = codBradesco;
	}

}
