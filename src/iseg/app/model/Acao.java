package iseg.app.model;


import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.conversion.CaseSensitive;
import iseg.app.persistence.PObject;

import java.io.Serializable;

import javax.persistence.AttributeOverride;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;


@Entity
@NamedQueries({
	@NamedQuery(name="getAcao", query="SELECT a FROM Acao a ORDER BY a.nome"),
	@NamedQuery(name="getCountAcao", query="SELECT Count(*) FROM Acao a"),
	@NamedQuery(name="getAcaoByMenu", query="SELECT a FROM Acao a WHERE a.menu.id = ?0")
})
public class Acao extends PObject implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="ACAO_SEQ", sequenceName = "APP_SEQ")
	private Long id;

	@Embedded
	@AttributeOverride(name="valor", column=@Column(name="NOME"))
	private CaseSensitive nome;

	@AttributeOverride(name="valor", column=@Column(name="DESCRICAO"))
	private CaseSensitive descricao;

	@Embedded
	@AttributeOverride(name="valor", column=@Column(name="action_name"))
	private CaseSensitive actionName;

	@ManyToOne
	private Menu menu;
	
	public static final Integer AUTOMOVEL = 31;

	public Acao() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public CaseSensitive getNome() {
		return this.nome;
	}

	public void setNome(CaseSensitive nome) {
		this.nome = nome;
	}

	public CaseSensitive getDescricao() {
		return descricao;
	}

	public void setDescricao(CaseSensitive descricao) {
		this.descricao = descricao;
	}

	public CaseSensitive getActionName() {
		return actionName;
	}

	public void setActionName(CaseSensitive actionName) {
		this.actionName = actionName;
	}

	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}
}