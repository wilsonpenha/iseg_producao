package iseg.app.business;

import iseg.app.model.BorderoComissao;
import iseg.app.persistence.PObjectService;

import java.util.List;


public interface BorderoComissaoService extends PObjectService{
	public List<BorderoComissao> getBorderoComissaosForSearch(BorderoComissao borderoComissao, Integer page, Integer pageSize, String order) throws Exception;
	public Long getCountBorderoComissaosForSearch(BorderoComissao borderoComissao) throws Exception;
	public BorderoComissao gerarLoteEstorno(BorderoComissao borderoComissao) throws Exception;
	public BorderoComissao copiarLote(BorderoComissao borderoComissao) throws Exception;
}
