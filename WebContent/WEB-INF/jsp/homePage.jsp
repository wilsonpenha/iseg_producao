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
	<frameset cols="25%,1*" frameborder="no" border="0" framespacing="0" rows="*" id="framesetMenu">
		<frame name="frameMenu" scrolling="no" src="${pageContext.request.contextPath}/login/showMenu.action" id="FrameMenu"></frame>
		<frameset cols="*" frameborder="NO" border="0" framespacing="0" rows="100%,*">
	    	<frame name="FrameAplicacao" scrolling="no" src="${pageContext.request.contextPath}/login/showHome.action" id="FrameAplicacao"></frame>
		</frameset>
		<noframes>
			<body bgcolor="#FFFFFF">Frames not available</body>
		</noframes>
	</frameset>
</html>
