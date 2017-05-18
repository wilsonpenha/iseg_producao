<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<HTML>
<HEAD>
<META http-equiv="Content-Type" content="text/html; charset=UTF-8"></META>
<TITLE>Openbravo</TITLE>
</HEAD>
<FRAMESET cols="25%,1*" frameborder="no" border="0" framespacing="0" rows="*" id="framesetMenu">
  <FRAME name="frameMenu" scrolling="no" src="<tiles:insertAttribute name='frame-menu' />" id="FrameMenu"></FRAME>
  <FRAMESET cols="*" frameborder="NO" border="0" framespacing="0" rows="100%,*">
    <FRAME name="FrameAplicacao" scrolling="no" src="<tiles:insertAttribute name='content-pane' />" id="FrameAplicacao"></FRAME>
    <FRAME name="frameOculto" scrolling="NO" src="${pageContext.request.contextPath}/jsp/Login_F0.html?Command=BLANK"></FRAME>
  </FRAMESET>
<NOFRAMES>
<BODY bgcolor="#FFFFFF">
  Frames not available

</BODY></NOFRAMES>

</FRAMESET></HTML>
