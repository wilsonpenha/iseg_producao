package iseg.app.model;

import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.math.BigDecimal;

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
@Table(name="IMOVEL_SERVICOS")
@NamedQueries({
	@NamedQuery(name="imovelServicosFindByImovel", query = "SELECT ac FROM ImovelServicos ac WHERE ac.imovel.id = ?0")})
public class ImovelServicos extends PObject implements Serializable {

	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="ISL_SEQ", sequenceName = "APP_SEQ")
	private Long id;

	@Column(name="SERVICOS_ID")
	private BigDecimal servicosId;

	private BigDecimal premio;

	private BigDecimal franquia;

	@Column(name="SERVICO_CONTRATADO")
	private String servicoContratado;

	@ManyToOne
	private Imovel imovel;

	private static final long serialVersionUID = 1L;

	public ImovelServicos() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public BigDecimal getServicosId() {
		return this.servicosId;
	}

	public void setServicosId(BigDecimal servicosId) {
		this.servicosId = servicosId;
	}

	public BigDecimal getPremio() {
		return this.premio;
	}

	public void setPremio(BigDecimal premio) {
		this.premio = premio;
	}

	public BigDecimal getFranquia() {
		return this.franquia;
	}

	public void setFranquia(BigDecimal franquia) {
		this.franquia = franquia;
	}

	public String getServicoContratado() {
		return this.servicoContratado;
	}

	public void setServicoContratado(String servicoContratado) {
		this.servicoContratado = servicoContratado;
	}

	public Imovel getImovel() {
		return this.imovel;
	}

	public void setImovel(Imovel imovel) {
		this.imovel = imovel;
	}

}
