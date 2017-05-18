package iseg.app.model;

import static javax.persistence.CascadeType.REFRESH;
import static javax.persistence.FetchType.LAZY;
import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;


@Entity
@Table(name="DOMINIO_ESP")
@NamedQueries({
	@NamedQuery(name="getDominioEsp", query="SELECT d FROM DominioEsp d ORDER BY d.valor"),
	@NamedQuery(name="getCountDominioEsp", query="SELECT Count(*) FROM DominioEsp d ")})
public class DominioEsp extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="DDE_SEQ", sequenceName = "APP_SEQ")
	private Long id;

	@Column(length=60)
	private String valor;

	@Column(name="COD_BRADESCO", length=60)
	private String codBradesco;
	
	@Column(name="COD_MARITIMA", length=60)
	private String codMaritima;

	private Long excluido;

	@Column(name="DATA_EXCLUSAO")
	@Temporal(TemporalType.DATE)
	private Date dataExclusao;

	@Column(name="IS_VEICULAR")
	private Long isVeicular;

	@ManyToOne(cascade=REFRESH, fetch = LAZY)
	@JoinColumn(name="DOMINIO_ESP_PAI_ID",nullable=true)
	private DominioEsp dominioEspPai;

	@ManyToOne(fetch=LAZY)
	private Dominio dominio;

	private static final long serialVersionUID = 1L;

	@Transient
	private List<Dossie> dossieCollection;

	@Transient
	private List<Endereco> enderecoCollection;

	@Transient
	private List<PessoaJuridica> pessoaJuridicaCollection;

	@Transient
	private List<DominioEsp> dominioEspCollection;

	@Transient
	private List<Proposta> propostaCollection;

	@Transient
	private List<Automovel> automovelCollection;

	@Transient
	private List<Automovel> automovelCollection2;

	@Transient
	private List<Automovel> automovelCollection3;

	@Transient
	private List<Automovel> automovelCollection4;

	@Transient
	private List<Usuario> usuarioCollection;

	@Transient
	private List<PessoaAtuacao> pessoaatuacaoList;

	public DominioEsp() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getValor() {
		return this.valor;
	}

	public void setValor(String valor) {
		this.valor = valor;
	}

	public Long getExcluido() {
		return this.excluido;
	}

	public void setExcluido(Long excluido) {
		this.excluido = excluido;
	}

	public Date getDataExclusao() {
		return this.dataExclusao;
	}

	public void setDataExclusao(Date dataExclusao) {
		this.dataExclusao = dataExclusao;
	}

	public Long getIsVeicular() {
		return this.isVeicular;
	}

	public void setIsVeicular(Long isVeicular) {
		this.isVeicular = isVeicular;
	}

	public DominioEsp getDominioEspPai() {
		return this.dominioEspPai;
	}

	public void setDominioEspPai(DominioEsp dominioEspPai) {
		this.dominioEspPai = dominioEspPai;
	}

	public Dominio getDominio() {
		return this.dominio;
	}

	public void setDominio(Dominio dominio) {
		this.dominio = dominio;
	}

	/** 
	 */
	public List<Dossie> getDossieCollection() {
		return this.dossieCollection;
	}

	/** 
	 */
	public void setDossieCollection(List<Dossie> dossieCollection) {
		this.dossieCollection = dossieCollection;
	}

	/** 
	 */
	public List<Endereco> getEnderecoCollection() {
		return this.enderecoCollection;
	}

	/** 
	 */
	public void setEnderecoCollection(List<Endereco> enderecoCollection) {
		this.enderecoCollection = enderecoCollection;
	}

	/** 
	 */
	public List<PessoaJuridica> getPessoaJuridicaCollection() {
		return this.pessoaJuridicaCollection;
	}

	/** 
	 */
	public void setPessoaJuridicaCollection(
			List<PessoaJuridica> pessoaJuridicaCollection) {
		this.pessoaJuridicaCollection = pessoaJuridicaCollection;
	}

	/** 
	 */
	public List<DominioEsp> getDominioEspCollection() {
		return this.dominioEspCollection;
	}

	/** 
	 */
	public void setDominioEspCollection(List<DominioEsp> dominioEspCollection) {
		this.dominioEspCollection = dominioEspCollection;
	}

	/** 
	 */
	public List<Proposta> getPropostaCollection() {
		return this.propostaCollection;
	}

	/** 
	 */
	public void setPropostaCollection(List<Proposta> propostaCollection) {
		this.propostaCollection = propostaCollection;
	}

	/** 
	 */
	public List<Automovel> getAutomovelCollection() {
		return this.automovelCollection;
	}

	/** 
	 */
	public void setAutomovelCollection(List<Automovel> automovelCollection) {
		this.automovelCollection = automovelCollection;
	}

	/** 
	 */
	public List<Automovel> getAutomovelCollection2() {
		return this.automovelCollection2;
	}

	/** 
	 */
	public void setAutomovelCollection2(List<Automovel> automovelCollection2) {
		this.automovelCollection2 = automovelCollection2;
	}

	/** 
	 */
	public List<Automovel> getAutomovelCollection3() {
		return this.automovelCollection3;
	}

	/** 
	 */
	public void setAutomovelCollection3(List<Automovel> automovelCollection3) {
		this.automovelCollection3 = automovelCollection3;
	}

	/** 
	 */
	public List<Automovel> getAutomovelCollection4() {
		return this.automovelCollection4;
	}

	/** 
	 */
	public void setAutomovelCollection4(List<Automovel> automovelCollection4) {
		this.automovelCollection4 = automovelCollection4;
	}

	/** 
	 */
	public List<Usuario> getUsuarioCollection() {
		return this.usuarioCollection;
	}

	/** 
	 */
	public void setUsuarioCollection(List<Usuario> usuarioCollection) {
		this.usuarioCollection = usuarioCollection;
	}

	public List<PessoaAtuacao> getPessoaatuacaoList() {
		return this.pessoaatuacaoList;
	}

	public void setPessoaatuacaoList(List<PessoaAtuacao> pessoaatuacaoList) {
		this.pessoaatuacaoList = pessoaatuacaoList;
	}

	public String getCodBradesco() {
		return codBradesco;
	}

	public void setCodBradesco(String codBradesco) {
		this.codBradesco = codBradesco;
	}

	public String getCodMaritima() {
		return codMaritima;
	}

	public void setCodMaritima(String codMaritima) {
		this.codMaritima = codMaritima;
	}
}