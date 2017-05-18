package iseg.app.business;

import iseg.app.model.Proposta;
import iseg.app.persistence.PObject;

import java.util.List;


public interface PropostaImoveisService extends PropostaService {

	/*public Double getPremioTotal(Long propostaId);*/
	public List<Proposta>getPropostasForSearch(Proposta proposta, Integer page, Integer pageSize);
	// TODO: Tirar isso daqui depois!
	public Long getCountPropostasForSearch(Proposta proposta);
	
	public void saveNoRefresh(PObject pobject) throws Exception;
}
