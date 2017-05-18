package iseg.app.model;

import static javax.persistence.CascadeType.REFRESH;
import static javax.persistence.FetchType.LAZY;
import static javax.persistence.InheritanceType.JOINED;
import iseg.app.model.listeners.PObjectListener;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.FetchType;
import javax.persistence.Inheritance;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Transient;


@Entity
@EntityListeners({PObjectListener.class})
@Inheritance(strategy=JOINED)
@NamedQueries({ 
	@NamedQuery(name="getCorretora",query="SELECT c FROM Corretora c ORDER BY c.nome"),
	@NamedQuery(name="getCorretoraByID",query="SELECT c FROM Corretora c WHERE c.id = ?0"),
	@NamedQuery(name="getCountCorretora", query="SELECT Count(*) FROM Corretora c"),
	@NamedQuery(name="getCorretoraByCodigoLs", query = "SELECT c FROM Corretora c WHERE c.codigoLs = :codigoLs ORDER BY c.nome"),
	@NamedQuery(name="getCorretoraByInscricaoSusep", query = "SELECT c FROM Corretora c WHERE c.inscricaoSusep = :inscricaoSusep ORDER BY c.nome"),
	@NamedQuery(name="getCorretoraByRazaoSocial", query = "SELECT c FROM Corretora c WHERE c.razaoSocial = :razaoSocial ORDER BY c.nome"),
	@NamedQuery(name="getCorretoraByCpfOuCnpj", query = "SELECT c FROM Corretora c WHERE c.cpfOuCnpj = :cpfOuCnpj ORDER BY c.nome"),
	@NamedQuery(name="getCorretoraBySmsAtivo", query = "SELECT c FROM Corretora c WHERE c.smsIsAtivo = true"),
	@NamedQuery(name="getCorretoraByNome", query = "SELECT c FROM Corretora c WHERE c.nome = :nome")})
public class Corretora  extends PessoaJuridica implements Serializable {

	@Column(length=40)
	private String telefones;

	@Column(name="CODIGO_LS",length=25)
	private String codigoLs;

	@Column(name="INSCRICAO_SUSEP",length=25)
	private String inscricaoSusep;

	@Column(name="PERCENTUAL_REPASSE")
	private Double percentualRepasse;

	@Column(name="AGENCIAMENTO_REPASSE")
	private Double agenciamentoRepasse;

	@Column(name="IMAGEM_LOGO")
	private String imagemLogo; 

	@ManyToOne(targetEntity=PessoaFisica.class, fetch = LAZY)
	@JoinColumn(name="pessoa_id", referencedColumnName = "id")
	private PessoaFisica pessoaFisica; 

	private static final long serialVersionUID = 1L;

	@OneToMany(mappedBy="corretora", fetch = LAZY)
	private List<Produtor> produtorCollection;

	@OneToMany(mappedBy="corretora", cascade = REFRESH, fetch = LAZY)
	private List<Usuario> usuarioCollection;

	@OneToMany(mappedBy="corretora", cascade = {CascadeType.PERSIST, CascadeType.REFRESH}, fetch = LAZY)
	private List<Coberturas> coberturasCollection = new ArrayList<Coberturas>();
	
	@OneToMany(mappedBy="corretora", cascade = {CascadeType.PERSIST, CascadeType.REFRESH}, fetch = LAZY)
	private List<Servicos> servicosCollection = new ArrayList<Servicos>();
	
/*	@OneToMany(mappedBy="corretora", cascade = {CascadeType.PERSIST, CascadeType.REFRESH}, fetch = LAZY)
	private List<SmsEventosCorretora> smsEventosCorretoraCollection = new ArrayList<SmsEventosCorretora>(); 
*/
	@OneToMany(mappedBy="corretora", cascade = REFRESH, fetch = LAZY)
	private List<Pessoa> pessoaCollection;

	@Column(name="IS_ASSESSORADA", columnDefinition="default false")
	private Boolean isAssessorada;

	@Column(name="sms_texto_informa", length=15)
	private String smsTextoInforma;

	@Column(name="sms_proposta_efetivada", columnDefinition="default false")
	private Boolean smsPropostaEfetivada;

	@Column(name="sms_is_ativo", columnDefinition="default true")
	private Boolean smsIsAtivo;

	@Column(name="sms_franquia_adicional", columnDefinition="default 0")
	private Long smsFranquiaAdicional;

	@Column(name="sms_franquia_basica", columnDefinition="default 0")
	private Long smsFranquiaBasica;

	@Column(name="sms_reserva_consulta", columnDefinition="default 0")
	private Long smsReservaConsulta;

	@Column(name="sms_enviados_total", columnDefinition="default 0")
	private Long smsEnviadosTotal;

	@Column(name="sms_creditos_total", columnDefinition="default 0")
	private Long smsCreditosTotal;

	@Column(name="usar_pos_venda", columnDefinition="default false")
	private Boolean usarPosVenda;

	@Column(name="usar_coberturas_assessoria", columnDefinition="default false")
	private Boolean usarCoberturasAssessoria;

	@ManyToOne(fetch=LAZY)
	@JoinColumn(name="ASSESSORIA_ID")
	private Corretora assessoria;

	@OneToMany(mappedBy="assessoria", fetch = LAZY)
	private List<Corretora> assessoradas;
	
	@Column(name="is_orcamento_cobertura")
	private Boolean isOrcamentoCobertura;
	
	@Column(name="is_orcamento_por_email")
	private Boolean isOrcamentoPorEmail;
	
	@Column(name="is_orcamento_sms_cliente")
	private Boolean isOrcamentoSmsCliente;
	
	@Column(name="is_orcamento_sms_produtor")
	private Boolean isOrcamentoSmsProdutor;
	
	@OneToMany(mappedBy="corretora", cascade = REFRESH, fetch = LAZY)
	private List<ServicosEmail> servicosEmailCollection = new ArrayList<ServicosEmail>();
	
	@OneToMany(mappedBy="corretora", cascade = REFRESH, fetch = LAZY)
	private List<TemplateMensagem> templateMensagemCollection = new ArrayList<TemplateMensagem>();
	
	@Transient
	private boolean inAssessoria;
	
	@Transient
	private Long assessoriaId;

	public Corretora() {
		super();
	}

	public String getTelefones() {
		return this.telefones;
	}

	public void setTelefones(String telefones) {
		this.telefones = telefones;
	}

	public String getCodigoLs() {
		return this.codigoLs;
	}

	public void setCodigoLs(String codigoLs) {
		this.codigoLs = codigoLs;
	}

	public String getInscricaoSusep() {
		return this.inscricaoSusep;
	}

	public void setInscricaoSusep(String inscricaoSusep) {
		this.inscricaoSusep = inscricaoSusep;
	}

	public Double getPercentualRepasse() {
		return percentualRepasse;
	}

	public void setPercentualRepasse(Double percentualRepasse) {
		this.percentualRepasse = percentualRepasse;
	}

	public List<Produtor> getProdutorCollection() {
		return this.produtorCollection;
	}

	public void setProdutorCollection(List<Produtor> produtorCollection) {
		this.produtorCollection = produtorCollection;
	}

	public List<Usuario> getUsuarioCollection() {
		return this.usuarioCollection;
	}

	public void setUsuarioCollection(List<Usuario> usuarioCollection) {
		this.usuarioCollection = usuarioCollection;
	}

	public PessoaFisica getPessoaFisica() {
		return pessoaFisica;
	}

	public void setPessoaFisica(PessoaFisica pessoaFisica) {
		this.pessoaFisica = pessoaFisica;
	}

	public String getImagemLogo() {
		return imagemLogo;
	}

	public void setImagemLogo(String imagemLogo) {
		this.imagemLogo = imagemLogo;
	}

	public Double getAgenciamentoRepasse() {
		return agenciamentoRepasse;
	}

	public void setAgenciamentoRepasse(Double agenciamentoRepasse) {
		this.agenciamentoRepasse = agenciamentoRepasse;
	}

	public List<Pessoa> getPessoaCollection() {
		return pessoaCollection;
	}

	public void setPessoaCollection(List<Pessoa> pessoaCollection) {
		this.pessoaCollection = pessoaCollection;
	}

	public Boolean getIsAssessorada() {
		return (isAssessorada==null ? true : isAssessorada);
	}

	public void setIsAssessorada(Boolean isAssessorada) {
		this.isAssessorada = isAssessorada==null ? true : isAssessorada;
	}

	public boolean ehAssessoria(){
		return inAssessoria;
	}
	
	public String getNomeCorretoraComAssessoria(){
		return assessoria != null ? assessoria.getNome()+" ("+getNome()+")" : getNome();
	}

	public List<Corretora> getAssessoradas() {
		return assessoradas;
	}

	public void setAssessoradas(List<Corretora> assessoradas) {
		this.assessoradas = assessoradas;
	}

	public Corretora getAssessoria() {
		return assessoria;
	}

	public void setAssessoria(Corretora assessoria) {
		this.assessoria = assessoria;
	}

	public Boolean getUsarPosVenda() {
		return (usarPosVenda==null ? true : usarPosVenda);
	}

	public void setUsarPosVenda(Boolean usarPosVenda) {
		this.usarPosVenda = usarPosVenda==null ? true : usarPosVenda;
	}

	public Boolean getUsarCoberturasAssessoria() {
		return (usarCoberturasAssessoria==null ? true : usarCoberturasAssessoria);
	}

	public void setUsarCoberturasAssessoria(Boolean usarCoberturasAssessoria) {
		this.usarCoberturasAssessoria = usarCoberturasAssessoria==null ? true : usarCoberturasAssessoria;
	}

	public List<Coberturas> getCoberturasCollection() {
		return coberturasCollection;
	}

	public void setCoberturasCollection(List<Coberturas> coberturasCollection) {
		this.coberturasCollection = coberturasCollection;
	}

	public List<Servicos> getServicosCollection() {
		return servicosCollection;
	}

	public void setServicosCollection(List<Servicos> servicosCollection) {
		this.servicosCollection = servicosCollection;
	}

	public Boolean getSmsPropostaEfetivada() {
		return smsPropostaEfetivada;
	}

	public void setSmsPropostaEfetivada(Boolean smsPropostaEfetivada) {
		this.smsPropostaEfetivada = smsPropostaEfetivada;
	}

	public void setInAssessoria(boolean inAssessoria) {
		this.inAssessoria = inAssessoria;
	}

	public Long getAssessoriaId() {
		return assessoriaId;
	}

	public void setAssessoriaId(Long assessoriaId) {
		this.assessoriaId = assessoriaId;
	}

	public Long getSmsFranquiaAdicional() {
		return smsFranquiaAdicional;
	}

	public void setSmsFranquiaAdicional(Long smsFranquiaAdicional) {
		this.smsFranquiaAdicional = smsFranquiaAdicional;
	}

	public Long getSmsFranquiaBasica() {
		return smsFranquiaBasica;
	}

	public void setSmsFranquiaBasica(Long smsFranquiaBasica) {
		this.smsFranquiaBasica = smsFranquiaBasica;
	}

	public Long getSmsReservaConsulta() {
		return smsReservaConsulta;
	}

	public void setSmsReservaConsulta(Long smsReservaConsulta) {
		this.smsReservaConsulta = smsReservaConsulta;
	}

	public Long getSmsEnviadosTotal() {
		return smsEnviadosTotal;
	}

	public void setSmsEnviadosTotal(Long smsEnviadosTotal) {
		this.smsEnviadosTotal = smsEnviadosTotal;
	}

	public Long getSmsCreditosTotal() {
		return smsCreditosTotal;
	}

	public void setSmsCreditosTotal(Long smsCreditosTotal) {
		this.smsCreditosTotal = smsCreditosTotal;
	}

	public Boolean getSmsIsAtivo() {
		return smsIsAtivo;
	}

	public void setSmsIsAtivo(Boolean smsIsAtivo) {
		this.smsIsAtivo = smsIsAtivo;
	}

	public String getSmsTextoInforma() {
		return smsTextoInforma;
	}

	public void setSmsTextoInforma(String smsTextoInforma) {
		this.smsTextoInforma = smsTextoInforma;
	}

	public Boolean getIsOrcamentoCobertura() {
		return isOrcamentoCobertura;
	}

	public void setIsOrcamentoCobertura(Boolean isOrcamentoCobertura) {
		this.isOrcamentoCobertura = isOrcamentoCobertura;
	}

	public Boolean getIsOrcamentoPorEmail() {
		return isOrcamentoPorEmail;
	}

	public void setIsOrcamentoPorEmail(Boolean isOrcamentoPorEmail) {
		this.isOrcamentoPorEmail = isOrcamentoPorEmail;
	}

	public Boolean getIsOrcamentoSmsCliente() {
		return isOrcamentoSmsCliente;
	}

	public void setIsOrcamentoSmsCliente(Boolean isOrcamentoSmsCliente) {
		this.isOrcamentoSmsCliente = isOrcamentoSmsCliente;
	}

	public Boolean getIsOrcamentoSmsProdutor() {
		return isOrcamentoSmsProdutor;
	}

	public void setIsOrcamentoSmsProdutor(Boolean isOrcamentoSmsProdutor) {
		this.isOrcamentoSmsProdutor = isOrcamentoSmsProdutor;
	}

	public boolean isInAssessoria() {
		return inAssessoria;
	}

	public List<ServicosEmail> getServicosEmailCollection() {
		return servicosEmailCollection;
	}

	public void setServicosEmailCollection(
			List<ServicosEmail> servicosEmailCollection) {
		this.servicosEmailCollection = servicosEmailCollection;
	}

	public List<TemplateMensagem> getTemplateMensagemCollection() {
		return templateMensagemCollection;
	}

	public void setTemplateMensagemCollection(
			List<TemplateMensagem> templateMensagemCollection) {
		this.templateMensagemCollection = templateMensagemCollection;
	}
	
}