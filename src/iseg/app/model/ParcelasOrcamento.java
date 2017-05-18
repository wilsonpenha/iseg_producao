package iseg.app.model;

import iseg.app.persistence.PObject;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="parcelas_orcamento")
@SequenceGenerator(name="seq_parcelas_orcamento", sequenceName = "seq_parcelas_orcamento")
@NamedQueries({
	@NamedQuery(name="getParcelasOrcamento", query="SELECT a FROM ParcelasOrcamento a"),
	@NamedQuery(name="getParcelasOrcamentoByOrcamentoFranquias", query="SELECT a FROM ParcelasOrcamento a WHERE a.orcamentoFranquias.id = ?0"),
	@NamedQuery(name="deleteParcelasOrcamentoByOrcamentoFranquias", query="DELETE FROM ParcelasOrcamento i WHERE i.orcamentoFranquias.id = ?0"),
	@NamedQuery(name="getCountParcelasOrcamento", query="SELECT Count(*) FROM ParcelasOrcamento a")
})
public class ParcelasOrcamento extends PObject implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2272173050143198738L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "seq_parcelas_orcamento")
	private Long id;
	
	@Column(name="forma_pagamento")
	private Integer formaPagamento;

	@Column(name="qtd_parcela_debito")
	private Integer qtdParcelaDebito;
	
	@Column(name="qtd_parcela_carne")
	private Integer qtdParcelaCarne;
	
	@Column(name="qtd_parcela_credito")
	private Integer qtdParcelaCredito;
	
	@Column(name="qtd_parcela_cheque")
	private Integer qtdParcelaCheque;

	@Column(name="valor_parcela_debito")
	private Double valorParcelaDebito;
	
	@Column(name="valor_parcela_carne")
	private Double valorParcelaCarne;

	@Column(name="valor_parcela_credito")
	private Double valorParcelaCredito;
	
	@Column(name="valor_parcela_cheque")
	private Double valorParcelaCheque;
	
	@Column(name="qtd_parcelas")
	private Integer qtdParcelas;
	
	@Column(name="is_selected")
	private Boolean isSelected;
	
	@ManyToOne
	@JoinColumn(name="orcamento_franquias_id")
	private OrcamentoFranquias orcamentoFranquias;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
	public Integer getFormaPagamento() {
		return formaPagamento;
	}

	public void setFormaPagamento(Integer formaPagamento) {
		this.formaPagamento = formaPagamento;
	}

	public Integer getQtdParcelaDebito() {
		return qtdParcelaDebito;
	}

	public void setQtdParcelaDebito(Integer qtdParcelaDebito) {
		this.qtdParcelaDebito = qtdParcelaDebito;
	}

	public Integer getQtdParcelaCarne() {
		return qtdParcelaCarne;
	}

	public void setQtdParcelaCarne(Integer qtdParcelaCarne) {
		this.qtdParcelaCarne = qtdParcelaCarne;
	}

	public Integer getQtdParcelaCredito() {
		return qtdParcelaCredito;
	}

	public void setQtdParcelaCredito(Integer qtdParcelaCredito) {
		this.qtdParcelaCredito = qtdParcelaCredito;
	}

	public Integer getQtdParcelaCheque() {
		return qtdParcelaCheque;
	}

	public void setQtdParcelaCheque(Integer qtdParcelaCheque) {
		this.qtdParcelaCheque = qtdParcelaCheque;
	}

	public Double getValorParcelaDebito() {
		return valorParcelaDebito;
	}

	public void setValorParcelaDebito(Double valorParcelaDebito) {
		this.valorParcelaDebito = valorParcelaDebito;
	}

	public Double getValorParcelaCarne() {
		return valorParcelaCarne;
	}

	public void setValorParcelaCarne(Double valorParcelaCarne) {
		this.valorParcelaCarne = valorParcelaCarne;
	}

	public Double getValorParcelaCredito() {
		return valorParcelaCredito;
	}

	public void setValorParcelaCredito(Double valorParcelaCredito) {
		this.valorParcelaCredito = valorParcelaCredito;
	}

	public Double getValorParcelaCheque() {
		return valorParcelaCheque;
	}

	public void setValorParcelaCheque(Double valorParcelaCheque) {
		this.valorParcelaCheque = valorParcelaCheque;
	}

	public OrcamentoFranquias getOrcamentoFranquias() {
		return orcamentoFranquias;
	}

	public void setOrcamentoFranquias(OrcamentoFranquias orcamentoFranquias) {
		this.orcamentoFranquias = orcamentoFranquias;
	}

	public Integer getQtdParcelas() {
		return qtdParcelas;
	}

	public void setQtdParcelas(Integer qtdParcelas) {
		this.qtdParcelas = qtdParcelas;
	}

	public Boolean getIsSelected() {
		return isSelected;
	}

	public void setIsSelected(Boolean isSelected) {
		this.isSelected = isSelected;
	}

}
