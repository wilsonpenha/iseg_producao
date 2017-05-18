package iseg.app.model;

import iseg.app.persistence.PObjectLog;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

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

@Entity
@Table(name="edi_importacao_config")
@NamedQueries({
	@NamedQuery(name="getImportacaoEdiConfigById", query="SELECT a FROM ImportacaoEdiConfig a WHERE a.id = ?0"),
	@NamedQuery(name="getImportacaoEdiConfig", query="SELECT a FROM ImportacaoEdiConfig a")
})
public class ImportacaoEdiConfig extends PObjectLog {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private Long id;

	@Column(name="versao_layoute")
	private String versaoLayoute;

	@Column(name="dt_vigencia_inicial")
	private Timestamp dtVigenciaInicial;

	@Column(name="dt_vigencia_final")
	private Timestamp dtVigenciaFinal;

	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="seguradora_id")
	private Seguradora seguradora;
	
	@OneToMany(mappedBy="importacaoEdiConfig", fetch=FetchType.LAZY)
	private List<ImportacaoEdiArquivo> importacaoEdiArquivoCollection = new ArrayList<ImportacaoEdiArquivo>(); 

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getVersaoLayoute() {
		return versaoLayoute;
	}

	public void setVersaoLayoute(String versaoLayoute) {
		this.versaoLayoute = versaoLayoute;
	}

	public Timestamp getDtVigenciaInicial() {
		return dtVigenciaInicial;
	}

	public void setDtVigenciaInicial(Timestamp dtVigenciaInicial) {
		this.dtVigenciaInicial = dtVigenciaInicial;
	}

	public Timestamp getDtVigenciaFinal() {
		return dtVigenciaFinal;
	}

	public void setDtVigenciaFinal(Timestamp dtVigenciaFinal) {
		this.dtVigenciaFinal = dtVigenciaFinal;
	}

	public Seguradora getSeguradora() {
		return seguradora;
	}

	public void setSeguradora(Seguradora seguradora) {
		this.seguradora = seguradora;
	}

	public List<ImportacaoEdiArquivo> getImportacaoEdiArquivoCollection() {
		return importacaoEdiArquivoCollection;
	}

	public void setImportacaoEdiArquivoCollection(
			List<ImportacaoEdiArquivo> importacaoEdiArquivoCollection) {
		this.importacaoEdiArquivoCollection = importacaoEdiArquivoCollection;
	}

}
