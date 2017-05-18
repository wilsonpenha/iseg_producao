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
@Table(name="template_mensagem")
@NamedQueries({
	@NamedQuery(name="getTemplateMensagemByCorretoraAndInmidia", query="SELECT a FROM TemplateMensagem a WHERE a.corretora.id = ?0 AND a.inmidia = ?1"),
	@NamedQuery(name="updateTemplateMensagemRemovendoIsPadraoByCorretora", query="UPDATE TemplateMensagem a SET a.isPadrao = false WHERE a.corretora.id = ?0")
})
public class TemplateMensagem extends PObject implements Serializable {
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private Long id;
	
	private String assunto;
	
	@Column(name="corpo_texto")
	private String corpoTexto;
	
	private Integer inmidia;
	
	@Column(name="is_padrao")
	private Boolean isPadrao;
	
	@ManyToOne
	@JoinColumn(name="tipo_mensagem_id")
	private TipoMensagem tipoMensagem;
	
	@ManyToOne
	@JoinColumn(name="corretora_id")
	private Corretora corretora;
	
	private Boolean status;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getAssunto() {
		return assunto;
	}

	public void setAssunto(String assunto) {
		this.assunto = assunto;
	}

	public String getCorpoTexto() {
		return corpoTexto;
	}

	public void setCorpoTexto(String corpoTexto) {
		this.corpoTexto = corpoTexto;
	}

	public Integer getInmidia() {
		return inmidia;
	}

	public void setInmidia(Integer inmidia) {
		this.inmidia = inmidia;
	}

	public TipoMensagem getTipoMensagem() {
		return tipoMensagem;
	}

	public void setTipoMensagem(TipoMensagem tipoMensagem) {
		this.tipoMensagem = tipoMensagem;
	}

	public Corretora getCorretora() {
		return corretora;
	}

	public void setCorretora(Corretora corretora) {
		this.corretora = corretora;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	public Boolean getIsPadrao() {
		return isPadrao;
	}

	public void setIsPadrao(Boolean isPadrao) {
		this.isPadrao = isPadrao;
	}
	
}
