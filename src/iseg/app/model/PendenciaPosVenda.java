package iseg.app.model;

import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.persistence.PObject;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name="pendencia_pos_venda")
@NamedQueries({
	@NamedQuery(name="getCountPendenciaPosVenda", query="SELECT Count(*) FROM PendenciaPosVenda b"),
	@NamedQuery(name="getPendenciaPosVenda", query="SELECT b FROM PendenciaPosVenda b"),
	@NamedQuery(name="getPendenciaPosVendaEmAberto", query="SELECT b FROM PendenciaPosVenda b where b.posVenda.id = ?0 and dataBaixa is null")
	})
public class PendenciaPosVenda extends PObject implements Serializable {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="PEDV_SEQ",sequenceName="APP_SEQ")
	private Long id;

	private String descricao;

	private String acao;

	@Column(name="data_abertura")
	@Temporal(TemporalType.DATE)
	private Date dataAbertura;

	@Column(name="data_baixa")
	@Temporal(TemporalType.DATE)
	private Date dataBaixa;

	@ManyToOne
	@JoinColumn(name="pos_venda_id")
	private PosVenda posVenda;

	@ManyToOne
	private Usuario usuario;

	private static final long serialVersionUID = 1L;

	public PendenciaPosVenda() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public PosVenda getPosVenda() {
		return this.posVenda;
	}

	public void setPosVenda(PosVenda posVenda) {
		this.posVenda = posVenda;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getAcao() {
		return acao;
	}

	public void setAcao(String acao) {
		this.acao = acao;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Date getDataAbertura() {
		return dataAbertura;
	}

	public void setDataAbertura(Date dataAbertura) {
		this.dataAbertura = dataAbertura;
	}

	public Date getDataBaixa() {
		return dataBaixa;
	}

	public void setDataBaixa(Date dataBaixa) {
		this.dataBaixa = dataBaixa;
	}

}
