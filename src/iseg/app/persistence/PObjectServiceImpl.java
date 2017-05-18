package iseg.app.persistence;

import iseg.app.exception.GenericException;
import iseg.app.model.AtributoCorretora;
import iseg.app.model.AtributoUsuario;
import iseg.app.model.Corretora;
import iseg.app.model.SmsserverIn;
import iseg.app.model.SmsserverOut;
import iseg.app.model.Usuario;

import java.lang.reflect.Method;
import java.sql.Connection;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.EntityNotFoundException;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import javax.persistence.PersistenceException;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import org.hibernate.Criteria;
import org.hibernate.Filter;
import org.hibernate.Session;
import org.hibernate.TransientObjectException;
import org.hibernate.criterion.Order;
import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.datasource.DataSourceUtils;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mchange.v2.c3p0.ComboPooledDataSource;


@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
public class PObjectServiceImpl implements PObjectService {
	private EntityManager em;
	
	@Resource(name = "isegDataSource")
	private ComboPooledDataSource fonteDados;
	
	protected Session hibernateSession;
	protected static PObjectService service;
	
	private @Autowired HttpServletRequest request;
	
	@PersistenceContext(type = PersistenceContextType.TRANSACTION)
	public void setEntityManager(EntityManager em) {
		this.em = em;
	}
	
	public Session getHibernateSession() {
		if (hibernateSession == null) {
			hibernateSession = em.unwrap(Session.class);
		}
		return hibernateSession;
	}
	
	public void save(PObject pobject) throws Exception {
		try{
			this.setCorretora(pobject);
			if (pobject.getId() == null) {
				// new
				em.persist(pobject);
			} else {
				// update
				em.merge(pobject);
			}
			em.flush();
			em.close();
		} catch (PersistenceException pe) {
			if (pe.getCause() instanceof ConstraintViolationException)
				throw new GenericException("Esta operaçãoo resultou numa violação de Restrição de Integridade.", pe);
			else
				throw new GenericException("save() :: Ocorreu uma falha no sistema.", pe);
		}catch (Exception e) {
			throw new GenericException("save() :: Ocorreu uma falha no sistema.", e);
		}
	}
	
	public void saveNoFilter(PObject pobject) throws Exception {
		try{
			if (pobject.getId() == null) {
				// new
				getEntityManager().persist(pobject);
			} else {
				// update
				getEntityManager().merge(pobject);
			}
			getEntityManager().flush();
			getEntityManager().close();
		} catch (PersistenceException pe) {
			if (pe.getCause() instanceof ConstraintViolationException)
				throw new GenericException("Esta operaçãoo resultou numa violação de Restrição de Integridade.", pe);
			else
				throw new GenericException("save() :: Ocorreu uma falha no sistema.", pe);
		}catch (Exception e) {
			throw new GenericException("save() :: Ocorreu uma falha no sistema.", e);
		}
	}

	public PObject saveAndReturnPObject(PObject pobject) throws Exception {
		try{
			this.setCorretora(pobject);
			if (pobject.getId() == null) {
				// new
				em.persist(pobject);
			} else {
				// update
				em.merge(pobject);
			}
			em.flush();
			em.close();
			return pobject;
		} catch (PersistenceException pe) {
			if (pe.getCause() instanceof ConstraintViolationException)
				throw new GenericException("Esta operaçãoo resultou numa violação de Restrição de Integridade.", pe);
			else
				throw new GenericException("save() :: Ocorreu uma falha no sistema.", pe);
		}catch (Exception e) {
			throw new GenericException("save() :: Ocorreu uma falha no sistema.", e);
		}
	}

	public void remove(PObject pobject) throws Exception {
		try{

			if (pobject != null) {
				em.remove(this.find(pobject));
				em.flush();
				em.close();
			}
			
		} catch (PersistenceException pe) {
			if (pe.getCause() instanceof ConstraintViolationException)
				throw new GenericException("Esta operaçãoo resultou numa violação de Restrição de Integridade.", pe);
			else
				throw new GenericException("save() :: Ocorreu uma falha no sistema.", pe);
		}catch (Exception ge) {
			throw ge;
		}
	}

	public EntityManager getEntityManager() {
		return em;
	}

	public void refresh(PObject pobject) throws Exception{
		try {
			em.refresh(pobject);
		} catch (Exception e) {
			//throw new GenericException("refresh() :: Ocorreu uma falha no sistema.", e);
		}
	}

	public PObject find(PObject pobject) throws Exception {
		try{
			this.applyFilter();
	        return em.find(pobject.getClass(), pobject.getId());
		}catch (IllegalArgumentException iae) {
			throw new GenericException("A operação utilizou um argumento ilegal ou inapropriado.", iae);
		}catch (Exception e) {
			throw new GenericException("Ocorreu uma falha no sistema.", e);
		}finally{
	        this.disableFilter();
		}
	}
	
	public PObject findAssessoriaNoFilter(Corretora pobject) throws Exception {
		try{
			Corretora corretora = (Corretora) em.find(Corretora.class, pobject.getId()); 
			corretora.setInAssessoria(corretora.getId().equals(corretora.getAssessoria().getId().longValue()));
	        return corretora;
		}catch (IllegalArgumentException iae) {
			throw new GenericException("A operação utilizou um argumento ilegal ou inapropriado.", iae);
		}catch (Exception e) {
			throw new GenericException("Ocorreu uma falha no sistema.", e);
		}finally{
	        this.disableFilter();
		}
	}
	
	@SuppressWarnings("unchecked")
	public PObject find(Class clazz, Long id) throws Exception {
		try{
			this.applyFilter();
			return (PObject)em.find(clazz, id);
		}catch (IllegalArgumentException iae) {
			throw new GenericException("A operação utilizou um argumento ilegal ou inapropriado.", iae);
		}catch (Exception e) {
			throw new GenericException("find() :: Ocorreu uma falha no sistema.", e);
		}finally{
	        this.disableFilter();
		}
	}

	public Object genericFindBySQLQuery(String sql, Object[] params) throws Exception {
		try {
			this.applyFilter();
			Query query = em.createQuery(sql);
			if(params != null){
				for(int i=0 ; i<params.length ; i++){
					query.setParameter(i, params[i]);
				}
			}
			return query.getResultList();
		} catch (Exception e) {
			throw new GenericException("genericFindBySQLQuery() :: Ocorreu uma falha no sistema.", e);
		}finally{
	        this.disableFilter();
		}
	}

	public Object genericFindBySQLQueryWithoutApplyFilter(String sql, Object[] params) throws Exception {
		try {
			Session sm = (Session) em.getDelegate();
			sm.disableFilter("corretoraFilter");    

			Query query = em.createQuery(sql);
			if(params != null){
				for(int i=0 ; i<params.length ; i++){
					query.setParameter(i, params[i]);
				}
			}
			return query.getResultList();
		} catch (Exception e) {
			throw new GenericException("genericFindBySQLQuery() :: Ocorreu uma falha no sistema.", e);
		}finally{
	        this.disableFilter();
		}
	}

	public Object genericFindBySQLQueryAssessoriaFilter(String sql, Object[] params) throws Exception {
		try {
			this.applyFilterAssessoria();
			Query query = em.createQuery(sql);
			if(params != null){
				for(int i=0 ; i<params.length ; i++){
					query.setParameter(i, params[i]);
				}
			}
			return query.getResultList();
		} catch (Exception e) {
			throw new GenericException("genericFindBySQLQuery() :: Ocorreu uma falha no sistema.", e);
		}finally{
	        this.disableFilter();
		}
	}

	@SuppressWarnings("unchecked")
	public <T extends PObject> List<T> genericFindByNamedQuery(String namedQuery, Object[] params, int page, int pageSize) throws Exception {
		try {
			getEntityManager().clear();
			this.applyFilter();
			Query query = em.createNamedQuery(namedQuery);
			if(params != null){
				for(int i=0 ; i<params.length ; i++){
					query.setParameter(i, params[i]);
				}
			}
			query.setFirstResult(page*pageSize);
			query.setMaxResults(pageSize);
			
			return query.getResultList();

		} catch (Exception e) {
			throw new GenericException("genericFindByNamedQuery() :: Ocorreu uma falha no sistema.", e);
		}finally{
	        this.disableFilter();
		}
	}

	@SuppressWarnings("unchecked")
	public <T extends PObject> List<T> genericFindByNamedQuery(String namedQuery, Object[] params) throws Exception{
		try{
			this.applyFilter();
			Query query = this.getEntityManager().createNamedQuery(namedQuery);
			if(params != null){
				for(int i=0 ; i<params.length ; i++){
					query.setParameter(i, params[i]);
				}
			}
			return query.getResultList();

		}catch (Exception e) {
			throw new GenericException("genericFindByNamedQuery() :: Ocorreu uma falha no sistema.", e);
		}finally{
	        this.disableFilter();
		}
	}
	
	@SuppressWarnings("unchecked")
	public <T extends PObject> List<T> genericFindByNamedQueryNoFilter(String namedQuery, Object[] params) throws Exception{
		try{
			Query query = this.getEntityManager().createNamedQuery(namedQuery);
			if(params != null){
				for(int i=0 ; i<params.length ; i++){
					query.setParameter(i, params[i]);
				}
			}
			return query.getResultList();
			
		}catch (Exception e) {
			throw new GenericException("genericFindByNamedQuery() :: Ocorreu uma falha no sistema.", e);
		}finally{
			this.disableFilter();
		}
	}
	
	@SuppressWarnings("unchecked")
	public <T extends PObject> T genericFirstFindByNamedQueryNoFilter(String namedQuery, Object[] params) throws Exception{
		try{
			Query query = this.getEntityManager().createNamedQuery(namedQuery);
			if(params != null){
				for(int i=0 ; i<params.length ; i++){
					query.setParameter(i, params[i]);
				}
			}
			List<?> list = query.getResultList();
			if(list != null && !list.isEmpty()){
				return (T) list.get(0); 
			}
			return null;
			
		}catch (Exception e) {
			throw new GenericException("genericFindByNamedQuery() :: Ocorreu uma falha no sistema.", e);
		}finally{
			this.disableFilter();
		}
	}

	@SuppressWarnings("unchecked")
	public <T extends PObject> List<T> genericFindMenuAndApplyFilter(String namedQuery, Object[] params) throws Exception{
		try{
			this.applyMenuFilter();
			
			Query query = this.getEntityManager().createNamedQuery(namedQuery);
			if(params != null){
				for(int i=0 ; i<params.length ; i++){
					query.setParameter(i, params[i]);
				}
			}
			return query.getResultList();

		}catch (Exception e) {
			throw new GenericException("genericFindByNamedQuery() :: Ocorreu uma falha no sistema.", e);
		}
	}
	
	@SuppressWarnings("unchecked")
	public <T extends PObject> List<T> genericFindByNamedQueryWithoutApplyFilter(String namedQuery, Object[] params) throws Exception{
		try{
			Session sm = (Session) em.getDelegate();
			sm.disableFilter("corretoraFilter");    

			Query query = this.getEntityManager().createNamedQuery(namedQuery);
			if(params != null){
				for(int i=0 ; i<params.length ; i++){
					query.setParameter(i, params[i]);
				}
			}
			return query.getResultList();

		}catch (Exception e) {
			throw new GenericException("genericFindByNamedQuery() :: Ocorreu uma falha no sistema.", e);
		}
	}
	
	@SuppressWarnings("unchecked")
	public  <T extends PObject> T genericFindFirstResultByNamedQueryWithoutApplyFilter(String namedQuery, Object[] params) throws Exception{
		try{
			List<PObject>list = this.genericFindByNamedQueryWithoutApplyFilter(namedQuery, params);
			return (T) (list.isEmpty() ? null : list.get(0));

		}catch (Exception e) {
			throw new GenericException("genericFindFirstResultByNamedQuery() :: Ocorreu uma falha no sistema.", e);
		}
	}
	
	@SuppressWarnings("unchecked")
	public  <T extends PObject> T genericFindFirstResultByNamedQuery(String namedQuery, Object[] params) throws Exception{
		try{
			this.applyFilter();
			List<PObject>list = this.genericFindByNamedQuery(namedQuery, params);
			return (T) (list.isEmpty() ? null : list.get(0));

		}catch (Exception e) {
			throw new GenericException("genericFindFirstResultByNamedQuery() :: Ocorreu uma falha no sistema.", e);
		}finally{
	        this.disableFilter();
		}
	}

	public int getRowCount(String queryName, Object[] params) throws Exception {
		try{
			this.applyFilter();
			Query query = this.getEntityManager().createNamedQuery(queryName);
			if(params != null){
				for(int i=0 ; i<params.length ; i++){
					query.setParameter(i, params[i]);
				}
			}
			Object value = query.getSingleResult();
			if (value instanceof Integer)
				return ((Integer)value).intValue();
			else if (value instanceof Long)
				return ((Long)value).intValue();
			else
				return 0;
		}catch (Exception e) {
			throw new GenericException("getRowCount() :: Ocorreu uma falha no sistema.", e);
		}finally{
	        this.disableFilter();
		}
	}

	public Double getSumResult(String queryName, Object[] params) throws Exception {
		try{
			this.applyFilter();
			Query query = this.getEntityManager().createNamedQuery(queryName);
			if(params != null){
				for(int i=0 ; i<params.length ; i++){
					query.setParameter(i, params[i]);
				}
			}
			Object value = query.getSingleResult();
			if (value instanceof Double)
				return (Double)value;
			else
				return 0D;
		}catch (Exception e) {
			throw new GenericException("getSumResult() :: Ocorreu uma falha no sistema.", e);
		}finally{
	        this.disableFilter();
		}
	}

	public Integer executeNamedQuery(String queryName, Map<String, Object> args) throws Exception{
		try {
			this.applyFilter();
			Query q = getEntityManager().createNamedQuery(queryName);
			if (args != null) {
				for (Map.Entry<String, Object> entry : args.entrySet()) {
					// will throw IllegalArgumentException if parameter name not
					// found or value is incorrect type
					q.setParameter(entry.getKey(), entry.getValue());
				}
			}
			return q.executeUpdate();
		}catch (Exception e) {
			throw new GenericException("executeNamedQuery(3 params) :: Ocorreu uma falha no sistema.", e);
		}finally{
	        this.disableFilter();
		}
	}
	
	public Integer executeNamedQuery(String queryName, Object[] args) throws Exception {
		try {
			this.applyFilter();
			Query q = getEntityManager().createNamedQuery(queryName);
			if (args != null) {
				int position = 0;
				for (Object value : args) {
					// will throw IllegalArgumentException if position is incorrect or value is incorrect type
					q.setParameter(position++, value);
				}
			}
			return q.executeUpdate();
		} catch (PersistenceException pe) {
			if (pe.getCause() instanceof ConstraintViolationException)
				throw new GenericException("ConstraintViolationException :: Este registro não pode ser excluir por estar sendo referenciado em outro documento.", pe);
			else
				throw new GenericException("executeNamedQuery(2 params) :: Ocorreu uma falha no sistema.", pe);
		} catch (Exception e) {
			throw new GenericException("executeNamedQuery(2 params) :: Ocorreu uma falha no sistema.", e);
		}finally{
	        this.disableFilter();
		}
	}
	
	public <T extends PObject> List<T> findAll() throws Exception{return null;}
	public List<PObject> findAll(int page, int pageSize) throws Exception{return null;}
	
	
	public <T extends PObject> List<T> findAll(Class<T>clazz){
		return findAll(clazz, null);
	}
	
	@SuppressWarnings("unchecked")
	public <T extends PObject> List<T> findAll(Class<T>clazz, Order order){
		
		Criteria criteria = getHibernateSession().createCriteria(clazz);
		if(order != null){
			criteria.addOrder(order);
		}
		
		return criteria.list();
	}
	
	public void clear(){
		try {
			em.clear();
		} catch (Exception e) {}
	}
	
	public void flush(){
		try {
			em.flush();
		} catch (Exception e) {}
	}

    public void disableFilter(){
		Session sm = (Session) em.getDelegate();
		sm.disableFilter("corretoraFilter");
    }
    
    public void disableMenuFilter(){
		Session sm = (Session) em.getDelegate();
		sm.disableFilter("corretoraFilter");
    }
    
	public void applyFilter(){
		Usuario usuario = (Usuario)this.request.getSession().getAttribute("usuario");
		usuario = (Usuario)this.em.getReference(Usuario.class, usuario.getId());
		Session sm = (Session) em.getDelegate();
		Corretora assessoria = usuario.getCorretora().getAssessoria();
		//Long corretoraCorrente = this.usuario.getCorretora().getId();
		Long corretoraCorrente = ((Corretora)this.request.getSession().getAttribute("corretoraEmUso")).getId();
		Long assessoriaId = (assessoria!=null && assessoria.getId()!=null) ? assessoria.getId() : 1L;
		Filter filter = sm.enableFilter("corretoraFilter");    
        filter.setParameter("assessoriaIdParam", assessoriaId);  			
        //filter.setParameter("corretoraParam", this.usuario.getCorretora().getId());
        Corretora corretoraEmUso = (Corretora) this.request.getSession().getAttribute("corretoraEmUso");
        if(corretoraEmUso != null && corretoraEmUso.getId() != null){
        	filter.setParameter("corretoraParam", corretoraEmUso.getId());
        }else{
        	filter.setParameter("corretoraParam", usuario.getCorretora().getId());
        }
        filter.setParameter("isAssessoriaParam", (corretoraCorrente.equals(assessoriaId)));
	}
	
	public void applyMenuFilter(){
		Usuario usuario = (Usuario)this.request.getSession().getAttribute("usuario");
		usuario = (Usuario)this.em.getReference(Usuario.class, usuario.getId());
		Session sm = (Session) em.getDelegate();
		Long roleId = usuario.getRole().getId();
		Filter filter = sm.enableFilter("menuRoleFilter");    
        filter.setParameter("roleParam", roleId);  			
        if(usuario.getNomeLogin().equals("ADMIN")){
        	filter.setParameter("isAdminParam", true);
        }else{
        	filter.setParameter("isAdminParam", false);
        }
	}
	
	public void applyFilterAssessoria(){
		Usuario usuario = (Usuario)this.request.getSession().getAttribute("usuario");
		usuario = (Usuario)this.em.getReference(Usuario.class, usuario.getId());
		Session sm = (Session) em.getDelegate();
		Corretora assessoria = usuario.getCorretora().getAssessoria();
		//Long corretoraCorrente = this.usuario.getCorretora().getId();
		Long corretoraCorrente = ((Corretora)this.request.getSession().getAttribute("corretoraEmUso")).getId();
		Long assessoriaId = (assessoria!=null && assessoria.getId()!=null) ? assessoria.getId() : 1L;
		Filter filter = sm.enableFilter("corretoraFilter");    
        filter.setParameter("assessoriaIdParam", assessoriaId);  			
        //filter.setParameter("corretoraParam", this.usuario.getCorretora().getId());
        Corretora corretoraEmUso = (Corretora) this.request.getSession().getAttribute("corretoraEmUso");
        if(corretoraEmUso != null && corretoraEmUso.getId() != null){
        	filter.setParameter("corretoraParam", corretoraEmUso.getId());
        }else{
        	filter.setParameter("corretoraParam", usuario.getCorretora().getId());
        }
        filter.setParameter("isAssessoriaParam", false);
	}
	
	public void setCorretora(PObject pobject) throws Exception{
		try {
			if (!(pobject instanceof SmsserverIn) && !(pobject instanceof SmsserverOut)){
				Corretora corretoraEmUso = (Corretora)this.request.getSession().getAttribute("corretoraEmUso");
				Usuario usuario = (Usuario)this.request.getSession().getAttribute("usuario");
				if (pobject instanceof AtributoCorretora && (!corretoraEmUso.ehAssessoria() && !(pobject instanceof Corretora))){
					if (usuario!=null){
						Method s = pobject.getClass().getMethod("setCorretora", new Class[] {Corretora.class});
						s.invoke(pobject, new Object[] {corretoraEmUso});
					}else{
						throw new GenericException("setCorretora :: Ocorreu uma falha no sistema - Usuario está null");
					}
				}
				if (pobject instanceof AtributoUsuario){
					if (usuario!=null){
						Method s = pobject.getClass().getMethod("setUsuario", new Class[] {Usuario.class});
						s.invoke(pobject, new Object[] {usuario});
					}else{
						throw new GenericException("setCorretora :: Ocorreu uma falha no sistema - Usuario está null");
					}
				}
			}
		}catch (Exception e) {
			throw new GenericException("setCorretora :: Ocorreu uma falha no sistema.", e);
		}
	}
	
 
	public DataSource getDatasource() {
 		return fonteDados;
 	}
 	
 	public Connection getConnection() {
 		Connection conexao = null;
 		try {
 			conexao = DataSourceUtils.getConnection(fonteDados);
		} catch (CannotGetJdbcConnectionException e) {
			e.printStackTrace();
		}
		return conexao;
 	}

	public PObjectService getService() {
		return service;
	}

	public void setService(PObjectService service) {
		this.service = service;
	}

	public void setHibernateSession(Session hibernateSession) {
		this.hibernateSession = hibernateSession;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

}