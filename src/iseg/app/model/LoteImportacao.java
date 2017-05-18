package iseg.app.model;

import iseg.app.constants.Constants;
import iseg.app.persistence.PObjectLog;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="lote_importacao")
@NamedQueries({
	@NamedQuery(name="getLoteImportacaoBySituacao", query="SELECT a FROM LoteImportacao a WHERE a.situacao = ?0"),
	@NamedQuery(name="getLoteImportacaoByCorretora", query="SELECT a FROM LoteImportacao a WHERE a.corretora.id = ?0 ORDER BY a.id DESC")
})
public class LoteImportacao extends PObjectLog implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private Long id;

	@Column(name="descricao")
	private String descricao;

	private Integer situacao;

	@Column(name="dt_inicio_processamento")
	private Timestamp dtInicioProcessamento;

	@Column(name="dt_final_processamento")
	private Timestamp dtFinalProcessamento;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="corretora_id")
	private Corretora corretora;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="seguradora_id")
	private Seguradora seguradora;
	
	@OneToMany(mappedBy="loteImportacao",cascade=CascadeType.ALL,fetch=FetchType.LAZY)
	private List<EdiImportacaoAnexo> ediImportacaoAnexoCollection = new ArrayList<EdiImportacaoAnexo>();
	
	@Transient
	private String situacaoDescricao;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Integer getSituacao() {
		return situacao;
	}

	public void setSituacao(Integer situacao) {
		this.situacao = situacao;
	}

	public Timestamp getDtInicioProcessamento() {
		return dtInicioProcessamento;
	}

	public void setDtInicioProcessamento(Timestamp dtInicioProcessamento) {
		this.dtInicioProcessamento = dtInicioProcessamento;
	}

	public Timestamp getDtFinalProcessamento() {
		return dtFinalProcessamento;
	}

	public void setDtFinalProcessamento(Timestamp dtFinalProcessamento) {
		this.dtFinalProcessamento = dtFinalProcessamento;
	}

	public Corretora getCorretora() {
		return corretora;
	}

	public void setCorretora(Corretora corretora) {
		this.corretora = corretora;
	}

	public Seguradora getSeguradora() {
		return seguradora;
	}

	public void setSeguradora(Seguradora seguradora) {
		this.seguradora = seguradora;
	}

	public List<EdiImportacaoAnexo> getEdiImportacaoAnexoCollection() {
		return ediImportacaoAnexoCollection;
	}

	public void setEdiImportacaoAnexoCollection(
			List<EdiImportacaoAnexo> ediImportacaoAnexoCollection) {
		this.ediImportacaoAnexoCollection = ediImportacaoAnexoCollection;
	}

	public String getSituacaoDescricao() {
		return Constants.getSituacaoImportacaoDescricao(this.situacao);
	}

	public void setSituacaoDescricao(String situacaoDescricao) {
		this.situacaoDescricao = situacaoDescricao;
	}

}