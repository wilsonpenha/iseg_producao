package iseg.app.business;

import iseg.app.model.RepasseComissao;
import iseg.app.model.Usuario;
import iseg.app.persistence.PObjectService;

import java.util.Date;
import java.util.List;



public interface RepasseComissaoService extends PObjectService{
	public void quitarRepasse(Long[] repasseIds, Date dataPagamento) throws Exception;
	public void quitarRepasse(Date inicioDataPagamento, Date fimDataPagamento, Long produtorId, Date dataPagamento) throws Exception;
	public Long getCountRepasseComissaosForSearch(RepasseComissao repasseComissao, Date inicioDataPagamento, Date fimDataPagamento, 
			Date inicioDataLancamento, Date fimDataLancamento, Integer situacao) throws Exception;
	public List<RepasseComissao> getRepasseComissaosForSearch(RepasseComissao repasseComissao, Date inicioDataPagamento, Date fimDataPagamento, 
			Date inicioDataLancamento, Date fimDataLancamento, Integer situacao, Integer page, Integer pageSize) throws Exception;
	public void estornarLancamento(RepasseComissao repasseComissao, Usuario usuarioEstorno) throws Exception;
}
