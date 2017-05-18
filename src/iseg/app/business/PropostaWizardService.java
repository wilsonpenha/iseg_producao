package iseg.app.business;

import iseg.app.model.Condutor;
import iseg.app.model.Pessoa;
import iseg.app.persistence.PObject;

public interface PropostaWizardService extends PropostaService {

	public void saveNoRefresh(PObject pobject) throws Exception;
	public void saveProposta(PObject pobject, Pessoa pessoa, Boolean blnGerarParcelas, PropostaComissaoService serviceAux,
			Condutor condutor, Boolean blnEndosso, Boolean blnPropria, Boolean blnRenovacao) throws Exception;
}
