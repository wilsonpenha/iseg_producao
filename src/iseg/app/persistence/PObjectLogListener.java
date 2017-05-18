package iseg.app.persistence;


import iseg.app.model.Usuario;

import java.sql.Timestamp;
import java.util.GregorianCalendar;

import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;

public class PObjectLogListener {

	@PrePersist
	@PreUpdate
	public void setDatesAndUser(PObjectLog pObjectLog) {

		// Informações do usuário
		Usuario usuarioCorrente = new Usuario();

		// check to see if modelBase and currentUser are the same, if so, make
		// currentUser modelBase.
//		if (pObject.equals(usuarioCorrente)) { 
//			usuarioCorrente = (Usuario) pObject; 
//		} 
		
		Timestamp agora = new Timestamp(GregorianCalendar.getInstance().getTimeInMillis());
		
		if (pObjectLog.getLog() == null){
			pObjectLog.setLog(new LogType(usuarioCorrente, agora, usuarioCorrente, agora));
		}
		
		if (pObjectLog.getLog().getAutor() == null) { 
			pObjectLog.getLog().setAutor(usuarioCorrente); 
		} 
			
		if (pObjectLog.getLog().getDtCriacao() == null) { 
			pObjectLog.getLog().setDtCriacao(agora);
		}
		
//		if (usuarioCorrente != null) { 
//			pObjectLog.getLog().setEditor(usuarioCorrente); 
//		}
			
		pObjectLog.getLog().setDtEdicao(agora);
	}
}