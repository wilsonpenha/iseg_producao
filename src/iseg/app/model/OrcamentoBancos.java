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
import javax.persistence.Transient;

@Entity
@Table(name="orcamento_bancos")
@SequenceGenerator(name="seq_orcamento_bancos", sequenceName = "seq_orcamento_bancos")
@NamedQueries({
	@NamedQuery(name="getOrcamentoBancos", query="SELECT a FROM OrcamentoBancos a"),
	@NamedQuery(name="deleteOrcamentoBancosByOrcamentoSeguro", query="DELETE FROM OrcamentoBancos a WHERE a.orcamentoSeguro.id = ?0")
})
public class OrcamentoBancos extends PObject implements Serializable {
	
	private static final long serialVersionUID = 374487929676099479L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "seq_orcamento_bancos")
	private Long id;
	
	@ManyToOne
	@JoinColumn(name="orcamento_seguro_id")
	private OrcamentoSeguro orcamentoSeguro;
	
	@Column(name="agencia")
	private String agencia;
	
	@Column(name="conta")
	private String conta;
	
	@Column(name="digito")
	private String digito;
	
	@ManyToOne
	@JoinColumn(name="tipo_conta_relacionamento_id")
	private TipoContaRelacionamento tipoContaRelacionamento;
	
	@ManyToOne
	@JoinColumn(name="banco_relacionamento_id")
	private BancoRelacionamento bancoRelacionamento;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public OrcamentoSeguro getOrcamentoSeguro() {
		return orcamentoSeguro;
	}

	public void setOrcamentoSeguro(OrcamentoSeguro orcamentoSeguro) {
		this.orcamentoSeguro = orcamentoSeguro;
	}

	public String getAgencia() {
		return agencia;
	}

	public void setAgencia(String agencia) {
		this.agencia = agencia;
	}

	public String getConta() {
		return conta;
	}

	public void setConta(String conta) {
		this.conta = conta;
	}

	public TipoContaRelacionamento getTipoContaRelacionamento() {
		return tipoContaRelacionamento;
	}

	public void setTipoContaRelacionamento(
			TipoContaRelacionamento tipoContaRelacionamento) {
		this.tipoContaRelacionamento = tipoContaRelacionamento;
	}

	public BancoRelacionamento getBancoRelacionamento() {
		return bancoRelacionamento;
	}

	public void setBancoRelacionamento(BancoRelacionamento bancoRelacionamento) {
		this.bancoRelacionamento = bancoRelacionamento;
	}

	public String getDigito() {
		return digito;
	}

	public void setDigito(String digito) {
		this.digito = digito;
	}
}
