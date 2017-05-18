package iseg.app.business;

import iseg.app.exception.GenericException;
import iseg.app.model.Corretora;
import iseg.app.model.EdiImportacaoAnexo;
import iseg.app.model.LoteImportacao;
import iseg.app.model.Seguradora;
import iseg.app.persistence.PObjectService;

import java.util.Date;
import java.util.List;

public interface ProcessarIntegracaoService extends PObjectService {
	
	public void processarArquivoComissao() throws Exception;
	public void processarArquivoEmissao() throws Exception;
	public List<EdiImportacaoAnexo> ediImportacaoAnexoListSearch(Seguradora seguradora, Date dataInicial, Date dataFinal, Integer tipo, Corretora corretora) throws GenericException;
	public List<LoteImportacao> pesquisaLoteImportacao(Corretora corretora);
	
}
