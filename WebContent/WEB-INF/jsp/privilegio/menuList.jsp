<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns:="http://www.w3.org/1999/xhtml">

<head>    

<title>iSeg - Gestão Inteligente</title>

<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta http-equiv="Expires" content="-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache"> 

<link rel="stylesheet" href="<s:url value="/common/wizardFinal/esquema.css" includeParams="none"/>" type="text/css" />
<link rel="stylesheet" type="text/css" href="<s:url value="/common/jquery.autocomplete.css" includeParams="none"/>"></link>           
<link rel="stylesheet" type="text/css" href="<s:url value="/common/styles/loader/loader.css" includeParams="none"/>"></link>
<link rel="stylesheet" type="text/css" href="<s:url value="/common/web/skins/Default/Main/Main_Edition.css" includeParams="none" />" id="paramCSS"></link>

<link rel="stylesheet" type="text/css" href="<s:url value="/common/web/skins/Default/Menu/Menu.css" />" title="StyleGrid" id="paramCSS"></link>
<script language="javaScript" src="<s:url value="/common/web/js/menuWindows.js?v=0" />" type="text/javascript"></script>

<script language="javascript" charset="UTF-8" src="<s:url value="/common/confirm-pack.js?v=0" includeParams="none"/>"></script>  
<script language="javascript" charset="UTF-8" src="<s:url value="/common/common-pack.js?v=3" includeParams="none"/>" includeParams="none"/>"></script>  
<script language="javascript" charset="UTF-8" src="<s:url value="/common/web/js/utils-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/hotkeys-pack.js?v=1" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery-1.5.1.min.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery-form-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.autocomplete-pack.js?v=0" includeParams="none"/>"></script>
<script charset="UTF-8" src="<s:url value="/common/jquery.simplemodal-1.1.1-pack.js?v=0" includeParams="none"/>" type='text/javascript'></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/is-date-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/event-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/masked-input-pack.js?v=0" includeParams="none"/>"></script>

<script language="javascript" charset="UTF-8" src="<s:url value="/common/xbLibrary-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/xbDebug-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/xbDOM-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/xbStyle-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/xbStyle-css-pack.js?v=0" includeParams="none"/>"></script>


<script charset="UTF-8" type="text/javascript">defineContext('<s:url value="/" includeParams="none"/>');</script>

<script charset="UTF-8" language="javascript">

var selected = false;
var alterado = false;

// Define as PF's no Wizard
// F4
keyActions [0] = {character:  115,
				  actionType: "code",
				  param:      "executarBotao('btnf3');"};
// F5
keyActions [1] = {character:  116,	
                  actionType: "code",
                  param:      "executarBotao('btnf5');"};
// F7
keyActions [3] = {character:  118,	
                  actionType: "code",
                  param:      "executarBotao('btnf7');"};
// F9
keyActions [2] = {character:  120,	
                  actionType: "code",
                  param:      "executarBotao('btnf9');"};
// F6
keyActions [4] = {character:  117,	
                  actionType: "code",
                  param:      "executarBotao('btnf6');"};
// F11                  
keyActions [5] = {character:  122,	
                  actionType: "code",
                  param:      "executarBotao('btnf11');"};
</script>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="init();focusFirst();">
<form id="formLista" namespace="/privilegio" name="formLista" method="post">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

  <s:submit id="submitButton" cssStyle="display:none" theme="simple"/>
  <input type="hidden" name="role.id" value="<s:property value="role.id"/>"/>
  <input type="hidden" name="menuRole.role.id" value="<s:property value="role.id"/>"/>
  
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
					<a class="Main_LeftTabsBar_ButtonRight" href="#" onclick="submitForm(document.formLista, '<s:url action='displayList.action' includeParams="none"/>', false);">
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
			  <!--
			  <td class="Main_NavBar_RightButton_cell">
				<a class="Main_NavBar_RightButton" href="#" onclick="about();return false;" border="0" onmouseover="window.status='About';return true;" onmouseout="window.status='';return true;"><img src="<s:url value="/common/web/images/blank.gif" />" class="Main_NavBar_RightButton_Icon Main_NavBar_RightButton_Icon_about" border="0" alt="About" title="About"/></a>
			  </td>
			  <td class="Main_NavBar_separator_cell"></td>
			  <td class="Main_NavBar_RightButton_cell">
				<a class="Main_NavBar_RightButton" href="#" onclick="" border="0" onmouseover="window.status='Help';return true;" onmouseout="window.status='';return true;"><img src="<s:url value="/common/web/images/blank.gif" />" class="Main_NavBar_RightButton_Icon Main_NavBar_RightButton_Icon_help" border="0" alt="Help" title="Help"/></a>
			  </td>
			  <td class="Main_NavBar_separator_cell"></td>
			  <td class="Main_NavBar_bg_logo_left"></td>
			  <td class="Main_NavBar_bg_logo" width="1" onclick="window.open('http://www.atlasinfo.com.br','','width=800,height=600,resizable=yes');return false;"><img src="<s:url value="/common/images/atlasinfo.gif" />" alt="AtlasInfo" title="AtlasInfo" border="0" id="openbravoLogo"/></td>
			  <td class="Main_NavBar_bg_logo_right"></td>
			  -->
			  <td></td>
			</tr>
		  </table>
		</div>
        <div class="Main_ContentPane_ToolBar" id="paramToolBar">
          <table class="Main_ContentPane_ToolBar Main_ToolBar_bg" id="tdToolBar">
            <tr>
			<td width="2%" ><a href="#" onclick="" class="Main_ToolBar_Button" onmouseover="window.status='Anexar Arquivo';return true;" onmouseout="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonAttachment"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Attachment" id="buttonAttachment" title="Anexar Arquivo"/></a></td>
			<td width="2%" ><a href="#" onclick="" class="Main_ToolBar_Button" onmouseover="window.status='Exportar p/ Excel';return true;" onmouseout="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonExportExcel"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_ExportExcel" id="buttonExportExcel" title="Exportar p/ Excel"/></a></td>
			<td width="2%" ><a href="#" onclick="" class="Main_ToolBar_Button" onmouseover="window.status='Exportar p/ CSV';return true;" onmouseout="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonExportCsv"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_ExportCsv" id="buttonExportCsv" title="Exportar p/ CSV"/></a></td>
			<td width="2%" ><a href="#" onclick="" class="Main_ToolBar_Button" onmouseover="window.status='Exportar p/ PDF';return true;" onmouseout="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonExportPDF"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_ExportPDF" id="buttonExportPDF" title="Exportar p/ PDF"/></a></td>
			<td width="2%" ><a href="#" onclick="" class="Main_ToolBar_Button" onmouseover="window.status='Efetuar uma Busca';return true;" onmouseout="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonSearch"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Search" id="buttonSearch" title="Efetuar uma Busca"/></a></td>
			<td class="Main_ToolBar_Separator_cell" ><img src="<s:url value="/common/web/images/blank.gif" />" class="Main_ToolBar_Separator"/></td>
			<td width="2%"><a href="#" onclick="listaFirst();" class="Main_ToolBar_Button" onmouseover="window.status='xxxxxxxxxxxxxxxx';return true;" onmouseout="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonFirst"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_First" id="buttonFirst" title="Primeira Página"/></a></td>
			<td width="2%" ><a href="#" onclick="listaPrevious();" class="Main_ToolBar_Button" onmouseover="window.status='Página Anterior';return true;" onmouseout="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonPrevious"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Previous" id="buttonPrevious" title="Página Anterior"/></a></td>
			<td width="2%" ><a href="#" onclick="listaNext();" class="Main_ToolBar_Button" onmouseover="window.status='Próxima Página';return true;" onmouseout="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonNext"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Next" id="buttonNext" title="Próxima Página"/></a></td>
			<td width="2%" ><a href="#" onclick="listaLast();" class="Main_ToolBar_Button" onmouseover="window.status='Última Página';return true;" onmouseout="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonLast"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Last" id="buttonLast" title="Última Página"/></a></td>
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
			<!-- 
			<tr id="paramMainTabContainer">
			  <td class="tabBackGroundInit" style="background-color: #505050">
				<div>
				  <span class="tabTitle">
					<div>
					  <span>Menus</span>
					</div>
				  </span>
				</div>
			  </td>
			</tr>
			-->
			<tr>
				<td class="tabBackGround">
					<div class="marginLeft">
						<span class="dojoTabcurrentfirst">
							<div>
								<span>
									<a class="dojoTabLink" href="#" onclick="submitForm(document.formPrivilegioTabs, '<s:url value="/privilegio/editar.action" />', false);">Privilégio</a>
								</span>
							</div>
			         	</span>
			       		<span class="dojoTabcurrentfirst">
							<div>
								<span class="select">Menus</span>
							</div>
						</span>	
					</div>
				</td>
			</tr>			
		</table>
			<div class="Main_ContentPane_Client" style="overflow:auto;" id="client">
		  <table width="100%" summary="" id="sectionDetail" style="border: 3px" cellpadding="0" cellspacing="0">
			<tr>
			  <td valign="top"  style="padding-left: 10px; padding-right: 10px;">
				<table width="100%" cellspacing="0" cellpadding="0" border="0" class="Main_Client_TableRelation" style="margin: 0px 0px 0px 0px">
				  <tr>
					<td>
  <table width="100%" cellspacing="0" cellpadding="0" align="center" >
	<tr>
	  <td colspan="4">
		<div id="divMessages" style="padding-bottom: 10px;">
		  <s:actionerror/>
		  <s:actionmessage/>
		  <s:fielderror/>
		</div>
	  </td>
	</tr>
	<tr>
	  <td colspan="4" class="Button_RightAlign_ContentCell">
		<div align="center">
		  <table>
			<tr>
			  <td>
				<input type="button" id="btnf3" onclick="submitForm(document.formLista, '<s:url action="efetivarPrivilegios.action" includeParams="none" />', false);" style="display: none;"/>
				<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton"
					   onclick="document.getElementById('btnf3').click()">
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">F4-Efetivar Privilégios</td>
					<td class="wButton_right"/>
				  </tr>
				</table>
			  </td>
			</tr>
		  </table>
		</div>
	  </td>
	</tr>
	<tr>
       <td colspan="4">
		<div id="Menu_Client" class="Menu_ContentPane_Client" style="overflow: auto">
		<ul id="nav">
			<li id="navSub">
			<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_BigIcon_folder">
			&nbsp;Menus disponiveis</span></img>

			<ul id="nav0Sub">
			<s:iterator value="menuPaiList" status="level0">
			  	<li id="nav<s:property value="#level0.index+1"/>">
					<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_BigIcon_folder" id="<s:property value="id"/>" />
					<span onclick="checkUncheck('#_nav<s:property value="#level0.index+1"/>')">&nbsp;<s:property value="nome.valor"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><input onclick="checkUncheck('#_nav<s:property value="#level0.index+1"/>',true)" id="_nav<s:property value="#level0.index+1"/>" type="checkbox" class="checkList" <s:action name="checkMenuRole" executeResult="false"><s:param name="menuRole.menu.id">${id}</s:param></s:action><s:property value="#attr.direito" /> style="vertical-align: middle;" name="id" value="<s:property value="id"/>" />

			  		<s:if test="menuCollection.size>0">
						<ul id="nav<s:property value="#level0.index+1"/>Sub">
						<s:iterator value="menuCollection" status="level1">
						    <s:if test="%{id == menuIdSmsEventos || id == menuIdMenus || nome.valor == 'Ações'}">
								<li id="nav<s:property value="#level0.index+1"/>Sub<s:property value="#level1.index+1"/>" style="display: none">
							</s:if>
							<s:else>
								<li id="nav<s:property value="#level0.index+1"/>Sub<s:property value="#level1.index+1"/>" >
							</s:else>

						  		<s:if test="menuCollection.size>0">
									<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_BigIcon_folder" id="<s:property value="id"/>" />
									<span onclick="checkUncheck('#_nav<s:property value="#level0.index+1"/>Sub<s:property value="#level1.index+1"/>')">&nbsp;<s:property value="nome.valor"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><input onclick="checkUncheck('#_nav<s:property value="#level0.index+1"/>Sub<s:property value="#level1.index+1"/>',true)" id="_nav<s:property value="#level0.index+1"/>Sub<s:property value="#level1.index+1"/>" type="checkbox" class="checkList" <s:action name="checkMenuRole" executeResult="false"><s:param name="menuRole.menu.id">${id}</s:param></s:action><s:property value="#attr.direito" /> style="vertical-align: middle;" name="id" value="<s:property value="id"/>"/>

									<ul id="nav<s:property value="#level0.index+1"/>Sub<s:property value="#level1.index+1"/>Sub">
									<s:iterator value="menuCollection" status="level2">
										<li id="nav<s:property value="#level0.index+1"/>Sub<s:property value="#level1.index+1"/>Sub<s:property value="#level2.index+1"/>" >

									  		<s:if test="menuCollection.size>0">
												<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_BigIcon_folder" id="<s:property value="id"/>" />
												<span onclick="checkUncheck('#_nav<s:property value="#level0.index+1"/>Sub<s:property value="#level1.index+1"/>Sub<s:property value="#level2.index+1"/>')">&nbsp;<s:property value="nome.valor"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><input onclick="checkUncheck('#_nav<s:property value="#level0.index+1"/>Sub<s:property value="#level1.index+1"/>Sub<s:property value="#level2.index+1"/>',true)" id="_nav<s:property value="#level0.index+1"/>Sub<s:property value="#level1.index+1"/>Sub<s:property value="#level2.index+1"/>" type="checkbox" class="checkList" <s:action name="checkMenuRole" executeResult="false"><s:param name="menuRole.menu.id">${id}</s:param></s:action><s:property value="#attr.direito" /> style="vertical-align: middle;" name="id" value="<s:property value="id"/>"/>

												<ul id="nav<s:property value="#level0.index+1"/>Sub<s:property value="#level1.index+1"/>Sub<s:property value="#level2.index+1"/>Sub">
												<s:iterator value="menuCollection" status="level3">
													<li id="nav<s:property value="#level0.index+1"/>Sub<s:property value="#level1.index+1"/>Sub<s:property value="#level2.index+1"/>Sub<s:property value="#level3.index+1"/>" >
														<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_Icon_childWindows" id="<s:property value="id"/>" />
														<span onclick="checkUncheck('#_nav<s:property value="#level0.index+1"/>Sub<s:property value="#level1.index+1"/>Sub<s:property value="#level2.index+1"/>Sub<s:property value="#level3.index+1"/>')">&nbsp;<s:property value="nome.valor"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><input onclick="checkUncheck('#_nav<s:property value="#level0.index+1"/>Sub<s:property value="#level1.index+1"/>Sub<s:property value="#level2.index+1"/>Sub<s:property value="#level3.index+1"/>',true)" id="_nav<s:property value="#level0.index+1"/>Sub<s:property value="#level1.index+1"/>Sub<s:property value="#level2.index+1"/>Sub<s:property value="#level3.index+1"/>" type="checkbox" class="checkList" <s:action name="checkMenuRole" executeResult="false"><s:param name="menuRole.menu.id">${id}</s:param></s:action><s:property value="#attr.direito" /> style="vertical-align: middle;" name="id" value="<s:property value="id"/>"/>
														<s:if test="acaoCollection.size>0">
														    &nbsp;|&nbsp;Botões ->
															<s:iterator value="acaoCollection" status="levelAcao0">
																&nbsp;<label for="_acao${id}">&nbsp;<s:property value="actionName.valor"/>&nbsp;&nbsp;&nbsp;&nbsp;</label><input id="_acao${id}" type="checkbox" class="checkList" <s:action name="checkAcaoRole" executeResult="false"><s:param name="acaoRole.acao.id">${id}</s:param></s:action><s:property value="#attr.direito" /> style="vertical-align: middle;" name="acaoId" value="<s:property value="id"/>"/>
															</s:iterator>
														</s:if>
													</li>
												</s:iterator>
												</ul>
											</s:if>
											<s:else>
												<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_Icon_childWindows" id="<s:property value="id"/>" />
												<span onclick="checkUncheck('#_nav<s:property value="#level0.index+1"/>Sub<s:property value="#level1.index+1"/>Sub<s:property value="#level2.index+1"/>')">&nbsp;<s:property value="nome.valor"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><input onclick="checkUncheck('#_nav<s:property value="#level0.index+1"/>Sub<s:property value="#level1.index+1"/>Sub<s:property value="#level2.index+1"/>',true)" id="_nav<s:property value="#level0.index+1"/>Sub<s:property value="#level1.index+1"/>Sub<s:property value="#level2.index+1"/>" type="checkbox" class="checkList" <s:action name="checkMenuRole" executeResult="false"><s:param name="menuRole.menu.id">${id}</s:param></s:action><s:property value="#attr.direito" /> style="vertical-align: middle;" name="id" value="<s:property value="id"/>"/>
												<s:if test="acaoCollection.size>0">
												    &nbsp;|&nbsp;Botões ->
													<s:iterator value="acaoCollection" status="levelAcao1">
														&nbsp;<label for="_acao${id}">&nbsp;<s:property value="actionName.valor"/>&nbsp;&nbsp;&nbsp;&nbsp;</label><input id="_acao${id}" type="checkbox" class="checkList" <s:action name="checkAcaoRole" executeResult="false"><s:param name="acaoRole.acao.id">${id}</s:param></s:action><s:property value="#attr.direito" /> style="vertical-align: middle;" name="acaoId" value="<s:property value="id"/>"/>
													</s:iterator>
												</s:if>
											</s:else>
										</li>
									</s:iterator>
									</ul>
								</s:if>
								<s:else>
								    <s:if test="%{id == menuIdSmsEventos || id == menuIdMenus || nome.valor == 'Ações'}">
										<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_Icon_childWindows" id="<s:property value="id"/>" />
										<span onclick="checkUncheck('#_nav<s:property value="#level0.index+1"/>Sub<s:property value="#level1.index+1"/>')">&nbsp;<s:property value="nome.valor"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
									</s:if>
									<s:else>
										<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_Icon_childWindows" id="<s:property value="id"/>" />
										<span onclick="checkUncheck('#_nav<s:property value="#level0.index+1"/>Sub<s:property value="#level1.index+1"/>')">&nbsp;<s:property value="nome.valor"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><input onclick="checkUncheck('#_nav<s:property value="#level0.index+1"/>Sub<s:property value="#level1.index+1"/>',true)" id="_nav<s:property value="#level0.index+1"/>Sub<s:property value="#level1.index+1"/>" type="checkbox" class="checkList" <s:action name="checkMenuRole" executeResult="false"><s:param name="menuRole.menu.id">${id}</s:param></s:action><s:property value="#attr.direito" /> style="vertical-align: middle;" name="id" value="<s:property value="id"/>"/>
										<s:if test="acaoCollection.size>0">
										    &nbsp;|&nbsp;Botões ->
											<s:iterator value="acaoCollection" status="levelAcao2">
												&nbsp;<label for="_acao${id}">&nbsp;<s:property value="actionName.valor"/>&nbsp;&nbsp;&nbsp;&nbsp;</label><input id="_acao${id}" type="checkbox" class="checkList" <s:action name="checkAcaoRole" executeResult="false"><s:param name="acaoRole.acao.id">${id}</s:param></s:action><s:property value="#attr.direito" /> style="vertical-align: middle;" name="acaoId" value="<s:property value="id"/>"/>
											</s:iterator>
										</s:if>
									</s:else>
								</s:else>
							</li>
						</s:iterator>
						</ul>
					</s:if>
				</li>
			</s:iterator>
			</ul>
			</li>
			</ul>
		</div>
       </td>
    </tr>
<tr>
        </tr>
          </table>
  <div id="pageloader" style="display:none;">Carregando...<br/></div>

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

<form name="formPrivilegioTabs">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<input type="hidden" name="id"/>
	<input type="hidden" name="role.id" value="<s:property value="role.id"/>"/>
</form>

<script>

// Estes parametros são para desativar as teclas PF's do browser.
if (navigator.appName=='Netscape') {
	window.onkeydown = frmRequest_KeyDown;
	//window.onkeypress = frmRequest_KeyPress;
}else{
	document.body.onkeydown = frmRequest_KeyDown;
	//document.body.onkeypress = frmRequest_KeyPress;
}

document.onhelp = function() {return(false);}

window.onresize = function(){init();}

jQuery(document).ready(function(){

	$('#bookmark')[0].innerHTML = '0-0/0';
	MaskInput($('#dataProposta').get(0), "99/99/9999");
	MaskInput($('#dataVencim1aParcela').get(0), "99/99/9999");

	$("#clienteNome").autocomplete('<s:url value="/objlookup/getClienteListByNome.action" includeParams="none" />', {idFieldsToUpdate:["#clienteId"],onEnterPress:"listaLista()",mustMatch:0,autoFill:false,  width:400,formatItemOnSelect:splitResultGetFirst});
	$("#clienteCpfCnpj").autocomplete('<s:url value="/objlookup/getClienteListByCpf.action" includeParams="none" />', {idFieldsToUpdate:["#clienteId"],onEnterPress:"listaLista()",mustMatch:0,autoFill:false,  width:400,formatItemOnSelect:splitResultGetFirst});

	addFunctionOnEnterPress(function(event){execOnEnterPress(event, 'listaLista()');}, 'clienteNome');
});

function checkUncheck(check,checkbox){
    if (!checkbox){
	    if(!$(check).is(':checked')){
	    	$(check).attr('checked', true);
	    }else{
	    	$(check).attr('checked', false);
	    }
	}
   	var obj = document.forms[0].id;
    for(var i in obj){
       	if (obj[i].type=='checkbox'){          
       		if($(check).is(':checked')){
       			if (obj[i].id.indexOf($(check).attr('id'))>=0){
       				obj[i].checked = true;
       			}
       		}else{
       			if (obj[i].id.indexOf($(check).attr('id'))>=0){
       				obj[i].checked = false;
       			}
       		}
       	}
    }
    if ($(check).attr('id').length==9){
    	if ($(check).is(':checked'))
    		$('#'+$(check).attr('id').substring(0,5)).attr('checked', true);
    }else if ($(check).attr('id').length==13){    	
    	if ($(check).is(':checked')){
    		$('#'+$(check).attr('id').substring(0,5)).attr('checked', true);
    		$('#'+$(check).attr('id').substring(0,9)).attr('checked', true);
    	}
    }else if ($(check).attr('id').length==17){
    	if ($(check).is(':checked')){
    		$('#'+$(check).attr('id').substring(0,5)).attr('checked', true);
    		$('#'+$(check).attr('id').substring(0,9)).attr('checked', true);
    		$('#'+$(check).attr('id').substring(0,13)).attr('checked', true);
    	}
    }    	
}

function showHideOpcoesNovaProposta(){
	$('#paramTipo').val() == 'NOVA' ? $('#opcoesNovaProposta').show() : $('#opcoesNovaProposta').hide();
}

</script>
<script language="javascript">

var tdleftTabs = null;
var tdtopButtons = null;
var tdBottomSeparetor = null;
var client = null;
var paramToolBar = null;

var stlTdleftTabs   = null;
var stlTdtopButtons   = null;
var stlTdBottomSeparetor   = null;
var stlClient = null;
var stlParamToolBar = null;

var windowHeight = null;
var windowWidth = null;

var wrapped = false;

function toggleDebug(debugging){
  if (debugging.value == '1')
    xbDEBUG.on = true;
  else 
    xbDEBUG.on = false;
}

inicializeMenu();

var navigation = document.getElementById('nav');
var navigationULs = navigation.getElementsByTagName('ul');

for (i = 0; i < navigationULs.length; i++) {
  navigationULs[i].style.display = "block";
}

function init() {

	client = xbGetElementById('client');
	tdleftTabs = xbGetElementById('tdleftTabs');
	tdtopButtons = xbGetElementById('tdtopButtons');
	tdBottomSeparetor = xbGetElementById('tdbottomSeparator');
	paramToolBar = xbGetElementById('paramToolBar');
	
	stlClient = new xbStyle(client);
	stlTdleftTabs = new xbStyle(tdleftTabs);
	stlTdtopButtons = new xbStyle(tdtopButtons);
	stlTdBottomSeparetor = new xbStyle(tdBottomSeparetor);
	stlParamToolBar = new xbStyle(paramToolBar);

	
/*	if (window.innerHeight){
		windowHeight=window.innerHeight;
		windowWidth=window.innerWidth;
//		stlCentral.setWidth(xbToInt(windowWidth - 16 )); 
		//alert(stlCorpo.getClientWidth());
		//alert(stlCorpo.getEffectiveValue('scroll'));
	}
	else if (document.body.clientHeight){*/
		windowHeight=document.documentElement.clientHeight;
	//}
	
	stlTdleftTabs.setHeight(windowHeight);
	stlClient.setHeight(xbToInt(windowHeight - stlTdtopButtons.getHeight() - stlTdBottomSeparetor.getHeight() - stlParamToolBar.getHeight() - 20));
//	stlTabFiller.setWidth(xbToInt(stlClient.getWidth()-100)); 

	// need this for NN4 since our form is in a relative div...
	if (xbDEBUG.on && !wrapped)
	{
		xbDebugTraceObject('window', 'xbStyle');
		xbDebugTraceObject('window', 'xbClipRect');
		wrapped = true;
	}
	if (xbDEBUG.on)
	{
		xbDebugDumpProfile();
	}
	
}

if ($('#mostraUltimaLista').val()=='true'){
	document.getElementById('btnf5').click();
	buttonMenuVisibility('buttonMenu', 'show');
	resizeArea(true);
}

</script>
