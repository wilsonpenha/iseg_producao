package iseg.app.business;

import iseg.app.exception.GenericException;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectService;
import iseg.app.persistence.PObjectServiceImpl;
import iseg.utils.HibernateUtil;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.ejb.EntityManagerImpl;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


//@Service
@Transactional(propagation=Propagation.REQUIRES_NEW)
public class AuditLogRecordServiceImpl extends PObjectServiceImpl{

	public AuditLogRecordServiceImpl(PObjectService service){
		this.service = service;
	}
	
	public AuditLogRecordServiceImpl(){
    	Session tempSession = HibernateUtil.currentSession(); 
	}
	
	public List<PObject> findAll(int page, int pageSize) throws Exception {
		return genericFindByNamedQuery("getAuditLogRecord", null, page, pageSize);
	}

	@SuppressWarnings("unchecked")
	public List<PObject> findAll() throws Exception {
		return (List<PObject>)genericFindByNamedQuery("getAuditLogRecord", null);
	}

	public static PObjectService service() {
		if (service.getHibernateSession() == null) {
			if (service.getEntityManager().getDelegate() instanceof EntityManagerImpl) {
				EntityManagerImpl entityManagerImpl = (EntityManagerImpl) service.getEntityManager().getDelegate();
				service.setHibernateSession(entityManagerImpl.getSession());
			} else {
				service.setHibernateSession((Session)service.getEntityManager().getDelegate());
			}
		}
		if (!service.getHibernateSession().isOpen()) {
			service.setHibernateSession(service.getHibernateSession().getSessionFactory().openSession());
		}
		return service;
	}
	
	@SuppressWarnings("unchecked")
	public PObject find(Class clazz, Long id) throws Exception {
		try{
			return (PObject)this.getEntityManager().find(clazz, id);
		}catch (IllegalArgumentException iae) {
			throw new GenericException("A operação utilizou um argumento ilegal ou inapropriado.", iae);
		}catch (Exception e) {
			throw new GenericException("find() :: Ocorreu uma falha no sistema.", e);
		}
	}

}