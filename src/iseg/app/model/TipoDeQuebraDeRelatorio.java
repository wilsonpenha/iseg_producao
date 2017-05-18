package iseg.app.model;

public enum TipoDeQuebraDeRelatorio {

	POR_SEGURADORA("Por seguradora", "seguradora_razao_social"),
	POR_RAMO("Por ramo", "ramo_nome"),
	POR_GRUPO_DE_VENDA("Por grupo de venda", "nome_do_grupo"),
	POR_PRODUTOR("Por produtor", "produtor_nome");

	private String nome;
	private String campoParaOrdenacao;

	TipoDeQuebraDeRelatorio(String nome, String campoParaOrdenacao){
		this.nome = nome;
		this.campoParaOrdenacao = campoParaOrdenacao;
	}

	public String getNome() {
		return nome;
	}

	public String getCampoParaOrdenacao() {
		return campoParaOrdenacao;
	}
}