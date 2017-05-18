package iseg.app.model;

import static javax.persistence.FetchType.LAZY;
import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

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


@Entity
@NamedQueries({
	@NamedQuery(name="getComissionadoAgenciamentoByAgenciamentoId", query = "SELECT cp FROM ComissionadoAgenciamento cp WHERE cp.agenciamento.id = ?0 and cp.situacao < 3 ORDER BY cp.pessoa.nome"),
	@NamedQuery(name="getComissionadosAgenciamentoAtivosByPropostaId", query = "SELECT cp FROM ComissionadoAgenciamento cp WHERE cp.proposta.id = ?0 and cp.situacao < 3"),
	@NamedQuery(name="deleteComissionadoAgenciamentoByPessoaId", query = "DELETE FROM ComissionadoAgenciamento cp WHERE cp.pessoa.id = ?0 AND cp.proposta.id = ?1"),
	@NamedQuery(name="deleteComissionadoAgenciamentoByPropostaId", query = "DELETE FROM ComissionadoAgenciamento cp WHERE cp.proposta.id = ?0"),
	@NamedQuery(name="updatePercentualComissionadoAgenciamentoByPropostaId", query = "UPDATE ComissionadoAgenciamento SET percentualComissao = ?0 WHERE pessoa.id = ?1 AND proposta.id = ?2")
	})
@Table(name="COMISSIONADO_AGENCIAMENTO")
public class ComissionadoAgenciamento extends PObject implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="CAGE_SEQ",sequenceName="APP_SEQ")
	private Long id;

	@Column(name="COMISSAO")
	private Double comissao;

	@Column(name="TIPO_COMISSAO")
	private Long tipoComissao;

	@ManyToOne
	private Proposta proposta;

	@ManyToOne
	private Agenciamento agenciamento;

	@ManyToOne
	private Pessoa pessoa;

	//Atributos auxiliares
	@Column(name="VALOR_COMISSAO")
	private Double valorComissao;
	
	@Column(name="VALOR_PAGO")
	private Double valorPago;

	private Integer situacao;

	@ManyToOne
	@JoinColumn(name="PARCELAS_PROPOSTA_ID")
	private ParcelasProposta parcelasProposta;
	
	@OneToMany(mappedBy="agenciado", fetch = LAZY)
	private List<RepasseComissao> comissionadoCollection = new ArrayList<RepasseComissao>();

	public ComissionadoAgenciamento() {
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
		this.comissao = comissao==null ? 0.0 : comissao;
	}

	public Long getTipoComissao() {
		return tipoComissao;
	}

	public void setTipoComissao(Long tipoComissao) {
		this.tipoComissao = tipoComissao;
	}

	public Pessoa getPessoa() {
		return this.pessoa;
	}

	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
	}

	public Double getValorComissao() {
		return valorComissao == null ? 0.0 : valorComissao;
	}

	public void setValorComissao(Double valorComissao) {
		this.valorComissao = valorComissao == null ? 0.0 : valorComissao;
	}

	public Double getValorPago() {
		return valorPago;
	}

	public void setValorPago(Double valorPago) {
		this.valorPago = valorPago == null ? 0.0 : valorPago;
	}

	public Integer getSituacao() {
		return situacao == null ? 0 : situacao;
	}

	public void setSituacao(Integer situacao) {
		this.situacao = situacao == null ? 0 : situacao;
	}

	public ParcelasProposta getParcelasProposta() {
		return parcelasProposta;
	}

	public void setParcelasProposta(ParcelasProposta parcelasProposta) {
		this.parcelasProposta = parcelasProposta;
	}
	
	public List<RepasseComissao> getComissionadoCollection() {
		return comissionadoCollection;
	}

	public void setComissionadoCollection(
			List<RepasseComissao> comissionadoCollection) {
		this.comissionadoCollection = comissionadoCollection;
	}

	public Proposta getProposta() {
		return proposta;
	}

	public void setProposta(Proposta proposta) {
		this.proposta = proposta;
	}

	public Agenciamento getAgenciamento() {
		return agenciamento;
	}

	public void setAgenciamento(Agenciamento agenciamento) {
		this.agenciamento = agenciamento;
	}
}