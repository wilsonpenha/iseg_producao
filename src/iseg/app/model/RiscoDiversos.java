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
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Cascade;


@Entity
@Table(name="RISCO_DIVERSOS")
@NamedQueries({
	@NamedQuery(name="getCountRiscoDiversos", query="SELECT Count(*) FROM RiscoDiversos i where i.proposta.id = ?0")
})
public class RiscoDiversos extends PObject implements Serializable {

	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="RDI_SEQ", sequenceName = "APP_SEQ")
	private Long id;

	private String cep;

	private String logradouro;

	private String numero;

	private String complemento;

	private String bairro;

	private String cidade;

	private String uf;

	private String telefone;
	
	@Column(name="DESCRICAO_RISCO")
	private String descricaoRisco;

	@ManyToOne
	private Proposta proposta;
	
	@ManyToOne
	private Seguradora seguradora;

	@Column(name="NRO_APOLICE_ANTERIOR")
	private String nroApoliceAnterior;

	@Column(name="CODIGO_IDENTIFICACAO")
	private String codigoIdentificacao;

	@Column(name="INI_VIG_APOLICE_ANTERIOR")
	@Temporal(TemporalType.DATE)
	private Date iniVigApoliceAnterior;

	@Column(name="FIM_VIG_APOLICE_ANTERIOR")
	@Temporal(TemporalType.DATE)
	private Date fimVigApoliceAnterior;

	@Column(name="CLASSE_BONUS")
	private String classeBonus;

	private String renovacao;

	@Column(name="LINHA_VAZIA")
	private Boolean linhaVazia;
	
	@OneToMany(cascade={CascadeType.ALL}, mappedBy="riscoDiversos", fetch=LAZY)
	@Cascade(org.hibernate.annotations.CascadeType.DELETE_ORPHAN)
	@OrderBy("sequencia asc")
	private List<RiscoCoberturas> riscoCoberturasCollection = new ArrayList<RiscoCoberturas>();
	
	private static final long serialVersionUID = 1L;

	public RiscoDiversos() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCep() {
		return this.cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getLogradouro() {
		return this.logradouro;
	}

	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}

	public String getNumero() {
		return this.numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public String getComplemento() {
		return this.complemento;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}

	public String getBairro() {
		return this.bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getCidade() {
		return this.cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getUf() {
		return this.uf;
	}

	public void setUf(String uf) {
		this.uf = uf;
	}

	public String getTelefone() {
		return this.telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public Proposta getProposta() {
		return proposta;
	}

	public void setProposta(Proposta proposta) {
		this.proposta = proposta;
	}

	public Seguradora getSeguradora() {
		return seguradora;
	}

	public void setSeguradora(Seguradora seguradora) {
		this.seguradora = seguradora;
	}

	public String getNroApoliceAnterior() {
		return this.nroApoliceAnterior;
	}

	public void setNroApoliceAnterior(String nroApoliceAnterior) {
		this.nroApoliceAnterior = nroApoliceAnterior;
	}

	public String getCodigoIdentificacao() {
		return this.codigoIdentificacao;
	}

	public void setCodigoIdentificacao(String codigoIdentificacao) {
		this.codigoIdentificacao = codigoIdentificacao;
	}

	public Date getIniVigApoliceAnterior() {
		return this.iniVigApoliceAnterior;
	}

	public void setIniVigApoliceAnterior(Date iniVigApoliceAnterior) {
		this.iniVigApoliceAnterior = iniVigApoliceAnterior;
	}

	public Date getFimVigApoliceAnterior() {
		return this.fimVigApoliceAnterior;
	}

	public void setFimVigApoliceAnterior(Date fimVigApoliceAnterior) {
		this.fimVigApoliceAnterior = fimVigApoliceAnterior;
	}

	public String getClasseBonus() {
		return this.classeBonus;
	}

	public void setClasseBonus(String classeBonus) {
		this.classeBonus = classeBonus;
	}

	public String getRenovacao() {
		return this.renovacao;
	}

	public void setRenovacao(String renovacao) {
		this.renovacao = renovacao;
	}

	public List<RiscoCoberturas> getRiscoCoberturasCollection() {
		return riscoCoberturasCollection;
	}

	public void setRiscoCoberturasCollection(List<RiscoCoberturas> riscoCoberturasCollection) {
		this.riscoCoberturasCollection = riscoCoberturasCollection;
	}

	public void setDescricaoRisco(String descricaoRisco) {
		this.descricaoRisco = descricaoRisco;
	}

	public String getDescricaoRisco() {
		return descricaoRisco;
	}

	public String getDescricaoRiscoCurto() {
		if (descricaoRisco!=null)
			return descricaoRisco.substring(0,60);
		else
			return descricaoRisco;
	}

	public Boolean getLinhaVazia() {
		return linhaVazia;
	}

	public void setLinhaVazia(Boolean linhaVazia) {
		this.linhaVazia = linhaVazia;
	}
}