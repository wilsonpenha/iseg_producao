package iseg.app.interceptor;

import java.util.Collection;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.StrutsStatics;
import org.apache.struts2.views.tiles.TilesResult;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.Result;
import com.opensymphony.xwork2.ValidationAware;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

/**
 * An Interceptor to preserve an actions ValidationAware messages across a
 * redirect result.
 *
 * It makes the assumption that you always want to preserve messages across a
 * redirect and restore them to the next action if they exist.
 *
 * The way this works is it looks at the result type after a action has executed
 * and if the result was a redirect (ServletRedirectResult) or a redirectAction
 * (ServletActionRedirectResult) and there were any errors, messages, or
 * fieldErrors they are stored in the session. Before the next action executes
 * it will check if there are any messages stored in the session and add them to
 * the next action.
 *
 */
public class RedirectMessageInterceptor extends MethodFilterInterceptor
{
    private static final long  serialVersionUID    = -1847557437429753540L;

    public static final String FIELD_ERRORS_KEY    = "RedirectMessageInterceptor_FieldErrors";
    public static final String ACTION_ERRORS_KEY   = "RedirectMessageInterceptor_ActionErrors";
    public static final String ACTION_MESSAGES_KEY = "RedirectMessageInterceptor_ActionMessages";

    public RedirectMessageInterceptor()
    {
    }

    public String doIntercept(ActionInvocation invocation) throws Exception
    {
        Object action = invocation.getAction();
        if (action instanceof ValidationAware)
        {
            //before(invocation, (ValidationAware) action);
        }

        String result = invocation.invoke();

        if (action instanceof ValidationAware)
        {
            after(invocation, (ValidationAware) action);
        }
        return result;
    }

    /**
     * Retrieve the errors and messages from the session and add them to the
     * action.
     */
    @SuppressWarnings("unchecked")
    protected void before(ActionInvocation invocation, ValidationAware validationAware) throws Exception
    {
        Map session = invocation.getInvocationContext().getSession();
        String user = (String)session.get("user");
        System.out.print(user);
    }
     

    /**
     * Retrieve the errors and messages from the session and add them to the
     * action.
    @SuppressWarnings("unchecked")
    protected void before(ActionInvocation invocation, ValidationAware validationAware) throws Exception
    {
        Map session = invocation.getInvocationContext().getSession();

        Collection actionErrors = (Collection) session.remove(ACTION_ERRORS_KEY);
        Collection actionMessages = (Collection) session.remove(ACTION_MESSAGES_KEY);
        Map fieldErrors = (Map) session.remove(FIELD_ERRORS_KEY);

        if (actionErrors != null && actionErrors.size() > 0)
        {
            for (Object error : actionErrors)
            {
                validationAware.addActionError((String)error);
            }
        }

        if (actionMessages != null && actionMessages.size() > 0)
        {
            for (Object message : actionMessages)
            {
                validationAware.addActionMessage((String)message);
            }
        }

        if (fieldErrors != null && fieldErrors.size() > 0)
        {
            for (Object entry : fieldErrors.entrySet())
            {
                validationAware.addFieldError((String)((Map.Entry)entry).getKey(), (String)((Map.Entry)entry).getValue());
            }
        }

    }
     */

    /**
     * If the result is a redirect then store error and messages in the session.
     */
    @SuppressWarnings("unchecked")
    protected void after(ActionInvocation invocation,
                         ValidationAware validationAware) throws Exception
    {
        Result result = invocation.getResult();

        if (result instanceof TilesResult)
        {
            ActionContext actionContext = invocation.getInvocationContext();
            HttpServletRequest request = (HttpServletRequest) actionContext
                .get(StrutsStatics.HTTP_REQUEST);

            /*
             * If the session doesn't already exist then it's too late to create
             * one as the response has already been committed. This is really
             * only to handle the 'unusual' case of a browser refresh after the
             * session has expired. In this case the messages are lost.
             */
            HttpSession session = request.getSession(false);
            if (session != null)
            {
                Collection actionErrors = validationAware.getActionErrors();
                if (actionErrors != null && actionErrors.size() > 0)
                {
                    session.setAttribute(ACTION_ERRORS_KEY, actionErrors);
                }

                Collection actionMessages = validationAware.getActionMessages();
                if (actionMessages != null && actionMessages.size() > 0)
                {
                    session.setAttribute(ACTION_MESSAGES_KEY, actionMessages);
                }

                Map fieldErrors = validationAware.getFieldErrors();
                if (fieldErrors != null && fieldErrors.size() > 0)
                {
                    session.setAttribute(FIELD_ERRORS_KEY, fieldErrors);
                }
            }
        }
    }

}