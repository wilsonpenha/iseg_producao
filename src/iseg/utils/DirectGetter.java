package iseg.utils;

import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.Member;
import java.lang.reflect.Method;
import java.util.Map;

import org.hibernate.HibernateException;
import org.hibernate.PropertyAccessException;
import org.hibernate.engine.SessionImplementor;
import org.hibernate.property.Getter;

public final class DirectGetter implements Getter {
	private final transient Field field;
	private final Class clazz;
	private final String name;
	private Method method;

	public DirectGetter(Field field, Class clazz, String name) {
		this.field = field;
		this.clazz = clazz;
		this.name = name;
		try	{
			BeanInfo beanInfo = Introspector.getBeanInfo( clazz );
			PropertyDescriptor[] pdArray = beanInfo.getPropertyDescriptors();
			
			if ( pdArray != null ){
				for (PropertyDescriptor pd : pdArray ){
					if ( pd.getName().equals( name ) ){ 
						this.method = pd.getReadMethod(); 
					}
				}
			}
		}catch ( Exception e ){ }
	}

	public Object get(Object target) throws HibernateException {
		try {
			return field.get(target);
		} catch (Exception e) {
			throw new PropertyAccessException(e,
					"could not get a field value by reflection", false, clazz,
					name);
		}
	}

	public Object getForInsert(Object target, Map mergeMap,
			SessionImplementor session) {
		return get(target);
	}

	public Method getMethod() {
		return method;
	}

	public String getMethodName() {
		return method == null ? null : method.getName();
	}

	public Class getReturnType() {
		return field.getType();
	}

	Object readResolve() {
		return null;//new DirectGetter(getField(clazz, name), clazz, name);
	}

	public String toString() {
		return "DirectGetter(" + clazz.getName() + '.' + name + ')';
	}

	public Member getMember() {
		// TODO Auto-generated method stub
		return null;
	}

	public Field getField() {
		return field;
	}

	public String getName() {
		return name;
	}

	public void setMethod(Method method) {
		this.method = method;
	}
}