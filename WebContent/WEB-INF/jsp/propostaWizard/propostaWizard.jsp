<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    
<head>
<title>Pedido Passo-a-Passo</title> 
<meta name="GENERATOR" content="JXEd 1.0" /> 
<meta name="ProgId" content="JXEd.Editor.Document" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" /> 
                                     
<link rel="stylesheet" type="text/css" href="<s:url value="/common/wizardFinal/tab-panel.css" includeParams="none"/>" />
<link rel="stylesheet" type="text/css" href="<s:url value="/common/wizardFinal/tabpane-ob.css" includeParams="none"/>" />
<link rel="stylesheet" type="text/css" href="<s:url value="/common/wizardFinal/esquema.css" includeParams="none"/>" /> 
<link rel="stylesheet" type="text/css" href="<s:url value="/common/jquery.autocomplete.css" includeParams="none"/>"></link>
<link rel="stylesheet" type="text/css" href="<s:url value="/common/web/skins/Default/Main/Main_Edition.css" includeParams="none" />" id="paramCSS"></link>
<link rel="stylesheet" type="text/css" href="<s:url value="/common/styles/loader/loader.css" includeParams="none"/>"></link>
<link rel="stylesheet" type="text/css" href="<s:url value="/common/ui.all.css" includeParams="none"/>"></link>
<link rel="stylesheet" type="text/css" href="<s:url value="/common/web/skins/Default/Main/Client/DataGrid/DataGrid.css" includeParams="none" />" id="paramCSS"></link>
<link rel="stylesheet" type="text/css" href="<s:url value="/common/lightbox/jquery.lightbox-0.5.css" includeParams="none"/>" />
<link rel="stylesheet" type="text/css" href="<s:url value="/common/jcarousel/jquery.jcarousel.css" includeParams="none"/>" />
<link rel="stylesheet" type="text/css" href="<s:url value="/common/jcarousel/skins/tango/skin.css" includeParams="none"/>" />
                            
<script language="javascript" charset="UTF-8" src="<s:url value="/common/web/js/utils-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/geral-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/confirm-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/js/wizard/script.js?v=9" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/hotkeys-pack.js?v=1" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/wizardFinal/tab-panel-pack.js?v=2" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/wizardFinal/tabpane-pack.js?v=1" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery-1.5.1.min.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/ui.core-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/ui.accordion-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.bestupper-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.meiomask-pack.js?v=1" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery-form-pack.js" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.form-new-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.simplemodal-1.1.1-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.autocomplete-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/common-pack.js?v=5" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/is-date-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/event-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/masked-input-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/xbLibrary-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/xbDebug-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/xbDOM-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/xbStyle-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/xbStyle-css-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/lightbox/jquery.lightbox-0.5-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.carousel.min.js?v=1" includeParams="none"/>"></script>

<script type="text/javascript">defineContext('<s:url value="/" includeParams="none"/>');</script>
  
<script language="javascript">
$(function() {
	$("#accordion").accordion({       
		active: false, 
        collapsible: true,  
        autoHeight: true
	});
});

$.mynamespace = {};
$.mynamespace.myVar = "something";
$.mynamespace.myVar2 = "somethingElse";

var horizontalOverflow = false;
var verticalOverflow   = false;

var divArray = ["tabPane0","tabPane1","tabPane2","tabPane3","tabPane4","tabPane5"];
var divReadonly_tabPane0_event = null;
var divReadonly_tabPane1_event = null;  
var divReadonly_tabPane2_event = null;
var divReadonly_tabPane3_event = null;
var divReadonly_tabPane4_event = null;
var divReadonly_tabPane5_event = null;
 

var selected = false;
var alterado = false;
var editavel = true;
var automovelAlterado = false;
var cpfClienteAlterado = false;   
var cnpjClienteAlterado = false;
var propostaPerfilAlterada = false;

// Define as PF's no Wizard
// F2
keyActions [0] = {character:  113,	
                  actionType: "code",
                  param:      "executarBotao('btnf14');"};
// F3               
keyActions [1] = {character:  114,	
                  actionType: "code",
                  param:      "executarBotao('btnf3');"};
// F4                 
keyActions [2] = {character:  115,	
                  actionType: "code",
                  param:      "executarBotao('btnf4');"};
// F5                  
keyActions [3] = {character:  116,	
                  actionType: "code",
                  param:      "executarBotao('btnf5');"};
// F6                  
keyActions [4] = {character:  117,	
                  actionType: "code",
                  param:      "executarBotao('btnf6');"};
// F7                  
keyActions [5] = {character:  118,	
                  actionType: "code",
                  param:      "executarBotao('btnf7');"};
// F8                  
keyActions [6] = {character:  119,	
                  actionType: "code",
                  param:      "executarBotao('btnf8');"};
// F9                  
keyActions [7] = {character:  120,	
                  actionType: "code",
                  param:      "executarBotao('btnf9');"};

// F10                  
keyActions [8] = {character:  121,	
                  actionType: "code",
                  param:      "executarBotao('btnf10');"};

// F11                  
keyActions [9] = {character:  122,	
                  actionType: "code",
                  param:      "executarBotao('btnf11');"};
</script>
<style type="text/css">
 
/**
 * Overwrite for having a carousel with dynamic width.
 */
.jcarousel-skin-tango .jcarousel-container-horizontal {
    width: 85%;
}

.jcarousel-skin-tango .jcarousel-clip-horizontal {
    width: 100%;
}

#display {
    clear: both;
    width: auto;
    height: 250px;
    overflow: scroll;
    border: 1px solid #666;
    background-color: #fcfcfc;
    padding: 10px;
}
</style>

<style>
fieldset {
	padding: 5px;
	margin-bottom: 8px;
}

div.greyDiv {background-color: #E8E8E8;}

a.button:link {text-decoration: none}
a.button:visited {text-decoration: none}
a.button:hover {text-decoration: none;}
a.button:active {text-decoration: none}

label{
	color:#404040;
	font-family:Verdana,Arial,Helvetica,sans-serif;
	font-size:11px;
	font-weight:normal;
}

select{
	background-color:#E8E8E8;
	border:1px solid #888888;
	color:#606060;
	font-family:Verdana,Arial,Helvetica,sans-serif;
	font-size:11px;
	font-weight:bold;
}  

input{ 
	background-color:#FFFFFF;          
	border:1px solid #888888;
	color:#303030;
	font-family:Verdana,Arial,Helvetica,sans-serif;
	font-size:11px;
	font-weight:normal;
	height:18px;
}
.transparent
{
   filter:alpha(opacity=60); 
   -moz-opacity: 0.6; 
   opacity: 0.6; 
}
</style> 
</head>
<body onload="init();">
<form id="formEdit" namespace="/wizard" name="formEdit" method="post">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

  <table style="height:100%" border="0" cellpadding="0" cellspacing="0" id="main">
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
					<a class="Main_LeftTabsBar_ButtonLeft" href="#" onclick="mostrarMenu('buttonMenu');init();return false;">
					  <img class="Main_LeftTabsBar_ButtonLeft_Icon Main_LeftTabsBar_ButtonLeft_Icon_arrow_hide" src="<s:url value="/common/web/images/blank.gif" />" border="0" id="buttonMenu"></img>
					</a>
				  </td>
				</tr>
				<tr>
				  <td class="Main_LeftTabsBar_bg_separator_cell"></td>
				</tr>
				<tr>
				  <td>
					<div class="Main_LeftTabsBar_ButtonRight_selected">
					  <img class="Main_LeftTabsBar_ButtonRight_Icon Main_LeftTabsBar_ButtonRight_Icon_edition_selected" src="<s:url value="/common/web/images/blank.gif" />" border="0"></img>
					</div>
				  </td>
				</tr>                   
				<tr>
				  <td>
					<a class="Main_LeftTabsBar_ButtonRight" href="#" onclick="listaPropostas();">
					  <img class="Main_LeftTabsBar_ButtonRight_Icon Main_LeftTabsBar_ButtonRight_Icon_relation" src="<s:url value="/common/web/images/blank.gif" />" border="0"></img>
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
				<a class="Main_NavBar_LeftButton" href="#" onclick="" style="border:0px;" onmouseover="window.status='Reload Current Page';return true;" onmouseout="window.status='';return true;"><img src="<s:url value="/common/web/images/blank.gif" />" class="Main_NavBar_LeftButton_Icon Main_NavBar_LeftButton_Icon_refresh" border="0" alt="Reload Current Page" title="Reload Current Page"></img> </a>
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
			<div class="Main_ContentPane_Client" style="overflow:hidden;" id="client">
		  <table width="100%" summary="" id="sectionDetail" style="height: 100%; border: 3px" cellpadding="0" cellspacing="0">
			<tr>
			  <td valign="top">
				<table width="100%" cellspacing="0" cellpadding="0" border="0" class="Main_Client_TableRelation" style="margin: 0px 0px 0px 0px">
				  <tr>
					<td>
<table style="height:100%" width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
	<td>
	  <div id="corpo" style="width:100%; z-index:1; overflow: hidden; height: 750px;" >
		<table style="height:100%" width="100%" border="0" cellpadding="0" cellspacing="0">
		  <tr>
			<td height="*" valign="top" id="tdDivCentral">
			  <div id="central" style="width:100%; z-index:1; overflow: hidden; height: 700px;" > 
				<div id="tabFrame" class="main_page">
				  <div class="sub_top_page">
					<div class="sections_menu">
					  <table border="0" cellpadding="0" cellspacing="0">
						<tr>
						  <td>
							<table onclick="raisePanel(0)" id="tabMenu0" border="0" cellpadding="0" cellspacing="0" class="active">
							  <tr>
								<td class="TabLeft"></td>
								<td class="TabBody">Dados Cliente</td>
								<td class="TabRight"/>
							  </tr>
							</table>
						  </td>
						  <td>
							<table onclick="raisePanel(1)" id="tabMenu1" border="0" cellpadding="0" cellspacing="0" class="inactive">
							  <tr>
								<td class="TabLeft"></td>
								<td class="TabBody TabPanel_width">Perfil Seg</td>
								<td class="TabRight"/>
							  </tr>
							</table>
						  </td>
						  <td>
							<table onclick="raisePanel(2)" id="tabMenu2" border="0" cellpadding="0" cellspacing="0" class="inactive">
							  <tr>
								<td class="TabLeft"></td>
								<td class="TabBody TabPanel_width">Veículo/Cobert.</td>
								<td class="TabRight"/>
							  </tr>
							</table>
						  </td>
						  <td>
							<table onclick="raisePanel(3)" id="tabMenu3" border="0" cellpadding="0" cellspacing="0" class="inactive">
							  <tr>
								<td class="TabLeft"></td>
								<td class="TabBody TabPanel_width">Prêmios</td>
								<td class="TabRight"/>
							  </tr>
							</table>
						  </td>
						  <td>
							<table onclick="raisePanel(4)" id="tabMenu4" border="0" cellpadding="0" cellspacing="0" class="inactive">
							  <tr>
								<td class="TabLeft"></td>
								<td class="TabBody TabPanel_width">Proposta/Apólice</td>
								<td class="TabRight"/>
							  </tr>
							</table>
						  </td>
						  <td>
							<table onclick="raisePanel(5)" id="tabMenu5" border="0" cellpadding="0" cellspacing="0" class="inactive">
							  <tr>
								<td class="TabLeft"></td>
								<td class="TabBody TabPanel_width">Comercialização</td>
								<td class="TabRight"/>
							  </tr>
							</table>
						  </td>
					    <s:if test="proposta.propostaInicial != null || countEndosso > 0">
					    <script>numeroDeTabs=7</script>
						  <td>
							<table onclick="raisePanel(6)" id="tabMenu6" border="0" cellpadding="0" cellspacing="0" class="inactive">
							  <tr>
								<td class="TabLeft"></td>
								<td class="TabBody TabPanel_width">Histórico</td>
								<td class="TabRight"/>
							  </tr>
							</table>
						  </td>
						</s:if>
						</tr>
					  </table>
					</div>
				  </div>

	<div id="divItens" style="position: absolute; z-index: 1000; width:100%; visibility: hidden;">
	   <table style="height: 32px; -moz-border-radius: 4px; border: 1px solid #AAAAAA;" class="Main_ContentPane_ToolBar Main_ToolBar_bg" id="tdToolBar">
	     <tr>
			<td class="Main_ToolBar_Separator_cell" ><IMG src="<s:url value="/common/web/images/blank.gif" />" class="Main_ToolBar_Separator"></td>
			<td width="2%" ><div id="divButtonNew" class="Main_ToolBar_bg"><a href="#" onClick="novoItem();" class="Main_ToolBar_Button" onMouseOver="window.status='Novo Registro';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonNew"><img class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_New" src="<s:url value="/common/web/images/blank.gif" />" title="Novo Registro" border="0" id="buttonNew"></a></div></td>
			<td class="Main_ToolBar_Separator_cell" ><IMG src="<s:url value="/common/web/images/blank.gif" />" class="Main_ToolBar_Separator"></td>
			<td width="2%" ><div id="divButtonDelete" class="Main_ToolBar_bg"><a href="#" onClick="if(confirma('Confirma exclusão?')){removerItem();}" class="Main_ToolBar_Button" onMouseOver="window.status='Excluir Registro';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonDelete"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Delete" id="buttonDelete" title="Excluir Registro"></a></div></td>
			<td class="Main_ToolBar_Separator_cell" ><IMG src="<s:url value="/common/web/images/blank.gif" />" class="Main_ToolBar_Separator"></td>
			<td width="2%" ><a href="#" onClick="$('#itensSegurados').click();" class="Main_ToolBar_Button" onMouseOver="window.status='Mostra Todos';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonSearch"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Search" id="buttonSearch" title="Mostra todos"></a></td>
			<td class="Main_ToolBar_Separator_cell" ><IMG src="<s:url value="/common/web/images/blank.gif" />" class="Main_ToolBar_Separator"></td>
			<td width="2%" ><a href="#" onclick="primeiroItem();" class="Main_ToolBar_Button" onmouseover="window.status='Primeiro Item';return true;" onmouseout="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonPrevious"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_First" id="buttonPrevious" title="Primeiro item"/></a></td>
			<td class="Main_ToolBar_Separator_cell" ><IMG src="<s:url value="/common/web/images/blank.gif" />" class="Main_ToolBar_Separator"></td>
			<td width="2%" ><a href="#" onclick="itemAnterior();" class="Main_ToolBar_Button" onmouseover="window.status='Item Anterior';return true;" onmouseout="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonPrevious"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Previous" id="buttonPrevious" title="Item anterior"/></a></td>
			<td class="Main_ToolBar_Separator_cell" ><IMG src="<s:url value="/common/web/images/blank.gif" />" class="Main_ToolBar_Separator"></td>
			<td width="2%" ><a href="#" onclick="proximoItem();" class="Main_ToolBar_Button" onmouseover="window.status='Próximo Item';return true;" onmouseout="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonNext"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Next" id="buttonNext" title="Proximo Item"/></a></td>
			<td class="Main_ToolBar_Separator_cell" ><IMG src="<s:url value="/common/web/images/blank.gif" />" class="Main_ToolBar_Separator"></td>
			<td width="2%" ><a href="#" onclick="ultimoItem();" class="Main_ToolBar_Button" onmouseover="window.status='Último Item';return true;" onmouseout="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonNext"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Last" id="buttonNext" title="Ultimo Item"/></a></td>
			<td class="Main_ToolBar_Separator_cell" ><IMG src="<s:url value="/common/web/images/blank.gif" />" class="Main_ToolBar_Separator"></td>
			<td width="1"><IMG src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_textlabel_bg_left"></td>
			<td class="Main_ToolBar_textlabel_bg_body"><nobr id="bookmark" class="Main_ToolBar_text_bookmark">${itemCorrente+1} / ${itens}</nobr></td>
			<td width="1"><IMG src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_textlabel_bg_right"></td>
			<td class="Main_ToolBar_Separator_cell" ><IMG src="<s:url value="/common/web/images/blank.gif" />" class="Main_ToolBar_Separator"></td>
			<td class="Main_ToolBar_Space"></td>
	     </tr>
	   </table>
	</div>
	<div id="allForms" style="overflow:hidden; width:100%;" class="tabPane" >  
	  <div class="tabPane" id="tabPane0" style="overflow-x:hidden; overflow-y:auto; height:auto; visibility: hidden;">
	     <jsp:include page="tabPane0_noJs.jsp" flush="false"></jsp:include>
	  </div>
	  <div class="tabPane" id="tabPane1" style="overflow-x:hidden; overflow-y:auto; height:auto; visibility: hidden">
	  	<s:if test="%{proposta.versao == 2 || proposta.tipoProposta == 4 || proposta.tipoProposta == 6}">
	  	 <jsp:include page="tabPane1_noJsProposta.jsp" flush="false"></jsp:include>
	  	</s:if>
	  	<s:else>
	     <jsp:include page="tabPane1_noJs.jsp" flush="false"></jsp:include>
	    </s:else>
	  </div>
	  <div class="tabPane" id="tabPane2" style="overflow-x:hidden; overflow-y:auto; height:auto; visibility: hidden">
	     <jsp:include page="tabPane2_noJs.jsp" flush="false"></jsp:include>
	  </div>
	  <div class="tabPane" id="tabPane3" style="overflow-x:hidden; overflow-y:auto; height:auto; visibility: hidden">
	     <jsp:include page="tabPane3_noJs.jsp" flush="false"></jsp:include>
	  </div>
	  <div class="tabPane" id="tabPane4" style="overflow-x:hidden; overflow-y:auto; height:auto; visibility: hidden">
	     <jsp:include page="../proposta/tabApolice_noJs.jsp" flush="false"></jsp:include>
	  </div>
	  <div class="tabPane" id="tabPane5" style="overflow-x:hidden; overflow-y:auto; height:auto; visibility: hidden">
	     <jsp:include page="tabPane5_noJs.jsp" flush="false"></jsp:include>
	  </div>
	  <div class="tabPane" id="tabPane6" style="overflow-x:hidden; overflow-y:auto; height:auto; visibility: hidden">
	     <jsp:include page="../proposta/historicoEndosso.jsp" flush="false"></jsp:include>
	  </div>
	</div>
    <div id="saveProgress" class="pageloader" style="display:none;z-index:10;">Salvando...<br/></div>
    <div id="loadProgress" class="pageloader" style="display:none;z-index:10;">Carregando...<br/></div>
	<div id="tabFiller" style="width:100%;visibility: visible; height:700px; "></div>
</div>

</div>   
</td>
</tr>  
</table>
</div>
</td>
</tr>
<!-- botoes no rodape do formulario "voltar; pesquisa; anterior e proximo" -->
<jsp:include page="../proposta/barraDeAcoes.jsp" flush="false"></jsp:include>

</table>
		<input type="button" id="btnf11" style="display: none;" onclick="mostrarMenu('buttonMenu');setTimeout('init()',300);return false;"/>

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

<!-- ========================= end of tabbed-frame div ======================== -->
<form id="formCondutor" name="formCondutor">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<input type="hidden" id="fcCondutorId" name="condutor.id"/>
	<input type="hidden" id="fcCondutorNome" name="condutor.nome"/>
	<input type="hidden" id="fcCondutorTipoCondutor" name="condutor.tipoCondutor"/>
	<input type="hidden" id="fcCondutorDataNascimento" name="condutor.dataNascimento"/>
	<input type="hidden" id="fcCondutorSexo" name="condutor.sexo"/>
	<input type="hidden" id="fcCondutorTelefones" name="condutor.telefones"/>
	<input type="hidden" id="fcCondutorEstadoCivil" name="condutor.estadoCivil"/>
	<input type="hidden" id="fcCondutorCNH" name="condutor.cnh"/>
	<input type="hidden" id="fcCondutorData1aHabilitacao" name="condutor.data1aHabilitacao"/>
	<input type="hidden" id="fcCondutorDataVencHabilitacao" name="condutor.dataVencHabilitacao"/>
	<input type="hidden" id="fcCondutorCPF" name="condutor.cpf"/>
	<input type="hidden" id="fcCondutorProposta" name="condutor.proposta.id"/>
	
	<input type="hidden" id="fcCondutorProfissao" name="condutor.profissao.descricao"/>
	<input type="hidden" id="fcCondutorProfissaoId" name="condutor.profissao.id"/>
	<input type="hidden" id="fcIsCondutorPrincipal" name="condutor.isCondutorPrincipal"/>
	<input type="hidden" id="fcEscolaridadeCondutor" name="condutor.escolaridade.id"/>
	<input type="hidden" id="fcRelacaoCondutorSegurado" name="condutor.relacaoCondutorSegurado.id"/>
	<input type="hidden" id="fcEmailCondutor" name="condutor.email"/>
</form>
<jsp:include page="modalAutomovelDadosCompl.jsp" flush="false"></jsp:include>
<form id="formComissionados">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<s:textfield theme="simple" id="comPropPropostaId" name="proposta.id" cssStyle="display:none"/>
	<s:textfield theme="simple" id="comPropId" name="comissionadoProposta.id" cssStyle="display:none"/>
	<s:textfield theme="simple" id="comPropPessoaId" name="comissionadoProposta.pessoa.id" cssStyle="display:none"/>
	<s:textfield theme="simple" id="comPropComissao" name="comissionadoProposta.comissao" cssStyle="display:none"/>
	<s:textfield theme="simple" id="comPropVlrComissao" name="comissionadoProposta.valorComissao" cssStyle="display:none"/>
	<s:textfield theme="simple" id="comPropTipoComissao" name="comissionadoProposta.tipoComissao" cssStyle="display:none"/>
</form>

<form id="formHistorico" name="formHistorico">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<input type="hidden" id="hiPropostaId" name="proposta.id" />
</form>

<form id="formAnexo" name="formAnexo" enctype="multipart/form-data">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<input type="hidden" id="faPropostaAnexoPropostaId" name="propostaAnexo.proposta.id" />
	<input type="hidden" id="faPropostaId" name="proposta.id" />
</form>

<form id="formLookup" name="formLookup">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<input type="hidden" id="currentTabId" name="currentTab" value="0"/>
	<input type="hidden" id="idRelatorio" name="idRelatorio" value="AUTO"/>
	<input type="hidden" id="gpPropostaId" name="proposta.id" />
	<input type="hidden" id="gpSeguradoraId" name="seguradora.id" />
	<input type="hidden" id="gpRamoId" name="ramo.id" />
	<input type="hidden" id="gpBlnPossuiPerfil" name="proposta.blnPossuiPerfil" />
	<input type="hidden" id="gpTipoCliente" name="tipoCliente" />
	<input type="hidden" id="gpClienteId" name="proposta.cliente.id" />
	<input type="hidden" id="gpClienteCpf" name="pessoaFisica.cpfOuCnpj" />
	<input type="hidden" id="gpClienteCnpj" name="pessoaJuridica.cpfOuCnpj" />
	<input type="hidden" id="gpGrupoDeVendaId" name="proposta.grupoDeVenda.id" />
	<input type="hidden" id="gpQuantParc" name="proposta.qtdeParcelas" />
	<input type="hidden" id="gpValorDemaisParcelas" name="proposta.valorDemaisParcelas" />
	<input type="hidden" id="gpFormaPagamento" name="proposta.formaPagamento" />
	<input type="hidden" id="gpFormaPagamento1aParcela" name="proposta.formaPagamento1aParcela" />
	<input type="hidden" id="gpNroBanco" name="proposta.nroBanco" />
	<input type="hidden" id="gpCodigoAgencia" name="proposta.codigoAgencia" />
	<input type="hidden" id="gpContaCorrente" name="proposta.contaCorrente" />
	<input type="hidden" id="gpContaDigito" name="proposta.contaDigito" />
	<s:hidden id="gpVistoriadoraId" name="proposta.vistoriadora.id" />

	<input type="hidden" id="gpDataVencim1aParcela" name="proposta.dataVencim1aParcela" />
	<input type="hidden" id="gpValor1aParcela" name="proposta.valor1aParcela" />
	<input type="hidden" id="gpPremioTotal" name="proposta.premioTotal"/>
	
	<input type="hidden" id="gpBlnEndosso" name="blnEndosso"/>
	<input type="hidden" id="gpBlnRenovacao" name="blnRenovacao"/>
</form>

  <jsp:include page="../proposta/novaPropostaModal.jsp" flush="false"></jsp:include>
  <jsp:include page="../proposta/endossoPropostaModal.jsp" flush="false"></jsp:include>
  <jsp:include page="../proposta/uploadBox_noJs.jsp" flush="false"></jsp:include>
  <jsp:include page="../proposta/modalTrocarSeguradora.jsp" flush="false"></jsp:include>
  
  <div id="novaCobertura" style="display:none; z-index: 1000;" >
	<form id="formCobertura" name="formCobertura">
	  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>
	
	  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="Main_ContentPane_TabPane" id="tdtopTabs">
		<tr id="paramParentTabContainer">
		  <td class="tabBackGroundInit" style="background-color: #505050"></td>
		</tr>
		<tr id="paramMainTabContainer">
		  <td class="tabBackGroundInit" style="background-color: #505050">
			<span style="color:#FFFFFF; font-size:8pt; font-weight:bold; height:26px !important; padding:0 4px; text-align:center; white-space:nowrap;">
			  Nova Cobertura
			</span>
		  </td>
		</tr>
	  </table>
	  <div align="center" style="border: solid 1px #505050; padding: 10px;" >
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
		  <tr>
			<td colspan="2">
		 	  <s:textfield theme="simple" cssStyle="display:none;" id="paramCobItemCorrente" name="itemCorrente"/>
			  <s:textfield theme="simple" cssStyle="display:none;" id="paramCobPropostaId" name="proposta.id" />
			  <input class="modalClose" id="closeDiv" style="display:none;" />
			</td>
		  </tr>
		  <tr>
		  	<td width="50%" class="TitleCell" style="text-align: left">
		  		<label class="LabelText">Cobertura:</label>
		  	</td>
		  	<td width="50%" >
		  		<s:select theme="simple" id="paramCoberturaIseg" cssClass="Combo" cssStyle="width: 300px" emptyOption="false" listKey="id" listValue="descricao" list="coberturasIseg" name="automovelCobertura.coberturasIseg.id"/>
		  	</td>
		  </tr>
		  <tr>
		  	<td width="50%" class="TitleCell" style="text-align: left">
		  		<label class="LabelText">Outra Cobertura (não listada)?:</label>
		  	</td>
		  	<td width="50%">
		  		<input type="checkbox" id="checkboxOutras" onchange="selectCheckBox(this);"/>
		  	</td>
		  </tr>
		  <tr>
			<td width="50%" class="TitleCell" style="text-align: left">
			  <label class="LabelText" for="paramCobDescricaoCobertura">Outra:</label>
			</td>
			<td width="50%" >
			  <s:textfield theme="simple" cssStyle="width: 100%" disabled="true" cssClass="clTextoRestritoModal readonly" id="paramCobDescricaoCobertura" name="automovelCobertura.descricao" />
			</td>
		  </tr>
		  <tr style="line-height:20px">
			<td width="50%" class="TitleCell" style="text-align: left">
			  <label class="LabelText" for="paramCobInformaFranquia">Informa Franquia?</label>
			</td>
			<td width="50%" >
			  <s:select theme="simple" cssStyle="width:60px" cssClass="requiredField" id="paramCobInformaFranquia" name="automovelCobertura.blnInformaFranquia" list="#{'true':'SIM', 'false':'NAO'}"/>
			</td>
		  </tr>
		  <tr>
			<td colspan="2" class="TitleCell" style="text-align: left">&nbsp;</td>
		  </tr>
		  <tr>
			<td>
			  <a href="#" class="button" onclick="fechaParamNovaProposta();inserirCobertura();$('#closeDiv').click()" >
				<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">Adicionar</td>
					<td class="wButton_right"/>
				  </tr>
				</table>
			  </a>
			</td>
			<td>
			  <a href="#" class="button" onclick="fechaParamNovaProposta();$('#closeDiv').click()" >
				<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">Cancelar</td>
					<td class="wButton_right"/>
				  </tr>
				</table>
			  </a>
			</td>
		  </tr>
		</table>
	  </div>
	  <script>
	  	function selectCheckBox(component){
	  		if(component.checked){
	  			$("#paramCobDescricaoCobertura").attr("disabled",false);
	  			$("#paramCobDescricaoCobertura").removeClass("readonly");
	  			$("#paramCoberturaIseg").attr("disabled",true);
	  			$("#paramCoberturaIseg").addClass("readonly");
	  		}else{
	  			$("#paramCobDescricaoCobertura").attr("disabled",true);
	  			$("#paramCobDescricaoCobertura").addClass("readonly");
	  			$("#paramCoberturaIseg").attr("disabled",false);
	  			$("#paramCoberturaIseg").removeClass("readonly");
	  		}
	  	}
	  </script>
	</form>
  </div>
  
  <div id="divNovoServico" style="display:none; z-index: 1000;" >
	<form id="formServico" name="formServico">
	  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>
	
	  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="Main_ContentPane_TabPane" id="tdtopTabs">
		<tr id="paramParentTabContainer">
		  <td class="tabBackGroundInit" style="background-color: #505050"></td>
		</tr>
		<tr id="paramMainTabContainer">
		  <td class="tabBackGroundInit" style="background-color: #505050">
			<span style="color:#FFFFFF; font-size:8pt; font-weight:bold; height:26px !important; padding:0 4px; text-align:center; white-space:nowrap;">
			  Novo Serviço
			</span>
		  </td>
		</tr>
	  </table>
	  <div align="center" style="border: solid 1px #505050; padding: 10px;" >
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
		  <tr>
			<td colspan="2">
			  <s:textfield theme="simple" cssStyle="display:none;" id="paramServPropostaId" name="proposta.id" />
		 	  <s:textfield theme="simple" cssStyle="display:none;" id="paramServItemCorrente" name="itemCorrente"/>
			  <input class="modalClose" id="closeDiv" style="display:none;" />
			</td>
		  </tr>
		  <tr>
		  	<td width="50%" class="TitleCell" style="text-align: left">
		  		<label class="LabelText" for="paramServDescricaoServico">Serviço:</label>
		  	</td>
		  	<td width="50%">
		  		<s:select theme="simple" id="paramServicoIseg" cssClass="Combo" cssStyle="width: 300px" emptyOption="false" listKey="id" listValue="descricao" list="servicosIseg" name="automovelServico.servicosIseg.id"/>
		  	</td>
		  </tr>
		  <tr>
		  	<td width="50%" class="TitleCell" style="text-align: left">
		  		<label class="LabelText">Outro Serviço (não listado)?:</label>
		  	</td>
		  	<td width="50%">
		  		<input type="checkbox" onchange="selectCheckBoxServico(this);"/>
		  	</td>
		  </tr>
		  <tr>
			<td width="50%" class="TitleCell" style="text-align: left">
			  <label class="LabelText" for="paramServDescricaoServico">Outro Serviço:</label>
			</td>
			<td width="50%" >
			  <s:textfield theme="simple" cssStyle="width: 100%" cssClass="clTextoRestritoModal readonly" id="paramServDescricaoServico" disabled="true" name="automovelServico.descricao" />
			</td>
		  </tr>
		  <tr>
			<td width="50%" class="TitleCell" style="text-align: left">
			  <label class="LabelText" for="paramServInformaFranquia">Informa Franquia?</label>
			</td>
			<td width="50%" >
			  <s:select theme="simple" cssClass="requiredField" id="paramServInformaFranquia" name="automovelServico.blnInformaFranquia" list="#{'true':'SIM', 'false':'NAO'}"/>
			</td>
		  </tr>
		  <tr>
			<td width="50%" class="TitleCell" style="text-align: left">
			  <label class="LabelText" for="paramServInformaDescricao">Informa Descrição?</label>
			</td>
			<td width="50%" >
			  <s:select theme="simple" cssClass="requiredField" id="paramServInformaDescricao" name="automovelServico.blnInformaDescricao" list="#{'true':'SIM', 'false':'NAO'}"/>
			</td>
		  </tr>
		  <tr>
			<td colspan="2" class="TitleCell" style="text-align: left">&nbsp;</td>
		  </tr>
		  <tr>
			<td>
			  <a href="#" class="button" onclick="fechaParamNovaProposta();inserirServico();$('#closeDiv').click()" >
				<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">Adicionar</td>
					<td class="wButton_right"/>
				  </tr>
				</table>
			  </a>
			</td>
			<td>
			  <a href="#" class="button" onclick="fechaParamNovaProposta();$('#closeDiv').click()" >
				<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">Cancelar</td>
					<td class="wButton_right"/>
				  </tr>
				</table>
			  </a>
			</td>
		  </tr>
		</table>
	  </div>
	  <script>
	  	function selectCheckBoxServico(component){
	  		if(component.checked){
	  			$("#paramServDescricaoServico").attr("disabled",false);
	  			$("#paramServDescricaoServico").removeClass("readonly");
	  			$("#paramServicoIseg").attr("disabled",true);
	  			$("#paramServicoIseg").addClass("readonly");
	  		}else{
	  			$("#paramServDescricaoServico").attr("disabled",true);
	  			$("#paramServDescricaoServico").addClass("readonly");
	  			$("#paramServicoIseg").attr("disabled",false);
	  			$("#paramServicoIseg").removeClass("readonly");
	  		}
	  	}
	  </script>
	</form>
  </div>
  <div id="divNovoModelo" style="display:none; z-index: 1000;" >
	<form id="formModelo" name="formModelo">
	  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>
	
	  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="Main_ContentPane_TabPane" id="tdtopTabs">
		<tr id="paramParentTabContainer">
		  <td class="tabBackGroundInit" style="background-color: #505050"></td>
		</tr>
		<tr id="paramMainTabContainer">
		  <td class="tabBackGroundInit" style="background-color: #505050">
			<span style="color:#FFFFFF; font-size:8pt; font-weight:bold; height:26px !important; padding:0 4px; text-align:center; white-space:nowrap;">
			  Novo Modelo
			</span>
		  </td>
		</tr>
	  </table>
	  <div align="center" style="border: solid 1px #505050; padding: 10px;" >
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
		  <tr>
			<td colspan="2">
			  <input class="modalClose" id="modeloCloseDiv" style="display:none;" />
			</td>
		  </tr>
		  <tr>
			  <td colspan="2" align="left">
			    <label for="paramMarcaNome">Marca</label><br />
			    <s:textfield id="paramMarcaId" name="veiculoModelo.fabricante.id" theme="simple" cssStyle="display:none;" />
				<s:textfield id="paramMarcaNome" name="veiculoModelo.fabricante.nome" cssClass="clTextoRestritoModal" theme="simple" cssStyle="width:97%;" />
			  </td>
		  </tr>
		  <tr>
			  <td colspan="2" align="left">
			    <label for="paramModeloVeiculoDescricao">Modelo</label><br />
			    <s:textfield id="paramModeloVeiculoDescricao" cssClass="clTextoRestritoModal" name="veiculoModelo.descricao" theme="simple" cssStyle="width:97%;" />
			  </td>
		  </tr>
		  <tr>
			  <td colspan="2" align="left">
			    <label for="paramModeloVeiculoDescricao">Cod. FIPE</label><br />
			    <s:textfield id="paramModeloVeiculoDescricao" cssClass="clTextoRestritoModal" name="veiculoModelo.codigoFipe" maxlength="15" theme="simple" cssStyle="width:97%;" />
			  </td>
		  </tr>
		  <tr><td><br/></td></tr>
		  <tr>
			<td style="width: 80px;">
			  <a href="#" class="button" onclick="fechaParamNovaProposta();inserirModelo();$('#modeloCloseDiv').click();" >
				<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton">
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">Adicionar</td>
					<td class="wButton_right"/>
				  </tr>    
				</table>
			  </a>
			</td>
			<td align="left">
			  <a href="#" class="button" onclick="fechaParamNovaProposta();cancelarInserirModelo();$('#modeloCloseDiv').click()" >
				<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">Cancelar</td>
					<td class="wButton_right"/>
				  </tr>
				</table>
			  </a>
			</td>
		  </tr>
		</table>
	  </div>
	</form>
  </div>
  <div id="divRelatorioFrota" style="display:none; z-index: 1000; width:240px;">
	<form id="formRelatorioFrota" name="formRelatorioFrota">
	  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="Main_ContentPane_TabPane" id="tdtopTabs">
		<tr id="paramParentTabContainer">
		  <td class="tabBackGroundInit" style="background-color: #505050"></td>
		</tr>
		<tr id="paramMainTabContainer">
		  <td class="tabBackGroundInit" style="background-color: #505050">
			<span style="color:#FFFFFF; font-size:8pt; font-weight:bold; height:26px !important; padding:0 4px; text-align:center; white-space:nowrap;">
			  Impressão do Pedido de Frota
			</span>
		  </td>
		</tr>
	  </table>
	  <div align="center" style="border: solid 1px #505050; padding: 10px;" >
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
		  <tr>
			<td colspan="2">
			  <input name="proposta.id" id="modalRelatorioPropostaId" style="display:none;" />
			  <input class="modalClose" id="modeloCloseDiv" style="display:none;" />
			  <input type="hidden" name="idRelatorio" value="AUTO"/>
			  <input type="hidden" name="isFrota" value="true"/>
			  <input type="hidden" name="ramo.id" value="2"/>
			</td>
		  </tr>
		  <tr>
		  	<td colspan="2">
		  		<input type="checkbox" style="height: 13px" value="true" name="printInclusaoVeiculo"/><label> imprimir inclusões de veículos</label>
		  	</td>
		  </tr>
		  <tr>
		  	<td colspan="2">
		  		<input type="checkbox" style="height: 13px" value="true" name="printExclusoesVeiculo"/><label> imprimir exclusões de veículos</label>
		  	</td>
		  </tr>
		  <tr>
		  	<td colspan="2">
		  		<input type="checkbox" style="height: 13px" value="true" name="printVeiculoInalterado"/><label> imprimir veículos inalterados</label>
		  	</td>
		  </tr>
		  <tr>
			<td style="width: 80px;">
			  <s:a href="#" class="button" onclick="imprimirRelFrota();">
				<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton">
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">Imprimir</td>
					<td class="wButton_right"/>
				  </tr>    
				</table>
			  </s:a>
			</td>
			<td align="left">
			  <a href="#" class="button" onclick="closeModalRelatorioFrota();" >
				<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">Cancelar</td>
					<td class="wButton_right"/>
				  </tr>
				</table>
			  </a>
			</td>
		  </tr>
		</table>
	  </div>
	</form>
  </div>
  <s:if test="proposta.statusOperacional != 0 && proposta.statusOperacional != 5 && proposta.statusOperacional != 8">
	<script>
	$(document).ready(function(){
		editavel = false;
		
	    for (k=0; k < divArray.length;k++){
	    	divName = divArray[k];
	    	//protegerCampos(divName);  
    		//$('#'+divArray[k]).readonly(true,divName);     
	    }

		//$('#allForms').readonly(true);     
		$('#divButtonNew').hide();  
		$('#divButtonDelete').hide(); 
 
		$('#btnf7').click(function (e) {
			e.preventDefault();
			$('#paramEndosso').modal({onShow: modalEndosso, close: false});
		});

	});
	</script>
  </s:if>
  <s:if test="proposta.statusOperacional > 4">
	  <script>
		$(document).ready(function(){
 		    $('#dadosApolice input').attr('readonly','true');
		    $('#dadosApolice input[type=text]').addClass('readonly');
		});
	  	
	  </script>
  </s:if>

	 <jsp:include page="../jqueryCalculadora.jsp" flush="false"></jsp:include>
  
<script>
$(document).ready(function(){

	MaskInput($('#dataProposta').get(0), "99/99/9999");
	MaskInput($('#dataVistoria').get(0), "99/99/9999");
	MaskInput($('#dataEmissaoApolice').get(0), "99/99/9999");
	//MaskInput($('#condutorDataNascimento').get(0), "99/99/9999");
	//MaskInput($('#condutorData1aHabilitacao').get(0), "99/99/9999");
	MaskInput($('#inicioVigencia').get(0), "99/99/9999");
	MaskInput($('#terminoVigencia').get(0), "99/99/9999");
	MaskInput($('#dataVencim1aParcela').get(0), "99/99/9999");
	MaskInput($('#propostaDataVistoria').get(0), "99/99/9999");
	MaskInput($('#dataGeracao').get(0), "99/99/9999");
	MaskInput($('#dataTransmissao').get(0), "99/99/9999");
	MaskInput($('#nroCheque1Parcela').get(0), "9999999999");
	MaskInput($('#nroBanco1Parcela').get(0), "9999");
<%--	MaskInput($('#nroBanco').get(0), "9999");--%>
	MaskInput($('#contaCorrente').get(0), "999999999999999");

	if(isEmpty('#propostaId')){
		MaskInput($('#dataFundacao').get(0), "99/99/9999");
		MaskInput($('#dataNascimento').get(0), "99/99/9999");
		MaskInput($('#dataEmissao').get(0), "99/99/9999");
		MaskInput($('#data1aHabilitacao').get(0), "99/99/9999");

		$("#clientePFNome").autocomplete('<s:url value="/objlookup/getClientePFListByNome.action" includeParams="none" />', {idFieldsToUpdate:["#clienteId"],onItemSelect:carregaCliente, mustMatch:0, autoFill:false,width:400,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
		$("#clienteCpf").autocomplete('<s:url value="/objlookup/getClienteListByCpf.action" includeParams="none" />', {idFieldsToUpdate:["#clienteId"],onItemSelect:carregaCliente, mustMatch:0, autoFill:false,width:400,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
		$("#clientePJNome").autocomplete('<s:url value="/objlookup/getClientePJListByNome.action" includeParams="none" />', {idFieldsToUpdate:["#clienteId"],onItemSelect:carregaCliente, mustMatch:0, autoFill:false,width:400,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
		$("#clienteCnpj").autocomplete('<s:url value="/objlookup/getClienteListByCnpj.action" includeParams="none" />', {idFieldsToUpdate:["#clienteId"],onItemSelect:carregaCliente, mustMatch:0, autoFill:false,width:400,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});

	}

	$("#comissionadoPropostaPessoaNome").autocomplete('<s:url value="/objlookup/getProdutorList.action" includeParams="none" />', {idFieldsToUpdate:["#comissionadoPropostaPessoaId"],width:400,max:300,scroll:true,scrollHeight:150});
	$("#autorGeracaoNome").autocomplete('<s:url value="/objlookup/getPessoaList.action" includeParams="none" />', {idFieldsToUpdate:["#autorGeracaoId"]});
	$("#marcaNome").autocomplete('<s:url value="/objlookup/getMarcaList.action" includeParams="none" />', {idFieldsToUpdate:["#marcaId"],autoFill:false,width:400,max:300,scroll:true,scrollHeight:150,onItemSelect:clearModeloVeiculoValues,onClear:clearModeloVeiculoValues});
	$("#modeloVeiculoDescricao").autocomplete('<s:url value="/objlookup/getModeloVeiculoList.action" includeParams="none" />', {idFieldsToUpdate:["#modeloVeiculoId","#codigoFipe"],extraParams:{'fabricante.id':function(){return $("#marcaId").val();}},autoFill:false,width:400,max:300,scroll:true,scrollHeight:150});
	$("#corPredominante").autocomplete('<s:url value="/objlookup/getCorList.action" includeParams="none" />', {minChars:1,mustMatch:0,autoFill:false,width:400,max:300,scroll:true,scrollHeight:150});
	$("#regiaoTarifacao").autocomplete('<s:url value="/objlookup/getCepOrCidadeList.action" includeParams="none" />', {mustMatch:0,autoFill:false, width:400,max:300,scroll:true,scrollHeight:150,minChars:2,width:300,formatItemOnSelect:splitResultGetFirst});
	$("#cepRes").autocomplete('<s:url value="/objlookup/getCepList.action" includeParams="none" />', {idFieldsToUpdate:["#bairroRes", "#cidadeRes","#ufRes","#lograRes"],mustMatch:0,minChars:6,width:300,autoFill:false,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
	$("#cepCom").autocomplete('<s:url value="/objlookup/getCepList.action" includeParams="none" />', {idFieldsToUpdate:["#bairroCom", "#cidadeCom","#ufCom","#lograCom"],mustMatch:0,minChars:6,width:300,autoFill:false,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
	$("#pfProfissao").autocomplete('<s:url value="/objlookup/getProfissaoByNome.action" includeParams="none" />', {idFieldsToUpdate:["#profissaoId"]});
	$("#nroBanco").autocomplete('<s:url value="/objlookup/getBancoByCodigoOrNome.action" includeParams="none" />', {idFieldsToUpdate:["#nroBanco"]});

	$("#condutorNome").keydown(function(event){return handleFocusNomeCondutor(event, this.value, '#tablePerfil');});
	/*$('#comissionadoPropostaComissao').addClass('readonly');
	$('#comissionadoPropostaVlrComissao').addClass('readonly');  
	$('#comissionadoPropostaComissao').attr('readonly',true)
	$('#comissionadoPropostaVlrComissao').attr('readonly',true)*/

	$('#gallery a.galleryLink').lightBox({fixedNavigation:true});
	$('#mycarousel').jcarousel();

	setTimeout(function(){
	   carregarPropostaAnexos();
	},500);
	
	bloquearHabilitarDadosCaminhao($('#tipoVeiculoId')[0]);
	disableDadosClientes();
	showHideDadosFormaPagamento();
	showHideDadosDemaisParcelas();
	showHideTab();
	enableDisableDadosCobertura();
	enableDisableDadosServico();
	showOptionsRecebimentoComissao();
	tooglePercValorCoberturaCasco($('#tipoIndenizacao').val());
});

function radioUnico(opc,selecao){
    if (opc="correspondenciaRes"){
    	if (selecao=="SIM")
    		$('#correspondenciaCom').val('NAO');
    	else
    		$('#correspondenciaCom').val('SIM');
    }else if (opc="correspondenciaCom"){
    	if (selecao=="SIM")
    		$('#correspondenciaRes').val('NAO');
    	else
    		$('#correspondenciaRes').val('SIM');
    }
}
function checarCpfCliente(cpf){
              
	setTimeout(function(){
		if (cpfClienteAlterado){
			if (validaCPF(document.formEdit.clienteCpf)){
				carregaCliente();
			}
		}
	},300);
}

function checarCnpjCliente(cnpj){
	setTimeout(function(){
		if (cnpjClienteAlterado){
			if (validaCnpj(document.formEdit.clienteCnpj)){
				carregaCliente();
			}
		}
	},300);
}

function clearModeloVeiculoValues(){
	$('#modeloVeiculoId').val('');
	$('#modeloVeiculoDescricao').val('');
}

function openWinReport(){
	$('#gpPropostaId').val($('#propostaId').val());
	if($('#propostaId').val() != ""){
		openWin('', 'report', '800', '600', 'resizable=yes');
		submitForm($('#formLookup').get(0), getContextApp()+'/report/runjasper.action', false, "report");
	}else{
		alert('Favor, salvar a proposta.');
	}
}

// Estes parametros são para desativar as teclas PF's do browser.
if (navigator.appName=='Netscape') {
	window.onkeydown = frmRequest_KeyDown;
	//window.onkeypress = frmRequest_KeyPress;
}else{
	document.body.onkeydown = frmRequest_KeyDown;
	//document.body.onkeypress = frmRequest_KeyPress;
}
document.onhelp = function() {return(false);}
window.onhelp = function() {return(false);}
window.onresize = function(){init();}
document.body.onselectstart = function(){selected=true;};

// ativa dialogo modal 
$(document).ready(function () {

	/*$(window).unload(function(e){
		if(alterado){
			if (ConfirmaSubmit(FORM_PROPOSTA_WIZARD,OP_INSERT_UPDATE,OP_COM_CONFIRMA)){
				salvarProposta();
				return false;
			}else{
				e.preventDefault();
				return false;
			}
		}
	});
	*/
	
	$('#btnf14').click(function (e) {
		e.preventDefault();
		$('#paramProposta').modal({onShow: modalNovaProposta, close: false});
	});

});
// define a mascara padrão para telefone  
$().ready(function() {
	// Mascara de telefone.
    $(".clCep").setMask({mask : '99999-999', autoTab: false});
    $(".clData").setMask({mask : '39/19/9999', autoTab: false});
    $(".clCPF").setMask({mask : '999.999.999-99', autoTab: false});
    $(".clFone").setMask({mask : '(99) 9999-9999', autoTab: false});
    $(".clFone").DefaultValue("(__) ____-____");
    // Converte para upper e elimina brancos no inicio e brancos duplos.
    $(".clValor3").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"000"});
    $(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
    $(".clValor1").setMask({mask : '9,999.999.999.999', type : 'reverse',defaultValue:"00"});
    $(".clValor").setMask({mask : '99',  type : 'reverse',defaultValue:"0"});
    $(".clNumero4").setMask({mask : '9999',  type : 'reverse',defaultValue:"1"});
 	
 });

function modalNovaProposta (dialog) {
	setTimeout(function(){
	  paramNovaProposta();}
	,500);
}

function modalEndosso (dialog) {
	setTimeout(function(){
	  paramEndosso();}
	,500);
}
$('input[name=bancosRelacionamentoIds]:checked').each(function(){
	objeto = $(this)[0];
	habilitaDesabilitaCamposBanco(objeto);
});

</script>
</body>
</html>
<script language="javascript">

var corpo = null;
var allForms = null;
var navegador = null;
var central = null;
var tdleftTabs = null;
var tdtopButtons = null;
var tdBottomSeparetor = null;
var client = null;
var tdDivCentral = null;
var tabFiller = null;

var stlCorpo   = null;
var stlNavegador   = null;
var stlCentral   = null;
var stlTdleftTabs   = null;
var stlTdtopButtons   = null;
var stlTdBottomSeparetor   = null;
var stlClient = null;
var stlTdDivCentral = null;
var stlTabFiller = null;

var windowHeight = null;
var windowWidth = null;

var wrapped = false;

function toggleDebug(debugging){
  if (debugging.value == '1')
    xbDEBUG.on = true;
  else 
    xbDEBUG.on = false;
}

function init() {
	allForms = xbGetElementById('allForms');
	corpo = xbGetElementById('corpo');
	navegador = xbGetElementById('navegador');
	central = xbGetElementById('central');
	client = xbGetElementById('client');
	tdleftTabs = xbGetElementById('tdleftTabs');
	tdtopButtons = xbGetElementById('tdtopButtons');
	tdBottomSeparetor = xbGetElementById('tdbottomSeparator');
	tdDivCentral = xbGetElementById('tdDivCentral');
	tabFiller = xbGetElementById('tabFiller');
	
	
	if (!corpo) {
		alert('corpo not found during init()');
		return;
	}

	if (!navegador) {
		alert('navegador not found during init()');
		return;
	}

	stlAllForms = new xbStyle(allForms);
	stlCorpo = new xbStyle(corpo);
	stlNavegador = new xbStyle(navegador);
	stlCentral = new xbStyle(central);
	stlClient = new xbStyle(client);
	stlTdleftTabs = new xbStyle(tdleftTabs);
	stlTdtopButtons = new xbStyle(tdtopButtons);
	stlTdBottomSeparetor = new xbStyle(tdBottomSeparetor);
	stlTdDivCentral = new xbStyle(tdDivCentral);
	stlTabFiller = new xbStyle(tabFiller);

	
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
	stlClient.setHeight(xbToInt(windowHeight - stlTdtopButtons.getHeight() - stlTdBottomSeparetor.getHeight()));
	stlCorpo.setHeight(xbToInt(stlClient.getHeight() - stlNavegador.getHeight() - 9 -10)); 
	stlCentral.setHeight(xbToInt(stlClient.getHeight() - stlNavegador.getHeight() - 9 - 15)); 
	stlTabFiller.setHeight(xbToInt(stlClient.getHeight() - stlNavegador.getHeight() - 9 - 16 - 34)); 
	stlAllForms.setHeight(xbToInt(stlClient.getHeight() - stlNavegador.getHeight() - 9 - 16 - 37)); 
	stlAllForms.setWidth(xbToInt(stlTabFiller.getWidth())); 
//	stlTabFiller.setWidth(xbToInt(stlClient.getWidth()-100)); 

	bodyOnLoad();
	
	if (!editavel){
		$('.div_overlay').remove();
    	divName = divArray[tabCount];
    	protegerCampos(divName);     
		$('#divButtonNew').hide();  
		$('#divButtonDelete').hide(); 
	}

    document.getElementById("currentTabId").value=tabCount;

//	alert(parent.divIndex);
	// need this for NN4 since our form is in a relative div...
	if (xbDEBUG.on && !wrapped)	{
		xbDebugTraceObject('window', 'xbStyle');
		xbDebugTraceObject('window', 'xbClipRect');
		wrapped = true;
	}if (xbDEBUG.on){
		xbDebugDumpProfile();
	}

}
buttonMenuVisibility('buttonMenu', 'hide');

if(!isEmpty('#propostaId')){
	setTimeout(function(){
		raisePanel('<s:property value="currentTab"/>');
	},300);
}
selectDadosArrendatario($('#segPropArrend').val());
if($("#isFrota").val() == "true"){
	$("#btnf10").attr("onClick","abrirModalRelatorioFrota()");
}
//mostrarMenu('buttonMenu');
</script>
