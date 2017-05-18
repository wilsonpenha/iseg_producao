package iseg.app.business;

import iseg.app.model.EdiImportacaoAnexo;
import iseg.app.model.LoteImportacao;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectService;

public interface IntegracaoService extends PObjectService{
	
	public PObject processaArquivoComissao(LoteImportacao obj, EdiImportacaoAnexo ediImportacaoAnexo) throws Exception;
	public PObject processaArquivoEmissao(LoteImportacao obj, EdiImportacaoAnexo ediImportacaoAnexo) throws Exception;
	
}
