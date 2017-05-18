package iseg.app.model;

import static javax.persistence.CascadeType.REFRESH;
import static javax.persistence.CascadeType.REMOVE;
import static javax.persistence.FetchType.LAZY;
import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.conversion.CaseSensitive;
import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.util.List;

import javax.persistence.AttributeOverride;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.Filter;
import org.hibernate.annotations.FilterDef;
import org.hibernate.annotations.ParamDef;


@Entity
@FilterDef(name="menuRoleFilter", parameters={@ParamDef(name="roleParam", type="long"),@ParamDef(name="isAdminParam", type="boolean")})    
@Filter(name="menuRoleFilter", condition="(:isAdminParam = 'false' and id in (select mr.menu_id from menu_role mr where mr.role_id = :roleParam) or :isAdminParam = 'true')")    
@NamedQueries({
	@NamedQuery(name="getCountMenu", query="SELECT Count(*) FROM Menu m"),
	@NamedQuery(name="getMenu", query="SELECT m FROM Menu m ORDER BY m.nivel, m.ordem"),
	@NamedQuery(name="getMenuPai", query="SELECT m FROM Menu m WHERE m.pai is null ORDER BY m.ordem"),
	@NamedQuery(name="getMenuPorPai", query="SELECT m FROM Menu m WHERE m.pai.id = ?0 ORDER BY m.nivel, m.ordem"),
	@NamedQuery(name="getMaxOrdem", query="select max(m.ordem) from Menu m where m.pai.id = ?0")
	})
public class Menu extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="MENU_SEQ", sequenceName = "APP_SEQ")
	private Long id;

	@Embedded
	@AttributeOverride(name="valor", column=@Column(name="NOME"))
	private CaseSensitive nome;

	private Integer nivel;

	private Integer master;

	@AttributeOverride(name="valor", column=@Column(name="DESCRICAO"))
	private CaseSensitive descricao;

	private Integer ordem;

	@AttributeOverride(name="valor", column=@Column(name="ACTION"))
	private CaseSensitive acao;

	@Column(name="is_restrito")
	private Boolean isRestrito;

	@ManyToOne
	private Menu pai;

	@OneToMany(mappedBy="pai")
	@OrderBy("ordem")
	private List<Menu> menuCollection;

	@OneToMany(mappedBy="menu")
	private List<AcessoUsuario> acessoUsuarioCollection;

	@OneToMany(mappedBy="menu")
	private List<MenuRole> menuRoleCollection;

	@OneToMany(mappedBy="menu", fetch = LAZY, cascade = { REMOVE, REFRESH })
	private List<Acao> acaoCollection;

	private static final long serialVersionUID = 1L;

	public Menu() {
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

	public Integer getNivel() {
		return this.nivel;
	}

	public void setNivel(Integer nivel) {
		this.nivel = nivel;
	}

	public Integer getMaster() {
		return this.master;
	}

	public void setMaster(Integer master) {
		this.master = master;
	}

	public CaseSensitive getDescricao() {
		return this.descricao;
	}

	public void setDescricao(CaseSensitive descricao) {
		this.descricao = descricao;
	}

	public Integer getOrdem() {
		return this.ordem;
	}

	public void setOrdem(Integer ordem) {
		this.ordem = ordem;
	}

	public CaseSensitive getAcao() {
		return this.acao;
	}

	public void setAcao(CaseSensitive acao) {
		this.acao = acao;
	}

	public Boolean getIsRestrito() {
		return this.isRestrito;
	}

	public void setIsRestrito(Boolean isRestrito) {
		this.isRestrito = isRestrito;
	}

	public Menu getPai() {
		return this.pai;
	}

	public void setPai(Menu pai) {
		this.pai = pai;
	}

	@Filter(name="menuRoleFilter", condition="(:isAdminParam = 'false' and id in (select m.menu_id from menu_role m where m.role_id = :roleParam) or :isAdminParam = 'true')")    
	public List<Menu> getMenuCollection() {
		return this.menuCollection;
	}

	public void setMenuCollection(List<Menu> menuCollection) {
		this.menuCollection = menuCollection;
	}

	public List<AcessoUsuario> getAcessoUsuarioCollection() {
		return this.acessoUsuarioCollection;
	}

	public void setAcessoUsuarioCollection(List<AcessoUsuario> acessoUsuarioCollection) {
		this.acessoUsuarioCollection = acessoUsuarioCollection;
	}

	public List<MenuRole> getMenuRoleCollection() {
		return this.menuRoleCollection;
	}

	public void setMenuRoleCollection(List<MenuRole> menuRoleCollection) {
		this.menuRoleCollection = menuRoleCollection;
	}

	public List<Acao> getAcaoCollection() {
		return acaoCollection;
	}

	public void setAcaoCollection(List<Acao> acaoCollection) {
		this.acaoCollection = acaoCollection;
	}

}
