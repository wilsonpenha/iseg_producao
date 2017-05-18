package iseg.app.persistence;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.EntityListeners;
import javax.persistence.MappedSuperclass;
import javax.persistence.Version;

import org.apache.struts2.json.annotations.JSON;

@org.hibernate.annotations.Entity(optimisticLock = org.hibernate.annotations.OptimisticLockType.ALL)
@MappedSuperclass
@EntityListeners({PObjectLogListener.class})
public abstract class PObjectLog extends PObject {

	@Column(name="versao", columnDefinition = "numeric(19,0) default 0", nullable=false)
	@org.hibernate.annotations.Generated(org.hibernate.annotations.GenerationTime.ALWAYS)
	@Version
	protected Long versao;

	@Embedded
	protected LogType log;

    public abstract Long getId();
    public abstract void setId(Long id);

	public Long getVersao() {
		return versao;
	}
	public void setVersao(Long versao) {
		this.versao = versao;
	}

	@JSON(serialize=false)
	public LogType getLog() {
		return log;
	}
	public void setLog(LogType log) {
		this.log = log;
	}

}
