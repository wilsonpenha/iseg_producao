package iseg.app.model;


import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;


@Entity
@Table(name="audit_log_record")
@SequenceGenerator(name="seq_audit", sequenceName = "seq_audit")
@NamedQueries({
	@NamedQuery(name="getAuditLogRecord", query="SELECT a FROM AuditLogRecord a"),
	@NamedQuery(name="getCountAuditLogRecord", query="SELECT Count(*) FROM AuditLogRecord a")
})
public class AuditLogRecord extends PObject implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "seq_audit")
	private Long id;

    @Column(name="entity_id")
    private String entityId;
    
    @Column(name="entity_name")
    private String entityName;
    
    @Column(name="entity_attribute")
    private String entityAttribute;
    
    private String message;

    @Column(name="entity_property_old_value")
    private String entityAttributeOldValue;
    
    @Column(name="entity_property_new_value")
    private String entityAttributeNewValue;
    
    @Column(name="operation_type")
    private String operationType;

    @Column(name="data_hora_operacao")
	@Temporal(TemporalType.TIMESTAMP)
    private Date dataHoraOperacao;
    
	@ManyToOne
	private Usuario usuario;
	
    @Column(name="root_entity_name")
    private String rootEntityName;
    
    @Column(name="root_entity_id")
    private String rootEntityId;
    
	@Transient
	private Auditable entity;
	
	public AuditLogRecord() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getEntityId() {
		return entityId;
	}

	public void setEntityId(String entityId) {
		this.entityId = entityId;
	}

	public String getEntityName() {
		return entityName;
	}

	public void setEntityName(String entityName) {
		this.entityName = entityName;
	}

	public String getEntityAttribute() {
		return entityAttribute;
	}

	public void setEntityAttribute(String entityAttribute) {
		this.entityAttribute = entityAttribute;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getEntityAttributeOldValue() {
		return entityAttributeOldValue;
	}

	public void setEntityAttributeOldValue(String entityAttributeOldValue) {
		this.entityAttributeOldValue = entityAttributeOldValue;
	}

	public String getEntityAttributeNewValue() {
		return entityAttributeNewValue;
	}

	public void setEntityAttributeNewValue(String entityAttributeNewValue) {
		this.entityAttributeNewValue = entityAttributeNewValue;
	}

	public String getOperationType() {
		return operationType;
	}

	public void setOperationType(String operationType) {
		this.operationType = operationType;
	}

	public Date getDataHoraOperacao() {
		return dataHoraOperacao;
	}

	public void setDataHoraOperacao(Date dataHoraOperacao) {
		this.dataHoraOperacao = dataHoraOperacao;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public String getRootEntityName() {
		return rootEntityName;
	}

	public void setRootEntityName(String rootEntityName) {
		this.rootEntityName = rootEntityName;
	}

	public String getRootEntityId() {
		return rootEntityId;
	}

	public void setRootEntityId(String rootEntityId) {
		this.rootEntityId = rootEntityId;
	}

	public Auditable getEntity() {
		return entity;
	}

	public void setEntity(Auditable entity) {
		this.entity = entity;
	}
}