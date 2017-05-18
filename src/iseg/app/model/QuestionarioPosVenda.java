package iseg.app.model;

import static javax.persistence.FetchType.LAZY;
import static javax.persistence.GenerationType.SEQUENCE;

import iseg.app.persistence.PObject;

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

import org.hibernate.annotations.Filter;
import org.hibernate.annotations.FilterDef;
import org.hibernate.annotations.ParamDef;


@Entity
@Table(name="questionario_pos_venda")
@FilterDef(name="corretoraFilter", parameters={@ParamDef(name="corretoraParam", type="long"),@ParamDef(name="assessoriaIdParam", type="long"),@ParamDef(name="isAssessoriaParam", type="boolean")})    
@Filter(name="corretoraFilter", condition="((:isAssessoriaParam = 'true' and corretora_id in (select c.id from corretora c where c.assessoria_id = :assessoriaIdParam and c.is_assessorada = 'true')) or corretora_id = :corretoraParam  or is_generic='true')")    
@NamedQueries({
	@NamedQuery(name="getCountQuestionarioPosVenda", query="SELECT Count(*) FROM QuestionarioPosVenda b"),
	@NamedQuery(name="getQuestionarioPosVenda", query="SELECT b FROM QuestionarioPosVenda b")
	})
public class QuestionarioPosVenda extends PObject implements Serializable, AtributoCorretora {
	@Id
	@GeneratedValue(strategy=SEQUENCE)
	@SequenceGenerator(name="QTN_SEQ",sequenceName="APP_SEQ")
	private Long id;

	private String pergunta;

	@Column(name="is_ativo")
	private Boolean isAtivo;

	@Column(name="TIPO_RESPOSTA")
	private Long tipoResposta;

	@ManyToOne(fetch=LAZY)
	private Corretora corretora;

	private static final long serialVersionUID = 1L;

	public QuestionarioPosVenda() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getPergunta() {
		return this.pergunta;
	}

	public void setPergunta(String pergunta) {
		this.pergunta = pergunta;
	}

	public Boolean getIsAtivo() {
		return this.isAtivo;
	}

	public void setIsAtivo(Boolean isAtivo) {
		this.isAtivo = isAtivo;
	}

	public Long getTipoResposta() {
		return tipoResposta;
	}

	public void setTipoResposta(Long tipoResposta) {
		this.tipoResposta = tipoResposta;
	}

	public Corretora getCorretora() {
		return corretora;
	}

	public void setCorretora(Corretora corretora) {
		this.corretora = corretora;
	}

}
