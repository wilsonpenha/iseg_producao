package iseg.app.interceptor;

import iseg.app.model.AuditLogRecord;
import iseg.app.model.Auditable;
import iseg.app.model.Usuario;
import iseg.app.persistence.PObject;
import iseg.utils.HibernateUtil;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.CallbackException;
import org.hibernate.EmptyInterceptor;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.type.Type;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


/**
 * @author Rob
 * 
 *         Hibernate Interceptor for logging saves, updates and deletes to the
 *         AuditLogRecord Table
 */
@Transactional(propagation=Propagation.REQUIRES_NEW)
public class AuditLogInterceptor extends EmptyInterceptor {

	private Log log = LogFactory.getLog(AuditLogInterceptor.class);

	private static final String UPDATE = "update";
	private static final String INSERT = "insert";
	private static final String DELETE = "delete";

	private Set inserts = new HashSet();
	private Set updates = new HashSet();
	private Set deletes = new HashSet();
	private Object currentObj;

	private Usuario usuario;

	private Session session;

	public void setSession(Session session) {
		this.session = session;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see net.sf.hibernate.Interceptor#onFlushDirty(java.lang.Object,
	 * java.io.Serializable, java.lang.Object[], java.lang.Object[],
	 * java.lang.String[], net.sf.hibernate.type.Type[])
	 */
	public boolean onFlushDirty(Object obj, Serializable id,
			Object[] newValues, Object[] oldValues, String[] properties,
			Type[] types) throws CallbackException {

		currentObj = obj;
		if (obj instanceof Auditable) {

			Class objectClass = obj.getClass();
			String className = objectClass.getName();

			// Just get the class name without the package structure
			String[] tokens = className.split("\\.");
			int lastToken = tokens.length - 1;
			className = tokens[lastToken];

			// Use the id and class to get the pre-update state from the
			// database
			Serializable persistedObjectId = getObjectId(obj);
			Auditable preUpdateState = null;

			try {
				Session tempSession = HibernateUtil.currentSession();
				preUpdateState = (Auditable) tempSession.get(objectClass,
						persistedObjectId);
				tempSession.close();
			} catch (Exception e) {
				throw new CallbackException(e);
			}

			try {

				logChanges((Auditable) obj, preUpdateState, null,
						persistedObjectId.toString(), UPDATE, className);

			} catch (IllegalArgumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return false;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see net.sf.hibernate.Interceptor#onSave(java.lang.Object,
	 * java.io.Serializable, java.lang.Object[], java.lang.String[],
	 * net.sf.hibernate.type.Type[])
	 * 
	 * public boolean onSave(Object obj, Serializable id, Object[] newValues,
	 * String[] properties, Type[] types) throws CallbackException { currentObj
	 * = obj; if (obj instanceof Auditable) {
	 * 
	 * try { Class objectClass = obj.getClass(); String className =
	 * objectClass.getName(); String[] tokens = className.split("\\."); int
	 * lastToken = tokens.length - 1; className = tokens[lastToken];
	 * 
	 * logChanges((Auditable)obj, null, null, null, INSERT, className);
	 * 
	 * } catch (IllegalArgumentException e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); } catch (IllegalAccessException e) { // TODO
	 * Auto-generated catch block e.printStackTrace(); } catch
	 * (InvocationTargetException e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); } } return false; }
	 */

	/*
	 * (non-Javadoc)
	 * 
	 * @see net.sf.hibernate.Interceptor#onDelete(java.lang.Object,
	 * java.io.Serializable, java.lang.Object[], java.lang.String[],
	 * net.sf.hibernate.type.Type[])
	 */
	public void onDelete(Object obj, Serializable id, Object[] newValues,
			String[] properties, Type[] types) throws CallbackException {

		currentObj = obj;
		if (obj instanceof Auditable) {

			try {
				Class objectClass = obj.getClass();
				String className = objectClass.getName();
				String[] tokens = className.split("\\.");
				int lastToken = tokens.length - 1;
				className = tokens[lastToken];

				logChanges((Auditable) obj, null, null, id.toString(), DELETE,
						className);

			} catch (IllegalArgumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see net.sf.hibernate.Interceptor#postFlush(java.util.Iterator)
	 */
	public void postFlush(Iterator arg0) throws CallbackException {
		log.debug("In postFlush of AuditLogInterceptor..");

		if (!this.inserts.isEmpty() || !this.updates.isEmpty() || !this.deletes.isEmpty()) {
			Session tempSession = HibernateUtil.currentSession();
			Transaction tx = null;

			try {
				tx = tempSession.beginTransaction();
				for (Iterator itr = this.inserts.iterator(); itr.hasNext();) {
					AuditLogRecord logRecord = (AuditLogRecord) itr.next();
					logRecord.setEntityId(getObjectId(logRecord.getEntity())
							.toString());
					tempSession.persist(logRecord);
				}
				for (Iterator itr = this.updates.iterator(); itr.hasNext();) {
					AuditLogRecord logRecord = (AuditLogRecord) itr.next();
					tempSession.persist(logRecord);
				}
				for (Iterator itr = this.deletes.iterator(); itr.hasNext();) {
					AuditLogRecord logRecord = (AuditLogRecord) itr.next();
					tempSession.persist(logRecord);
				}
				tx.commit();
			} catch (HibernateException e) {
				if (tx != null)
					tx.rollback();
				throw new CallbackException(e);
			} catch (Exception e) {
				if (tx != null)
					tx.rollback();
				throw new CallbackException(e);
			} finally {
				this.inserts.clear();
				this.updates.clear();
				this.deletes.clear();
				tempSession.close();
			}
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @seeorg.hibernate.Interceptor#afterTransactionCompletion(org.hibernate.
	 * Transaction)
	 */
	public void afterTransactionCompletion(Transaction arg0) {
		// clear any audit log records potentially remaining from a rolled back
		// transaction
		//this.inserts.clear();
		//this.updates.clear();
		//this.deletes.clear();

	}

	/**
	 * Logs changes to persistent data
	 * 
	 * @param newObject
	 *            the object being saved, updated or deleted
	 * @param existingObject
	 *            the existing object in the database. Used only for updates
	 * @param parentObject
	 *            the parent object. Set only if passing a Component object as
	 *            the newObject
	 * @param persistedObjectId
	 *            the id of the persisted object. Used only for update and
	 *            delete
	 * @param event
	 *            the type of event being logged. Valid values are "update",
	 *            "delete", "save"
	 * @param className
	 *            the name of the class being logged. Used as a reference in the
	 *            auditLogRecord
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 * @throws InvocationTargetException
	 */
	private void logChanges(Auditable newObject, Object existingObject,
			Object parentObject, String persistedObjectId, String event,
			String className) throws IllegalArgumentException,
			IllegalAccessException, InvocationTargetException {

		Class objectClass = newObject.getClass();
		// get an array of all fields in the class including those in
		// superclasses if this is a subclass.
		Field[] fields = getAllFields(objectClass, null);

		Object objUsuario = null;
		PObject root = null;
		String rootClassName = "";
		String rootId = "";

		Method[] methods = objectClass.getMethods();

		for (int ii = 0; ii < methods.length; ii++) {
			if (methods[ii].getName().equals("getRoot")) {
				root = (PObject) methods[ii].invoke(newObject, null);

				while (root != null) {
					try{
						rootId += root.getId().toString();
						Class rootClass = root.getClass();
						String rootName = rootClass.getName();
						String[] tokens = rootName.split("\\.");
						int lastToken = tokens.length - 1;
						rootClassName += tokens[lastToken];
						Method getRootMethod = root.getClass().getMethod("getRoot", null);
						root = (PObject) getRootMethod.invoke(root, null);
						if (root!=null){
							rootId += "->";
							rootClassName += "->";
						}
					}catch (Exception e) {
						// exception não tratada
					}
				}
			}

			if (methods[ii].getName().equals("getUsuario"))
				objUsuario = methods[ii].invoke(newObject, null);
		}

		// Iterate through all the fields in the object

		fieldIteration: 
		for (int ii = 0; ii < fields.length; ii++) {

			// make private fields accessible so we can access their values
			fields[ii].setAccessible(true);

			// if the current field is static, transient or final then don't log
			// it as
			// these modifiers are v.unlikely to be part of the data model.
			if (Modifier.isTransient(fields[ii].getModifiers())
					|| Modifier.isFinal(fields[ii].getModifiers())
					|| Modifier.isStatic(fields[ii].getModifiers())) {
				continue fieldIteration;
			}

			String fieldName = fields[ii].getName();
			if (!fieldName.equals("id")) {

				Class interfaces[] = fields[ii].getType().getInterfaces();

				for (int i = 0; i < interfaces.length;) {
					if (interfaces[i].getName().equals("java.util.Collection")) {
						continue fieldIteration;

						// If the field is a class that is a component
						// (Hibernate mapping type) then iterate through its
						// fields and log them
					} else if (interfaces[i].getName().equals(
							"com.mycompany.model.audit.Component")) {

						Auditable newComponent = (Auditable) fields[ii]
								.get(newObject);
						Object existingComponent = null;

						if (event.equals(UPDATE)) {
							existingComponent = fields[ii].get(existingObject);
							if (existingComponent == null
									&& newComponent != null) {
								try {
									existingComponent = newComponent.getClass()
											.newInstance();
								} catch (InstantiationException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								} catch (IllegalAccessException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}
							} else {
								// if neither objects contain the component then
								// don't log anything
								continue fieldIteration;
							}
						}

						if (newComponent == null) {
							continue fieldIteration;
						}

						logChanges(newComponent, existingComponent, newObject,
								persistedObjectId, event, className);
						continue fieldIteration;
					}
					i++;
				}

				String propertyNewState;
				String propertyPreUpdateState;

				// get new field values
				try {
					Object objPropNewState = fields[ii].get(newObject);
					if (objPropNewState != null) {
						if (objPropNewState instanceof Date) {
							objPropNewState = new SimpleDateFormat("dd/MM/yyyy")
									.format(objPropNewState);
						}
						if (objPropNewState instanceof PObject) {
							objPropNewState = ((PObject) objPropNewState)
									.getId();
						}
						propertyNewState = objPropNewState.toString();
					} else {
						propertyNewState = "";
					}

				} catch (Exception e) {
					propertyNewState = "";
				}

				if (event.equals(UPDATE)) {

					try {
						Object objPreUpdateState = fields[ii]
								.get(existingObject);

						if (objPreUpdateState != null) {
							if (objPreUpdateState instanceof Date) {
								objPreUpdateState = new SimpleDateFormat(
										"dd/MM/yyyy").format(objPreUpdateState);
							}
							if (objPreUpdateState instanceof PObject) {
								objPreUpdateState = ((PObject) objPreUpdateState)
										.getId();
							}
							propertyPreUpdateState = objPreUpdateState
									.toString();
						} else {
							propertyPreUpdateState = "";
						}
					} catch (Exception e) {
						propertyPreUpdateState = "";
					}

					// Now we have the two property values - compare them
					if (propertyNewState.equals(propertyPreUpdateState)) {
						continue; // Values haven't changed so loop to next
									// property
					} else {
						AuditLogRecord logRecord = new AuditLogRecord();
						logRecord.setEntityName(className);
						logRecord.setEntityAttribute(fieldName);
						logRecord.setMessage(event);
						logRecord.setUsuario((Usuario) objUsuario);
						Calendar c = Calendar.getInstance();
						logRecord.setDataHoraOperacao(c.getTime());
						logRecord
								.setEntityAttributeOldValue(propertyPreUpdateState);
						logRecord.setEntityAttributeNewValue(propertyNewState);
						logRecord.setEntityId(persistedObjectId);
						logRecord.setRootEntityName(rootClassName);
						logRecord.setRootEntityId(rootId);

						logRecord.setOperationType("UPDATE");
						if (parentObject == null) {
							logRecord.setEntity((Auditable) newObject);
						} else {
							logRecord.setEntity((Auditable) parentObject);
						}

						this.updates.add(logRecord);

					}

				} else if (event.equals(DELETE)) {
					Object returnValue = fields[ii].get(newObject);
					try {
						if (returnValue != null) {
							if (returnValue instanceof Date) {
								returnValue = new SimpleDateFormat("dd/MM/yyyy")
										.format(returnValue);
							}
							if (returnValue instanceof PObject) {
								returnValue = ((PObject) newObject).getId();
							}
						} else {
							returnValue = "";
						}
					} catch (Exception e) {
						returnValue = "";
					}

					AuditLogRecord logRecord = new AuditLogRecord();
					logRecord.setEntityName(className);
					logRecord.setEntityAttribute(fieldName);
					logRecord.setMessage(event);
					logRecord.setUsuario((Usuario) objUsuario);
					Calendar c = Calendar.getInstance();
					logRecord.setDataHoraOperacao(c.getTime());
					logRecord.setEntityAttributeNewValue("");
					logRecord.setRootEntityName(rootClassName);
					logRecord.setRootEntityId(rootId);
					if (returnValue != null)
						logRecord.setEntityAttributeOldValue(returnValue
								.toString());
					if (persistedObjectId != null)
						logRecord.setEntityId(persistedObjectId);

					if (parentObject == null) {
						logRecord.setEntity((Auditable) newObject);
					} else {
						logRecord.setEntity((Auditable) parentObject);
					}

					this.deletes.add(logRecord);
				}
			}
		}
	}

	/**
	 * Returns an array of all fields used by this object from it's class and
	 * all superclasses.
	 * 
	 * @param objectClass
	 *            the class
	 * @param fields
	 *            the current field list
	 * @return an array of fields
	 */
	private Field[] getAllFields(Class objectClass, Field[] fields) {

		Field[] newFields = objectClass.getDeclaredFields();

		int fieldsSize = 0;
		int newFieldsSize = 0;

		if (fields != null) {
			fieldsSize = fields.length;
		}

		if (newFields != null) {
			newFieldsSize = newFields.length;
		}

		Field[] totalFields = new Field[fieldsSize + newFieldsSize];

		if (fieldsSize > 0) {
			System.arraycopy(fields, 0, totalFields, 0, fieldsSize);
		}

		if (newFieldsSize > 0) {
			System.arraycopy(newFields, 0, totalFields, fieldsSize,
					newFieldsSize);
		}

		Class superClass = objectClass.getSuperclass();

		Field[] finalFieldsArray;

		if (superClass != null
				&& !superClass.getName().equals("java.lang.Object")) {
			finalFieldsArray = getAllFields(superClass, totalFields);
		} else {
			finalFieldsArray = totalFields;
		}

		return finalFieldsArray;

	}

	/**
	 * Gets the id of the persisted object
	 * 
	 * @param obj
	 *            the object to get the id from
	 * @return object Id
	 */
	private Serializable getObjectId(Object obj) {

		Class objectClass = obj.getClass();
		Method[] methods = objectClass.getMethods();

		Serializable persistedObjectId = null;
		for (int ii = 0; ii < methods.length; ii++) {
			// If the method name equals 'getId' then invoke it to get the id of
			// the object.
			if (methods[ii].getName().equals("getId")) {
				try {
					persistedObjectId = (Serializable) methods[ii].invoke(obj,
							null);
					break;
				} catch (Exception e) {
					log
							.warn("Audit Log Failed - Could not get persisted object id: "
									+ e.getMessage());
				}
			}
		}
		return persistedObjectId;
	}

}
