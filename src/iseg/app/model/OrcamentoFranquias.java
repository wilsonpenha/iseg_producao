package iseg.app.model;

import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="orcamento_franquias")
@SequenceGenerator(name="seq_orcamento_franquias", sequenceName = "seq_orcamento_franquias")
@NamedQueries({
	@NamedQuery(name="getOrcamentoFranquias", query="SELECT a FROM OrcamentoFranquias a"),
	@NamedQuery(name="getOrcamentoFranquiasById", query="SELECT a FROM OrcamentoFranquias a WHERE a.id = ?0"),
	@NamedQuery(name="getCountOrcamentoFranquias", query="SELECT Count(*) FROM OrcamentoFranquias a")
})
public class OrcamentoFranquias extends PObject implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "seq_orcamento_franquias")
	private Long id;

	@Column(name="premio_total")
	private Double premioTotal;

	@Column(name="valor_franquia")
	private Double valorFranquia;

	@Column(name="premio_liquido")
	private Double premioLiquido;

	@Column(name="descricao")
	private String descricao;
	
	@Column(name="custo_apolice")
	private Double custoApolice;
	
	@Column(name="iof")
	private Double iof;
	
	private String observacao;
	
	@OneToMany(mappedBy="orcamentoFranquias", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	@OrderBy(value="id")
	private List<ParcelasOrcamento> parcelasOrcamentoCollection = new ArrayList<ParcelasOrcamento>();
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="orcamento_seguradora_id")
	private OrcamentoSeguradora orcamentoSeguradora;
	
	@ManyToOne
	@JoinColumn(name="tipo_franquia_id")
	@OrderBy("valor desc")
	private DominioEsp tipoFranquia;

	@Column(name="nro_calculo_seguradora")
	private String nroCalculoSeguradora;

	@Column(name="xml_envio_calculo")
	private String xmlEnvioCalculo;
	
	@Column(name="xml_retorno_calculo")
	private String xmlRetornoCalculo;

	private static final long serialVersionUID = 1L;

	public OrcamentoFranquias() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public OrcamentoSeguradora getOrcamentoSeguradora() {
		return orcamentoSeguradora;
	}

	public void setOrcamentoSeguradora(OrcamentoSeguradora orcamentoSeguradora) {
		this.orcamentoSeguradora = orcamentoSeguradora;
	}

	public Double getPremioTotal() {
		return this.premioTotal;
	}

	public void setPremioTotal(Double premioTotal) {
		this.premioTotal = premioTotal;
	}

	public Double getValorFranquia() {
		return this.valorFranquia;
	}

	public void setValorFranquia(Double valorFranquia) {
		this.valorFranquia = valorFranquia;
	}

	public Double getPremioLiquido() {
		return this.premioLiquido;
	}

	public void setPremioLiquido(Double premioLiquido) {
		this.premioLiquido = premioLiquido;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getObservacao() {
		return this.observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}

	public List<ParcelasOrcamento> getParcelasOrcamentoCollection() {
		return parcelasOrcamentoCollection;
	}

	public void setParcelasOrcamentoCollection(
			List<ParcelasOrcamento> parcelasOrcamentoCollection) {
		this.parcelasOrcamentoCollection = parcelasOrcamentoCollection;
	}

	public Double getCustoApolice() {
		return custoApolice;
	}

	public void setCustoApolice(Double custoApolice) {
		this.custoApolice = custoApolice;
	}

	public Double getIof() {
		return iof;
	}

	public void setIof(Double iof) {
		this.iof = iof;
	}

	public DominioEsp getTipoFranquia() {
		return tipoFranquia;
	}

	public void setTipoFranquia(DominioEsp tipoFranquia) {
		this.tipoFranquia = tipoFranquia;
	}

	public String getNroCalculoSeguradora() {
		return nroCalculoSeguradora;
	}

	public void setNroCalculoSeguradora(String nroCalculoSeguradora) {
		this.nroCalculoSeguradora = nroCalculoSeguradora;
	}

	public String getXmlEnvioCalculo() {
		return xmlEnvioCalculo;
	}

	public void setXmlEnvioCalculo(String xmlEnvioCalculo) {
		this.xmlEnvioCalculo = xmlEnvioCalculo;
	}

	public String getXmlRetornoCalculo() {
		return xmlRetornoCalculo;
	}

	public void setXmlRetornoCalculo(String xmlRetornoCalculo) {
		this.xmlRetornoCalculo = xmlRetornoCalculo;
	}

}
