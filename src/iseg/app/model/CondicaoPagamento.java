package iseg.app.model;

import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.persistence.PObject;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;


@Entity
@NamedQueries({
	@NamedQuery(name="getCountCondicaoPagamento", query="SELECT Count(*) FROM CondicaoPagamento cp"),
	@NamedQuery(name="getCondicaoPagamento", query = "SELECT cp FROM CondicaoPagamento cp"),
	@NamedQuery(name="getCondicaoPagamentoOrdered", query = "SELECT cp FROM CondicaoPagamento cp ORDER BY cp.id"),
	@NamedQuery(name="getCondicaoPagamentoBySeguradora", query = "SELECT cp FROM CondicaoPagamento cp WHERE cp.seguradora.id = ?0")})
@Table(name="CONDICAO_PAGAMENTO")	
public class CondicaoPagamento extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="CPG_SEQ", sequenceName = "APP_SEQ")
	private Long id;

	@Column(name="QTDE_DE_PARCELAS")
	private Integer qtdeDeParcelas;

	private String descricao;

	@Column(name="PAGAMENTO_COMISSAO")
	private String pagamentoComissao;

	@Column(name="DIA_PREFERENCIAL")
	private Integer diaPreferencial;

	@Column(name="PERC_ACRESCIMO_DESCONTO")
	private Double percAcrescimoDesconto;

	@ManyToOne
	private Seguradora seguradora;

	@Column(name="ACRESCIMO_DESCONTO")
	private String acrescimoDesconto;
			
	@Column(name="TIPO_PAGAMENTO")
	private Integer tipoPagamento;

	private static final long serialVersionUID = 1L;

	public CondicaoPagamento() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getQtdeDeParcelas() {
		return this.qtdeDeParcelas;
	}

	public void setQtdeDeParcelas(Integer qtdeDeParcelas) {
		this.qtdeDeParcelas = qtdeDeParcelas;
	}

	public String getDescricao() {
		return this.descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getPagamentoComissao() {
		return this.pagamentoComissao;
	}

	public void setPagamentoComissao(String pagamentoComissao) {
		this.pagamentoComissao = pagamentoComissao;
	}

	public Integer getDiaPreferencial() {
		return this.diaPreferencial;
	}

	public void setDiaPreferencial(Integer diaPreferencial) {
		this.diaPreferencial = diaPreferencial;
	}

	public Double getPercAcrescimoDesconto() {
		return this.percAcrescimoDesconto;
	}

	public void setPercAcrescimoDesconto(Double percAcrescimoDesconto) {
		this.percAcrescimoDesconto = percAcrescimoDesconto;
	}

	public Seguradora getSeguradora() {
		return this.seguradora;
	}

	public void setSeguradora(Seguradora seguradora) {
		this.seguradora = seguradora;
	}

	public String getAcrescimoDesconto() {
		return this.acrescimoDesconto;
	}

	public void setAcrescimoDesconto(String acrescimoDesconto) {
		this.acrescimoDesconto = acrescimoDesconto;
	}

	public Integer getTipoPagamento() {
		return tipoPagamento;
	}

	public void setTipoPagamento(Integer tipoPagamento) {
		this.tipoPagamento = tipoPagamento;
	}
}