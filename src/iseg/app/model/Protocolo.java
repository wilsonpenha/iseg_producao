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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Filter;
import org.hibernate.annotations.FilterDef;
import org.hibernate.annotations.ParamDef;


@Entity
@SequenceGenerator(name="seq_protocolo", sequenceName = "seq_protocolo")
@FilterDef(name="corretoraFilter", parameters={@ParamDef(name="corretoraParam", type="long"),@ParamDef(name="assessoriaIdParam", type="long"),@ParamDef(name="isAssessoriaParam", type="boolean")})    
@Filter(name="corretoraFilter", condition="(corretora_id = :corretoraParam)")    
@NamedQueries({
	@NamedQuery(name="getCountProtocolo", query="SELECT Count(*) FROM Protocolo pv"),
	@NamedQuery(name="getProtocolo", query="SELECT pv FROM Protocolo pv ")
	})
public class Protocolo extends PObject implements Serializable, AtributoCorretora {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "seq_protocolo")
	private Long id;

	private Long numero;
	
	@Column(name="data_abertura")
	@Temporal(TemporalType.DATE)
	private Date dataAbertura;

	@Column(name="data_envio")
	@Temporal(TemporalType.DATE)
	private Date dataEnvio;

	@Column(name="data_encerramento")
	@Temporal(TemporalType.DATE)
	private Date dataEncerramento;

	private String observacao;

	@Column(name="destino_origem")
	private String destinoOrigem;

	@ManyToOne(fetch=LAZY)
	private Corretora corretora;

	@ManyToOne
	private Usuario usuario;

	@Column(name="tipo_protocolo")
	private Integer tipoProtocolo;

	@OneToMany(cascade={CascadeType.ALL}, mappedBy="protocolo", fetch=FetchType.LAZY)
	private List<ProtocoloItens> protocoloItensCollection = new ArrayList<ProtocoloItens>();

	private static final long serialVersionUID = 1L;

	public Protocolo() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getObservacao() {
		return this.observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
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

	public List<ProtocoloItens> getProtocoloItensCollection() {
		return protocoloItensCollection;
	}

	public void setProtocoloItensCollection(
			List<ProtocoloItens> protocoloItensCollection) {
		this.protocoloItensCollection = protocoloItensCollection;
	}

	public Long getNumero() {
		return numero;
	}

	public void setNumero(Long numero) {
		this.numero = numero;
	}

	public Date getDataEnvio() {
		return dataEnvio;
	}

	public void setDataEnvio(Date dataEnvio) {
		this.dataEnvio = dataEnvio;
	}

	public Integer getTipoProtocolo() {
		return tipoProtocolo;
	}

	public void setTipoProtocolo(Integer tipoProtocolo) {
		this.tipoProtocolo = tipoProtocolo;
	}

	public String getDestinoOrigem() {
		return destinoOrigem;
	}

	public void setDestinoOrigem(String destinoOrigem) {
		this.destinoOrigem = destinoOrigem;
	}
}
