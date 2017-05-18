package iseg.app.model;

import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
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
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name="protocolo_itens")
@SequenceGenerator(name="seq_protocolo_itens", sequenceName = "seq_protocolo_itens")
@NamedQueries({
	@NamedQuery(name="getCountProtocoloItens", query="SELECT Count(*) FROM ProtocoloItens pv"),
	@NamedQuery(name="getProtocoloItensByProposta", query="SELECT pv FROM ProtocoloItens pv where pv.proposta.id = ?0"),
	@NamedQuery(name="getProtocoloItens", query="SELECT pv FROM ProtocoloItens pv ")
	})
public class ProtocoloItens extends PObject implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "seq_protocolo_itens")
	private Long id;

	@ManyToOne(fetch=FetchType.EAGER, cascade={CascadeType.REFRESH})
	private Proposta proposta;

	@Column(name="data_recebimento")
	@Temporal(TemporalType.DATE)
	private Date dataRecebimento;

	@Column(name="data_devolucao")
	@Temporal(TemporalType.DATE)
	private Date dataDevolucao;

	@Column(name="obs_envio")
	private String obsEnvio;

	@Column(name="obs_devolucao")
	private String obsDevolucao;

	@ManyToOne(fetch=FetchType.EAGER)
	private Protocolo protocolo;

	@ManyToOne(fetch=FetchType.EAGER)
	private Usuario usuario;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="tipo_documento_id")
	private DominioEsp tipoDocumento;

	private static final long serialVersionUID = 1L;

	public ProtocoloItens() {
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

	public Date getDataRecebimento() {
		return dataRecebimento;
	}

	public void setDataRecebimento(Date dataRecebimento) {
		this.dataRecebimento = dataRecebimento;
	}

	public Date getDataDevolucao() {
		return dataDevolucao;
	}

	public void setDataDevolucao(Date dataDevolucao) {
		this.dataDevolucao = dataDevolucao;
	}

	public String getObsEnvio() {
		return obsEnvio;
	}

	public void setObsEnvio(String obsEnvio) {
		this.obsEnvio = obsEnvio;
	}

	public String getObsDevolucao() {
		return obsDevolucao;
	}

	public void setObsDevolucao(String obsDevolucao) {
		this.obsDevolucao = obsDevolucao;
	}

	public Protocolo getProtocolo() {
		return protocolo;
	}

	public void setProtocolo(Protocolo protocolo) {
		this.protocolo = protocolo;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public void setTipoDocumento(DominioEsp tipoDocumento) {
		this.tipoDocumento = tipoDocumento;
	}

	public DominioEsp getTipoDocumento() {
		return tipoDocumento;
	}

}
