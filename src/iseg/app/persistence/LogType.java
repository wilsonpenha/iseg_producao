package iseg.app.persistence;


import iseg.app.model.Usuario;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Embeddable
public class LogType {
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="log_autor", nullable=true, updatable=false)
	private Usuario autor;

	@Column(name="log_dtCriacao", columnDefinition = "datetime default getdate()", nullable=false, updatable=false)
	@org.hibernate.annotations.Generated(org.hibernate.annotations.GenerationTime.INSERT)
	private Timestamp dtCriacao;

	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="log_editor", nullable=true)
	private Usuario editor;

	@Column(name="log_dtEdicao", nullable=false)
	private Timestamp dtEdicao;

	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="log_excluidoPor", nullable=true)
	private Usuario excluidoPor;

	@Column(name="log_dtExclusao", nullable=true)
	private Timestamp dtExclusao;
	
	public LogType() {
		super();
	}

	public LogType(Usuario autor, Timestamp dtCriacao, Usuario editor, Timestamp dtEdicao) {
		super();
		this.autor = autor;
		this.dtCriacao = dtCriacao;
		this.editor = editor;
		this.dtEdicao = dtEdicao;
	}

	public Usuario getAutor() {
		return autor;
	}
	public void setAutor(Usuario autor) {
		this.autor = autor;
	}
	
	public Timestamp getDtCriacao() {
		return dtCriacao;
	}
	public void setDtCriacao(Timestamp dtCriacao) {
		this.dtCriacao = dtCriacao;
	}

	public Usuario getEditor() {
		return editor;
	}
	public void setEditor(Usuario editor) {
		this.editor = editor;
	}
	
	public Timestamp getDtEdicao() {
		return dtEdicao;
	}
	public void setDtEdicao(Timestamp dtEdicao) {
		this.dtEdicao = dtEdicao;
	}
	
	public Usuario getExcluidoPor() {
		return excluidoPor;
	}
	public void setExcluidoPor(Usuario excluidoPor) {
		this.excluidoPor = excluidoPor;
	}
	
	public Timestamp getDtExclusao() {
		return dtExclusao;
	}
	public void setDtExclusao(Timestamp dtExclusao) {
		this.dtExclusao = dtExclusao;
	}	
}
