<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<html xmlns:="http://www.w3.org/1999/xhtml">

<head> 

<title>iSeg - Gestão Inteligente</title>

<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta http-equiv="Expires" content="-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">

<link rel="stylesheet" type="text/css" href="<s:url value="/common/web/skins/Default/Main/Main_Relation.css" includeParams="none"/>" id="paramCSS"></link>
<link rel="stylesheet" type="text/css" href="<s:url value="/common/web/skins/Default/Main/Main_Edition.css" />" id="paramCSS"></link>

<script language="javascript" src="<s:url value="/common/common-pack.js?v=1" includeParams="none"/>"></script>
<script language="javascript" src="<s:url value="/common/is-date.js?v=0" includeParams="none"/>"></script>
<script language="javascript" src="<s:url value="/common/event.js?v=0" includeParams="none"/>"></script>
<script language="javascript" src="<s:url value="/common/masked-input.js?v=0" includeParams="none"/>"></script>
<script language="javascript" src="<s:url value="/common/xbLibrary.js?v=0" includeParams="none"/>"></script>
<script language="javascript" src="<s:url value="/common/xbDebug.js?v=0" includeParams="none"/>"></script>
<script language="javascript" src="<s:url value="/common/xbDOM.js?v=0" includeParams="none"/>"></script>
<script language="javascript" src="<s:url value="/common/xbStyle.js?v=0" includeParams="none"/>"></script>
<script language="javascript" src="<s:url value="/common/xbStyle-css.js?v=0" includeParams="none"/>"></script>
<script language="javascript" src="<s:url value="/common/web/js/utils-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" src="<s:url value="/common/TableSort.js?v=0" includeParams="none"/>"></script>
<script type="text/javascript">defineContext('<s:url value="/" includeParams="none"/>');</script>


<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="resizeArea(true);updateMenuIcon('buttonMenu');focusFirst();"
	onresize="resizeArea(true);">
<form id="formLista" name="formLista" method="post">
<s:submit id="submitButton" cssStyle="display:none" theme="simple" /> 
<input id="propostaId" type="hidden" name="proposta.id" />

<table height="100%" border="0" cellpadding="0" cellspacing="0" id="main">
    <tr>
      <td valign="top" id="tdleftTabs"><table cellpadding="0" cellspacing="0" class="Main_ContentPane_LeftTabsBar" id="tdLeftTabsBars">
          <tr>
            <td class="Main_LeftTabsBar_bg_body">
              <table cellpadding="0" cellspacing="0" class="Main_LeftTabsBar">
                <tr>
                  <td class="Main_LeftTabsBar_bg_top"></td>
                </tr>
                <tr>
                  <td><a class="Main_LeftTabsBar_ButtonLeft" href="#" onclick="mostrarMenu('buttonMenu');resizeArea(true);return false;"><img class="Main_LeftTabsBar_ButtonLeft_Icon Main_LeftTabsBar_ButtonLeft_Icon_arrow_hide" src="<s:url value="/common/web/images/blank.gif" />" border="0" id="buttonMenu"></img> </a> </td>
                </tr>
                <tr>
                  <td class="Main_LeftTabsBar_bg_separator_cell"></td>
                </tr>
                <tr>
                  <td><a class="Main_LeftTabsBar_ButtonRight" href="#" > <IMG class="Main_LeftTabsBar_ButtonRight_Icon Main_LeftTabsBar_ButtonRight_Icon_edition" src="<s:url value="/common/web/images/blank.gif" />" border="0"></IMG> </A> </td>
                </tr>
                <tr>
                  <td><div class="Main_LeftTabsBar_ButtonRight_selected"> <IMG class="Main_LeftTabsBar_ButtonRight_Icon Main_LeftTabsBar_ButtonRight_Icon_relation_selected" src="<s:url value="/common/web/images/blank.gif" />" border="0"></IMG> </DIV></td>
                </tr>
                <tr>
                  <td class="Main_LeftTabsBar_bg_empty_cell"></td>
                </tr>
              </table></td>
          </tr>
          <tr class="Main_LeftTabsBar_bg_empty_cell">
            <td class="Main_LeftTabsBar_bg_empty_cell"></td>
          </tr>
        </table>
      </td>
      <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="Main_ContentPane_Left" id="tdleftSeparator">
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
        </table></td>
		<td valign="top">
		<div class="Main_ContentPane_NavBar" id="tdtopButtons">
		<table class="Main_ContentPane_NavBar" id="tdtopNavButtons">
			<tr class="Main_NavBar_bg">
				<td></td>
				<td class="Main_NavBar_LeftButton_cell"></td>
				<td class="Main_NavBar_separator_cell"></td>
				<td class="Main_NavBar_LeftButton_cell"><a
					class="Main_NavBar_LeftButton" href="#" onclick="" border="0"
					onmouseover="window.status='Reload Current Page';return true;"
					onmouseout="window.status='';return true;"><img
					src="<s:url value="/common/web/images/blank.gif" />"
					class="Main_NavBar_LeftButton_Icon Main_NavBar_LeftButton_Icon_refresh"
					border="0" alt="Reload Current Page" title="Reload Current Page" /></a>
				</td>
				<td class="Main_NavBar_Breadcrumb_cell">
				<span class="Main_NavBar_Breadcrumb" id="paramBreadcrumb"></span></td>
				<td></td>
				<!--
				<td class="Main_NavBar_RightButton_cell"><a
					class="Main_NavBar_RightButton" href="#"
					onclick="about();return false;" border="0"
					onmouseover="window.status='About';return true;"
					onmouseout="window.status='';return true;"><img
					src="<s:url value="/common/web/images/blank.gif" />"
					class="Main_NavBar_RightButton_Icon Main_NavBar_RightButton_Icon_about"
					border="0" alt="About" title="About" /></a></td>
				<td class="Main_NavBar_separator_cell"></td>
				<td class="Main_NavBar_RightButton_cell"><a
					class="Main_NavBar_RightButton" href="#" onclick="" border="0"
					onmouseover="window.status='Help';return true;"
					onmouseout="window.status='';return true;"><img
					src="<s:url value="/common/web/images/blank.gif" />"
					class="Main_NavBar_RightButton_Icon Main_NavBar_RightButton_Icon_help"
					border="0" alt="Help" title="Help" /></a></td>
				<td class="Main_NavBar_separator_cell"></td>
				<td class="Main_NavBar_bg_logo_left"></td>
				<td class="Main_NavBar_bg_logo" width="1"
					onclick="window.open('http://www.atlasinfo.com.br','','width=800,height=600,resizable=yes');return false;"><img
					src="<s:url value="/common/images/atlasinfo.gif" />"
					alt="AtlasInfo" title="AtlasInfo" border="0" id="openbravoLogo" /></td>
				<td class="Main_NavBar_bg_logo_right"></td>
				-->
				<td></td>
			</tr>
		</table>
		</div>
		<div class="Main_ContentPane_ToolBar" id="paramToolBar">
		<table class="Main_ContentPane_ToolBar Main_ToolBar_bg" id="tdToolBar">
			<tr>
				<td>&nbsp;</td>
			</tr>
		</table>
		</div>
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="Main_ContentPane_TabPane" id="tdtopTabs">
			<tr id="paramParentTabContainer">
				<td class="tabBackGroundInit" style="background-color: #505050"></td>
			</tr>
			<tr id="paramMainTabContainer">
				<td class="tabBackGroundInit" style="background-color: #505050">
				<div><span class="tabTitle">
				<div><span>Tutorial</span></div>
				</span></div>
				</td>
			</tr>

		</table>
		<DIV class="Main_ContentPane_Client" style="overflow: auto; display: none;" id="client">
		<table width="100%" summary="" id="sectionDetail">
			<tr>
				<td>
				<table width="97%" cellspacing="0" cellpadding="0" border="0"
					class="Main_Client_TableRelation">
					<tr>
						<td>
						<DIV style="z-index: 1000; overflow: hidden;">
						<div align="left">
						<table width="100%" border="0">
							<tr>
								<td>
								<table cellspacing="3" cellpadding="0" align="center" class="Main_Client_TableEdition">
									<tr>
										<td colspan="4">
										<table width="100%" class="FieldGroup" border="0"
											cellpadding="0" cellspacing="0">
											<tbody>
												<tr class="FieldGroup_TopMargin"></tr>
												<tr>
													<td class="FieldGroupTitle_Left"><img
														class="FieldGroupTitle_Left_bg"
														src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>"
														border="0" /></td>
													<td class="FieldGroupTitle_MaxSize">Tutorial</td>
													<td class="FieldGroupTitle_Right"><img
														class="FieldGroupTitle_Right_bg"
														src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>"
														border="0" /></td>
												</tr>
												<tr class="FieldGroup_BottomMargin"></tr>
											</tbody>
										</table>
										</td>
									</tr>
									<tr>
										<td colspan="4">
										<table class=" " id="tdToolBar"	style="width: 100%; background-color: #505050;">
											<tr>
												<td style="line-height: 8px;" width="100%">&nbsp;</td>
											</tr>
											<tr>
												<td><a href="#" class="Main_ToolBar_Button"
													onMouseOver="window.status='Novo Registro';return true;"
													onMouseOut="window.status='';return true;"
													onblur="this.hideFocus=false" id="linkButtonNew"><img
													class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_New"
													src="<s:url value="/common/web/images/blank.gif" />"
													title="Novo Registro" border="0" id="buttonNew"></a></td>
											</tr>
											<tr>
												<td style="line-height: 8px;" width="100%">&nbsp;</td>
											</tr>
											<tr>
												<td><a href="#" class="Main_ToolBar_Button"
													onMouseOver="window.status='Excluir Registro';return true;"
													onMouseOut="window.status='';return true;"
													onblur="this.hideFocus=false" id="linkButtonDelete"><img
													src="<s:url value="/common/web/images/blank.gif" />"
													width="1" height="1" border="0"
													class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Delete"
													id="buttonDelete" title="Excluir Registro"></a></td>
											</tr>
											<tr>
												<td style="line-height: 8px;" width="100%">&nbsp;</td>
											</tr>
											<tr>
												<td><a href="#" class="Main_ToolBar_Button"
													onMouseOver="window.status='Anexar arquivo';return true;"
													onMouseOut="window.status='';return true;"
													onblur="this.hideFocus=false" id="linkButtonAttachment"><img
													src="<s:url value="/common/web/images/blank.gif" />"
													width="1" height="1" border="0"
													class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Attachment"
													id="buttonAttachment" title="Anexar arquivo"></a></td>
											</tr>
											<tr>
												<td style="line-height: 8px;" width="100%">&nbsp;</td>
											</tr>
											<tr>
												<td><a href="#" class="Main_ToolBar_Button"
													onMouseOver="window.status='Exportar p/ Excel';return true;"
													onMouseOut="window.status='';return true;"
													onblur="this.hideFocus=false" id="linkButtonExportExcel"><img
													src="<s:url value="/common/web/images/blank.gif" />"
													width="1" height="1" border="0"
													class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_ExportExcel"
													id="buttonExportExcel" title="Exportar p/ Excel"></a></td>
											</tr>
											<tr>
												<td style="line-height: 8px;" width="100%">&nbsp;</td>
											</tr>
											<tr>
												<td><a href="#" class="Main_ToolBar_Button"
													onMouseOver="window.status='Exportar p/ CSV';return true;"
													onMouseOut="window.status='';return true;"
													onblur="this.hideFocus=false" id="linkButtonExportCsv"><img
													src="<s:url value="/common/web/images/blank.gif" />"
													width="1" height="1" border="0"
													class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_ExportCsv"
													id="buttonExportCsv" title="Exportar p/ CSV"></a></td>
											</tr>
											<tr>
												<td style="line-height: 8px;" width="100%">&nbsp;</td>
											</tr>
											<tr>
												<td><a href="#" class="Main_ToolBar_Button"
													onMouseOver="window.status='Exportar p/ PDF';return true;"
													onMouseOut="window.status='';return true;"
													onblur="this.hideFocus=false" id="linkButtonExportPDF"><img
													src="<s:url value="/common/web/images/blank.gif" />"
													width="1" height="1" border="0"
													class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_ExportPDF"
													id="buttonExportPDF" title="Exportar p/ PDF"></a></td>
											</tr>
											<tr>
												<td style="line-height: 8px;" width="100%">&nbsp;</td>
											</tr>
											<tr>
												<td><a href="#" class="Main_ToolBar_Button"
													onMouseOver="window.status='Efetuar uma busca';return true;"
													onMouseOut="window.status='';return true;"
													onblur="this.hideFocus=false" id="linkButtonSearch"><img
													src="<s:url value="/common/web/images/blank.gif" />"
													width="1" height="1" border="0"
													class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Search"
													id="buttonSearch" title="Efetuar uma busca"></a></td>
											</tr>
											<tr>
												<td style="line-height: 8px;" width="100%">&nbsp;</td>
											</tr>
											<tr>
												<td><a href="#" class="Main_ToolBar_Button"
													onMouseOver="window.status='Primeira Página';return true;"
													onMouseOut="window.status='';return true;"
													onblur="this.hideFocus=false" id="linkButtonFirst"><img
													src="<s:url value="/common/web/images/blank.gif" />"
													width="1" height="1" border="0"
													class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_First"
													id="buttonFirst" title="Primeira Página"></a></td>
											</tr>
											<tr>
												<td style="line-height: 8px;" width="100%">&nbsp;</td>
											</tr>
											<tr>
												<td><a href="#" class="Main_ToolBar_Button"
													onMouseOver="window.status='Página Anterior';return true;"
													onMouseOut="window.status='';return true;"
													onblur="this.hideFocus=false" id="linkButtonPrevious"><img
													src="<s:url value="/common/web/images/blank.gif" />"
													width="1" height="1" border="0"
													class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Previous"
													id="buttonPrevious" title="Página Anterior"></a></td>
											</tr>
											<tr>
												<td style="line-height: 8px;" width="100%">&nbsp;</td>
											</tr>
											<tr>
												<td><a href="#" class="Main_ToolBar_Button"
													onMouseOver="window.status='Próxima Página';return true;"
													onMouseOut="window.status='';return true;"
													onblur="this.hideFocus=false" id="linkButtonNext"><img
													src="<s:url value="/common/web/images/blank.gif" />"
													width="1" height="1" border="0"
													class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Next"
													id="buttonNext" title="Próxima Página"></a></td>
											</tr>
											<tr>
												<td style="line-height: 8px;" width="100%">&nbsp;</td>
											</tr>
											<tr>
												<td><a href="#" class="Main_ToolBar_Button"
													onMouseOver="window.status='Última Página';return true;"
													onMouseOut="window.status='';return true;"
													onblur="this.hideFocus=false" id="linkButtonLast"><img
													src="<s:url value="/common/web/images/blank.gif" />"
													width="1" height="1" border="0"
													class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Last"
													id="buttonLast" title="Última Página"></a></td>
											</tr>
											<tr>
												<td style="line-height: 8px;" width="100%">&nbsp;</td>
											</tr>
											<tr>
												<td class="Main_ToolBar_textlabel_bg_right"><a
													href="#" class="Main_ToolBar_Button"
													onMouseOver="window.status='Linked Items';return true;"
													onMouseOut="window.status='';return true;"
													onblur="this.hideFocus=false" id="linkButtonRelatedInfo"><img
													src="<s:url value="/common/web/images/blank.gif" />"
													width="1" height="1" border="0"
													class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_RelatedInfo"
													id="buttonRelatedInfo" title="Linked Items"></a></td>
											</tr>
											<tr>
												<td style="line-height: 8px;" width="100%">&nbsp;</td>
											</tr>
										</table>
										</td>
									</tr>
								</table>
								</td>
								</tr>
						</table>
						</div>
						</DIV>
						</td>
					</tr>
				</table>
				</td>
			</tr>
		</table>
		</DIV>
		</td>
	</tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0"
	class="Menu_ContentPane_Bottom" id="tdbottomSeparator">
	<tr>
		<td class="Main_Bottom_bg"><IMG
			src="<s:url value="/common/web/images/blank.gif" />" width="1"
			height="1" border="0"></IMG></td>
	</tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0"
	class="Main_ContentPane_Right" id="tdrightSeparator">
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
</form>
</body>
</head>
</html>
