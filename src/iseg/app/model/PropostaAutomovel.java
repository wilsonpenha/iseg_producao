package iseg.app.model;

import iseg.app.persistence.PObjectLog;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name="proposta_automovel")
@NamedQueries({
	@NamedQuery(name="getPropostaAutomovel", query="SELECT a FROM PropostaAutomovel a"),
	@NamedQuery(name="updateDataExclusao", query="UPDATE PropostaAutomovel pa SET pa.dataExclusao = ?0 WHERE pa.id = ?1"),
	@NamedQuery(name="deletePropostaAutomovelByProposta", query="DELETE FROM PropostaAutomovel pa WHERE pa.proposta.id = ?0")
	
})
public class PropostaAutomovel extends PObjectLog implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3099147947957086286L;

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private Long id;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="proposta_id")
	private Proposta proposta;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="proposta_original_id")
	private Proposta propostaOriginal;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="automovel_id")
	private Automovel automovel;
	
	@Column(name="data_inclusao")
	private Date dataInclusao;
	
	@Column(name="data_exclusao")
	private Date dataExclusao;
	
	@Column(name="numero_item")
	private Integer numeroItem;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Proposta getProposta() {
		return proposta;
	}

	public void setProposta(Proposta proposta) {
		this.proposta = proposta;
	}

	public Automovel getAutomovel() {
		return automovel;
	}

	public void setAutomovel(Automovel automovel) {
		this.automovel = automovel;
	}

	public Date getDataInclusao() {
		return dataInclusao;
	}

	public void setDataInclusao(Date dataInclusao) {
		this.dataInclusao = dataInclusao;
	}

	public Date getDataExclusao() {
		return dataExclusao;
	}

	public void setDataExclusao(Date dataExclusao) {
		this.dataExclusao = dataExclusao;
	}

	public Proposta getPropostaOriginal() {
		return propostaOriginal;
	}

	public void setPropostaOriginal(Proposta propostaOriginal) {
		this.propostaOriginal = propostaOriginal;
	}

	public Integer getNumeroItem() {
		return numeroItem;
	}

	public void setNumeroItem(Integer numeroItem) {
		this.numeroItem = numeroItem;
	}

}
