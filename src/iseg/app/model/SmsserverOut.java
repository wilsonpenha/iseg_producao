package iseg.app.model;

import static javax.persistence.FetchType.LAZY;

import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@SequenceGenerator(name="smsserver_out_seq", sequenceName = "smsserver_out_seq")
@Table(name="smsserver_out")
public class SmsserverOut extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "smsserver_out_seq")
	private Long id;

	private String type;

	private String recipient;

	private String text;

	@Column(name="wap_url")
	private String wapUrl;

	@Column(name="wap_expiry_date")
	@Temporal(TemporalType.DATE)
	private Date wapExpiryDate;

	@Column(name="wap_signal")
	private String wapSignal;

	@Column(name="create_date")
	@Temporal(TemporalType.DATE)
	private Date createDate;

	private String originator;

	private String encoding;

	@Column(name="status_report")
	private Integer statusReport;

	@Column(name="flash_sms")
	private Integer flashSms;

	@Column(name="src_port")
	private Integer srcPort;

	@Column(name="dst_port")
	private Integer dstPort;

	@Column(name="sent_date")
	@Temporal(TemporalType.DATE)
	private Date sentDate;

	@Column(name="ref_no")
	private String refNo;

	private Integer priority;

	private String status;

	private Integer errors;

	@Column(name="gateway_id")
	private String gatewayId;

	@ManyToOne(targetEntity=Produtor.class, fetch = LAZY)
	@JoinColumn(name="produtor_id", referencedColumnName = "id")
	private Produtor produtor; 

	@ManyToOne(targetEntity=Pessoa.class, fetch = LAZY)
	@JoinColumn(name="pessoa_id", referencedColumnName = "id")
	private Pessoa pessoa; 

	@ManyToOne(targetEntity=Usuario.class, fetch = LAZY)
	@JoinColumn(name="usuario_id", referencedColumnName = "id")
	private Usuario usuario; 

	private static final long serialVersionUID = 1L;

	public SmsserverOut() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getRecipient() {
		return this.recipient;
	}

	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}

	public String getText() {
		return this.text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getWapUrl() {
		return this.wapUrl;
	}

	public void setWapUrl(String wapUrl) {
		this.wapUrl = wapUrl;
	}

	public Date getWapExpiryDate() {
		return this.wapExpiryDate;
	}

	public void setWapExpiryDate(Date wapExpiryDate) {
		this.wapExpiryDate = wapExpiryDate;
	}

	public String getWapSignal() {
		return this.wapSignal;
	}

	public void setWapSignal(String wapSignal) {
		this.wapSignal = wapSignal;
	}

	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getOriginator() {
		return this.originator;
	}

	public void setOriginator(String originator) {
		this.originator = originator;
	}

	public String getEncoding() {
		return this.encoding;
	}

	public void setEncoding(String encoding) {
		this.encoding = encoding;
	}

	public Integer getStatusReport() {
		return this.statusReport;
	}

	public void setStatusReport(Integer statusReport) {
		this.statusReport = statusReport;
	}

	public Integer getFlashSms() {
		return this.flashSms;
	}

	public void setFlashSms(Integer flashSms) {
		this.flashSms = flashSms;
	}

	public Integer getSrcPort() {
		return this.srcPort;
	}

	public void setSrcPort(Integer srcPort) {
		this.srcPort = srcPort;
	}

	public Integer getDstPort() {
		return this.dstPort;
	}

	public void setDstPort(Integer dstPort) {
		this.dstPort = dstPort;
	}

	public Date getSentDate() {
		return this.sentDate;
	}

	public void setSentDate(Date sentDate) {
		this.sentDate = sentDate;
	}

	public String getRefNo() {
		return this.refNo;
	}

	public void setRefNo(String refNo) {
		this.refNo = refNo;
	}

	public Integer getPriority() {
		return this.priority;
	}

	public void setPriority(Integer priority) {
		this.priority = priority;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Integer getErrors() {
		return this.errors;
	}

	public void setErrors(Integer errors) {
		this.errors = errors;
	}

	public String getGatewayId() {
		return this.gatewayId;
	}

	public void setGatewayId(String gatewayId) {
		this.gatewayId = gatewayId;
	}

	public Produtor getProdutor() {
		return produtor;
	}

	public void setProdutor(Produtor produtor) {
		this.produtor = produtor;
	}

	public Pessoa getPessoa() {
		return pessoa;
	}

	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

}
