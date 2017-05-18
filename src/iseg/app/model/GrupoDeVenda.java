package iseg.app.model;

import static javax.persistence.FetchType.LAZY;
import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.Filter;
import org.hibernate.annotations.FilterDef;
import org.hibernate.annotations.ParamDef;


@Entity
@FilterDef(name="corretoraFilter", parameters={@ParamDef(name="corretoraParam", type="long"),@ParamDef(name="assessoriaIdParam", type="long"),@ParamDef(name="isAssessoriaParam", type="boolean")})    
@Filter(name="corretoraFilter", condition="(corretora_id = :corretoraParam or is_generic='true')")    
@NamedQueries({
	@NamedQuery(name="getCountGrupoDeVenda", query="SELECT Count(*) FROM GrupoDeVenda g"),
	@NamedQuery(name="getGrupoDeVenda", query = "SELECT g FROM GrupoDeVenda g ORDER BY g.nomeDoGrupo")})
@Table(name="GRUPO_DE_VENDA")
public class GrupoDeVenda extends PObject implements Serializable, AtributoCorretora {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="GDV_SEQ",sequenceName="APP_SEQ")
	private Long id;

	@ManyToOne(fetch=LAZY)
	@JoinColumn(name="PRODUTOR_GERENTE_ID")
	private Produtor produtorGerente;

	@Column(name="NOME_DO_GRUPO")
	private String nomeDoGrupo;

	@Column(name="QUEBRA_EXCLUSIVIDADE")
	private String quebraExclusividade;

	@OneToMany(mappedBy="grupoDeVenda", fetch = LAZY)
	private List<Pessoa> pessoaCollection = new ArrayList<Pessoa>();

	@OneToMany(mappedBy="grupoDeVenda", fetch = LAZY)
	private List<Proposta> propostaCollection = new ArrayList<Proposta>();

	@OneToMany(mappedBy="grupoDeVenda", fetch = LAZY)
	private List<OperadoresPosVenda> operadoresPosVendaCollection = new ArrayList<OperadoresPosVenda>();

	@OneToMany(cascade=CascadeType.REMOVE, mappedBy="grupoDeVenda", fetch = LAZY)
	private List<ObservadoresPosVenda> observadoresPosVendaCollection = new ArrayList<ObservadoresPosVenda>();

	@OneToMany(cascade=CascadeType.REMOVE, mappedBy="grupoDeVenda", fetch = LAZY)
	private List<GrupoProdutor> grupoProdutorCollection = new ArrayList<GrupoProdutor>();

	private Double desconto;

	@Column(name="IS_GENERIC", columnDefinition="default false")
	private Boolean isGeneric;

	@ManyToOne(fetch=LAZY)
	private Corretora corretora;

	public GrupoDeVenda() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Produtor getProdutorGerente() {
		return this.produtorGerente;
	}

	public void setProdutorGerente(Produtor produtorGerente) {
		this.produtorGerente = produtorGerente;
	}

	public String getNomeDoGrupo() {
		return this.nomeDoGrupo;
	}

	public void setNomeDoGrupo(String nomeDoGrupo) {
		this.nomeDoGrupo = nomeDoGrupo;
	}

	public String getQuebraExclusividade() {
		return this.quebraExclusividade;
	}

	public void setQuebraExclusividade(String quebraExclusividade) {
		this.quebraExclusividade = quebraExclusividade;
	}

	public List<Pessoa> getClienteGrupoDeVendaCollection() {
		return this.pessoaCollection;
	}

	public void setClienteGrupoDeVendaCollection(List<Pessoa> pessoaCollection) {
		this.pessoaCollection = pessoaCollection;
	}

	public List<GrupoProdutor> getGrupoProdutorCollection() {
		return this.grupoProdutorCollection;
	}

	public void setGrupoProdutorCollection(List<GrupoProdutor> grupoProdutorCollection) {
		this.grupoProdutorCollection = grupoProdutorCollection;
	}

	public Double getDesconto() {
		return desconto;
	}

	public void setDesconto(Double desconto) {
		this.desconto = desconto;
	}

	public List<Proposta> getPropostaCollection() {
		return propostaCollection;
	}

	public void setPropostaCollection(List<Proposta> propostaCollection) {
		this.propostaCollection = propostaCollection;
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

	public List<OperadoresPosVenda> getOperadoresPosVendaCollection() {
		return operadoresPosVendaCollection;
	}

	public void setOperadoresPosVendaCollection(
			List<OperadoresPosVenda> operadoresPosVendaCollection) {
		this.operadoresPosVendaCollection = operadoresPosVendaCollection;
	}

	public List<ObservadoresPosVenda> getObservadoresPosVendaCollection() {
		return observadoresPosVendaCollection;
	}

	public void setObservadoresPosVendaCollection(
			List<ObservadoresPosVenda> observadoresPosVendaCollection) {
		this.observadoresPosVendaCollection = observadoresPosVendaCollection;
	}
}