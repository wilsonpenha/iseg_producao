package iseg.app.business;

import iseg.app.model.BorderoLancamento;
import iseg.app.model.Proposta;
import iseg.app.model.PropostaComissao;
import iseg.app.persistence.PObjectService;

import java.util.List;



public interface PropostaComissaoService extends PObjectService{

	public void removePropostaComissao(List<Long>idsPropostaComissao) throws Exception;
	public boolean baixaComissao(PropostaComissao propostaComissao, double valorPago, BorderoLancamento lancamento) throws Exception;
	public boolean estornaComissao(PropostaComissao propostaComissao, BorderoLancamento lancamento) throws Exception;
	public boolean baixaComissao(List<BorderoLancamento> borderoLancamentoList, boolean fecharLote) throws Exception;
	public boolean gerarComissoes(Proposta proposta) throws Exception;
	public boolean cancelarComissoes(Proposta proposta) throws Exception;
	public boolean recuperarComissoes(Proposta proposta) throws Exception;
	public boolean gerarComissoesEmpresarial(Proposta proposta) throws Exception;
	public void gerarRepassesFaltantes();
	
}
