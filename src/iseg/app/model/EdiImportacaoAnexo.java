package iseg.app.model;

import java.io.Serializable;

import iseg.app.constants.Constants;
import iseg.app.persistence.PObject;

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
import javax.persistence.Table;

@Entity
@Table(name="edi_importacao_anexo")
@NamedQueries({
	@NamedQuery(name="getEdiImportacaoAnexo", query="SELECT a FROM EdiImportacaoAnexo a"),
	@NamedQuery(name="getEdiImportacaoAnexoByLoteImportacaoByCorretora", query="SELECT a FROM EdiImportacaoAnexo a WHERE a.loteImportacao.corretora.id = ?0")
	
})
public class EdiImportacaoAnexo extends PObject implements Serializable {
	
	private static final long serialVersionUID = 551304733172131884L;

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private Long id;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="arquivo_byte_id")
	private ArquivoByte arquivoByte;
	
	@Column(name="nome_arquivo")
	private String nomeArquivo;
	
	@Column(name="ext_arquivo")
	private String extArquivo;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="lote_importacao_id")
	private LoteImportacao loteImportacao;
	
	@Column(name="tipo_arquivo")
	private Integer tipoArquivo;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public ArquivoByte getArquivoByte() {
		return arquivoByte;
	}

	public void setArquivoByte(ArquivoByte arquivoByte) {
		this.arquivoByte = arquivoByte;
	}

	public LoteImportacao getLoteImportacao() {
		return loteImportacao;
	}

	public void setLoteImportacao(LoteImportacao loteImportacao) {
		this.loteImportacao = loteImportacao;
	}

	public Integer getTipoArquivo() {
		return tipoArquivo;
	}

	public void setTipoArquivo(Integer tipoArquivo) {
		this.tipoArquivo = tipoArquivo;
	}

	public String getNomeArquivo() {
		return nomeArquivo;
	}

	public void setNomeArquivo(String nomeArquivo) {
		this.nomeArquivo = nomeArquivo;
	}

	public String getExtArquivo() {
		return extArquivo;
	}

	public void setExtArquivo(String extArquivo) {
		this.extArquivo = extArquivo;
	}
	
	public String getTipoArquivoDescricao(){
		return Constants.getTipoLoteImportacaoDescricao(this.tipoArquivo);
	}

}
