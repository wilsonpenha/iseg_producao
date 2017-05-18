package iseg.app.model;

import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.persistence.PObject;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;


@Entity
@Table(name="acao_role")
@NamedQueries({
	@NamedQuery(name="getCountAcaoRole", query="SELECT Count(*) FROM AcaoRole m"),
	@NamedQuery(name="getAcaoRole", query="SELECT m FROM AcaoRole m"),
	@NamedQuery(name="getAcaoRoleByAcaoAndRole", query="SELECT m FROM AcaoRole m WHERE m.role.id = ?0 and m.acao.id = ?1"),
	@NamedQuery(name="getAcaoRoleByRoleAndAcaoAndMenu", query="SELECT m FROM AcaoRole m WHERE m.role.id = ?0 and m.acao.actionName = ?1 and m.acao.menu.id = ?2"),
	@NamedQuery(name="deleteAcaoRoleByRole", query="DELETE FROM AcaoRole m WHERE m.role.id = ?0")
	})
public class AcaoRole extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="ACRL_SEQ", sequenceName = "APP_SEQ")
	private Long id;

	@ManyToOne
	private Acao acao;

	@ManyToOne
	private Role role;

	private static final long serialVersionUID = 1L;

	public AcaoRole() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Acao getAcao() {
		return this.acao;
	}

	public void setAcao(Acao acao) {
		this.acao = acao;
	}

	public Role getRole() {
		return this.role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

}
