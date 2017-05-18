package iseg.app.model;

import static javax.persistence.FetchType.LAZY;
import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.conversion.CpfCnpj;
import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.AttributeOverride;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@NamedQueries({
	@NamedQuery(name="getCountCondutor", query="SELECT Count(*) FROM Condutor c ORDER BY c.nome"),
	@NamedQuery(name="getCondutor", query="SELECT c FROM Condutor c"),
	@NamedQuery(name="getCondutorByNome", query="SELECT c FROM Condutor c where c.proposta.id = ?0 and c.nome = ?1"),
	@NamedQuery(name="getCondutorByCpfAndOrcamento", query="SELECT c FROM Condutor c where c.orcamentoSeguro.id = ?0 and c.cpf = ?1"),
	@NamedQuery(name="getCondutorByOrcamentoSeguro", query="SELECT c FROM Condutor c where c.orcamentoSeguro.id = ?0"),
	@NamedQuery(name="updateCondutorAllNaoPrincipalByAutomovel", query="UPDATE Condutor SET tipoCondutor = 'NAO' WHERE automovel.id = ?0"),
	@NamedQuery(name="updateCondutorAllNaoPrincipalByProposta", query="UPDATE Condutor SET tipoCondutor = 'NAO', isCondutorPrincipal = false WHERE proposta.id = ?0"),
	@NamedQuery(name="updateCondutorAllNaoPrincipalByOrcamentoSeguro", query="UPDATE Condutor SET isCondutorPrincipal = FALSE WHERE orcamentoSeguro.id = ?0"),
	@NamedQuery(name="getCondutorByAutomovel", query="SELECT c FROM Condutor c WHERE c.proposta.id = ?0 ORDER BY c.nome")})
public class Condutor extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="CDT_SEQ", sequenceName = "APP_SEQ")
	private Long id;

	private String dirige;

	@Column(name="USO_SEMANA")
	private Long usoSemana;

	private String sexo;

	@Column(name="DATA_NASCIMENTO")
	@Temporal(TemporalType.DATE)
	private Date dataNascimento;

	@Column(name="DATA_1A_HABILITACAO")
	@Temporal(TemporalType.DATE)
	private Date data1aHabilitacao;
	
	@Temporal(TemporalType.DATE)
	@Column(name="data_venc_habilitacao")
	private Date dataVencHabilitacao;

	@Column(name="TEMPO_HABILITACAO")
	private Long tempoHabilitacao;

	@Embedded
	@AttributeOverride(name="valor", column=@Column(name="CPF"))
	private CpfCnpj cpf;

	private Long idade;

	private String nome;

	@Column(name="TIPO_CONDUTOR")
	private String tipoCondutor;

	private String telefones;

	@ManyToOne
	@JoinColumn(name="profissao_id")
	private Profissao profissao;

	private String cnh;

	@ManyToOne(fetch=LAZY)
	private Automovel automovel;

	@ManyToOne(fetch=LAZY)
	private Proposta proposta;

	@Column(name="ESTADO_CIVIL")
	private String estadoCivil;
	
	@Column(name="email")
	private String email;
	
	@ManyToOne
	@JoinColumn(name="orcamento_seguro_id")
	private OrcamentoSeguro orcamentoSeguro; 
	
	@Column(name="is_condutor_principal")
	private Boolean isCondutorPrincipal;
	
	@ManyToOne
	@JoinColumn(name="escolaridade_id")
	private Escolaridade escolaridade; 
	
	@ManyToOne
	@JoinColumn(name="relacao_condutor_seg_id")
	private DominioEsp relacaoCondutorSegurado;
	
	private static final long serialVersionUID = 1L;

	public Condutor() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDirige() {
		return this.dirige;
	}

	public void setDirige(String dirige) {
		this.dirige = dirige;
	}

	public Long getUsoSemana() {
		return this.usoSemana;
	}

	public void setUsoSemana(Long usoSemana) {
		this.usoSemana = usoSemana;
	}

	public String getSexo() {
		return this.sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public Date getDataNascimento() {
		return this.dataNascimento;
	}

	public void setDataNascimento(Date dataNascimento) {
		this.dataNascimento = dataNascimento;
	}

	public Date getData1aHabilitacao() {
		return data1aHabilitacao;
	}

	public void setData1aHabilitacao(Date data1aHabilitacao) {
		this.data1aHabilitacao = data1aHabilitacao;
	}

	public Long getTempoHabilitacao() {
		return this.tempoHabilitacao;
	}

	public void setTempoHabilitacao(Long tempoHabilitacao) {
		this.tempoHabilitacao = tempoHabilitacao;
	}

	public CpfCnpj getCpf() {
		return this.cpf;
	}

	public void setCpf(CpfCnpj cpf) {
		this.cpf = cpf;
	}

	public Long getIdade() {
		return this.idade;
	}

	public void setIdade(Long idade) {
		this.idade = idade;
	}

	public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getTipoCondutor() {
		return tipoCondutor;
	}

	public void setTipoCondutor(String tipoCondutor) {
		this.tipoCondutor = tipoCondutor;
	}

	public String getTelefones() {
		return telefones;
	}

	public Profissao getProfissao() {
		return profissao;
	}

	public void setProfissao(Profissao profissao) {
		this.profissao = profissao;
	}

	public void setTelefones(String telefones) {
		this.telefones = telefones;
	}

	public Automovel getAutomovel() {
		return this.automovel;
	}

	public void setAutomovel(Automovel automovel) {
		this.automovel = automovel;
	}

	public String getEstadoCivil() {
		return this.estadoCivil;
	}

	public void setEstadoCivil(String estadoCivil) {
		this.estadoCivil = estadoCivil;
	}

	public String getCnh() {
		return cnh;
	}

	public void setCnh(String cnh) {
		this.cnh = cnh;
	}

	public Date getDataVencHabilitacao() {
		return dataVencHabilitacao;
	}

	public void setDataVencHabilitacao(Date dataVencHabilitacao) {
		this.dataVencHabilitacao = dataVencHabilitacao;
	}

	public Proposta getProposta() {
		return proposta;
	}

	public void setProposta(Proposta proposta) {
		this.proposta = proposta;
	}

	public OrcamentoSeguro getOrcamentoSeguro() {
		return orcamentoSeguro;
	}

	public void setOrcamentoSeguro(OrcamentoSeguro orcamentoSeguro) {
		this.orcamentoSeguro = orcamentoSeguro;
	}

	public Boolean getIsCondutorPrincipal() {
		return isCondutorPrincipal;
	}

	public void setIsCondutorPrincipal(Boolean isCondutorPrincipal) {
		this.isCondutorPrincipal = isCondutorPrincipal;
	}

	public Escolaridade getEscolaridade() {
		return escolaridade;
	}

	public void setEscolaridade(Escolaridade escolaridade) {
		this.escolaridade = escolaridade;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public DominioEsp getRelacaoCondutorSegurado() {
		return relacaoCondutorSegurado;
	}

	public void setRelacaoCondutorSegurado(DominioEsp relacaoCondutorSegurado) {
		this.relacaoCondutorSegurado = relacaoCondutorSegurado;
	}
	
}