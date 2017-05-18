package iseg.app.model;

import static javax.persistence.FetchType.LAZY;

import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Filter;
import org.hibernate.annotations.FilterDef;
import org.hibernate.annotations.ParamDef;


@Entity
@Table(name="pos_venda")
@SequenceGenerator(name="seq_pos_venda", sequenceName = "seq_pos_venda")
@FilterDef(name="corretoraFilter", parameters={@ParamDef(name="corretoraParam", type="long"),@ParamDef(name="assessoriaIdParam", type="long"),@ParamDef(name="isAssessoriaParam", type="boolean")})    
@Filter(name="corretoraFilter", condition="(corretora_id = :corretoraParam)")    
@NamedQueries({
	@NamedQuery(name="getCountPosVenda", query="SELECT Count(*) FROM PosVenda pv"),
	@NamedQuery(name="getPosVendaByProposta", query="SELECT pv FROM PosVenda pv where pv.proposta.id = ?0"),
	@NamedQuery(name="getPosVendaByGrupoDeVenda", query="SELECT pv FROM PosVenda pv where pv.proposta.grupoDeVenda.id = ?0"),
	@NamedQuery(name="getPosVendaPendenteByGrupoDeVenda", query="SELECT pv FROM PosVenda pv left outer join pv.respostaPosVendaCollection r left outer join pv.pendenciaPosVendaCollection p where pv.proposta.grupoDeVenda.id = ?0 and (r.isRespondido = false or p.dataBaixa is null)"),
	@NamedQuery(name="getPosVendaPendente", query="SELECT pv FROM PosVenda pv left outer join pv.respostaPosVendaCollection rp left outer join pv.pendenciaPosVendaCollection pp where pv.id = ?0 and (rp.isRespondido = false or pp.dataBaixa is null)"),
	@NamedQuery(name="getPosVenda", query="SELECT pv FROM PosVenda pv ")
	})
public class PosVenda extends PObject implements Serializable, AtributoCorretora {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "seq_pos_venda")
	private Long id;

	@ManyToOne(fetch=FetchType.LAZY, cascade={CascadeType.REFRESH})
	private Proposta proposta;

	@Column(name="data_abertura")
	@Temporal(TemporalType.DATE)
	private Date dataAbertura;

	@Column(name="data_encerramento")
	@Temporal(TemporalType.DATE)
	private Date dataEncerramento;

	@Column(name="data_alteracao")
	@Temporal(TemporalType.DATE)
	private Date dataAlteracao;

	private String observacao;

	@Column(name="is_ativo")
	private Boolean isAtivo;

	@Column(name="nome_contato")
	private String nomeContato;

	@Column(name="telefone_contato")
	private String telefoneContato;

	@Column(name="celular_contato")
	private String celularContato;

	@Column(name="fax_contato")
	private String faxContato;

	@ManyToOne(fetch=LAZY)
	private Corretora corretora;

	@ManyToOne
	private Usuario usuario;

	@OneToMany(cascade={CascadeType.ALL}, mappedBy="posVenda", fetch=FetchType.LAZY)
	private List<RespostaPosVenda> respostaPosVendaCollection = new ArrayList<RespostaPosVenda>();

	@OneToMany(cascade={CascadeType.ALL}, mappedBy="posVenda", fetch=FetchType.LAZY)
	private List<PendenciaPosVenda> pendenciaPosVendaCollection = new ArrayList<PendenciaPosVenda>();

	private static final long serialVersionUID = 1L;

	public PosVenda() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Proposta getProposta() {
		return this.proposta;
	}

	public void setProposta(Proposta proposta) {
		this.proposta = proposta;
	}

	public String getObservacao() {
		return this.observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}

	public Boolean getIsAtivo() {
		return this.isAtivo;
	}

	public void setIsAtivo(Boolean isAtivo) {
		this.isAtivo = isAtivo;
	}

	public String getNomeContato() {
		return this.nomeContato;
	}

	public void setNomeContato(String nomeContato) {
		this.nomeContato = nomeContato;
	}

	public String getTelefoneContato() {
		return this.telefoneContato;
	}

	public void setTelefoneContato(String telefoneContato) {
		this.telefoneContato = telefoneContato;
	}

	public String getCelularContato() {
		return this.celularContato;
	}

	public void setCelularContato(String celularContato) {
		this.celularContato = celularContato;
	}

	public String getFaxContato() {
		return this.faxContato;
	}

	public void setFaxContato(String faxContato) {
		this.faxContato = faxContato;
	}

	public List<RespostaPosVenda> getRespostaPosVendaCollection() {
		return this.respostaPosVendaCollection;
	}

	public void setRespostaPosVendaCollection(List<RespostaPosVenda> respostaPosVendaCollection) {
		this.respostaPosVendaCollection = respostaPosVendaCollection;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public void setDataAbertura(Date dataAbertura) {
		this.dataAbertura = dataAbertura;
	}

	public void setDataEncerramento(Date dataEncerramento) {
		this.dataEncerramento = dataEncerramento;
	}

	public Date getDataAbertura() {
		return dataAbertura;
	}

	public Date getDataEncerramento() {
		return dataEncerramento;
	}

	public Corretora getCorretora() {
		return corretora;
	}

	public void setCorretora(Corretora corretora) {
		this.corretora = corretora;
	}

	public Date getDataAlteracao() {
		return dataAlteracao;
	}

	public void setDataAlteracao(Date dataAlteracao) {
		this.dataAlteracao = dataAlteracao;
	}

	public List<PendenciaPosVenda> getPendenciaPosVendaCollection() {
		return pendenciaPosVendaCollection;
	}

	public void setPendenciaPosVendaCollection(
			List<PendenciaPosVenda> pendenciaPosVendaCollection) {
		this.pendenciaPosVendaCollection = pendenciaPosVendaCollection;
	}

}
