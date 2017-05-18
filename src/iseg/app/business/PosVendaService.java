package iseg.app.business;

import iseg.app.model.PosVenda;
import iseg.app.persistence.PObjectService;

import java.util.List;



public interface PosVendaService extends PObjectService{

	public List<PosVenda>getPosVendaForSearch(PosVenda posVenda, Integer page, Integer pageSize, Long statusPosVenda) throws Exception;
	public Long getCountPosVendaForSearch(PosVenda posVenda, Long statusPosVenda) throws Exception;
}
