package iseg.app.model;

import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
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
@Table(name="orcamento_seguradora")
@SequenceGenerator(name="seq_orcamento_seguradora", sequenceName = "seq_orcamento_seguradora")
@NamedQueries({
	@NamedQuery(name="getOrcamentoSeguradora", query="SELECT a FROM OrcamentoSeguradora a"),
	@NamedQuery(name="getOrcamentoSeguradoraById", query="SELECT a FROM OrcamentoSeguradora a WHERE a.id = ?0"),
	@NamedQuery(name="getOrcamentoSeguradoraByOrcamentoSeguro", query="SELECT a FROM OrcamentoSeguradora a WHERE a.orcamentoSeguro.id = ?0"),
	@NamedQuery(name="getOrcamentoSeguradoraByOrcamentoAndItem", query="SELECT Count(*) FROM OrcamentoSeguradora a WHERE a.id = ?0 AND a.item <> null")
})
public class OrcamentoSeguradora extends PObject implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "seq_orcamento_seguradora")
	private Long id;

	@Column(name="item")
	private Integer item;

	@Column(name="rotulo")
	private String rotulo;

	@Column(name="custo_apolice")
	private Double custoApolice;

	@Column(name="iof")
	private Double iof;

	@Column(name="qtde_parcelas")
	private Long qtdeParcelas;

	@ManyToOne
	@JoinColumn(name="seguradora_id")
	private Seguradora seguradora;

	@Column(name="data_calculo")
	private Date dataCalculo;

	@ManyToOne
	@JoinColumn(name="usuario_id")
	private Usuario usuario;

	@Column(name="observacao")
	private String observacao;

	@Column(name="fator") 
	private Double fator;

	@ManyToOne
	@JoinColumn(name="orcamento_id")
	private OrcamentoSeguro orcamentoSeguro;

	@OneToMany(mappedBy="orcamentoSeguradora", cascade = CascadeType.ALL, fetch=FetchType.LAZY)
	@OrderBy("sequencia")
	private List<OrcamentoServicos> orcamentoServicosCollection = new ArrayList<OrcamentoServicos>();;

	@OneToMany(mappedBy="orcamentoSeguradora", cascade = CascadeType.ALL, fetch=FetchType.LAZY)
	@OrderBy("sequencia")
	private List<OrcamentoCobertura> orcamentoCoberturaCollection = new ArrayList<OrcamentoCobertura>();

	@OneToMany(mappedBy="orcamentoSeguradora", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	private List<OrcamentoFranquias> orcamentoFranquiasCollection = new ArrayList<OrcamentoFranquias>();
	
	@OneToMany(mappedBy="orcamentoSeguradora", fetch=FetchType.LAZY, cascade={CascadeType.REFRESH,CascadeType.REMOVE})
	private List<PropostaAnexo> propostaAnexoCollection = new ArrayList<PropostaAnexo>();

	private static final long serialVersionUID = 1L;

	public OrcamentoSeguradora() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getItem() {
		return item;
	}

	public void setItem(Integer item) {
		this.item = item;
	}

	public String getRotulo() {
		return this.rotulo;
	}

	public void setRotulo(String rotulo) {
		this.rotulo = rotulo;
	}

	public Double getCustoApolice() {
		return this.custoApolice;
	}

	public void setCustoApolice(Double custoApolice) {
		this.custoApolice = custoApolice;
	}

	public Double getIof() {
		return this.iof;
	}

	public void setIof(Double iof) {
		this.iof = iof;
	}

	public Long getQtdeParcelas() {
		return this.qtdeParcelas;
	}

	public void setQtdeParcelas(Long qtdeParcelas) {
		this.qtdeParcelas = qtdeParcelas;
	}

	public Seguradora getSeguradora() {
		return seguradora;
	}

	public void setSeguradora(Seguradora seguradora) {
		this.seguradora = seguradora;
	}

	public Date getDataCalculo() {
		return this.dataCalculo;
	}

	public void setDataCalculo(Date dataCalculo) {
		this.dataCalculo = dataCalculo;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public String getObservacao() {
		return this.observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}

	public Double getFator() {
		return this.fator;
	}

	public void setFator(Double fator) {
		this.fator = fator;
	}

	public OrcamentoSeguro getOrcamentoSeguro() {
		return orcamentoSeguro;
	}

	public void setOrcamentoSeguro(OrcamentoSeguro orcamentoSeguro) {
		this.orcamentoSeguro = orcamentoSeguro;
	}

	public List<OrcamentoServicos> getOrcamentoServicosCollection() {
		return this.orcamentoServicosCollection;
	}

	public void setOrcamentoServicosCollection(List<OrcamentoServicos> orcamentoServicosCollection) {
		this.orcamentoServicosCollection = orcamentoServicosCollection;
	}

	public List<OrcamentoCobertura> getOrcamentoCoberturaCollection() {
		return this.orcamentoCoberturaCollection;
	}

	public void setOrcamentoCoberturaCollection(List<OrcamentoCobertura> orcamentoCoberturaCollection) {
		this.orcamentoCoberturaCollection = orcamentoCoberturaCollection;
	}

	public List<OrcamentoFranquias> getOrcamentoFranquiasCollection() {
		return orcamentoFranquiasCollection;
	}

	public void setOrcamentoFranquiasCollection(
			List<OrcamentoFranquias> orcamentoFranquiasCollection) {
		this.orcamentoFranquiasCollection = orcamentoFranquiasCollection;
	}

	public List<PropostaAnexo> getPropostaAnexoCollection() {
		return propostaAnexoCollection;
	}

	public void setPropostaAnexoCollection(
			List<PropostaAnexo> propostaAnexoCollection) {
		this.propostaAnexoCollection = propostaAnexoCollection;
	}
}
