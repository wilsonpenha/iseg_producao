package iseg.app.model;

import iseg.app.persistence.PObject;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name="servicos_email")
@NamedQueries({
	@NamedQuery(name="getServicosEmail", query="SELECT a FROM ServicosEmail a")
})
public class ServicosEmail extends PObject implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private Long id;
	
	private String host;
	
	private Integer porta;
	
	private String protocolo;
	
	@Column(name="email_servidor")
	private String emailServidor;
	
	@Column(name="senha_email_servidor")
	private String senhaEmailServidor;
	
	@Column(name="is_autenticacao")
	private Boolean isAutenticacao;
	
	@Column(name="email_corretora")
	private String emailCorretora;
	
	@ManyToOne
	@JoinColumn(name="corretora_id")
	private Corretora corretora;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getHost() {
		return host;
	}
	public void setHost(String host) {
		this.host = host;
	}
	public Integer getPorta() {
		return porta;
	}
	public void setPorta(Integer porta) {
		this.porta = porta;
	}
	public String getProtocolo() {
		return protocolo;
	}
	public void setProtocolo(String protocolo) {
		this.protocolo = protocolo;
	}
	public String getEmailServidor() {
		return emailServidor;
	}
	public void setEmailServidor(String emailServidor) {
		this.emailServidor = emailServidor;
	}
	public String getSenhaEmailServidor() {
		return senhaEmailServidor;
	}
	public void setSenhaEmailServidor(String senhaEmailServidor) {
		this.senhaEmailServidor = senhaEmailServidor;
	}
	public Boolean getIsAutenticacao() {
		return isAutenticacao;
	}
	public void setIsAutenticacao(Boolean isAutenticacao) {
		this.isAutenticacao = isAutenticacao;
	}
	public String getEmailCorretora() {
		return emailCorretora;
	}
	public void setEmailCorretora(String emailCorretora) {
		this.emailCorretora = emailCorretora;
	}
	public Corretora getCorretora() {
		return corretora;
	}
	public void setCorretora(Corretora corretora) {
		this.corretora = corretora;
	}

}
