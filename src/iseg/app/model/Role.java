package iseg.app.model;

import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.Filter;
import org.hibernate.annotations.FilterDef;
import org.hibernate.annotations.ParamDef;


@Entity
@FilterDef(name="corretoraFilter", parameters={@ParamDef(name="corretoraParam", type="long"),@ParamDef(name="assessoriaIdParam", type="long"),@ParamDef(name="isAssessoriaParam", type="boolean")})    
@Filter(name="corretoraFilter", condition="(corretora_id = :corretoraParam)")    
@NamedQueries({
	@NamedQuery(name="getCountRole", query="SELECT Count(*) FROM Role m"),
	@NamedQuery(name="getRole", query="SELECT m FROM Role m"),
	@NamedQuery(name="getRoleByCorretora", query="SELECT r FROM Role r where r.corretora.id = ?0")
	})
public class Role extends PObject implements Serializable, AtributoCorretora {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="ROL_SEQ", sequenceName = "APP_SEQ")
	private Long id;

	private String nome;

	@Column(name="is_ativo")
	private Boolean isAtivo;

	@OneToMany(mappedBy="role",fetch = FetchType.LAZY)
	private List<MenuRole> menuRoleCollection;

	@OneToMany(mappedBy="role",fetch = FetchType.LAZY)
	private List<AcessoRole> acessoRoleCollection;

	@OneToMany(mappedBy="role",fetch = FetchType.LAZY)
	private List<Usuario> usuarioCollection;

	@ManyToOne(fetch=FetchType.EAGER)
	private Corretora corretora;

	private static final long serialVersionUID = 1L;

	public Role() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Boolean getIsAtivo() {
		return this.isAtivo;
	}

	public void setIsAtivo(Boolean isAtivo) {
		this.isAtivo = isAtivo;
	}

	public List<MenuRole> getMenuRoleCollection() {
		return this.menuRoleCollection;
	}

	public void setMenuRoleCollection(List<MenuRole> menuRoleCollection) {
		this.menuRoleCollection = menuRoleCollection;
	}

	public List<AcessoRole> getAcessoRoleCollection() {
		return this.acessoRoleCollection;
	}

	public void setAcessoRoleCollection(List<AcessoRole> acessoRoleCollection) {
		this.acessoRoleCollection = acessoRoleCollection;
	}

	public List<Usuario> getUsuarioCollection() {
		return usuarioCollection;
	}

	public void setUsuarioCollection(List<Usuario> usuarioCollection) {
		this.usuarioCollection = usuarioCollection;
	}

	public Corretora getCorretora() {
		return corretora;
	}

	public void setCorretora(Corretora corretora) {
		this.corretora = corretora;
	}

}
