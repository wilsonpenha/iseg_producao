package iseg.app.model;

import iseg.app.persistence.PObjectLog;

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
@Table(name="edi_importacao_tipo")
@NamedQueries({
	@NamedQuery(name="getImportacaoEdiTipo", query="SELECT a FROM ImportacaoEdiTipo a")
})
public class ImportacaoEdiTipo extends PObjectLog {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private Long id;

	@Column(name="tipo_item_edi")
	private String tipoItemEdi;

	@ManyToOne
	@JoinColumn(name="importacao_edi_arquivo_id")
	private ImportacaoEdiArquivo importacaoEdiArquivo;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTipoItemEdi() {
		return tipoItemEdi;
	}

	public void setTipoItemEdi(String tipoItemEdi) {
		this.tipoItemEdi = tipoItemEdi;
	}

	public ImportacaoEdiArquivo getImportacaoEdiArquivo() {
		return importacaoEdiArquivo;
	}

	public void setImportacaoEdiArquivo(ImportacaoEdiArquivo importacaoEdiArquivo) {
		this.importacaoEdiArquivo = importacaoEdiArquivo;
	}

}
