package iseg.app.model;

import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.persistence.PObject;
import iseg.utils.ImageUtil;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.Serializable;

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


@Entity
@NamedQueries({
	@NamedQuery(name="propostaAnexoFindAll", query = "SELECT ans FROM PropostaAnexo ans")})
@Table(name="PROPOSTA_ANEXO")
public class PropostaAnexo extends PObject implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="PANS_SEQ",sequenceName="APP_SEQ")
	private Long id;

	@Column(name="CONTENT_TYPE")
	private String contentType;

	@Column(name="nome")
	private String nome;

	@ManyToOne
	private Proposta proposta;
	
	@ManyToOne
	@JoinColumn(name="orcamento_seguradora_id")
	private OrcamentoSeguradora orcamentoSeguradora;

	private byte[] anexo;

	public PropostaAnexo() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Proposta getProposta() {
		return proposta;
	}

	public void setProposta(Proposta proposta) {
		this.proposta = proposta;
	}

	public byte[] getAnexo() {
		return anexo;
	}

	public void setAnexo(byte[] anexo) {
		this.anexo = anexo;
	}
	
	public InputStream getAnexoStream(){
		/*byte[] bytes = new byte[this.getAnexo().length];
		for(int i=0 ; i<this.getAnexo().length ; i++){
			bytes[i] = this.getAnexo()[i].byteValue();
		}*/
		return new ByteArrayInputStream(this.getAnexo());
	}
	
	public InputStream getAnexoMiniaturaStream(){
		/*byte[] bytes = new byte[this.getAnexo().length];
		for(int i=0 ; i<this.getAnexo().length ; i++){
			bytes[i] = this.getAnexo()[i].byteValue();
		}*/
		//return new ByteArrayInputStream(this.getAnexo());
		return new ByteArrayInputStream(new ImageUtil().getMiniIcon(this.getAnexo(), 75, contentType));
	}
	
	public InputStream getAnexoGalleryStream(){
		/*byte[] bytes = new byte[this.getAnexo().length];
		for(int i=0 ; i<this.getAnexo().length ; i++){
			bytes[i] = this.getAnexo()[i].byteValue();
		}*/
		//return new ByteArrayInputStream(this.getAnexo());
		return new ByteArrayInputStream(new ImageUtil().getMiniIcon(this.getAnexo(), 500, contentType));
	}

	public OrcamentoSeguradora getOrcamentoSeguradora() {
		return orcamentoSeguradora;
	}

	public void setOrcamentoSeguradora(OrcamentoSeguradora orcamentoSeguradora) {
		this.orcamentoSeguradora = orcamentoSeguradora;
	}
}