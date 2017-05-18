<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<script>
	alert("Esta sessão foi encerrada porque o mesmo usuário iniciou uma nova sessão em outro navegador / computador!");

	top.window.location='${pageContext.request.contextPath}/login/doLogin.action'
</script>
