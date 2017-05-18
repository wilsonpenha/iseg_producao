package iseg.app.model.listeners;

import iseg.app.model.Corretora;

import javax.persistence.PostPersist;
import javax.persistence.PreRemove;


public class PObjectListener {
	static final int MAX_NAME_LEN = 40;
	
    @PreRemove
    public void prepareUpdate(Object obj) {
		try {
			if (obj instanceof Corretora){
				((Corretora)obj).setCorretora(null);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
    
	@PostPersist 
    public void publishPersist(Object obj) {
		try {
			if (obj instanceof Corretora){
				((Corretora)obj).setCorretora((Corretora)obj);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	//@PostUpdate
    public void publishUpdate(Object obj) {}

    //@PostRemove
    public void publishRemove(Object obj) {}
}