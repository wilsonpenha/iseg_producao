package iseg.app.model;

import iseg.app.persistence.PObjectLog;

import java.math.BigDecimal;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name="lote_importacao_item")
@NamedQueries({
	@NamedQuery(name="getLoteImportacaoItem", query="SELECT a FROM LoteImportacaoItem a")
})
public class LoteImportacaoItem extends PObjectLog {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private Long id;

	@Column(name="tipo_item_edi")
	private Integer tipoItemEdi;

	@Column(name="cpf_cnpj_segurado")
	private String cpfCnpjSegurado;

	@Column(name="nome_segurado")
	private String nomeSegurado;

	@Column(name="numero_proposta")
	private String numeroProposta;

	@Column(name="numero_apolice")
	private String numeroApolice;

	@Column(name="numero_apolice_anterior")
	private String numeroApoliceAnterior;

	@Column(name="numero_endosso")
	private String numeroEndosso;

	@Column(name="dt_inicio_vigencia")
	private Timestamp dtInicioVigencia;

	@Column(name="dt_final_vigencia")
	private Timestamp dtFinalVigencia;

	@Column(name="premio_total")
	private BigDecimal premioTotal;

	@Column(name="dt_conciliacao")
	private Timestamp dtConciliacao;

	@Column(name="in_conciliacao_manual")
	private Boolean inConciliacaoManual;

	private String registro;

	@ManyToOne
	@JoinColumn(name="lote_importacao_id")
	private LoteImportacao loteImportacao;

	@ManyToOne
	@JoinColumn(name="proposta_id")
	private Proposta proposta;

	@ManyToOne
	@JoinColumn(name="ramo_id")
	private Ramo ramo;

	@ManyToOne
	@JoinColumn(name="usuario_id")
	private Usuario autorConciliacao;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getTipoItemEdi() {
		return tipoItemEdi;
	}

	public void setTipoItemEdi(Integer tipoItemEdi) {
		this.tipoItemEdi = tipoItemEdi;
	}

	public String getCpfCnpjSegurado() {
		return cpfCnpjSegurado;
	}

	public void setCpfCnpjSegurado(String cpfCnpjSegurado) {
		this.cpfCnpjSegurado = cpfCnpjSegurado;
	}

	public String getNomeSegurado() {
		return nomeSegurado;
	}

	public void setNomeSegurado(String nomeSegurado) {
		this.nomeSegurado = nomeSegurado;
	}

	public String getNumeroProposta() {
		return numeroProposta;
	}

	public void setNumeroProposta(String numeroProposta) {
		this.numeroProposta = numeroProposta;
	}

	public String getNumeroApolice() {
		return numeroApolice;
	}

	public void setNumeroApolice(String numeroApolice) {
		this.numeroApolice = numeroApolice;
	}

	public String getNumeroApoliceAnterior() {
		return numeroApoliceAnterior;
	}

	public void setNumeroApoliceAnterior(String numeroApoliceAnterior) {
		this.numeroApoliceAnterior = numeroApoliceAnterior;
	}

	public String getNumeroEndosso() {
		return numeroEndosso;
	}

	public void setNumeroEndosso(String numeroEndosso) {
		this.numeroEndosso = numeroEndosso;
	}

	public Timestamp getDtInicioVigencia() {
		return dtInicioVigencia;
	}

	public void setDtInicioVigencia(Timestamp dtInicioVigencia) {
		this.dtInicioVigencia = dtInicioVigencia;
	}

	public Timestamp getDtFinalVigencia() {
		return dtFinalVigencia;
	}

	public void setDtFinalVigencia(Timestamp dtFinalVigencia) {
		this.dtFinalVigencia = dtFinalVigencia;
	}

	public BigDecimal getPremioTotal() {
		return premioTotal;
	}

	public void setPremioTotal(BigDecimal premioTotal) {
		this.premioTotal = premioTotal;
	}

	public Timestamp getDtConciliacao() {
		return dtConciliacao;
	}

	public void setDtConciliacao(Timestamp dtConciliacao) {
		this.dtConciliacao = dtConciliacao;
	}

	public Boolean getInConciliacaoManual() {
		return inConciliacaoManual;
	}

	public void setInConciliacaoManual(Boolean inConciliacaoManual) {
		this.inConciliacaoManual = inConciliacaoManual;
	}

	public String getRegistro() {
		return registro;
	}

	public void setRegistro(String registro) {
		this.registro = registro;
	}

	public LoteImportacao getLoteImportacao() {
		return loteImportacao;
	}

	public void setLoteImportacao(LoteImportacao loteImportacao) {
		this.loteImportacao = loteImportacao;
	}

	public Proposta getProposta() {
		return proposta;
	}

	public void setProposta(Proposta proposta) {
		this.proposta = proposta;
	}

	public Ramo getRamo() {
		return ramo;
	}

	public void setRamo(Ramo ramo) {
		this.ramo = ramo;
	}

	public Usuario getAutorConciliacao() {
		return autorConciliacao;
	}

	public void setAutorConciliacao(Usuario autorConciliacao) {
		this.autorConciliacao = autorConciliacao;
	}

}
