package iseg.app.model;

import static javax.persistence.FetchType.LAZY;
import static javax.persistence.InheritanceType.JOINED;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name="PESSOA_JURIDICA")
@NamedQueries({ 
	@NamedQuery(name = "getPessoaJuridica",query="SELECT pj FROM PessoaJuridica pj ORDER BY pj.nome"),
	@NamedQuery(name = "getPessoaJuridicaById",query="SELECT pj FROM PessoaJuridica pj WHERE pj.id = ?0"),
	@NamedQuery(name = "getPessoaJuridicaByCnpj", query="SELECT pj FROM PessoaJuridica pj WHERE pj.cpfOuCnpj = ?0 and pj.id not in (select id from Seguradora s where s.id=pj.id)"),
	@NamedQuery(name = "getCountPessoaJuridica",query="SELECT Count(*) FROM PessoaJuridica pj ORDER BY pj.nome")})
@Inheritance(strategy=JOINED)
public class PessoaJuridica extends Pessoa implements Serializable {

	@Column(name="RAZAO_SOCIAL",length=60)
	private String razaoSocial;

	@Column(name="INSCR_ESTADUAL",length=14)
	private String inscrEstadual;

	@Column(name="DATA_FUNDACAO")
	@Temporal(TemporalType.DATE)
	private Date dataFundacao;

	@Column(name="VALOR_PATRIMONIO")
	private Double valorPatrimonio;

	@Column(name="PESSOA_CONTATO",length=60)
	private String pessoaContato;

	@Column(name="INSCRICAO_MUNICIPAL",length=15)
	private String inscricaoMunicipal;

	@Column(name="SITE_HOME_PAGE",length=100)
	private String siteHomePage;

	@ManyToOne(fetch=LAZY)
	@JoinColumn(name="atividade_comercial_id", referencedColumnName = "id")
	private DominioEsp atividadeComercial;

	private static final long serialVersionUID = 1L;

	public PessoaJuridica() {
		super();
	}

	public String getRazaoSocial() {
		return razaoSocial;
	}

	public void setRazaoSocial(String razaoSocial) {
		this.razaoSocial = razaoSocial;
	}

	public String getInscrEstadual() {
		return this.inscrEstadual;
	}

	public void setInscrEstadual(String inscrEstadual) {
		this.inscrEstadual = inscrEstadual;
	}

	public Date getDataFundacao() {
		return this.dataFundacao;
	}

	public void setDataFundacao(Date dataFundacao) {
		this.dataFundacao = dataFundacao;
	}

	public Double getValorPatrimonio() {
		return this.valorPatrimonio;
	}

	public void setValorPatrimonio(Double valorPatrimonio) {
		this.valorPatrimonio = valorPatrimonio;
	}

	public String getPessoaContato() {
		return this.pessoaContato;
	}

	public void setPessoaContato(String pessoaContato) {
		this.pessoaContato = pessoaContato;
	}

	public String getInscricaoMunicipal() {
		return this.inscricaoMunicipal;
	}

	public void setInscricaoMunicipal(String inscricaoMunicipal) {
		this.inscricaoMunicipal = inscricaoMunicipal;
	}

	public String getSiteHomePage() {
		return this.siteHomePage;
	}

	public void setSiteHomePage(String siteHomePage) {
		this.siteHomePage = siteHomePage;
	}

	public DominioEsp getAtividadeComercial() {
		return this.atividadeComercial;
	}

	public void setAtividadeComercial(DominioEsp atividadeComercial) {
		this.atividadeComercial = atividadeComercial;
	}
}
