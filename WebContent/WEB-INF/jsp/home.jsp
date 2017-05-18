<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<%@page import="iseg.app.model.Usuario"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
<title>iSeg - Gestão Inteligente</title>

<LINK rel="SHORTCUT ICON" href="${pageContext.request.contextPath}/common/web/images/iseg.ico"></LINK> 
<link rel="stylesheet" type="text/css" href="../common/web/skins/Default/Login/Login.css" id="paramCSS"></link>

<link rel="stylesheet" href="<s:url value="/common/wizardFinal/tab-panel.css" includeParams="none"/>" type="text/css" />
<link rel="stylesheet" href="<s:url value="/common/wizardFinal/tabpane-ob.css" includeParams="none"/>" type="text/css" />
<link rel="stylesheet" href="<s:url value="/common/wizardFinal/esquema.css" includeParams="none"/>" type="text/css" />
<link rel="stylesheet" type="text/css" href="<s:url value="/common/styles/loader/loader.css" includeParams="none"/>"></link>
<link rel="stylesheet" type="text/css" href="<s:url value="/common/web/skins/Default/Main/Main_Edition.css" includeParams="none" />" id="paramCSS"></link>

<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery-1.5.1.min.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/confirm-pack.js?v=0" includeParams="none"/>"></script>  
<script language="javascript" charset="UTF-8" src="<s:url value="/common/common-pack.js?v=3" includeParams="none"/>" includeParams="none"/>"></script>  
<script language="javascript" charset="UTF-8" src="<s:url value="/common/web/js/utils-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/hotkeys-pack.js?v=1" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/event-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/masked-input-pack.js?v=0" includeParams="none"/>"></script>

<script charset="UTF-8" type="text/javascript">defineContext('<s:url value="/" includeParams="none"/>');</script>

<script language="javascript" charset="UTF-8" src="<s:url value="/common/xbLibrary-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/xbDebug-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/xbDOM-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/xbStyle-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/xbStyle-css-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/TableSort-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/web/js/utils-pack.js?v=0" includeParams="none"/>"></script>

</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="resizeArea();" onresize="resizeArea();">

<s:if test="posVendas.size() > 0">
  <form id="formLista" name="formLista" method="post">
    <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>
  
  <s:submit id="submitButton" cssStyle="display:none" theme="simple"/>
  <s:textfield theme="simple" id="posVendaId" name="posVenda.id" cssStyle="display:none;" />
  
  <table height="100%" border="0" cellpadding="0" cellspacing="0" id="main">
	<tr> 
	  <td valign="top" id="tdleftTabs" style="width: 25px;">
		<table cellpadding="0" cellspacing="0" class="Main_ContentPane_LeftTabsBar" id="tdLeftTabsBars" >
		  <tr>
			<td class="Main_LeftTabsBar_bg_body" id="Main_LeftTabsBar">
			  <table cellpadding="0" cellspacing="0" class="Main_LeftTabsBar">
				<tr>
				  <td class="Main_LeftTabsBar_bg_top"></td>
				</tr>
				<tr> 
				  <td>
					<a class="Main_LeftTabsBar_ButtonLeft" href="#" onclick="mostrarMenu('buttonMenu');resizeArea(true);return false;">
					  <img class="Main_LeftTabsBar_ButtonLeft_Icon Main_LeftTabsBar_ButtonLeft_Icon_arrow_hide" src="<s:url value="/common/web/images/blank.gif" />" border="0" id="buttonMenu" />
					</a>
				  </td>
				</tr>
				<tr>
				  <td class="Main_LeftTabsBar_bg_separator_cell"></td>
				</tr>
				<tr>
				  <td>
					<div class="Main_LeftTabsBar_ButtonRight_selected">
					  <img class="Main_LeftTabsBar_ButtonRight_Icon Main_LeftTabsBar_ButtonRight_Icon_edition_selected" src="<s:url value="/common/web/images/blank.gif" />" border="0" />
					</div>
				  </td>
				</tr>
				<tr>
				  <td>
					<a class="Main_LeftTabsBar_ButtonRight" href="#" >
					  <img class="Main_LeftTabsBar_ButtonRight_Icon Main_LeftTabsBar_ButtonRight_Icon_relation" src="<s:url value="/common/web/images/blank.gif" />" border="0" />
					</a>
				  </td>
				</tr>
				<tr>
				  <td class="Main_LeftTabsBar_bg_empty_cell"></td>
				</tr>
			  </table>
			</td>
		  </tr>
		  <tr class="Main_LeftTabsBar_bg_empty_cell">
			<td class="Main_LeftTabsBar_bg_empty_cell"></td>
		  </tr>
		</table>
	  </td>
	  <td valign="top" style="width: 8px">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="Main_ContentPane_Left">
		  <tr>
			<td class="Main_NavBar_bg_left" id="tdleftSeparator"></td>
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
	  <td valign="top">
		<div class="Main_ContentPane_NavBar" id="tdtopButtons">
		  <table class="Main_ContentPane_NavBar" id="tdtopNavButtons">
			<tr class="Main_NavBar_bg">
			  <td></td>
			  <td class="Main_NavBar_LeftButton_cell"></td>
			  <td class="Main_NavBar_separator_cell"></td>
			  <td class="Main_NavBar_LeftButton_cell">
				<a class="Main_NavBar_LeftButton" href="#" onclick="" border="0" onmouseover="window.status='Reload Current Page';return true;" onmouseout="window.status='';return true;"><img src="<s:url value="/common/web/images/blank.gif" />" class="Main_NavBar_LeftButton_Icon Main_NavBar_LeftButton_Icon_refresh" border="0" alt="Reload Current Page" title="Reload Current Page" /></a>
			  </td>
			  <td class="Main_NavBar_Breadcrumb_cell">
			  	<span class="Main_NavBar_Breadcrumb" id="paramBreadcrumb"></span>
			  </td>
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
			<td width="2%" ><a href="#" onClick="submitForm(document.formLista, '<s:url action="listafirst.action" includeParams="none" />', false);" class="Main_ToolBar_Button" onMouseOver="window.status='Primeira Página';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonFirst"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_First" id="buttonFirst" title="Primeira Página"></a></td>
			<td width="2%" ><a href="#" onClick="submitForm(document.formLista, '<s:url action="listaprevious.action" includeParams="none" />', false);" class="Main_ToolBar_Button" onMouseOver="window.status='Página Anterior';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonPrevious"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Previous" id="buttonPrevious" title="Página Anterior"></a></td>
			<td width="2%" ><a href="#" onClick="submitForm(document.formLista, '<s:url action="listanext.action" includeParams="none" />', false);" class="Main_ToolBar_Button" onMouseOver="window.status='Próxima Página';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonNext"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Next" id="buttonNext" title="Próxima Página"></a></td>
			<td width="2%" ><a href="#" onClick="submitForm(document.formLista, '<s:url action="listalast.action" includeParams="none" />', false);" class="Main_ToolBar_Button" onMouseOver="window.status='Última Página';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonLast"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Last" id="buttonLast" title="Última Página"></a></td>
			<td width="1"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_textlabel_bg_left"/></td>
			<td class="Main_ToolBar_textlabel_bg_body"><nobr id="bookmark" class="Main_ToolBar_text_bookmark"><s:property value="firstPosition"/>-<s:property value="lastPosition"/>/<s:property value="listCount"/></nobr></td>
			<td width="1"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_textlabel_bg_right"/></td>
			<td class="Main_ToolBar_Separator_cell" ><img src="<s:url value="/common/web/images/blank.gif" />" class="Main_ToolBar_Separator"/></td>
			<td class="Main_ToolBar_Space"></td>
			<!-- 
			<td width="1"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_textlabel_bg_left"/></td>
			<td class="Main_ToolBar_textlabel_bg_body"><a class="Main_ToolBar_text_relatedinfo" href="#" onclick="">Linked Items</a></td>
			<td class="Main_ToolBar_textlabel_bg_right" width="2%" ><a href="#" onclick="" class="Main_ToolBar_Button" onmouseover="window.status='Linked Items';return true;" onmouseout="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonRelatedInfo"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_RelatedInfo" id="buttonRelatedInfo" title="Linked Items"/></a></td>
			 -->
	            </tr>
          </table>
        </div>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="Main_ContentPane_TabPane" id="tdtopTabs">
			<tr id="paramParentTabContainer">
				<td class="tabBackGroundInit" style="background-color: #505050"></td>
			</tr>
		</table>
			<div class="Main_ContentPane_Client" style="overflow:hidden;" id="client">
		  <table width="100%" summary="" id="sectionDetail" style="height: 100%; border: 3px" cellpadding="0" cellspacing="0">
			<tr>
			  <td valign="top"  style="padding-left: 10px; padding-right: 10px;">
				<table width="100%" cellspacing="0" cellpadding="0" border="0" class="Main_Client_TableRelation" style="margin: 0px 0px 0px 0px">
				  <tr>
					<td>          
		      <jsp:include page="posVenda/homeDisplayListResult.jsp" flush="false"></jsp:include>
		     
					</td>
				  </tr>
				</table>
			  </td>
			</tr>
		  </table>
		</div>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="Menu_ContentPane_Bottom" id="tdbottomSeparator">
		  <tr>
			<td class="Main_Bottom_bg"><img src="<s:url value="/common/web/images/blank.gif" includeParams="none" />" border="0"></img></td>
		  </tr>
		</table>
	  </td>
	  <td valign="top" style="width: 8px;">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="Main_ContentPane_Right" id="tdrightSeparator">
		  <tr><td class="Main_NavBar_bg_right"></td></tr>
		  <tr><td class="Main_ToolBar_bg_right" valign="top"></td></tr>
		  <tr><td class="Main_Client_bg_right"></td></tr>
		  <tr><td class="Main_Bottom_bg_right"></td></tr>
		</table>
	  </td>
	</tr>
  </table>
  </form>
</s:if>
<s:else>
  <table height="100%" border="0" cellpadding="0" cellspacing="0" id="main">
    <tr>
      <td valign="top" id="tdleftTabs"><table cellpadding="0" cellspacing="0" class="Main_ContentPane_LeftTabsBar" id="tdLeftTabsBars">
  <tr>
    <td class="Main_LeftTabsBar_bg_body">
      <table cellpadding="0" cellspacing="0" class="Main_LeftTabsBar">
        <tr>
          <td class="Main_LeftTabsBar_bg_top">
          </td>
        </tr>
        <tr>
          <td>
              <A class="Main_LeftTabsBar_ButtonLeft" href="#" onclick="mostrarMenu('buttonMenu');return false;">
                <IMG class="Main_LeftTabsBar_ButtonLeft_Icon Main_LeftTabsBar_ButtonLeft_Icon_arrow_hide" src="../common/web/images/blank.gif" border="0" id="buttonMenu"></IMG>
              </A>
          </td>
        </tr>
        <tr>
          <td class="Main_LeftTabsBar_bg_separator_cell">
          </td>
        </tr>
        <tr>
          <td class="Main_LeftTabsBar_bg_empty_cell">
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr class="Main_LeftTabsBar_bg_empty_cell">
    <td class="Main_LeftTabsBar_bg_empty_cell">
    </td>
  </tr>
</table>
</td>
      <td valign="top">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="Main_ContentPane_Left">
          <tr><td class="Main_NavBar_bg_left" id="tdleftSeparator"></td></tr>
          <tr><td class="Main_ToolBar_bg_left" valign="top"></td></tr>
          <tr><td class="Main_Client_bg_left"></td></tr>
          <tr><td class="Main_Bottom_bg_left"></td></tr>
        </table>
      </td>
      <td valign="top">
        <DIV class="Main_ContentPane_NavBar" id="tdtopButtons">
          <table cellpadding="0" cellspacing="0" class="Main_ContentPane_NavBar" id="tdtopNavButtons">
            <tr class="Main_NavBar_bg">
              <td width="100%" align="left"><span class="Main_NavBar_Breadcrumb" id="paramBreadcrumb"></span></td>
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
        </DIV>
        <DIV class="Login_ContentPane_ToolBar" id="paramToolBar">
        
          <table class="Login_ContentPane_ToolBar Login_ToolBar_bg" id="tdToolBar">
            <tr>
              <td width="100%"></td>
            </tr>
          </table>
        
        </DIV>
        <DIV class="Login_ContentPane_Home" style="overflow: auto; display: none;" id="client">
          <table cellspacing="0" cellpadding="0" border="0" class="Login_Home_TableEdition">
            <tr>
              <td class="Login_Home_Logo">
                <div align="center" style="width: 100%">
                	<DIV border="0" style="background: transparent url(../common/images/logo_iSeg.jpg) no-repeat scroll center; height: 364px; width: 400px;"></DIV>
                </div>
              </td>
            </tr>
          </table>
        </DIV>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="Menu_ContentPane_Bottom" id="tdbottomSeparator">
          <tr>
            <td class="Main_Bottom_bg"><IMG src="../common/web/images/blank.gif" border="0"></IMG></td>
          </tr>
        </table></td>
      <td valign="top">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="Main_ContentPane_Right" id="tdrightSeparator">
          <tr><td class="Main_NavBar_bg_right"></td></tr>
          <tr><td class="Main_ToolBar_bg_right" valign="top"></td></tr>
          <tr><td class="Main_Client_bg_right"></td></tr>
          <tr><td class="Main_Bottom_bg_right"></td></tr>
        </table>
      </td>
    </tr>
  </table>
</s:else>
<script type="text/javascript">
var alterado=false;
</script>

</body></html>