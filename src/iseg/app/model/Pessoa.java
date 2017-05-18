package iseg.app.model;

import static javax.persistence.CascadeType.REFRESH;
import static javax.persistence.CascadeType.REMOVE;
import static javax.persistence.GenerationType.SEQUENCE;
import static javax.persistence.InheritanceType.JOINED;

import iseg.app.conversion.CpfCnpj;
import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.AttributeOverride;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Transient;

import org.hibernate.annotations.Filter;
import org.hibernate.annotations.FilterDef;
import org.hibernate.annotations.ParamDef;


@Entity
@FilterDef(name="corretoraFilter", parameters={@ParamDef(name="corretoraParam", type="long"),@ParamDef(name="assessoriaIdParam", type="long"),@ParamDef(name="isAssessoriaParam", type="boolean")})    
@Filter(name="corretoraFilter", condition="((:isAssessoriaParam = 'true' and corretora_id in (select c.id from corretora c where c.assessoria_id = :assessoriaIdParam and c.is_assessorada = 'true')) or corretora_id = :corretoraParam  or is_generic='true')")    
@NamedQueries({
	@NamedQuery(name="getPessoa", query="SELECT p FROM Pessoa p ORDER BY p.nome"),
	@NamedQuery(name="getPessoaOrdered", query = "SELECT p FROM Pessoa p ORDER BY p.nome"),
	@NamedQuery(name="getPessoaByCpfOuCnpj", query = "SELECT p FROM Pessoa p WHERE p.cpfOuCnpj = :cpfOuCnpj ORDER BY p.nome"),
	@NamedQuery(name="getPessoaByCpfOuCnpjNoFilter", query = "SELECT p FROM Pessoa p WHERE p.cpfOuCnpj = ?0 ORDER BY p.nome"),
	@NamedQuery(name="getPessoaByNome", query = "SELECT p FROM Pessoa p WHERE p.nome = :nome ORDER BY p.nome")})
@Inheritance(strategy=JOINED)
public class Pessoa extends PObject implements Serializable, AtributoCorretora {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="PES_SEQ", sequenceName = "APP_SEQ")
	private Long id;

	@Embedded
	@AttributeOverride(name="valor", column=@Column(name="CPF_OU_CNPJ"))
	private CpfCnpj cpfOuCnpj;

	private String nome;

	private String email;

	@Column(name="TELEFONE_PREFERENCIAL")
	private String telefonePreferencial;

	@Column(name="TELEFONE_ALTERNATIVO")
	private String telefoneAlternativo;

	@Column(name="TELEFONE_CELULAR")
	private String telefoneCelular;

	@Column(name="IS_GENERIC", columnDefinition="default false")
	private Boolean isGeneric;

	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="GRUPO_DE_VENDA_ID")
	private GrupoDeVenda grupoDeVenda;

	@ManyToOne(fetch=FetchType.EAGER)
	private Corretora corretora;

	@Column(name="sms_is_ativo", columnDefinition="default true")
	private Boolean smsIsAtivo;
	
	@Column(name="referencia_pessoal")
	private String referenciaPessoal;

	@Transient
	private List<CorretoraCliente> corretoraClienteCollection = new ArrayList<CorretoraCliente>();

	@OneToMany(mappedBy="pessoa", cascade ={CascadeType.REMOVE,CascadeType.PERSIST,CascadeType.MERGE},fetch = FetchType.LAZY)
	private List<Endereco> enderecoCollection = new ArrayList<Endereco>();

	@Transient
	private List<Dossie> dossieCollection = new ArrayList<Dossie>();

	@OneToMany(mappedBy="pessoa", cascade =CascadeType.REMOVE,fetch = FetchType.LAZY)
	private List<ContaCorrente> contaCorrenteCollection = new ArrayList<ContaCorrente>();

	@OneToMany(fetch=FetchType.LAZY, mappedBy = "cliente", cascade = REFRESH)
	private List<Proposta> propostaCollection = new ArrayList<Proposta>();

	@OneToMany(cascade={ REMOVE }, mappedBy = "pessoa",fetch = FetchType.LAZY)
	private List<Dependentes> dependentesCollection = new ArrayList<Dependentes>();

	@Transient
	private List<Usuario> usuarioCollection = new ArrayList<Usuario>();

	@Transient
	private List<Automovel> automovelCollection = new ArrayList<Automovel>();

	@Transient
	private List<PessoaAtuacao> pessoaAtuacaoList = new ArrayList<PessoaAtuacao>();

	public Pessoa() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public CpfCnpj getCpfOuCnpj() {
		return this.cpfOuCnpj;
	}

	public void setCpfOuCnpj(CpfCnpj cpfOuCnpj) {
		this.cpfOuCnpj = cpfOuCnpj;
	}

	public String getNome() {
		return this.nome!=null ? this.nome.trim() : this.nome;
	}

	public String getNomeCurto() {
		if (this.nome!=null){
			if (this.nome.length()>25)
				return this.nome.substring(0, 25);
		}
		return this.nome ;
	}

	public void setNome(String nome) {
		this.nome = nome!=null ? nome.trim() : nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public List<Dossie> getDossieCollection() {
		return this.dossieCollection;
	}

	public void setDossieCollection(List<Dossie> dossieCollection) {
		this.dossieCollection = dossieCollection;
	}

	public List<CorretoraCliente> getCorretoraClienteCollection() {
		return this.corretoraClienteCollection;
	}

	public void setCorretoraClienteCollection(List<CorretoraCliente> corretoraClienteCollection) {
		this.corretoraClienteCollection = corretoraClienteCollection;
	}

	public List<Endereco> getEnderecoCollection() {
		return this.enderecoCollection;
	}

	public void setEnderecoCollection(List<Endereco> enderecoCollection) {
		this.enderecoCollection = enderecoCollection;
	}

	public List<ContaCorrente> getContaCorrenteCollection() {
		return this.contaCorrenteCollection;
	}

	public void setContaCorrenteCollection(List<ContaCorrente> contaCorrenteCollection) {
		this.contaCorrenteCollection = contaCorrenteCollection;
	}

	public List<Proposta> getPropostaCollection() {
		return this.propostaCollection;
	}

	public void setPropostaCollection(List<Proposta> propostaCollection) {
		this.propostaCollection = propostaCollection;
	}

	public List<Automovel> getAutomovelCollection() {
		return this.automovelCollection;
	}

	public void setAutomovelCollection(List<Automovel> automovelCollection) {
		this.automovelCollection = automovelCollection;
	}

	public List<Dependentes> getDependentesCollection() {
		return this.dependentesCollection;
	}

	public void setDependentesCollection(List<Dependentes> dependentesCollection) {
		this.dependentesCollection = dependentesCollection;
	}

	public List<Usuario> getUsuarioCollection() {
		return this.usuarioCollection;
	}

	public void setUsuarioCollection(List<Usuario> usuarioCollection) {
		this.usuarioCollection = usuarioCollection;
	}

	public List<PessoaAtuacao> getPessoaatuacaoList() {
		return this.pessoaAtuacaoList;
	}

	public void setPessoaatuacaoList(List<PessoaAtuacao> pessoaatuacaoList) {
		this.pessoaAtuacaoList = pessoaatuacaoList;
	}

	public GrupoDeVenda getGrupoDeVenda() {
		return grupoDeVenda;
	}

	public void setGrupoDeVenda(GrupoDeVenda grupoDeVenda) {
		this.grupoDeVenda = grupoDeVenda;
	}


	public String getTelefonePreferencial() {
		return telefonePreferencial;
	}

	public void setTelefonePreferencial(String telefonePreferencial) {
		this.telefonePreferencial = telefonePreferencial;
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

	public Corretora getCorretora() {
		return corretora;
	}

	public void setCorretora(Corretora corretora) {
		this.corretora = corretora;
	}

	public Boolean getIsGeneric() {
		return isGeneric;
	}

	public void setIsGeneric(Boolean isGeneric) {
		this.isGeneric = isGeneric;
	}

	public Boolean getSmsIsAtivo() {
		return smsIsAtivo;
	}

	public void setSmsIsAtivo(Boolean smsIsAtivo) {
		this.smsIsAtivo = smsIsAtivo;
	}

	public String getReferenciaPessoal() {
		return referenciaPessoal;
	}

	public void setReferenciaPessoal(String referenciaPessoal) {
		this.referenciaPessoal = referenciaPessoal;
	}
}