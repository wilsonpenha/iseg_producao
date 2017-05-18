package iseg.app.model.listeners;

import iseg.app.constants.Constants;
import iseg.app.model.Proposta;

import java.util.Date;

import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;


public class PropostaListener {
	static final int MAX_NAME_LEN = 40;
	
	@PrePersist
	@PreUpdate
    public void publishPersist(Object obj) {
		try {
			if (((Proposta)obj).getNroApolice()!=null && !((Proposta)obj).getNroApolice().isEmpty() &&
				((Proposta)obj).getDataLanctoApolice()==null){
				((Proposta)obj).setDataLanctoApolice(new Date());
				((Proposta)obj).setUsuarioLanctoApolice(((Proposta)obj).getUsuario());
			}
			if (((Proposta)obj).getDataRecebApolice()!=null && ((Proposta)obj).getUsuarioRecebApolice()==null){
				((Proposta)obj).setUsuarioRecebApolice(((Proposta)obj).getUsuario());
			}
			if (((Proposta)obj).getDataRecebEndosso()!=null && ((Proposta)obj).getUsuarioRecebEndosso()==null){
				((Proposta)obj).setUsuarioRecebEndosso(((Proposta)obj).getUsuario());
			}
		    if (((Proposta)obj).getStatusOperacional().longValue()==Constants.STATUS_OPER_APOLICE && 
				((Proposta)obj).getDataBaixaApolice()==null){
				((Proposta)obj).setDataBaixaApolice(new Date());
				((Proposta)obj).setUsuarioBaixaApolice(((Proposta)obj).getUsuario());
				((Proposta)obj).setSmsEncaminhado("N");
			}
			if (((Proposta)obj).getNroEndosso()!=null && !((Proposta)obj).getNroEndosso().isEmpty() &&
				((Proposta)obj).getDataLanctoEndosso()==null){
				((Proposta)obj).setDataLanctoEndosso(new Date());
				((Proposta)obj).setUsuarioLanctoEndosso(((Proposta)obj).getUsuario());
			}
			if (((Proposta)obj).getStatusOperacional().longValue()==Constants.STATUS_OPER_ENDOSSO && 
				((Proposta)obj).getDataBaixaEndosso()==null){
				((Proposta)obj).setDataBaixaEndosso(new Date());
				((Proposta)obj).setUsuarioBaixaEndosso(((Proposta)obj).getUsuario());
			}
			if (((Proposta)obj).getStatusOperacional().longValue()==Constants.STATUS_OPER_ENDOSSO_CANCELAMENTO && 
				((Proposta)obj).getDataBaixaEndosso()==null){
				((Proposta)obj).setDataBaixaEndosso(new Date());
				((Proposta)obj).setUsuarioBaixaEndosso(((Proposta)obj).getUsuario());
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}