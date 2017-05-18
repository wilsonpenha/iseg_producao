package iseg.app.business;

import iseg.app.model.Proposta;
import iseg.app.model.Protocolo;
import iseg.app.persistence.PObjectService;

import java.util.List;



public interface ProtocoloService extends PObjectService{

	public List<Protocolo>getProtocoloForSearch(Protocolo protocolo, Proposta proposta, Integer page, Integer pageSize, Long statusProtocolo) throws Exception;
	public Long getCountProtocoloForSearch(Protocolo protocolo, Proposta proposta, Long statusProtocolo) throws Exception;
}
