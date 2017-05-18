package iseg.app.model;

import static javax.persistence.FetchType.LAZY;
import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;

import org.hibernate.annotations.Filter;
import org.hibernate.annotations.FilterDef;
import org.hibernate.annotations.ParamDef;


@Entity
@FilterDef(name="corretoraFilter", parameters={@ParamDef(name="corretoraParam", type="long"),@ParamDef(name="assessoriaIdParam", type="long"),@ParamDef(name="isAssessoriaParam", type="boolean")})    
@Filter(name="corretoraFilter", condition="((:isAssessoriaParam = 'true' and corretora_id in (select c.id from corretora c where c.assessoria_id = :assessoriaIdParam and c.is_assessorada = 'true')) or corretora_id = :corretoraParam  or is_generic='true')")    
@NamedQueries({ 
	@NamedQuery(name="getCountProdutor", query="SELECT Count(*) FROM Produtor p"),
	@NamedQuery(name="getProdutorByGrupoVenda", query="SELECT pr FROM Produtor pr, Pessoa pe, GrupoProdutor gp WHERE pr.id = pe.id AND pe.id = gp.produtor.id AND gp.grupoDeVenda.id = ?0 ORDER BY pe.nome"),
	@NamedQuery(name="getProdutor", query="SELECT p FROM Produtor p ORDER BY p.pessoa.nome"),
	@NamedQuery(name="getProdutorByNroCelular", query="SELECT p FROM Produtor p where p.pessoa.telefoneCelular = ?0"),
	@NamedQuery(name="getProdutorByCpfOuCnpj", query="SELECT p FROM Produtor p where p.pessoa.cpfOuCnpj = ?0"),
	@NamedQuery(name="getProdutorByCorretora", query="SELECT p FROM Produtor p where p.corretora.id = ?0"),
	@NamedQuery(name="getProdutorOrdered", query = "SELECT p FROM Produtor p ORDER BY p.pessoa.nome")})
@org.hibernate.annotations.GenericGenerator(name="pessoa-primarykey", strategy="foreign",
	parameters={@org.hibernate.annotations.Parameter(name="property", value="pessoa")
})
public class Produtor extends PObject implements Serializable, AtributoCorretora {

	@Id
	@GeneratedValue(generator = "pessoa-primarykey")
	private Long id;

	private Double desconto;

	@Column(length=20)
	private String matricula;

	@Column(length=8)
	private String situacao;

	@Column(length=15)
	private String apelido;

	private Double comissao;

	@OneToOne(fetch = FetchType.LAZY)
	@PrimaryKeyJoinColumn(name="id", referencedColumnName="id")
	private Pessoa pessoa;
	
	@ManyToOne(fetch=LAZY)
	@JoinColumn(name="corretora_id",referencedColumnName="id")
	private Corretora corretora;

	@Column(name="IS_GENERIC", columnDefinition="default false")
	private Boolean isGeneric;

	@OneToMany(mappedBy="produtor", fetch = LAZY)
	private List<MovimentoProdutor> movimentoProdutorCollection;

	@OneToMany(mappedBy="produtorGerente", fetch = LAZY)
	private List<GrupoDeVenda> grupoDeVendaCollection;

	private static final long serialVersionUID = 1L;

	public Produtor() {
		super();
	}

	public String getNome(){
		return this.pessoa.getNome();
	}
	
	public Double getDesconto() {
		return this.desconto;
	}

	public void setDesconto(Double desconto) {
		this.desconto = desconto;
	}

	public String getMatricula() {
		return this.matricula;
	}

	public void setMatricula(String matricula) {
		this.matricula = matricula;
	}

	public String getSituacao() {
		return this.situacao;
	}

	public void setSituacao(String situacao) {
		this.situacao = situacao;
	}

	public String getApelido() {
		return this.apelido;
	}

	public void setApelido(String apelido) {
		this.apelido = apelido;
	}

	public Double getComissao() {
		return this.comissao;
	}

	public void setComissao(Double comissao) {
		this.comissao = comissao;
	}

	public Corretora getCorretora() {
		return this.corretora;
	}

	public void setCorretora(Corretora corretora) {
		this.corretora = corretora;
	}

	public List<MovimentoProdutor> getMovimentoProdutorCollection() {
		return this.movimentoProdutorCollection;
	}

	public void setMovimentoProdutorCollection(List<MovimentoProdutor> movimentoProdutorCollection) {
		this.movimentoProdutorCollection = movimentoProdutorCollection;
	}

	public List<GrupoDeVenda> getGrupoDeVendaCollection() {
		return grupoDeVendaCollection;
	}

	public void setGrupoDeVendaCollection(List<GrupoDeVenda> grupoDeVendaCollection) {
		this.grupoDeVendaCollection = grupoDeVendaCollection;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Pessoa getPessoa() {
		return pessoa;
	}

	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
//		this.id = pessoa.getId();
	}

	public Boolean getIsGeneric() {
		return isGeneric;
	}

	public void setIsGeneric(Boolean isGeneric) {
		this.isGeneric = isGeneric;
	}

}