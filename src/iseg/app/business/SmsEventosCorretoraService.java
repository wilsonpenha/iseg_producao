package iseg.app.business;

import iseg.app.persistence.PObjectService;


public interface SmsEventosCorretoraService extends PObjectService{
	public void agenteDeEventosSms() throws Exception;	
	public void consultaSms() throws Exception;
}
