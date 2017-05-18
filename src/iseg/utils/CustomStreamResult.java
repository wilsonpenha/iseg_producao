package iseg.utils;

import org.apache.struts2.dispatcher.StreamResult;

import com.opensymphony.xwork2.ActionInvocation;

public class CustomStreamResult extends StreamResult {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doExecute(String finalLocation, ActionInvocation invocation) throws Exception {
		// get name of downloaded file
		String downloadedFileName = ""+invocation.getStack().findValue(conditionalParse("contentDisposition", invocation));
		contentDisposition = "" + downloadedFileName + "";
		// get file size
		contentLength = ""+invocation.getStack().findValue(conditionalParse("contentLength", invocation));
		// get type of file
		contentType = ""+invocation.getStack().findValue(conditionalParse("contentType", invocation));
		super.doExecute(finalLocation, invocation);
	}
}
