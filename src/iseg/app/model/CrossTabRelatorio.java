package iseg.app.model;



public class CrossTabRelatorio{
	private String coluna;
	private String linha;
	private Object conteudo;
	private Integer sequencia;
	
	public String getColuna() {
		return coluna;
	}
	public void setColuna(String coluna) {
		this.coluna = coluna;
	}
	public String getLinha() {
		return linha;
	}
	public void setLinha(String linha) {
		this.linha = linha;
	}
	public Object getConteudo() {
		return conteudo;
	}
	public void setConteudo(Object conteudo) {
		this.conteudo = conteudo;
	}
	public Integer getSequencia() {
		return sequencia;
	}
	public void setSequencia(Integer sequencia) {
		this.sequencia = sequencia;
	}
}
