package iseg.app.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Pagamentos implements Serializable {
	@Id
	private Long id;

	private BigDecimal numero;

	@Column(name="data_pagamento")
	private Timestamp dataPagamento;

	private Integer situacao;

	@Column(name="base_encargos")
	private BigDecimal baseEncargos;

	@Column(name="valor_encargos")
	private BigDecimal valorEncargos;

	@Column(name="valor_pagamento")
	private BigDecimal valorPagamento;

	@Column(name="percentual_encargos")
	private BigDecimal percentualEncargos;

	@Column(name="usuario_criacao_id")
	private Long usuarioCriacaoId;

	@Column(name="data_criacao")
	private Timestamp dataCriacao;

	@Column(name="usuario_estorno_id")
	private Long usuarioEstornoId;

	@Column(name="data_estorno")
	private Timestamp dataEstorno;

	@Column(name="corretora_id")
	private Long corretoraId;

	@OneToMany(mappedBy="pagamento")
	private Set<PagamentosRepasse> pagamentosRepasseCollection;

	private static final long serialVersionUID = 1L;

	public Pagamentos() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public BigDecimal getNumero() {
		return this.numero;
	}

	public void setNumero(BigDecimal numero) {
		this.numero = numero;
	}

	public Timestamp getDataPagamento() {
		return this.dataPagamento;
	}

	public void setDataPagamento(Timestamp dataPagamento) {
		this.dataPagamento = dataPagamento;
	}

	public Integer getSituacao() {
		return this.situacao;
	}

	public void setSituacao(Integer situacao) {
		this.situacao = situacao;
	}

	public BigDecimal getBaseEncargos() {
		return this.baseEncargos;
	}

	public void setBaseEncargos(BigDecimal baseEncargos) {
		this.baseEncargos = baseEncargos;
	}

	public BigDecimal getValorEncargos() {
		return this.valorEncargos;
	}

	public void setValorEncargos(BigDecimal valorEncargos) {
		this.valorEncargos = valorEncargos;
	}

	public BigDecimal getValorPagamento() {
		return this.valorPagamento;
	}

	public void setValorPagamento(BigDecimal valorPagamento) {
		this.valorPagamento = valorPagamento;
	}

	public BigDecimal getPercentualEncargos() {
		return this.percentualEncargos;
	}

	public void setPercentualEncargos(BigDecimal percentualEncargos) {
		this.percentualEncargos = percentualEncargos;
	}

	public Long getUsuarioCriacaoId() {
		return this.usuarioCriacaoId;
	}

	public void setUsuarioCriacaoId(Long usuarioCriacaoId) {
		this.usuarioCriacaoId = usuarioCriacaoId;
	}

	public Timestamp getDataCriacao() {
		return this.dataCriacao;
	}

	public void setDataCriacao(Timestamp dataCriacao) {
		this.dataCriacao = dataCriacao;
	}

	public Long getUsuarioEstornoId() {
		return this.usuarioEstornoId;
	}

	public void setUsuarioEstornoId(Long usuarioEstornoId) {
		this.usuarioEstornoId = usuarioEstornoId;
	}

	public Timestamp getDataEstorno() {
		return this.dataEstorno;
	}

	public void setDataEstorno(Timestamp dataEstorno) {
		this.dataEstorno = dataEstorno;
	}

	public Long getCorretoraId() {
		return this.corretoraId;
	}

	public void setCorretoraId(Long corretoraId) {
		this.corretoraId = corretoraId;
	}

	public Set<PagamentosRepasse> getPagamentosRepasseCollection() {
		return this.pagamentosRepasseCollection;
	}

	public void setPagamentosRepasseCollection(Set<PagamentosRepasse> pagamentosRepasseCollection) {
		this.pagamentosRepasseCollection = pagamentosRepasseCollection;
	}

}
