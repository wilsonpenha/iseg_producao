package iseg.app.model;

import static javax.persistence.FetchType.LAZY;
import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Transient;

import org.hibernate.annotations.Filter;
import org.hibernate.annotations.FilterDef;
import org.hibernate.annotations.ParamDef;


//(:isAssessoriaParam = 'true' and corretora_id in (select c.id from corretora c where c.assessoria_id = :assessoriaIdParam and c.is_assessorada = 'true')) or 

@Entity
@FilterDef(name="corretoraFilter", parameters={@ParamDef(name="corretoraParam", type="long"),@ParamDef(name="assessoriaIdParam", type="long"),@ParamDef(name="isAssessoriaParam", type="boolean")})    
@Filter(name="corretoraFilter", condition="(corretora_id = :corretoraParam)")    
@NamedQueries({
	@NamedQuery(name="getCountUsuario", query="SELECT Count(*) FROM Usuario u"),
	@NamedQuery(name="getUsuario", query="SELECT u FROM Usuario u ORDER BY u.nomeLogin"),
	@NamedQuery(name="getUsuariosByCorretora", query="SELECT u FROM Usuario u where u.corretora.id = ?0"),
	@NamedQuery(name="getUsuarioByNomeLogin", query="SELECT u FROM Usuario u WHERE u.nomeLogin = ?0 and u.corretora.cpfOuCnpj.valor = ?1")
	})
public class Usuario extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="USU_SEQ",sequenceName="APP_SEQ")
	private Long id;

	@Column(name="DATA_ULTIMO_ACESSO") 
	private Date dataUltimoAcesso;

	@Column(name="NOME_LOGIN",length=15)
	private String nomeLogin;

	@Column(name="UNIQUE_LOGIN",length=35)
	private String uniqueLogin;

	@Column(length=15)
	private String status;

	@Column(length=15)
	private String senha;

	@ManyToOne(fetch=LAZY)
	private Pessoa pessoa;

	@ManyToOne(fetch=FetchType.EAGER)
	private Corretora corretora;

	@ManyToOne(fetch=FetchType.EAGER)
	private Role role;

	private String email;
	
	@Column(name="restricao_endereco_ip",length=35)
	private String restricaoEnderecoIp;

	@Transient
	private String LoginEnderecoIP;

	private static final long serialVersionUID = 1L;

	public Usuario() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getDataUltimoAcesso() {
		return this.dataUltimoAcesso;
	}

	public void setDataUltimoAcesso(Date dataUltimoAcesso) {
		this.dataUltimoAcesso = dataUltimoAcesso;
	}

	public String getNomeLogin() {
		return this.nomeLogin;
	}

	public String getNomeLoginFull() {
		return this.nomeLogin +"@"+(this.corretora.getCpfOuCnpj()!=null ? this.corretora.getCpfOuCnpj().getValor():"00000000000000");
	}

	public void setNomeLogin(String nomeLogin) {
		this.nomeLogin = nomeLogin;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getSenha() {
		return this.senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public Pessoa getPessoa() {
		return this.pessoa;
	}

	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
	}

	public Corretora getCorretora() {
		return this.corretora;
	}

	public void setCorretora(Corretora corretora) {
		this.corretora = corretora;
	}

	public Role getRole() {
		return this.role;
	}

	public void setRole(Role role) {
		this.role = role;
	}
	
	public boolean isUsuarioDeAssessoria(){
		return corretora != null && corretora.ehAssessoria();
	}

	public String getUniqueLogin() {
		return uniqueLogin;
	}

	public void setUniqueLogin(String uniqueLogin) {
		this.uniqueLogin = uniqueLogin;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRestricaoEnderecoIp() {
		return restricaoEnderecoIp;
	}

	public void setRestricaoEnderecoIp(String restricaoEnderecoIp) {
		this.restricaoEnderecoIp = restricaoEnderecoIp;
	}

	public String getLoginEnderecoIP() {
		return LoginEnderecoIP;
	}

	public void setLoginEnderecoIP(String loginEnderecoIP) {
		LoginEnderecoIP = loginEnderecoIP;
	}
}