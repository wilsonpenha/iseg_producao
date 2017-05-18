package iseg.app.business;

import iseg.app.model.Sinistro;
import iseg.app.persistence.PObjectService;

import java.util.List;


public interface SinistroService extends PObjectService{
	
	public List<Sinistro>getSinistroForSearch(Sinistro sinistro, Integer page, Integer pageSize)throws Exception;
	public Long getCountSinistroForSearch(Sinistro sinistro)throws Exception;
}
