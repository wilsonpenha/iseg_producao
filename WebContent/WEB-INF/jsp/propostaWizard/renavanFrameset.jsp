<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
		<title>iSeg - Gestão Inteligente</title>
		<LINK rel="SHORTCUT ICON" href="${pageContext.request.contextPath}/common/web/images/iseg.ico"></LINK> 
	</head>
	<frameset rows="90%,10%" frameborder="no" border="0" framespacing="0" cols="*" id="framesetMenu">
		<frame name="frameConsulta" scrolling="yes" src="https://denatran.serpro.gov.br/Veiculo_Consulta.asp" id="frameConsulta"></frame>
    	<frame name="frameBotao" scrolling="no" src="${pageContext.request.contextPath}/wizard/formBotao.action" id="frameBotao"></frame>
		<noframes>
			<body bgcolor="#FFFFFF">Frames not available</body>
		</noframes>
	</frameset>
</html>
