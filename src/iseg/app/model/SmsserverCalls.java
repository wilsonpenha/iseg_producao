package iseg.app.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="smsserver_calls")
public class SmsserverCalls implements Serializable {
	@Id
	private long id;

	@Column(name="call_date")
	private Date callDate;

	@Column(name="gateway_id")
	private String gatewayId;

	@Column(name="caller_id")
	private String callerId;

	private static final long serialVersionUID = 1L;

	public SmsserverCalls() {
		super();
	}

	public long getId() {
		return this.id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Date getCallDate() {
		return this.callDate;
	}

	public void setCallDate(Date callDate) {
		this.callDate = callDate;
	}

	public String getGatewayId() {
		return this.gatewayId;
	}

	public void setGatewayId(String gatewayId) {
		this.gatewayId = gatewayId;
	}

	public String getCallerId() {
		return this.callerId;
	}

	public void setCallerId(String callerId) {
		this.callerId = callerId;
	}

}
