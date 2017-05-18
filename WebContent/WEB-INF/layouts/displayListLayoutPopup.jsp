<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<tiles:insertAttribute name="content-header" />

<script language="javascript" src="${pageContext.request.contextPath}/js<tiles:getAsString name='package.namespace'/>/script.js?v=0"></script>
<sx:head cache="true"/>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="resizeArea(true);updateMenuIcon('buttonMenu');focusFirst();" onresize="resizeArea(true);">
<form id="lista" name="formLista" method="post">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>
  <input type="hidden" name="page" value="${page}">
  <input type="hidden" name="listCount" value="${listCount}">
  <s:submit id="submitButton" cssStyle="display:none" theme="simple"/>
  <table height="100%" border="0" cellpadding="0" cellspacing="0" id="main">
    <tr>
      <td valign="top">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="Main_ContentPane_Left" id="tdleftSeparator">
          <tr>
            <td class="Main_NavBar_bg_left"></td>
          </tr>
          <tr>
            <td class="Main_ToolBar_bg_left" valign="top"></td>
          </tr>
          <tr>
            <td class="Main_Client_bg_left"></td>
          </tr>
          <tr>
            <td class="Main_Bottom_bg_left"></td>
          </tr>
        </table>
      </td>
      <td valign="top"><div class="Main_ContentPane_NavBar" id="tdtopButtons">
          <table class="Main_ContentPane_NavBar" id="tdtopNavButtons">
            <tr class="Main_NavBar_bg">
			  <td></td>
			  <td class="Main_NavBar_RightButton_cell">
				<a class="Main_NavBar_RightButton" href="http://www.iseg.net.br/manuais/guia_rapido/index.html" target="new" border="0" onmouseover="window.status='Help';return true;" onmouseout="window.status='';return true;"><img src="<s:url value="/common/web/images/blank.gif" />" class="Main_NavBar_RightButton_Icon Main_NavBar_RightButton_Icon_help" border="0" alt="Guia rápido" title="Guia rápido"></a>
			  </td>
			  <td class="Main_NavBar_separator_cell"></td>
			  <td class="Main_NavBar_RightButton_cell">
				<a class="Main_NavBar_RightButton" href="http://www.iseg.net.br" target="new" border="0" onmouseover="window.status='About';return true;" onmouseout="window.status='';return true;"><img src="<s:url value="/common/web/images/blank.gif" />" class="Main_NavBar_RightButton_Icon Main_NavBar_RightButton_Icon_about" border="0" alt="Sobre o iSeg" title="Sobre o iSeg"></a>
			  </td>
			  <td></td>
            </tr>
          </table>
        </div>
        <div class="Main_ContentPane_ToolBar" id="paramToolBar">
          <table class="Main_ContentPane_ToolBar Main_ToolBar_bg" id="tdToolBar">
            <tr>
			  <tiles:insertAttribute name="tool-bar" />
            </tr>
          </table>
        </div>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="Main_ContentPane_TabPane" id="tdtopTabs">
			<tr id="paramParentTabContainer">
				<td class="tabBackGroundInit"></td>
			</tr>
			<tr id="paramMainTabContainer">
			  <td class="tabBackGroundInit">
				<div>
				  <span class="tabTitle">
					<div>
					  <span><tiles:insertAttribute name="title" /></span>
					</div>
				  </span>
				</div>
			  </td>
			</tr>
			<tiles:insertAttribute name="content-tabs" />
		</table>
        <div class="Main_ContentPane_Client" style="overflow: auto; display: none;" id="client">
          <table width="100%" summary="" id="sectionDetail">
            <tr>
              <td>
              
                <table width="97%" cellspacing="0" cellpadding="0" border="0" class="Main_Client_TableRelation">
                  <tr>
                    <td><div style="z-index: 1000;overflow: auto;"><tiles:insertAttribute name="content-main" /></div></td><td width="2%">&nbsp;</td>
                  </tr>
                </table></td>
            </tr>
          </table>
        </div>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="Menu_ContentPane_Bottom" id="tdbottomSeparator">
          <tr>
            <td class="Main_Bottom_bg"><IMG src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0"></IMG></td>
          </tr>
        </table></td>
      <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="Main_ContentPane_Right" id="tdrightSeparator">
          <tr>
            <td class="Main_NavBar_bg_right"></td>
          </tr>
          <tr>
            <td class="Main_ToolBar_bg_right" valign="top"></td>
          </tr>
          <tr>
            <td class="Main_Client_bg_right"></td>
          </tr>
          <tr>
            <td class="Main_Bottom_bg_right"></td>
          </tr>
        </table></td>
    </tr>
  </table>
</FORM>
<tiles:insertAttribute name="content-footer" />
