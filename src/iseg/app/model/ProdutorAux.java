package iseg.app.model;

import static javax.persistence.FetchType.LAZY;

import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name="PRODUTOR")
public class ProdutorAux extends PObject implements Serializable {

	@Id
	private Long id;

	private Double desconto;

	@Column(length=20)
	private String matricula;

	@Column(length=8)
	private String situacao;

	@Column(length=15)
	private String apelido;

	private Double comissao;

	@ManyToOne(fetch=LAZY)
	@JoinColumn(name="CORRETORA_ID")
	private Corretora corretora;

	@OneToMany(mappedBy="produtor", fetch = LAZY)
	private List<MovimentoProdutor> movimentoProdutorCollection;

	@OneToMany(mappedBy="produtorGerente", fetch = LAZY)
	private List<GrupoDeVenda> grupoDeVendaCollection;

	private static final long serialVersionUID = 1L;

	public ProdutorAux() {
		super();
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

}