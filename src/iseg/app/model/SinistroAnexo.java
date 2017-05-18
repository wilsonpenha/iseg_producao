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
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;


@Entity
@NamedQueries({
	@NamedQuery(name="sinistroAnexoFindAll", query = "SELECT ans FROM SinistroAnexo ans")})
@Table(name="SINISTRO_ANEXO")
public class SinistroAnexo extends PObject implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="ANS_SEQ",sequenceName="APP_SEQ")
	private Long id;

	@Column(name="CONTENT_TYPE")
	private String contentType;

	private String nome;

	@ManyToOne
	private Sinistro sinistro;

	private byte[] anexo;

	public SinistroAnexo() {
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

	public Sinistro getSinistro() {
		return sinistro;
	}

	public void setSinistro(Sinistro sinistro) {
		this.sinistro = sinistro;
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
		return new ByteArrayInputStream(ImageUtil.resize(this.getAnexo(), 75, 1, contentType));
	}
	
	public InputStream getAnexoGalleryStream(){
		/*byte[] bytes = new byte[this.getAnexo().length];
		for(int i=0 ; i<this.getAnexo().length ; i++){
			bytes[i] = this.getAnexo()[i].byteValue();
		}*/
		return new ByteArrayInputStream(ImageUtil.resize(this.getAnexo(), 500, 1, contentType));
	}
}