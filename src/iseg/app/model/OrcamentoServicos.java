package iseg.app.model;

import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.ColumnResult;
import javax.persistence.Entity;
import javax.persistence.EntityResult;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.SqlResultSetMapping;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="orcamento_servicos")
@SequenceGenerator(name="seq_orcamento_servicos", sequenceName = "seq_orcamento_servicos")
@NamedQueries({
	@NamedQuery(name="getOrcamentoServicos", query="SELECT a FROM OrcamentoServicos a"),
	@NamedQuery(name="getCountOrcamentoServicos", query="SELECT Count(*) FROM OrcamentoServicos a")
})
@SqlResultSetMapping(
    name = "OrcamentoServico",
    entities = @EntityResult(entityClass = OrcamentoServicos.class),
    columns = {
    		@ColumnResult(name = "servicosId")
 })
public class OrcamentoServicos extends PObject implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "seq_orcamento_servicos")
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

	@Column(name="sequencia")
	private Long sequencia;

	@ManyToOne
	@JoinColumn(name="usuario_id")
	private Usuario usuario;

	@ManyToOne
	@JoinColumn(name="orcamento_seguradora_id")
	private OrcamentoSeguradora orcamentoSeguradora;

	@ManyToOne
	@JoinColumn(name="servicos_id")
	private Servicos servicos;
	
	@ManyToOne
	@JoinColumn(name="servicos_iseg_id")
	private ServicosIseg servicosIseg;
	
	@Transient
	private Long servicosId;
	
	@Transient
	private List<ServicosIseg> servicoIsegList = new ArrayList<ServicosIseg>();
	
	@Transient
	private List<Servicos> servicosList = new ArrayList<Servicos>();

	private static final long serialVersionUID = 1L;

	public OrcamentoServicos() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDescricao() {
		return this.descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
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

	public Long getQuantidade() {
		return this.quantidade;
	}

	public void setQuantidade(Long quantidade) {
		this.quantidade = quantidade;
	}

	public String getServicoContratado() {
		return this.servicoContratado;
	}

	public void setServicoContratado(String servicoContratado) {
		this.servicoContratado = servicoContratado;
	}

	public String getTextoFranquia() {
		return this.textoFranquia;
	}

	public void setTextoFranquia(String textoFranquia) {
		this.textoFranquia = textoFranquia;
	}

	public Boolean getInformaFranquia() {
		return this.informaFranquia;
	}

	public void setInformaFranquia(Boolean informaFranquia) {
		this.informaFranquia = informaFranquia;
	}

	public String getTextoDescricao() {
		return this.textoDescricao;
	}

	public void setTextoDescricao(String textoDescricao) {
		this.textoDescricao = textoDescricao;
	}

	public Long getSequencia() {
		return this.sequencia;
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

	public OrcamentoSeguradora getOrcamentoSeguradora() {
		return this.orcamentoSeguradora;
	}

	public void setOrcamentoSeguradora(OrcamentoSeguradora orcamentoSeguradora) {
		this.orcamentoSeguradora = orcamentoSeguradora;
	}

	public Servicos getServicos() {
		return servicos;
	}

	public void setServicos(Servicos servicos) {
		this.servicos = servicos;
	}

	public ServicosIseg getServicosIseg() {
		return servicosIseg;
	}

	public void setServicosIseg(ServicosIseg servicosIseg) {
		this.servicosIseg = servicosIseg;
	}

	public Long getServicosId() {
		return servicosId;
	}

	public void setServicosId(Long servicosId) {
		this.servicosId = servicosId;
	}

	public List<ServicosIseg> getServicoIsegList() {
		return servicoIsegList;
	}

	public void setServicoIsegList(List<ServicosIseg> servicoIsegList) {
		this.servicoIsegList = servicoIsegList;
	}

	public List<Servicos> getServicosList() {
		return servicosList;
	}

	public void setServicosList(List<Servicos> servicosList) {
		this.servicosList = servicosList;
	}

}
