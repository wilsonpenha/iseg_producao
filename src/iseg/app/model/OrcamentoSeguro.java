package iseg.app.model;

import static javax.persistence.FetchType.LAZY;
import iseg.app.conversion.CpfCnpj;
import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.AttributeOverride;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Embedded;
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
import javax.persistence.Transient;

import org.hibernate.annotations.Filter;
import org.hibernate.annotations.FilterDef;
import org.hibernate.annotations.ParamDef;

@Entity
@Table(name="orcamento_seguro")
@SequenceGenerator(name="seq_orcamento_seguro", sequenceName = "seq_orcamento_seguro")
@FilterDef(name="corretoraFilter", parameters={@ParamDef(name="corretoraParam", type="long"),@ParamDef(name="assessoriaIdParam", type="long"),@ParamDef(name="isAssessoriaParam", type="boolean")})    
@Filter(name="corretoraFilter", condition="(corretora_id = :corretoraParam)")
@NamedQueries({
	@NamedQuery(name="getOrcamentoSeguroById", query="SELECT a FROM OrcamentoSeguro a WHERE a.id = ?0"),
	@NamedQuery(name="getCountOrcamentoSeguro", query="SELECT Count(*) FROM OrcamentoSeguro a WHERE a.corretora.id = ?0")
})
public class OrcamentoSeguro extends PObject implements Serializable, AtributoCorretora, AtributoUsuario {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "seq_orcamento_seguro")
	private Long id;

	@Column(name="nome_banco")
	private String nomeBanco;

	@Column(name="nro_banco")
	private Long nroBanco;

	@Column(name="codigo_agencia")
	private String codigoAgencia;

	@Column(name="conta_corrente")
	private Long contaCorrente;

	@Column(name="conta_digito")
	private String contaDigito;

	@Column(name="inicio_vigencia")
	private Date inicioVigencia;

	@Column(name="termino_vigencia")
	private Date terminoVigencia;

	@Column(name="numero")
	private Long numero;

	@Column(name="nro_cotacao_online")
	private String nroCotacaoOnline;

	@Column(name="titular_ccorrente")
	private String titularCcorrente;

	@ManyToOne
	@JoinColumn(name="cliente_id")
	private Pessoa cliente;

	@Column(name="data_orcamento")
	private Date dataOrcamento;

	@ManyToOne
	@JoinColumn(name="corretora_id")
	private Corretora corretora;

	@ManyToOne
	@JoinColumn(name="grupo_de_venda_id")
	private GrupoDeVenda grupoDeVenda;

	@ManyToOne
	@JoinColumn(name="produtor_id")
	private Produtor produtor;

	@ManyToOne
	@JoinColumn(name="ramo_id")
	private Ramo ramo;

	@ManyToOne
	@JoinColumn(name="usuario_id")
	private Usuario usuario;

	@ManyToOne
	@JoinColumn(name="situacao_id")
	private Situacao situacao;

	@Column(name="cliente_nome")
	private String clienteNome;

	@Embedded
	@AttributeOverride(name="valor", column=@Column(name="cpf_ou_cnpj"))
	private CpfCnpj cpfOuCnpj;
	
	@Column(name="fator")
	private BigDecimal fator;

	@Column(name="is_generic")
	private Boolean isGeneric;

	@Column(name="email")
	private String email;

	@Column(name="telefone_alternativo")
	private String telefoneAlternativo;

	@Column(name="telefone_celular")
	private String telefoneCelular;

	@Column(name="telefone_preferencial")
	private String telefonePreferencial;

	@Column(name="referencia_pessoal")
	private String referenciaPessoal;

	@Column(name="cnh")
	private String cnh;

	@Column(name="data_1a_habilitacao")
	private Date data1aHabilitacao;

	@Column(name="data_nascimento")
	private Date dataNascimento;

	@Column(name="estado_civil")
	private String estadoCivil;

	@Column(name="sexo")
	private String sexo;
	
	@Column(name="cli_condutor_principal")
	private String cliCondutorPrincipal;
	
	@Column(name="tipo_pessoa")
	private Integer tipoPessoa;
	
	@Column(name="outra_profissao")
	private String outraProfissao;
	
	@Column(name="data_validade")
	private Date dataValidade;
	
	@Column(name="data_agendamento")
	private Date dataAgendamento;

	@Column(name="tipo_proposta")
	private Long tipoProposta;
	
	private String observacao;
	
	@ManyToOne
	@JoinColumn(name="profissao_id")
	private Profissao profissao;
	
	@ManyToOne(targetEntity=OrcamentoSeguro.class, fetch = LAZY)
	@JoinColumn(name="orcamento_seguro_id", referencedColumnName = "id")
	private OrcamentoSeguro orcamentoSeguro;

	@ManyToOne
	@JoinColumn(name="tipo_cobertura_id")
	private TipoCobertura tipoCobertura;
	
	@ManyToOne
	@JoinColumn(name="proposta_id")
	private Proposta proposta;
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy="orcamentoSeguro", fetch=FetchType.LAZY)
	@OrderBy("id asc")
	private List<AutomovelOrcamento> automovelOrcamentoCollection = new ArrayList<AutomovelOrcamento>();
	
	@OneToMany(mappedBy="orcamentoSeguro", cascade={CascadeType.REFRESH, CascadeType.DETACH})
	@OrderBy("id,isCondutorPrincipal  desc")
	private List<Condutor> condutoresCollection = new ArrayList<Condutor>();

	@OneToMany(mappedBy="orcamentoSeguro", cascade = CascadeType.ALL, fetch=FetchType.LAZY)
	@OrderBy("item")
	private List<OrcamentoSeguradora> orcamentoSeguradoraCollection = new ArrayList<OrcamentoSeguradora>();
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy="orcamentoSeguro", fetch=FetchType.LAZY)
	@OrderBy("sequencia")
	private List<OrcamentoCoberturaIseg> orcamentoCoberturaIsegCollection = new ArrayList<OrcamentoCoberturaIseg>();
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy="orcamentoSeguro", fetch=FetchType.LAZY)
	@OrderBy("sequencia")
	private List<OrcamentoServicosIseg> orcamentoServicosIsegCollection = new ArrayList<OrcamentoServicosIseg>();
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy="orcamentoSeguro", fetch=FetchType.LAZY)
	private List<RespostaPerfil> respostaPerfilCollection = new ArrayList<RespostaPerfil>();
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy="orcamentoSeguro", fetch=FetchType.LAZY)
	private List<Orcamento> orcamentoCollection = new ArrayList<Orcamento>();
	
	@OneToMany(mappedBy="orcamentoSeguro", cascade = CascadeType.ALL, fetch=FetchType.LAZY)
	@OrderBy("id asc")
	private List<OrcamentoBancos> orcamentoBancosCollection = new ArrayList<OrcamentoBancos>();
	
	@OneToMany(mappedBy="orcamentoSeguro", cascade = CascadeType.ALL, fetch=FetchType.LAZY)
	private List<PerfilOrcamento> perfilOrcamentoCollection = new ArrayList<PerfilOrcamento>();
	
	@Transient
	private List<CrossTabRelatorio> orcamentoSeguradoraCoberturaCollection = new ArrayList<CrossTabRelatorio>();
	
	@Transient
	private List<CrossTabRelatorio> orcamentoSeguradoraServicoCollection = new ArrayList<CrossTabRelatorio>();
	
	@Transient
	private List<CrossTabRelatorio> formaPagamentoFranquiasCollection = new ArrayList<CrossTabRelatorio>();
	
	@Transient
	private List<CrossTabRelatorio> franquiasCollection = new ArrayList<CrossTabRelatorio>();
	
	@Transient
	private List<CrossTabRelatorio> premiosCollection = new ArrayList<CrossTabRelatorio>(); 
	
	private static final long serialVersionUID = 1L;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNomeBanco() {
		return nomeBanco;
	}

	public void setNomeBanco(String nomeBanco) {
		this.nomeBanco = nomeBanco;
	}

	public Long getNroBanco() {
		return nroBanco;
	}

	public void setNroBanco(Long nroBanco) {
		this.nroBanco = nroBanco;
	}

	public String getCodigoAgencia() {
		return codigoAgencia;
	}

	public void setCodigoAgencia(String codigoAgencia) {
		this.codigoAgencia = codigoAgencia;
	}

	public Long getContaCorrente() {
		return contaCorrente;
	}

	public void setContaCorrente(Long contaCorrente) {
		this.contaCorrente = contaCorrente;
	}

	public String getContaDigito() {
		return contaDigito;
	}

	public void setContaDigito(String contaDigito) {
		this.contaDigito = contaDigito;
	}

	public Date getInicioVigencia() {
		return inicioVigencia;
	}

	public void setInicioVigencia(Date inicioVigencia) {
		this.inicioVigencia = inicioVigencia;
	}

	public Date getTerminoVigencia() {
		return terminoVigencia;
	}

	public void setTerminoVigencia(Date terminoVigencia) {
		this.terminoVigencia = terminoVigencia;
	}

	public Long getNumero() {
		return numero;
	}

	public void setNumero(Long numero) {
		this.numero = numero;
	}

	public String getTitularCcorrente() {
		return titularCcorrente;
	}

	public void setTitularCcorrente(String titularCcorrente) {
		this.titularCcorrente = titularCcorrente;
	}

	public Pessoa getCliente() {
		return cliente;
	}

	public void setCliente(Pessoa cliente) {
		this.cliente = cliente;
	}

	public Date getDataOrcamento() {
		return dataOrcamento;
	}

	public void setDataOrcamento(Date dataOrcamento) {
		this.dataOrcamento = dataOrcamento;
	}

	public Corretora getCorretora() {
		return corretora;
	}

	public void setCorretora(Corretora corretora) {
		this.corretora = corretora;
	}

	public GrupoDeVenda getGrupoDeVenda() {
		return grupoDeVenda;
	}

	public void setGrupoDeVenda(GrupoDeVenda grupoDeVenda) {
		this.grupoDeVenda = grupoDeVenda;
	}

	public Produtor getProdutor() {
		return produtor;
	}

	public void setProdutor(Produtor produtor) {
		this.produtor = produtor;
	}

	public Ramo getRamo() {
		return ramo;
	}

	public void setRamo(Ramo ramo) {
		this.ramo = ramo;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Situacao getSituacao() {
		return situacao;
	}

	public void setSituacao(Situacao situacao) {
		this.situacao = situacao;
	}

	public String getClienteNome() {
		return clienteNome;
	}

	public void setClienteNome(String clienteNome) {
		this.clienteNome = clienteNome;
	}

	public CpfCnpj getCpfOuCnpj() {
		return cpfOuCnpj;
	}

	public void setCpfOuCnpj(CpfCnpj cpfOuCnpj) {
		this.cpfOuCnpj = cpfOuCnpj;
	}

	public BigDecimal getFator() {
		return fator;
	}

	public void setFator(BigDecimal fator) {
		this.fator = fator;
	}

	public Boolean getIsGeneric() {
		return isGeneric;
	}

	public void setIsGeneric(Boolean isGeneric) {
		this.isGeneric = isGeneric;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelefoneAlternativo() {
		return telefoneAlternativo;
	}

	public void setTelefoneAlternativo(String telefoneAlternativo) {
		this.telefoneAlternativo = telefoneAlternativo;
	}

	public String getTelefoneCelular() {
		return telefoneCelular;
	}

	public void setTelefoneCelular(String telefoneCelular) {
		this.telefoneCelular = telefoneCelular;
	}

	public String getTelefonePreferencial() {
		return telefonePreferencial;
	}

	public void setTelefonePreferencial(String telefonePreferencial) {
		this.telefonePreferencial = telefonePreferencial;
	}

	public String getReferenciaPessoal() {
		return referenciaPessoal;
	}

	public void setReferenciaPessoal(String referenciaPessoal) {
		this.referenciaPessoal = referenciaPessoal;
	}

	public String getCnh() {
		return cnh;
	}

	public void setCnh(String cnh) {
		this.cnh = cnh;
	}

	public Date getData1aHabilitacao() {
		return data1aHabilitacao;
	}

	public void setData1aHabilitacao(Date data1aHabilitacao) {
		this.data1aHabilitacao = data1aHabilitacao;
	}

	public Date getDataNascimento() {
		return dataNascimento;
	}

	public void setDataNascimento(Date dataNascimento) {
		this.dataNascimento = dataNascimento;
	}

	public String getEstadoCivil() {
		return estadoCivil;
	}

	public void setEstadoCivil(String estadoCivil) {
		this.estadoCivil = estadoCivil;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public String getCliCondutorPrincipal() {
		return cliCondutorPrincipal;
	}

	public void setCliCondutorPrincipal(String cliCondutorPrincipal) {
		this.cliCondutorPrincipal = cliCondutorPrincipal;
	}
	
	public Integer getTipoPessoa() {
		return tipoPessoa;
	}

	public void setTipoPessoa(Integer tipoPessoa) {
		this.tipoPessoa = tipoPessoa;
	}
	
	public String getOutraProfissao() {
		return outraProfissao;
	}

	public void setOutraProfissao(String outraProfissao) {
		this.outraProfissao = outraProfissao;
	}

	public Date getDataValidade() {
		return dataValidade;
	}

	public void setDataValidade(Date dataValidade) {
		this.dataValidade = dataValidade;
	}
	
	public Long getTipoProposta() {
		return tipoProposta;
	}

	public void setTipoProposta(Long tipoProposta) {
		this.tipoProposta = tipoProposta;
	}

	public Profissao getProfissao() {
		return profissao;
	}

	public void setProfissao(Profissao profissao) {
		this.profissao = profissao;
	}

	public OrcamentoSeguro getOrcamentoSeguro() {
		return orcamentoSeguro;
	}

	public void setOrcamentoSeguro(OrcamentoSeguro orcamentoSeguro) {
		this.orcamentoSeguro = orcamentoSeguro;
	}
	
	public List<OrcamentoBancos> getOrcamentoBancosCollection() {
		return orcamentoBancosCollection;
	}

	public void setOrcamentoBancosCollection(
			List<OrcamentoBancos> orcamentoBancosCollection) {
		this.orcamentoBancosCollection = orcamentoBancosCollection;
	}

	public TipoCobertura getTipoCobertura() {
		return tipoCobertura;
	}

	public void setTipoCobertura(TipoCobertura tipoCobertura) {
		this.tipoCobertura = tipoCobertura;
	}

	public Proposta getProposta() {
		return proposta;
	}

	public void setProposta(Proposta proposta) {
		this.proposta = proposta;
	}

	public List<AutomovelOrcamento> getAutomovelOrcamentoCollection() {
		return automovelOrcamentoCollection;
	}

	public void setAutomovelOrcamentoCollection(
			List<AutomovelOrcamento> automovelOrcamentoCollection) {
		this.automovelOrcamentoCollection = automovelOrcamentoCollection;
	}

	public List<OrcamentoSeguradora> getOrcamentoSeguradoraCollection() {
		return orcamentoSeguradoraCollection;
	}

	public void setOrcamentoSeguradoraCollection(
			List<OrcamentoSeguradora> orcamentoSeguradoraCollection) {
		this.orcamentoSeguradoraCollection = orcamentoSeguradoraCollection;
	}

	public List<Condutor> getCondutoresCollection() {
		return condutoresCollection;
	}

	public void setCondutoresCollection(List<Condutor> condutoresCollection) {
		this.condutoresCollection = condutoresCollection;
	}

	public List<OrcamentoCoberturaIseg> getOrcamentoCoberturaIsegCollection() {
		return orcamentoCoberturaIsegCollection;
	}

	public void setOrcamentoCoberturaIsegCollection(
			List<OrcamentoCoberturaIseg> orcamentoCoberturaIsegCollection) {
		this.orcamentoCoberturaIsegCollection = orcamentoCoberturaIsegCollection;
	}

	public List<OrcamentoServicosIseg> getOrcamentoServicosIsegCollection() {
		return orcamentoServicosIsegCollection;
	}

	public void setOrcamentoServicosIsegCollection(
			List<OrcamentoServicosIseg> orcamentoServicosIsegCollection) {
		this.orcamentoServicosIsegCollection = orcamentoServicosIsegCollection;
	}

	public List<RespostaPerfil> getRespostaPerfilCollection() {
		return respostaPerfilCollection;
	}

	public void setRespostaPerfilCollection(
			List<RespostaPerfil> respostaPerfilCollection) {
		this.respostaPerfilCollection = respostaPerfilCollection;
	}

	public List<Orcamento> getOrcamentoCollection() {
		return orcamentoCollection;
	}

	public void setOrcamentoCollection(List<Orcamento> orcamentoCollection) {
		this.orcamentoCollection = orcamentoCollection;
	}

	public List<CrossTabRelatorio> getOrcamentoSeguradoraCoberturaCollection() {
		return orcamentoSeguradoraCoberturaCollection;
	}

	public void setOrcamentoSeguradoraCoberturaCollection(
			List<CrossTabRelatorio> orcamentoSeguradoraCoberturaCollection) {
		this.orcamentoSeguradoraCoberturaCollection = orcamentoSeguradoraCoberturaCollection;
	}

	public List<CrossTabRelatorio> getOrcamentoSeguradoraServicoCollection() {
		return orcamentoSeguradoraServicoCollection;
	}

	public void setOrcamentoSeguradoraServicoCollection(
			List<CrossTabRelatorio> orcamentoSeguradoraServicoCollection) {
		this.orcamentoSeguradoraServicoCollection = orcamentoSeguradoraServicoCollection;
	}

	public List<CrossTabRelatorio> getFormaPagamentoFranquiasCollection() {
		return formaPagamentoFranquiasCollection;
	}

	public void setFormaPagamentoFranquiasCollection(
			List<CrossTabRelatorio> formaPagamentoFranquiasCollection) {
		this.formaPagamentoFranquiasCollection = formaPagamentoFranquiasCollection;
	}

	public List<CrossTabRelatorio> getFranquiasCollection() {
		return franquiasCollection;
	}

	public void setFranquiasCollection(List<CrossTabRelatorio> franquiasCollection) {
		this.franquiasCollection = franquiasCollection;
	}

	public List<CrossTabRelatorio> getPremiosCollection() {
		return premiosCollection;
	}

	public void setPremiosCollection(List<CrossTabRelatorio> premiosCollection) {
		this.premiosCollection = premiosCollection;
	}

	public List<PerfilOrcamento> getPerfilOrcamentoCollection() {
		return perfilOrcamentoCollection;
	}

	public void setPerfilOrcamentoCollection(
			List<PerfilOrcamento> perfilOrcamentoCollection) {
		this.perfilOrcamentoCollection = perfilOrcamentoCollection;
	}

	public Date getDataAgendamento() {
		return dataAgendamento;
	}

	public void setDataAgendamento(Date dataAgendamento) {
		this.dataAgendamento = dataAgendamento;
	}

	public String getObservacao() {
		return observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}

	public String getNroCotacaoOnline() {
		return nroCotacaoOnline;
	}

	public void setNroCotacaoOnline(String nroCotacaoOnline) {
		this.nroCotacaoOnline = nroCotacaoOnline;
	}
	
}
