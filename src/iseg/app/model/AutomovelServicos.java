package iseg.app.model;

import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.persistence.PObject;

import java.io.Serializable;

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
@Table(name="AUTOMOVEL_SERVICOS")
@NamedQueries({
	@NamedQuery(name="automovelServicoFindByAutomovel", query = "SELECT autoServ FROM AutomovelServicos autoServ WHERE autoServ.automovel.id = ?0 ORDER BY autoServ.servicos.sequencia")})
public class AutomovelServicos extends PObject implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="ASE_SEQ", sequenceName = "APP_SEQ")
	private Long id;

	private Double franquia;

	private Double premio;

	@Column(name="TEXTO_FRANQUIA")
	private String textoFranquia;

	@Column(name="TEXTO_DESCRICAO")
	private String textoDescricao;

	@Column(name="INFORMA_FRANQUIA")
	private Boolean blnInformaFranquia;

	private Long sequencia;

	@ManyToOne
	private Automovel automovel;

	@ManyToOne
	private Servicos servicos;
	
	@ManyToOne
	@JoinColumn(name="servicos_iseg_id")
	private ServicosIseg servicosIseg;

	@Column(name="SERVICO_CONTRATADO")
	private String servicoContratado;

	@Column(length=100)
	private String descricao;

	private Long quantidade;

	public AutomovelServicos() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Double getFranquia() {
		return this.franquia;
	}

	public void setFranquia(Double franquia) {
		this.franquia = franquia;
	}

	public Double getPremio() {
		return this.premio;
	}

	public void setPremio(Double premio) {
		this.premio = premio;
	}

	public Boolean getBlnInformaFranquia() {
		return blnInformaFranquia;
	}

	public void setBlnInformaFranquia(Boolean blnInformaFranquia) {
		this.blnInformaFranquia = blnInformaFranquia;
	}

	public Automovel getAutomovel() {
		return this.automovel;
	}

	public String getTextoDescricao() {
		return textoDescricao;
	}

	public void setTextoDescricao(String textoDescricao) {
		this.textoDescricao = textoDescricao;
	}

	public void setAutomovel(Automovel automovel) {
		this.automovel = automovel;
	}

	public Long getSequencia() {
		return sequencia;
	}

	public void setSequencia(Long sequencia) {
		this.sequencia = sequencia;
	}

	public Servicos getServicos() {
		return this.servicos;
	}

	public void setServicos(Servicos servicos) {
		this.servicos = servicos;
	}

	public String getServicoContratado() {
		return servicoContratado;
	}

	public void setServicoContratado(String servicoContratado) {
		this.servicoContratado = servicoContratado;
	}

	public Long getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(Long quantidade) {
		this.quantidade = quantidade;
	}

	public String getTextoFranquia() {
		return textoFranquia;
	}

	public void setTextoFranquia(String textoFranquia) {
		this.textoFranquia = textoFranquia;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public ServicosIseg getServicosIseg() {
		return servicosIseg;
	}

	public void setServicosIseg(ServicosIseg servicosIseg) {
		this.servicosIseg = servicosIseg;
	}
}