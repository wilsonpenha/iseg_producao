package iseg.app.model;

import static javax.persistence.GenerationType.SEQUENCE;
import iseg.app.persistence.PObject;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="ACESSO_SEGURADORA")
@NamedQueries({
	@NamedQuery(name="getAcessoSeguradora", query="SELECT p FROM AcessoSeguradora p"),
	@NamedQuery(name="getAcessoSeguradoraByCorretoraAndSeguradora", query="SELECT p FROM AcessoSeguradora p where p.corretora.id=?0 and p.seguradora.id=?1")})
public class AcessoSeguradora extends PObject {

	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="ACSS_SEQ", sequenceName = "ACSS_SEQ")
	private Long id;

	@Column(name="codigo_corretor")
	private String codigoCorretor;

	private String senha;

	@ManyToOne(fetch=FetchType.EAGER)
	private Corretora corretora;
	
	@ManyToOne(fetch=FetchType.EAGER)
	private Seguradora seguradora;

	@Column(name="codigo_aux1")
	private String codigoAux1;
	
	@Column(name="codigo_aux2")
	private String codigoAux2;

	@Column(name="codigo_aux3")
	private String codigoAux3;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCodigoCorretor() {
		return codigoCorretor;
	}

	public void setCodigoCorretor(String codigoCorretor) {
		this.codigoCorretor = codigoCorretor;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
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

	public String getCodigoAux1() {
		return codigoAux1;
	}

	public void setCodigoAux1(String codigoAux1) {
		this.codigoAux1 = codigoAux1;
	}

	public String getCodigoAux2() {
		return codigoAux2;
	}

	public void setCodigoAux2(String codigoAux2) {
		this.codigoAux2 = codigoAux2;
	}

	public String getCodigoAux3() {
		return codigoAux3;
	}

	public void setCodigoAux3(String codigoAux3) {
		this.codigoAux3 = codigoAux3;
	}
	
}
