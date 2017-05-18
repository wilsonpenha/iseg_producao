package iseg.app.business;

import iseg.app.model.Corretora;
import iseg.app.persistence.PObjectService;


public interface OrcamentoCorretoraService extends PObjectService{
	public void salvarEditar(Corretora corretora, Long[] templateMensagemIds) throws Exception;	
}
