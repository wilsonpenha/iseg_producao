package iseg.app.interceptor;

import java.lang.reflect.Method;

import org.apache.struts2.interceptor.validation.SkipValidation;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.validator.ValidationInterceptor;

public class FixedAnnotationValidationInterceptor extends ValidationInterceptor {

	private static final long serialVersionUID = 1813272797367431184L;

	protected String doIntercept(ActionInvocation invocation) throws Exception {

		Object action = invocation.getAction();
		if (action != null) {
			Method method = getActionMethod(Class.forName(action.getClass().getName().split("\\$")[0]), invocation.getProxy().getMethod());
			SkipValidation skip = (SkipValidation) method.getAnnotation(SkipValidation.class);
			if (skip != null) {
				return invocation.invoke();
			}
		}

		return super.doIntercept(invocation);
	}

	// FIXME: This is copied from DefaultActionInvocation but should be exposed through the interface
	@SuppressWarnings("unchecked")
	protected Method getActionMethod(Class actionClass, String methodName) throws NoSuchMethodException {
		Method method;
		try {
			method = actionClass.getMethod(methodName, new Class[0]);
		} catch (NoSuchMethodException e) {
			// hmm -- OK, try doXxx instead
			try {
				String altMethodName = "do" + methodName.substring(0, 1).toUpperCase() + methodName.substring(1);
				method = actionClass.getMethod(altMethodName, new Class[0]);
			} catch (NoSuchMethodException e1) {
				// throw the original one
				throw e;
			}
		}
		return method;
	}
}