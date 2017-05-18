package iseg.app.model;

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
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@NamedQueries({
	@NamedQuery(name="getCountDependentes", query="SELECT Count(*) FROM Dependentes cc"),
	@NamedQuery(name="getDependentes", query="SELECT cc FROM Dependentes cc"),
	@NamedQuery(name="getDependentesByPessoaId", query = "SELECT e FROM Dependentes e WHERE e.pessoa.id = ?0")})
public class Dependentes extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="DEP_SEQ",sequenceName="APP_SEQ")
	private Long id;

	@ManyToOne
	private Pessoa pessoa;

	private String nome;

	@Column(name="data_nascimento")
	@Temporal(TemporalType.DATE)
	private Date dataNascimento;

	private String sexo;

	private String parentesco;

	@Embedded
	@AttributeOverride(name="valor", column=@Column(name="CPF"))
	private CpfCnpj cpf;

	private String rg;

	@Column(name="data_emissao")
	@Temporal(TemporalType.DATE)
	private Date dataEmissao;

	@Column(name="orgao_emissor")
	private String orgaoEmissor;

	private String cnh;

	@Column(name="data_1a_habilitacao")
	@Temporal(TemporalType.DATE)
	private Date data1aHabilitacao;

	@Column(name="data_venc_habilitacao")
	@Temporal(TemporalType.DATE)
	private Date dataVencHabilitacao;

	@Column(name="estado_civil")
	private String estadoCivil;

	private String profissao;

	@Column(name="telefone_celular")
	private String telefoneCelular;

	private String email;

	private static final long serialVersionUID = 1L;

	public Dependentes() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Pessoa getPessoa() {
		return this.pessoa;
	}

	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
	}

	public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Date getDataNascimento() {
		return this.dataNascimento;
	}

	public void setDataNascimento(Date dataNascimento) {
		this.dataNascimento = dataNascimento;
	}

	public String getSexo() {
		return this.sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public String getParentesco() {
		return this.parentesco;
	}

	public void setParentesco(String parentesco) {
		this.parentesco = parentesco;
	}

	public CpfCnpj getCpf() {
		return this.cpf;
	}

	public void setCpf(CpfCnpj cpf) {
		this.cpf = cpf;
	}

	public String getRg() {
		return this.rg;
	}

	public void setRg(String rg) {
		this.rg = rg;
	}

	public Date getDataEmissao() {
		return this.dataEmissao;
	}

	public void setDataEmissao(Date dataEmissao) {
		this.dataEmissao = dataEmissao;
	}

	public String getOrgaoEmissor() {
		return this.orgaoEmissor;
	}

	public void setOrgaoEmissor(String orgaoEmissor) {
		this.orgaoEmissor = orgaoEmissor;
	}

	public String getCnh() {
		return this.cnh;
	}

	public void setCnh(String cnh) {
		this.cnh = cnh;
	}

	public Date getData1aHabilitacao() {
		return this.data1aHabilitacao;
	}

	public void setData1aHabilitacao(Date data1aHabilitacao) {
		this.data1aHabilitacao = data1aHabilitacao;
	}

	public Date getDataVencHabilitacao() {
		return this.dataVencHabilitacao;
	}

	public void setDataVencHabilitacao(Date dataVencHabilitacao) {
		this.dataVencHabilitacao = dataVencHabilitacao;
	}

	public String getEstadoCivil() {
		return this.estadoCivil;
	}

	public void setEstadoCivil(String estadoCivil) {
		this.estadoCivil = estadoCivil;
	}

	public String getProfissao() {
		return this.profissao;
	}

	public void setProfissao(String profissao) {
		this.profissao = profissao;
	}

	public String getTelefoneCelular() {
		return this.telefoneCelular;
	}

	public void setTelefoneCelular(String telefoneCelular) {
		this.telefoneCelular = telefoneCelular;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
