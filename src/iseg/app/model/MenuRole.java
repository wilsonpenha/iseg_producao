package iseg.app.model;

import static javax.persistence.FetchType.LAZY;
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
@Table(name="menu_role")
@NamedQueries({
	@NamedQuery(name="getCountMenuRole", query="SELECT Count(*) FROM MenuRole m"),
	@NamedQuery(name="getMenuRole", query="SELECT m FROM MenuRole m"),
	@NamedQuery(name="getMenuRoleByRoleAndMenu", query="SELECT m FROM MenuRole m WHERE m.role.id = ?0 and m.menu.id = ?1"),
	@NamedQuery(name="deleteMenuRoleByRole", query="DELETE FROM MenuRole m WHERE m.role.id = ?0")
	})
public class MenuRole extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="MROL_SEQ", sequenceName = "APP_SEQ")
	private Long id;

	@ManyToOne(fetch=LAZY)
	private Menu menu;

	@ManyToOne(fetch=LAZY)
	private Role role;

	private static final long serialVersionUID = 1L;

	public MenuRole() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Menu getMenu() {
		return this.menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	public Role getRole() {
		return this.role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

}
