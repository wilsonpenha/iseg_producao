package iseg.app.model;

import static javax.persistence.FetchType.LAZY;

import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name="smsserver_in")
@NamedQueries({
	@NamedQuery(name="getCountSmsserverIn", query="SELECT Count(*) FROM SmsserverIn s"),
	@NamedQuery(name="getSmsserverInById", query="SELECT s FROM SmsserverIn s where s.id = ?0"),
	@NamedQuery(name="getSmsserverInNaoEncaminhados", query="SELECT s FROM SmsserverIn s where s.encaminhado='N' order by s.receiveDate")
	})
public class SmsserverIn extends PObject implements Serializable {
	@Id
	private Long id;

	private Integer process;

	private String originator;

	private String type;

	private String encoding;

	@Column(name="message_date")
	@Temporal(TemporalType.DATE)
	private Date messageDate;

	@Column(name="receive_date")
	@Temporal(TemporalType.DATE)
	private Date receiveDate;

	private String text;

	@Column(name="original_ref_no")
	private String originalRefNo;

	@Column(name="original_receive_date")
	@Temporal(TemporalType.DATE)
	private Date originalReceiveDate;

	@Column(name="gateway_id")
	private String gatewayId;

	private String encaminhado;

	@ManyToOne(targetEntity=Produtor.class, fetch = LAZY)
	@JoinColumn(name="produtor_id", referencedColumnName = "id")
	private Produtor produtor; 

	private static final long serialVersionUID = 1L;

	public SmsserverIn() {
		super();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getProcess() {
		return this.process;
	}

	public void setProcess(Integer process) {
		this.process = process;
	}

	public String getOriginator() {
		return this.originator;
	}

	public void setOriginator(String originator) {
		this.originator = originator;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getEncoding() {
		return this.encoding;
	}

	public void setEncoding(String encoding) {
		this.encoding = encoding;
	}

	public Date getMessageDate() {
		return this.messageDate;
	}

	public void setMessageDate(Date messageDate) {
		this.messageDate = messageDate;
	}

	public Date getReceiveDate() {
		return this.receiveDate;
	}

	public void setReceiveDate(Date receiveDate) {
		this.receiveDate = receiveDate;
	}

	public String getText() {
		return this.text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getOriginalRefNo() {
		return this.originalRefNo;
	}

	public void setOriginalRefNo(String originalRefNo) {
		this.originalRefNo = originalRefNo;
	}

	public Date getOriginalReceiveDate() {
		return this.originalReceiveDate;
	}

	public void setOriginalReceiveDate(Date originalReceiveDate) {
		this.originalReceiveDate = originalReceiveDate;
	}

	public String getGatewayId() {
		return this.gatewayId;
	}

	public void setGatewayId(String gatewayId) {
		this.gatewayId = gatewayId;
	}

	public String getEncaminhado() {
		return encaminhado;
	}

	public void setEncaminhado(String encaminhado) {
		this.encaminhado = encaminhado;
	}

	public Produtor getProdutor() {
		return produtor;
	}

	public void setProdutor(Produtor produtor) {
		this.produtor = produtor;
	}

}
