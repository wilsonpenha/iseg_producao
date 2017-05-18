package iseg.app.model;

import iseg.app.persistence.PObjectLog;

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
@Table(name="edi_importacao_arquivo")
@NamedQueries({
	@NamedQuery(name="getImportacaoEdiArquivo", query="SELECT a FROM ImportacaoEdiArquivo a")
})
public class ImportacaoEdiArquivo extends PObjectLog {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private Long id;

	private String descricao;

	private String formato;
	
	private String patch;

	private String xsd;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="importacao_edi_config_id")
	private ImportacaoEdiConfig importacaoEdiConfig;

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

	public String getFormato() {
		return formato;
	}

	public void setFormato(String formato) {
		this.formato = formato;
	}

	public String getPatch() {
		return patch;
	}

	public void setPatch(String patch) {
		this.patch = patch;
	}

	public String getXsd() {
		return xsd;
	}

	public void setXsd(String xsd) {
		this.xsd = xsd;
	}

	public ImportacaoEdiConfig getImportacaoEdiConfig() {
		return importacaoEdiConfig;
	}

	public void setImportacaoEdiConfig(ImportacaoEdiConfig importacaoEdiConfig) {
		this.importacaoEdiConfig = importacaoEdiConfig;
	}

}
