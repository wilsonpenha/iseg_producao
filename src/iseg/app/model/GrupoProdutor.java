package iseg.app.model;

import static javax.persistence.FetchType.LAZY;
import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.persistence.PObject;

import java.io.Serializable;

import javax.persistence.CascadeType;
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


@Entity
@Table(name="GRUPO_PRODUTOR")
@NamedQueries({
	@NamedQuery(name="getCountGrupoProdutor", query="SELECT Count(*) FROM GrupoProdutor b"),
	@NamedQuery(name="getGrupoProdutorByGrupoDeVenda", query="SELECT b FROM GrupoProdutor b where b.grupoDeVenda.id = ?0"),
	@NamedQuery(name="getGrupoProdutor", query="SELECT b FROM GrupoProdutor b")
	})
public class GrupoProdutor  extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="GPR_SEQ",sequenceName="APP_SEQ")
	private Long id;

	private Double comissao;

	private String atribuicao;

	@Column(name="TIPO_COMISSAO")
	private Long tipoComissao;

	@ManyToOne(fetch=LAZY, cascade={CascadeType.REFRESH})
	@JoinColumn(name="pessoa_id")
	private Produtor produtor;

	@Column(name="PARTICIPACAO_REQUERIDA")
	private String participacaoRequerida;

	@ManyToOne(fetch=LAZY, cascade={CascadeType.REFRESH})
	@JoinColumn(name="GRUPO_DE_VENDA_ID")
	private GrupoDeVenda grupoDeVenda;

	@Column(name="VALOR_COMISSAO_FIXA")
	private Double valorComissaoFixa;

	private static final long serialVersionUID = 1L;

	public GrupoProdutor() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Double getComissao() {
		return this.comissao;
	}

	public void setComissao(Double comissao) {
		this.comissao = comissao;
	}

	public String getAtribuicao() {
		return this.atribuicao;
	}

	public void setAtribuicao(String atribuicao) {
		this.atribuicao = atribuicao;
	}

	public Produtor getProdutor() {
		return this.produtor;
	}

	public void setProdutor(Produtor produtor) {
		this.produtor = produtor;
	}

	public String getParticipacaoRequerida() {
		return this.participacaoRequerida;
	}

	public void setParticipacaoRequerida(String participacaoRequerida) {
		this.participacaoRequerida = participacaoRequerida;
	}

	public GrupoDeVenda getGrupoDeVenda() {
		return this.grupoDeVenda;
	}

	public void setGrupoDeVenda(GrupoDeVenda grupoDeVenda) {
		this.grupoDeVenda = grupoDeVenda;
	}

	public Double getValorComissaoFixa() {
		return valorComissaoFixa;
	}

	public void setValorComissaoFixa(Double valorComissaoFixa) {
		this.valorComissaoFixa = valorComissaoFixa;
	}

	public Long getTipoComissao() {
		return tipoComissao;
	}

	public void setTipoComissao(Long tipoComissao) {
		this.tipoComissao = tipoComissao;
	}
}