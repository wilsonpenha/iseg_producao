package iseg.app.model;

import static javax.persistence.GenerationType.SEQUENCE;

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
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.SequenceGenerator;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Cascade;


@Entity
@NamedQueries({
	@NamedQuery(name="getCountAgenciamento", query="SELECT Count(*) FROM Agenciamento b"),
	@NamedQuery(name="getAgenciamento", query="SELECT b FROM Agenciamento b"),
	@NamedQuery(name="getAgenciamentoByPropostaAndParcelaAtual", query="SELECT b FROM Agenciamento b where b.proposta.id = ?0 and b.referenciaParcela = ?1"),
	@NamedQuery(name="deleteAgenciamentoByPropostaAndParcelaAtual", query="DELETE FROM Agenciamento b where b.proposta.id = ?0 and b.referenciaParcela = ?1"),
	@NamedQuery(name="getAgenciamentoByProposta", query="SELECT b FROM Agenciamento b where b.proposta.id = ?0 order by b.referenciaParcela desc")
	})
public class Agenciamento extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="AGE_SEQ",sequenceName="APP_SEQ")
	private Long id;
	
	@ManyToOne(fetch=FetchType.LAZY)
	private Proposta proposta;
	
	@Column(name="NRO_INCLUSOES")
	private Integer nroInclusoes;

	@Column(name="VALOR_INCLUSOES")
	private Double valorInclusoes;

	@Column(name="PERCENTUAL_AGENCIAMENTO")
	private Double percentualAgenciamento;
	
	@Column(name="VALOR_AGENCIAMENTO")
	private Double valorAgenciamento;

	@Column(name="QTDE_PARCELAS")
	private Integer qtdeParcelas;

	@Column(name="PARCELA_ATUAL")
	private Integer parcelaAtual;

	@Temporal(TemporalType.DATE)
	@Column(name="REFERENCIA_PARCELA")
	private Date referenciaParcela;

	@Column(name="DATA_LANCAMENTO")
	@Temporal(TemporalType.DATE)
	private Date dataLancamento;

	@OneToMany(cascade={CascadeType.ALL}, mappedBy="agenciamento", fetch=FetchType.LAZY)
	@Cascade(org.hibernate.annotations.CascadeType.DELETE_ORPHAN)
	@OrderBy("parcelaOriginaria, nroParcela asc")
	private List<ParcelasAgenciamento> parcelasAgenciamentoCollection = new ArrayList<ParcelasAgenciamento>();

	@OneToMany(cascade={CascadeType.REMOVE, CascadeType.REFRESH}, mappedBy="agenciamento", fetch=FetchType.LAZY)
	private List<ComissionadoAgenciamento> comissionadoAgenciamentoCollection = new ArrayList<ComissionadoAgenciamento>();

	@ManyToOne // para ser usado no vida empresarial e vicular o grupo de venda de cada parcela.
	@JoinColumn(name="GRUPO_DE_VENDA_ID")
	private GrupoDeVenda grupoDeVenda;
	
	@ManyToOne // para ser usado no vida empresarial e vicular o produtor de cada parcela.
	@JoinColumn(name="PRODUTOR_ID")
	private Produtor produtor;	

	private static final long serialVersionUID = 1L;

	public Agenciamento() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Proposta getProposta() {
		return proposta;
	}

	public void setProposta(Proposta proposta) {
		this.proposta = proposta;
	}

	public Double getPercentualAgenciamento() {
		return percentualAgenciamento;
	}

	public void setPercentualAgenciamento(Double percentualAgenciamento) {
		this.percentualAgenciamento = percentualAgenciamento;
	}

	public Double getValorAgenciamento() {
		return valorAgenciamento;
	}

	public void setValorAgenciamento(Double valorAgenciamento) {
		this.valorAgenciamento = valorAgenciamento;
	}

	public Integer getParcelaAtual() {
		return parcelaAtual;
	}

	public void setParcelaAtual(Integer parcelaAtual) {
		this.parcelaAtual = parcelaAtual;
	}

	public Date getDataLancamento() {
		return dataLancamento;
	}

	public void setDataLancamento(Date dataLancamento) {
		this.dataLancamento = dataLancamento;
	}

	public Integer getNroInclusoes() {
		return nroInclusoes;
	}

	public Double getValorInclusoes() {
		return valorInclusoes;
	}

	public void setValorInclusoes(Double valorInclusoes) {
		this.valorInclusoes = valorInclusoes;
	}

	public List<ParcelasAgenciamento> getParcelasAgenciamentoCollection() {
		return parcelasAgenciamentoCollection;
	}

	public void setParcelasAgenciamentoCollection(
			List<ParcelasAgenciamento> parcelasAgenciamentoCollection) {
		this.parcelasAgenciamentoCollection = parcelasAgenciamentoCollection;
	}

	public Integer getQtdeParcelas() {
		return qtdeParcelas;
	}

	public void setQtdeParcelas(Integer qtdeParcelas) {
		this.qtdeParcelas = qtdeParcelas;
	}

	public void setNroInclusoes(Integer nroInclusoes) {
		this.nroInclusoes = nroInclusoes;
	}

	public GrupoDeVenda getGrupoDeVenda() {
		return grupoDeVenda;
	}

	public void setGrupoDeVenda(GrupoDeVenda grupoDeVenda) {
		this.grupoDeVenda = grupoDeVenda;
	}

	public List<ComissionadoAgenciamento> getComissionadoAgenciamentoCollection() {
		return comissionadoAgenciamentoCollection;
	}

	public void setComissionadoAgenciamentoCollection(
			List<ComissionadoAgenciamento> comissionadoAgenciamentoCollection) {
		this.comissionadoAgenciamentoCollection = comissionadoAgenciamentoCollection;
	}

	public Date getReferenciaParcela() {
		return referenciaParcela;
	}

	public void setReferenciaParcela(Date referenciaParcela) {
		this.referenciaParcela = referenciaParcela;
	}

	public Produtor getProdutor() {
		return produtor;
	}

	public void setProdutor(Produtor produtor) {
		this.produtor = produtor;
	}

}
