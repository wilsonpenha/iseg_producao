package iseg.app.model;

import static javax.persistence.FetchType.LAZY;
import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.persistence.PObject;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;


@Entity
@Table(name="operadores_pos_venda")
@NamedQueries({
	@NamedQuery(name="getCountOperadoresPosVenda", query="SELECT Count(*) FROM OperadoresPosVenda b"),
	@NamedQuery(name="getOperadoresByGrupoDeVenda", query="SELECT b FROM OperadoresPosVenda b where b.grupoDeVenda.id = ?0"),
	@NamedQuery(name="getOperadoresPosVenda", query="SELECT b FROM OperadoresPosVenda b")
	})
public class OperadoresPosVenda extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="OPVD_SEQ",sequenceName="APP_SEQ")
	private Long id;

	@ManyToOne(fetch=LAZY)
	@JoinColumn(name="grupo_de_venda_id", referencedColumnName = "id")
	private GrupoDeVenda grupoDeVenda;

	@ManyToOne(fetch=FetchType.LAZY, cascade={CascadeType.REFRESH})
	private Usuario usuario;

	@Column(name="is_ativo")
	private Boolean isAtivo;

	@Column(name="is_ativar_notificacao")
	private Boolean isAtivarNotificacao;

	private static final long serialVersionUID = 1L;

	public OperadoresPosVenda() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public GrupoDeVenda getGrupoDeVenda() {
		return this.grupoDeVenda;
	}

	public void setGrupoDeVenda(GrupoDeVenda grupoDeVenda) {
		this.grupoDeVenda = grupoDeVenda;
	}

	public Usuario getUsuario() {
		return this.usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Boolean getIsAtivo() {
		return this.isAtivo;
	}

	public void setIsAtivo(Boolean isAtivo) {
		this.isAtivo = isAtivo;
	}

	public Boolean getIsAtivarNotificacao() {
		return this.isAtivarNotificacao;
	}

	public void setIsAtivarNotificacao(Boolean isAtivarNotificacao) {
		this.isAtivarNotificacao = isAtivarNotificacao;
	}

}
