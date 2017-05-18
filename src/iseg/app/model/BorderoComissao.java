package iseg.app.model;

import static javax.persistence.FetchType.LAZY;
import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.Filter;
import org.hibernate.annotations.FilterDef;
import org.hibernate.annotations.ParamDef;


@Entity
@FilterDef(name="corretoraFilter", parameters={@ParamDef(name="corretoraParam", type="long"),@ParamDef(name="assessoriaIdParam", type="long"),@ParamDef(name="isAssessoriaParam", type="boolean")})    
@Filter(name="corretoraFilter", condition="(corretora_id = :corretoraParam)")    
@NamedQueries({
	@NamedQuery(name="getCount", query="SELECT Count(*) FROM BorderoComissao c"),
	@NamedQuery(name="getBordComissBySegAndCorretoraAndNroExt", query="SELECT c FROM BorderoComissao c WHERE c.seguradora.id = ?0 AND c.corretora.id = ?1 AND c.nroExtrato like ?2")
})
@Table(name="bordero_comissao")
public class BorderoComissao extends PObject implements Serializable, AtributoCorretora, AtributoUsuario {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="BDC_SEQ", sequenceName = "APP_SEQ")
	private Long id;

	@ManyToOne
	private Seguradora seguradora;

	@Column(name="data_lancamento")
	private Date dataLancamento;

	@Column(name="valor_total")
	private Double valorTotal;

	@Column(name="nro_extrato")
	private String nroExtrato;

	@Temporal(TemporalType.DATE)
	@Column(name="data_documento")
	private Date dataDocumento;

	private Integer situacao;

	@OneToMany(cascade=CascadeType.ALL, mappedBy="borderoComissao", fetch = LAZY)
	@Cascade(org.hibernate.annotations.CascadeType.DELETE_ORPHAN)
	@org.hibernate.annotations.OrderBy(clause = "ID")
	private List<BorderoLancamento> borderoLancamentoCollection= new ArrayList<BorderoLancamento>();;

	@ManyToOne(fetch=LAZY)
	@JoinColumn(name="CORRETORA_ID")
	private Corretora corretora;
	
	@ManyToOne(fetch=LAZY)
	@JoinColumn(name="lote_importacao_id")
	private LoteImportacao loteImportacao;

	@ManyToOne(fetch=LAZY)
	private Usuario usuario;

	private static final long serialVersionUID = 1L;

	public BorderoComissao() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Seguradora getSeguradora() {
		return this.seguradora;
	}

	public void setSeguradora(Seguradora seguradora) {
		this.seguradora = seguradora;
	}

	public Date getDataLancamento() {
		return this.dataLancamento;
	}

	public void setDataLancamento(Date dataLancamento) {
		this.dataLancamento = dataLancamento;
	}

	public Double getValorTotal() {
		return this.valorTotal;
	}

	public void setValorTotal(Double valorTotal) {
		this.valorTotal = valorTotal;
	}

	public String getNroExtrato() {
		return this.nroExtrato;
	}

	public void setNroExtrato(String nroExtrato) {
		this.nroExtrato = nroExtrato;
	}

	public Date getDataDocumento() {
		return this.dataDocumento;
	}

	public void setDataDocumento(Date dataDocumento) {
		this.dataDocumento = dataDocumento;
	}

	public List<BorderoLancamento> getBorderoLancamentoCollection() {
		return this.borderoLancamentoCollection;
	}

	public void setBorderoLancamentoCollection(List<BorderoLancamento> borderoLancamentoCollection) {
		this.borderoLancamentoCollection = borderoLancamentoCollection;
	}

	public String getSituacaoDesc() {
		return situacao.intValue()==0 ? "Em aberto" : situacao.intValue()==1 ? "Fechado" : situacao.intValue()==2 ? "Invalido" : "Invalido";
	}

	public Integer getSituacao() {
		return situacao;
	}

	public void setSituacao(Integer situacao) {
		this.situacao = situacao;
	}

	public void setCorretora(Corretora corretora) {
		this.corretora = corretora;
	}

	public Corretora getCorretora() {
		return corretora;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public LoteImportacao getLoteImportacao() {
		return loteImportacao;
	}

	public void setLoteImportacao(LoteImportacao loteImportacao) {
		this.loteImportacao = loteImportacao;
	}
	
}
