package iseg.app.model;

import static javax.persistence.InheritanceType.JOINED;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="PESSOA_FISICA")
@NamedQueries({
	@NamedQuery(name="getPessoaFisica", query="SELECT pf FROM PessoaFisica pf ORDER BY pf.nome"),
	@NamedQuery(name="getPessoaFisicaById", query="SELECT pf FROM PessoaFisica pf WHERE pf.id = ?0"),
	@NamedQuery(name="getPessoaFisicaByCpf", query="SELECT pf FROM PessoaFisica pf WHERE pf.cpfOuCnpj = ?0"),
	@NamedQuery(name="getPessoaFisicaByNome", query="SELECT pf FROM PessoaFisica pf WHERE pf.nome = ?0"),
	@NamedQuery(name="getCountPessoaFisica", query="SELECT Count(*) FROM PessoaFisica pf"),
	@NamedQuery(name="getPessoaFisicaOrdered", query = "SELECT pf FROM PessoaFisica pf ORDER BY pf.nome")})
@Inheritance(strategy=JOINED)
public class PessoaFisica  extends Pessoa implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column(length=15)
	private String sexo;

	@Temporal(TemporalType.DATE)
	@Column(name="DATA_NASCIMENTO")
	private Date dataNascimento;

	@Column(length=15)
	private String cnh;

	@ManyToOne(optional = true)
	@JoinColumn(name="profissao_id")
	private Profissao profissao;
	
	@Column(name="profissao")
	private String profissaoNome;

	@Column(name="ESTADO_CIVIL")
	private String estadoCivil;

	@Temporal(TemporalType.DATE)
	@Column(name="DATA_1A_HABILITACAO")
	private Date data1aHabilitacao;

	@Temporal(TemporalType.DATE)
	@Column(name="data_venc_habilitacao")
	private Date dataVencHabilitacao;
	
	@Column(length=15)
	private String rg;

	@Column(name="ORGAO_EMISSOR",length=15)
	private String orgaoEmissor;

	@Column(name="TELEFONE_RECADOS",length=30)
	private String telefoneRecados;

	@Temporal(TemporalType.DATE)
	@Column(name="DATA_EMISSAO")
	private Date dataEmissao;

	@OneToMany(mappedBy="pessoaFisica")
	private Set<Corretora> corretoraCollection;

	public PessoaFisica() {
		super();
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public Date getDataNascimento() {
		return dataNascimento;
	}

	public void setDataNascimento(Date dataNascimento) {
		this.dataNascimento = dataNascimento;
	}

	public String getCnh() {
		return cnh;
	}

	public void setCnh(String cnh) {
		this.cnh = cnh;
	}

	public Profissao getProfissao() {
		return profissao;
	}

	public void setProfissao(Profissao profissao) {
		this.profissao = profissao;
	}

	public String getProfissaoNome() {
		return profissaoNome;
	}

	public void setProfissaoNome(String profissaoNome) {
		this.profissaoNome = profissaoNome;
	}

	public Date getData1aHabilitacao() {
		return data1aHabilitacao;
	}

	public void setData1aHabilitacao(Date data1aHabilitacao) {
		this.data1aHabilitacao = data1aHabilitacao;
	}

	public String getRg() {
		return this.rg;
	}

	public void setRg(String rg) {
		this.rg = rg;
	}

	public String getOrgaoEmissor() {
		return this.orgaoEmissor;
	}

	public void setOrgaoEmissor(String orgaoEmissor) {
		this.orgaoEmissor = orgaoEmissor;
	}

	public String getTelefoneRecados() {
		return this.telefoneRecados;
	}

	public void setTelefoneRecados(String telefoneRecados) {
		this.telefoneRecados = telefoneRecados;
	}

	public Date getDataEmissao() {
		return this.dataEmissao;
	}

	public void setDataEmissao(Date dataEmissao) {
		this.dataEmissao = dataEmissao;
	}

	public Set<Corretora> getCorretoraCollection() {
		return this.corretoraCollection;
	}

	public void setCorretoraCollection(Set<Corretora> corretoraCollection) {
		this.corretoraCollection = corretoraCollection;
	}

	public String getEstadoCivil() {
		return estadoCivil;
	}

	public void setEstadoCivil(String estadoCivil) {
		this.estadoCivil = estadoCivil;
	}

	public Date getDataVencHabilitacao() {
		return dataVencHabilitacao;
	}

	public void setDataVencHabilitacao(Date dataVencHabilitacao) {
		this.dataVencHabilitacao = dataVencHabilitacao;
	}
}