package iseg.app.model;

public enum TipoDeRelatorioDeMixDeVendas implements TipoDeRelatorio {

	RAMO_X_PRODUTOR("Ramo X Produtor", "RelRankingRamoXProdutor.jasper"),
	RAMO_X_SEGURADORA("Ramo X Seguradora", "RelRankingRamoXSeguradora.jasper"),
	RAMO_X_GRUPO("Ramo X Grupo", "RelRankingRamoXGrupoVenda.jasper");
	
	private String nome;
	private String nomeDoArquivoDoRelatorio;

	TipoDeRelatorioDeMixDeVendas(String nome, String nomeDoArquivoDoRelatorio){
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
