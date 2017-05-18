package iseg.utils;

import iseg.app.persistence.PObject;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Properties;

import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.proxy.HibernateProxy;

/**
* Manages Hibernate connections to our underlying database.
*
* Typical usecase:
* <pre>
* Session session = HibernateUtil.currentSession();
* Transaction tx = session.beginTransaction();
* ... do something with session ...
* tx.commit();
* HibernateUtil.closeSession();
* </pre>
*/
public class HibernateUtil 
{
  private static final SessionFactory sessionFactory;

  private HibernateUtil() {}
  static {
      try {
    	  AnnotationConfiguration config = new AnnotationConfiguration();
          Properties properties = XMLPersistenceUtil.getProperties("META-INF/persistence.xml", "punit");
          config.setProperties(properties);
          config.configure("META-INF/hibernate.cfg.xml");
          /*config.setProperty("hibernate.connection.driver_class", "org.postgresql.Driver");
          config.setProperty("hibernate.connection.url", "jdbc:postgresql://192.168.0.4/iseg_consolidado");
          config.setProperty("hibernate.connection.username", "postgres");
          config.setProperty("hibernate.connection.password", "master");*/
          //config.setProperty("hibernate.connection.datasource", "java:comp/env/jdbc/iseg");
          sessionFactory = config.buildSessionFactory();
      } catch (Throwable ex) {
          // Make sure you log the exception, as it might be swallowed
          ex.printStackTrace();
          System.err.println("Initial SessionFactory creation failed." + ex);
          throw new ExceptionInInitializerError(ex);
      }
  }

  private static final ThreadLocal session = new ThreadLocal();

  /**
   * Returns the current database session. Opens a new session, if this 
   * thread has none yet.
   *
   * @return the current database session.
   *
   * @throws HibernateException if the Hibernate layer chokes. 
   */
  public static Session currentSession() throws HibernateException 
  {
      Session s = (Session) session.get();
      if (s == null) {
          s = sessionFactory.openSession();
          session.set(s);
      }else if (!s.isOpen()){
          s = sessionFactory.openSession();
          session.set(s);
      }
      return s;
  }

  /**
   * Closes the current database session.
   *
   * @throws HibernateException if the Hibernate layer chokes. 
   */
  public static void closeSession() throws HibernateException 
  {
      Session s = (Session) session.get();
      session.set(null);
      if (s != null) {
          s.close();
      }
  }
  
  @SuppressWarnings("unchecked")
  public static <T> T initializeAndUnproxy(T entity) {
      if (entity == null) {
          throw new
             NullPointerException("Entity passed for initialization is null");
      }

      Hibernate.initialize(entity);
      if (entity instanceof HibernateProxy) {
          entity = (T) ((HibernateProxy) entity).getHibernateLazyInitializer().getImplementation();
      }
      return entity;
  }
  
  public static <K extends PObject> List<K> initializeAndUnproxyList(List<K> list) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException{
	  for(K entity : list){
		  List<Field> fList = new ArrayList<Field>(Arrays.asList(entity.getClass().getDeclaredFields()));
		  for(Field field : fList){
			  if(field.getType().getSuperclass()!= null){
				  if(field.getType().getSuperclass().getSimpleName().equals("PObject")){
					  String pLe = field.getName().substring(0,1).toUpperCase();
					  String rest = field.getName().substring(1);
					  String metodo = pLe+rest;
					  Method metodoGet = null;
					  Method metodoSet = null;
					  Object objectValue = null;
					  metodoGet = entity.getClass().getMethod("get"+metodo, null);
					  objectValue = metodoGet.invoke(entity, null);
					  if(objectValue != null){
						  metodoSet = entity.getClass().getMethod("set"+metodo, field.getType());
						  metodoSet.invoke(entity, initializeAndUnproxy(objectValue));  
					  }
				  }
			  }
		  }
	  }
	  return list;
  }
}