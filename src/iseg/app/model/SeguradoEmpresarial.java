package iseg.app.model;

import static javax.persistence.FetchType.LAZY;
import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.conversion.CEP;
import iseg.app.conversion.CpfCnpj;
import iseg.app.persistence.PObject;

import java.io.Serializable;
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
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Cascade;


@Entity
@NamedQueries({
	@NamedQuery(name="getCountSeguradosEmp", query="SELECT Count(*) FROM SeguradoEmpresarial i where i.proposta.id = ?0")
})
@Table(name="segurado_empresarial")
public class SeguradoEmpresarial extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="SEMP_SEQ", sequenceName = "APP_SEQ")
	private Long id;

	@ManyToOne(fetch=FetchType.LAZY)
	private Proposta proposta;

	private String nome;

	@Embedded
	@AttributeOverride(name="valor", column=@Column(name="CPF"))
	private CpfCnpj cpf;

	@Column(name="LINHA_VAZIA")
	private Boolean linhaVazia;

	@Column(name="nro_apolice_anterior")
	private String nroApoliceAnterior;

	@Temporal(TemporalType.DATE)
	@Column(name="data_nascimento")
	private Date dataNascimento;

	@Column(name="estado_civil")
	private String estadoCivil;

	@Column(name="orgao_emissor")
	private String orgaoEmissor;

	private String profissao;

	private String rg;

	private String sexo;

	@Column(name="telefone_preferencial")
	private String telefonePreferencial;

	@Column(name="telefone_recados")
	private String telefoneRecados;

	@Column(name="telefone_celular")
	private String telefoneCelular;

	private String email;

	private String bairro;

	@Embedded
	@AttributeOverride(name="valor", column=@Column(name="CEP"))
	private CEP cep;

	private String cidade;

	private String complemento;

	private String fax;

	private String numero;

	@Column(name="tipo_endereco")
	private String tipoEndereco;

	private String uf;

	private String logradouro;

	private String conjuge;

	@Temporal(TemporalType.DATE)
	@Column(name="data_nascimento_conj")
	private Date dataNascimentoConj;

	@Column(name="sexo_conjuge")
	private String sexoConjuge;

	@Temporal(TemporalType.DATE)
	@Column(name="data_inclusao")
	private Date dataInclusao;

	@Temporal(TemporalType.DATE)
	@Column(name="inicio_vigencia")
	private Date inicioVigencia;

	@Column(name="forma_pagamento")
	private Integer formaPagamento;

	private String plano;

	private String pendencia;

	private String situacao;

	@Temporal(TemporalType.DATE)
	@Column(name="data_inativacao")
	private Date dataInativacao;

	@Column(name="renda_mensal")
	private Double rendaMensal;

	@Column(name="renda_diaria")
	private Double rendaDiaria;

	@Column(name="premio_titular")
	private Double premioTitular;

	@Column(name="premio_conjuge")
	private Double premioConjuge;

	private String certificado;

	@OneToMany(cascade={CascadeType.ALL}, mappedBy="seguradoEmpresarial", fetch=LAZY)
	@Cascade(org.hibernate.annotations.CascadeType.DELETE_ORPHAN)
	@org.hibernate.annotations.OrderBy(clause = "SEQUENCIA")
	private List<SeguradoCoberturas> seguradoCoberturasCollection = new ArrayList<SeguradoCoberturas>();

	@OneToMany(cascade={CascadeType.REMOVE}, mappedBy="seguradoEmpresarial", fetch=LAZY)
	private List<BeneficiarioEmpresarial> beneficiarioEmpresarialCollection;

	private static final long serialVersionUID = 1L;

	public SeguradoEmpresarial() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Proposta getProposta() {
		return this.proposta;
	}

	public void setProposta(Proposta proposta) {
		this.proposta = proposta;
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

	public String getEstadoCivil() {
		return this.estadoCivil;
	}

	public void setEstadoCivil(String estadoCivil) {
		this.estadoCivil = estadoCivil;
	}

	public String getOrgaoEmissor() {
		return this.orgaoEmissor;
	}

	public void setOrgaoEmissor(String orgaoEmissor) {
		this.orgaoEmissor = orgaoEmissor;
	}

	public String getProfissao() {
		return this.profissao;
	}

	public void setProfissao(String profissao) {
		this.profissao = profissao;
	}

	public String getRg() {
		return this.rg;
	}

	public void setRg(String rg) {
		this.rg = rg;
	}

	public String getSexo() {
		return this.sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public String getTelefoneRecados() {
		return this.telefoneRecados;
	}

	public void setTelefoneRecados(String telefoneRecados) {
		this.telefoneRecados = telefoneRecados;
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

	public String getBairro() {
		return this.bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public CEP getCep() {
		return this.cep;
	}

	public void setCep(CEP cep) {
		this.cep = cep;
	}

	public String getCidade() {
		return this.cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getComplemento() {
		return this.complemento;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}

	public String getFax() {
		return this.fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getNumero() {
		return this.numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public String getTipoEndereco() {
		return this.tipoEndereco;
	}

	public void setTipoEndereco(String tipoEndereco) {
		this.tipoEndereco = tipoEndereco;
	}

	public String getUf() {
		return this.uf;
	}

	public void setUf(String uf) {
		this.uf = uf;
	}

	public String getLogradouro() {
		return this.logradouro;
	}

	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}

	public String getConjuge() {
		return this.conjuge;
	}

	public void setConjuge(String conjuge) {
		this.conjuge = conjuge;
	}

	public Date getDataNascimentoConj() {
		return this.dataNascimentoConj;
	}

	public void setDataNascimentoConj(Date dataNascimentoConj) {
		this.dataNascimentoConj = dataNascimentoConj;
	}

	public String getSexoConjuge() {
		return this.sexoConjuge;
	}

	public void setSexoConjuge(String sexoConjuge) {
		this.sexoConjuge = sexoConjuge;
	}

	public Date getDataInclusao() {
		return this.dataInclusao;
	}

	public void setDataInclusao(Date dataInclusao) {
		this.dataInclusao = dataInclusao;
	}

	public Date getInicioVigencia() {
		return this.inicioVigencia;
	}

	public void setInicioVigencia(Date inicioVigencia) {
		this.inicioVigencia = inicioVigencia;
	}

	public Integer getFormaPagamento() {
		return this.formaPagamento;
	}

	public void setFormaPagamento(Integer formaPagamento) {
		this.formaPagamento = formaPagamento;
	}

	public String getPlano() {
		return this.plano;
	}

	public void setPlano(String plano) {
		this.plano = plano;
	}

	public String getPendencia() {
		return this.pendencia;
	}

	public void setPendencia(String pendencia) {
		this.pendencia = pendencia;
	}

	public String getSituacao() {
		return this.situacao;
	}

	public void setSituacao(String situacao) {
		this.situacao = situacao;
	}

	public Date getDataInativacao() {
		return this.dataInativacao;
	}

	public void setDataInativacao(Date dataInativacao) {
		this.dataInativacao = dataInativacao;
	}

	public Double getRendaMensal() {
		return this.rendaMensal;
	}

	public void setRendaMensal(Double rendaMensal) {
		this.rendaMensal = rendaMensal;
	}

	public Double getRendaDiaria() {
		return this.rendaDiaria;
	}

	public void setRendaDiaria(Double rendaDiaria) {
		this.rendaDiaria = rendaDiaria;
	}

	public String getCertificado() {
		return this.certificado;
	}

	public void setCertificado(String certificado) {
		this.certificado = certificado;
	}

	public List<BeneficiarioEmpresarial> getBeneficiarioEmpresarialCollection() {
		return this.beneficiarioEmpresarialCollection;
	}

	public void setBeneficiarioEmpresarialCollection(List<BeneficiarioEmpresarial> beneficiarioEmpresarialCollection) {
		this.beneficiarioEmpresarialCollection = beneficiarioEmpresarialCollection;
	}

	public List<SeguradoCoberturas> getSeguradoCoberturasCollection() {
		return this.seguradoCoberturasCollection;
	}

	public void setSeguradoCoberturasCollection(List<SeguradoCoberturas> seguradoCoberturasCollection) {
		this.seguradoCoberturasCollection = seguradoCoberturasCollection;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setLinhaVazia(Boolean linhaVazia) {
		this.linhaVazia = linhaVazia;
	}

	public Boolean getLinhaVazia() {
		return linhaVazia;
	}

	public void setCpf(CpfCnpj cpf) {
		this.cpf = cpf;
	}

	public CpfCnpj getCpf() {
		return cpf;
	}

	public String getTelefonePreferencial() {
		return telefonePreferencial;
	}

	public void setTelefonePreferencial(String telefonePreferencial) {
		this.telefonePreferencial = telefonePreferencial;
	}

	public String getNroApoliceAnterior() {
		return nroApoliceAnterior;
	}

	public void setNroApoliceAnterior(String nroApoliceAnterior) {
		this.nroApoliceAnterior = nroApoliceAnterior;
	}

	public Double getPremioTitular() {
		return premioTitular;
	}

	public void setPremioTitular(Double premioTitular) {
		this.premioTitular = premioTitular;
	}

	public Double getPremioConjuge() {
		return premioConjuge;
	}

	public void setPremioConjuge(Double premioConjuge) {
		this.premioConjuge = premioConjuge;
	}

}
