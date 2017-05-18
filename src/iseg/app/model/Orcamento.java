package iseg.app.model;

import java.io.Serializable;
import java.util.Date;

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

import iseg.app.persistence.PObject;

@Entity
@Table(name="orcamento")
@SequenceGenerator(name="seq_orcamento", sequenceName = "seq_orcamento")
@NamedQueries({
	@NamedQuery(name="getOrcamento", query="SELECT a FROM Orcamento a")
})
public class Orcamento extends PObject implements Serializable {

	private static final long serialVersionUID = -3904470160784502871L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "seq_orcamento")
	private Long id;
	
	@ManyToOne
	@JoinColumn(name="orcamento_seguradora_id")
	private OrcamentoSeguradora orcamentoSeguradora;
	
	@ManyToOne
	@JoinColumn(name="orcamento_seguro_id")
	private OrcamentoSeguro orcamentoSeguro;
	
	@ManyToOne
	@JoinColumn(name="usuario_id")
	private Usuario usuario;
	
	@Column(name="data_orcamento")
	private Date dataOrcamento;
	
	@Column(name="numero")
	private Integer numero;
	
	@Column(name="validade")
	private Date validade;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public OrcamentoSeguradora getOrcamentoSeguradora() {
		return orcamentoSeguradora;
	}

	public void setOrcamentoSeguradora(OrcamentoSeguradora orcamentoSeguradora) {
		this.orcamentoSeguradora = orcamentoSeguradora;
	}

	public OrcamentoSeguro getOrcamentoSeguro() {
		return orcamentoSeguro;
	}

	public void setOrcamentoSeguro(OrcamentoSeguro orcamentoSeguro) {
		this.orcamentoSeguro = orcamentoSeguro;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Date getDataOrcamento() {
		return dataOrcamento;
	}

	public void setDataOrcamento(Date dataOrcamento) {
		this.dataOrcamento = dataOrcamento;
	}

	public Integer getNumero() {
		return numero;
	}

	public void setNumero(Integer numero) {
		this.numero = numero;
	}

	public Date getValidade() {
		return validade;
	}

	public void setValidade(Date validade) {
		this.validade = validade;
	}
	
}
