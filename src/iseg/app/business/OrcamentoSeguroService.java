package iseg.app.business;

import iseg.app.model.OrcamentoFranquias;
import iseg.app.model.OrcamentoSeguradora;
import iseg.app.model.OrcamentoSeguro;
import iseg.app.model.Proposta;
import iseg.app.persistence.PObjectService;

import java.util.List;



public interface OrcamentoSeguroService extends PObjectService {

	public List<OrcamentoSeguro> getOrcamentoSeguroForSearch(OrcamentoSeguro orcamentoSeguro, Integer page, Integer pageSize) throws Exception;
	public Long getCountOrcamentoSeguroForSearch(OrcamentoSeguro orcamentoSeguro) throws Exception;
	public void excluirOrcamentoSeguro(OrcamentoSeguro orcamentoSeguro) throws Exception;
	public Proposta gerarProposta(OrcamentoFranquias orcamentoFranquias, OrcamentoSeguradora orcamentoSeguradora) throws Exception;
}
