package iseg.app.model;

import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

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
@Table(name="orcamento_servicos_iseg")
@SequenceGenerator(name="seq_orcamento_servicos_iseg", sequenceName = "seq_orcamento_servicos_iseg")
@NamedQueries({
	@NamedQuery(name="getOrcamentoServicosIseg", query="SELECT a FROM OrcamentoServicosIseg a"),
	@NamedQuery(name="getOrcamentoServicosIsegById", query="SELECT a FROM OrcamentoServicosIseg a WHERE a.id = ?0"),
	@NamedQuery(name="getOrcamentoServicosIsegByOrcamentoSeguro", query="SELECT a FROM OrcamentoServicosIseg a WHERE a.orcamentoSeguro.id = ?0"),
	@NamedQuery(name="getCountOrcamentoServicosIseg", query="SELECT Count(*) FROM OrcamentoServicosIseg a"),
	@NamedQuery(name="deleteOrcamentoServicosIsegById", query="DELETE FROM OrcamentoServicosIseg a WHERE a.id = ?0")
})
public class OrcamentoServicosIseg extends PObject implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3043245093747082162L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "seq_orcamento_servicos_iseg")
	private Long id;

	@Column(name="descricao")
	private String descricao;

	@Column(name="franquia")
	private Double franquia;
	
	@Column(name="premio")
	private Double premio;

	@Column(name="quantidade")
	private Long quantidade;

	@Column(name="servico_contratado")
	private String servicoContratado;

	@Column(name="texto_franquia")
	private String textoFranquia;

	@Column(name="informa_franquia")
	private Boolean informaFranquia;

	@Column(name="texto_descricao")
	private String textoDescricao;
	
	@Column(name="is_ativa")
	private Boolean isAtiva;

	@Column(name="sequencia")
	private Long sequencia;

	@ManyToOne
	@JoinColumn(name="usuario_id")
	private Usuario usuario;

	@ManyToOne
	@JoinColumn(name="orcamento_seguro_id")
	private OrcamentoSeguro orcamentoSeguro;
	
	@ManyToOne
	@JoinColumn(name="servicos_iseg_id")
	private ServicosIseg servicosIseg;
	
	@Transient
	private List<Servicos> servicosList = new ArrayList<Servicos>();
	
	@Transient
	private List<ServicosIseg> servicosIsegList = new ArrayList<ServicosIseg>();

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Double getFranquia() {
		return franquia;
	}

	public void setFranquia(Double franquia) {
		this.franquia = franquia;
	}

	public Double getPremio() {
		return premio;
	}

	public void setPremio(Double premio) {
		this.premio = premio;
	}

	public Long getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(Long quantidade) {
		this.quantidade = quantidade;
	}

	public String getServicoContratado() {
		return servicoContratado;
	}

	public void setServicoContratado(String servicoContratado) {
		this.servicoContratado = servicoContratado;
	}

	public String getTextoFranquia() {
		return textoFranquia;
	}

	public void setTextoFranquia(String textoFranquia) {
		this.textoFranquia = textoFranquia;
	}

	public Boolean getInformaFranquia() {
		return informaFranquia;
	}

	public void setInformaFranquia(Boolean informaFranquia) {
		this.informaFranquia = informaFranquia;
	}

	public String getTextoDescricao() {
		return textoDescricao;
	}

	public void setTextoDescricao(String textoDescricao) {
		this.textoDescricao = textoDescricao;
	}
	
	public Boolean getIsAtiva() {
		return isAtiva;
	}

	public void setIsAtiva(Boolean isAtiva) {
		this.isAtiva = isAtiva;
	}

	public Long getSequencia() {
		return sequencia;
	}

	public void setSequencia(Long sequencia) {
		this.sequencia = sequencia;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public OrcamentoSeguro getOrcamentoSeguro() {
		return orcamentoSeguro;
	}

	public void setOrcamentoSeguro(OrcamentoSeguro orcamentoSeguro) {
		this.orcamentoSeguro = orcamentoSeguro;
	}

	public ServicosIseg getServicosIseg() {
		return servicosIseg;
	}

	public void setServicosIseg(ServicosIseg servicosIseg) {
		this.servicosIseg = servicosIseg;
	}

	public List<Servicos> getServicosList() {
		return servicosList;
	}

	public void setServicosList(List<Servicos> servicosList) {
		this.servicosList = servicosList;
	}

	public List<ServicosIseg> getServicosIsegList() {
		return servicosIsegList;
	}

	public void setServicosIsegList(List<ServicosIseg> servicosIsegList) {
		this.servicosIsegList = servicosIsegList;
	}
	
}
