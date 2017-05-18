package iseg.app.model;

public enum TipoDeRelatorioDeComparativoMensal implements TipoDeRelatorio {

	RANKING_DE_PRODUTOR("Ranking de produtor", "RelRankingProdutor.jasper"),
	RANKING_DE_SEGURADORA("Ranking de seguradora", "RelRankingSeguradora.jasper"),
	RANKING_DE_GRUPO_DE_VENDA("Ranking de grupo de venda", "RelRankingGrupoVenda.jasper"),
	RANKING_DE_RAMO("Ranking de ramo", "RelRankingRamo.jasper");
	
	private String nome;
	private String nomeDoArquivoDoRelatorio;

	TipoDeRelatorioDeComparativoMensal(String nome, String nomeDoArquivoDoRelatorio){
		this.nome = nome;
		this.nomeDoArquivoDoRelatorio = nomeDoArquivoDoRelatorio;
	}

	public String getNome() {
		return nome;
	}
	
	public String getNomeDoArquivoDoRelatorio() {
		return nomeDoArquivoDoRelatorio;
	}
}
