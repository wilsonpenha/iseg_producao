package iseg.app.business;

import iseg.app.model.Corretora;
import iseg.app.model.TemplateMensagem;
import iseg.app.persistence.PObjectServiceImpl;


//@Service
public class OrcamentoCorretoraServiceImpl extends PObjectServiceImpl implements OrcamentoCorretoraService {

	public void salvarEditar(Corretora corretora, Long[] templateMensagemIds) throws Exception {
		this.save(corretora);
		this.executeNamedQuery("updateTemplateMensagemRemovendoIsPadraoByCorretora", new Object[]{corretora.getId()});
		for(Long templateMensagemId : templateMensagemIds){
			if(templateMensagemId != null){
				TemplateMensagem templateMensagem = (TemplateMensagem) this.find(TemplateMensagem.class, templateMensagemId);
				templateMensagem.setIsPadrao(Boolean.TRUE);
				this.save(templateMensagem);
			}
		}
	}
	
}
