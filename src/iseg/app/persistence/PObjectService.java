package iseg.app.persistence;

import iseg.app.model.Corretora;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.sql.DataSource;

import org.hibernate.Session;
import org.hibernate.criterion.Order;


public interface PObjectService{

	public <T extends PObject> List<T> findAll() throws Exception; 

	public PObject saveAndReturnPObject(PObject pobject) throws Exception;
	
	public List<PObject> findAll(int page, int pageSize) throws Exception; 

	public void save(PObject pobject) throws Exception;

	public void remove(PObject pobject) throws Exception;

	public PObject find(PObject pobject) throws Exception;

	@SuppressWarnings("unchecked")
	public PObject find(Class clazz, Long id) throws Exception;
	
	public PObject findAssessoriaNoFilter(Corretora pobject) throws Exception;
	
	public int getRowCount(String queryName, Object[] params) throws Exception;
	
	public Double getSumResult(String queryName, Object[] params) throws Exception;

	public Object genericFindBySQLQuery(String sql, Object[] params) throws Exception;

	public Object genericFindBySQLQueryWithoutApplyFilter(String sql, Object[] params) throws Exception;
	
	public Object genericFindBySQLQueryAssessoriaFilter(String sql, Object[] params) throws Exception;

	public <T extends PObject> List<T> genericFindByNamedQuery(String namedQuery, Object[] params) throws Exception;
	
	public void refresh(PObject pobject) throws Exception;

	public <T extends PObject> List<T> genericFindByNamedQuery(String namedQuery, Object[] params, int page, int pageSize) throws Exception;

	public <T extends PObject> T genericFindFirstResultByNamedQuery(String namedQuery, Object[] params) throws Exception;

	public Integer executeNamedQuery(String queryName, Map<String, Object> args) throws Exception;

	public Integer executeNamedQuery(String queryName, Object[] params) throws Exception;
	
	public void clear() throws Exception;

	public void flush() throws Exception;
	
	public <T extends PObject> List<T> findAll(Class<T>clazz);
	
	public <T extends PObject> List<T> findAll(Class<T>clazz, Order order);
	
	public <T extends PObject> List<T> genericFindByNamedQueryWithoutApplyFilter(String namedQuery, Object[] params) throws Exception;

	public <T extends PObject> T genericFindFirstResultByNamedQueryWithoutApplyFilter(String namedQuery, Object[] params) throws Exception;
	
	public DataSource getDatasource();
	
 	public Connection getConnection();
 	
 	public EntityManager getEntityManager();
 	
 	public Session getHibernateSession();

 	public void setHibernateSession(Session hibernateSession);
 	
 	public void applyFilter();
 	
 	public void disableMenuFilter();

 	public void applyMenuFilter();
 	
 	public <T extends PObject> List<T> genericFindMenuAndApplyFilter(String namedQuery, Object[] params) throws Exception;
}
