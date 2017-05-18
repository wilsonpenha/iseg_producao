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
<link rel="stylesheet" type="text/css" href="<s:url value="/common/jquery.readonly.css" includeParams="none"/>"></link>
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
<script language="javascript" charset="UTF-8" src="<s:url value="/js/orcamentoSegAuto/script.js?v=5" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/hotkeys-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/js/orcamentoSegAuto/tab-panel.js?v=1" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/wizardFinal/tabpane-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery-1.3.2-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/ui.core-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/ui.accordion-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/ui.dialog.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.bestupper-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.meiomask-pack.js?v=1" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery-form.js" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.form-new-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.readonly.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.simplemodal-1.1.1-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.autocomplete-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/common.js" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/is-date-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/event-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/masked-input-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/xbLibrary-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/xbDebug-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/xbDOM-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/xbStyle-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/xbStyle-css-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/lightbox/jquery.lightbox-0.5.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.carousel.min.js?v=1" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/ajax/ajaxPoll.js" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.alphanumeric.js" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/nicEdit.js" includeParams="none"/>"></script>

<script type="text/javascript">defineContext('<s:url value="/" includeParams="none"/>');</script>
  
<script language="javascript">
$(function() {
	$("#accordion").accordion({
		active: false,
        collapsible: true, 
        autoHeight: true
	});
});

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
var orcamentoSegAutoPerfilAlterada = false;
var formOrcamento = true;

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
div.panel,p.flip
{
    width: 0px;
    height: 0px;
    padding:5px;
    text-align:center;
    background:#e5eecc;
    border:solid 1px #c3c3c3;
    position:fixed;
    right:10px;
    bottom:-15px;
    z-index:10;
    color: red;
    font-weight: bold;
}
div.panel
{
    position:fixed;
    bottom: 29px;
    width: 200px;
    height: auto;
    display:none;
    text-align:left;
    z-index:10;
}
.vh 
{
	    background-color: #F9EDBE;
	    border-color: #F0C36D;
	    border: 3px solid transparent;
	    border-radius: 3px 3px 3px 3px;
	    background: none repeat scroll 0 0 #F9EDBE;
	    border-color: #F9EDBE;
	    color: #222222;
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
	background-color:#FFF;
	border:1px solid #888888;
	color:#606060;
	font-family:Verdana,Arial,Helvetica,sans-serif;
	font-size:11px;
	font-weight:bold;
}  
.padding_right tr td
{
	 padding-right: 4px;
}
input{ 
	background-color:#FFFFFF;          
	border:1px solid #888888;
	color:#303030;
	font-family:Verdana,Arial,Helvetica,sans-serif;
	font-size:12px;
	font-weight:normal;
	height:18px;
}
legend{
	font-weight:bolder;
}
.transparent
{
   filter:alpha(opacity=60); 
   -moz-opacity: 0.6; 
   opacity: 0.6; 
}
.readonly{
	font-size: 10px;
}
/* #modalContainer {max-height:560px; overflow:auto; width:auto; height: auto; top:5%; left: 0; margin-left:5%; margin-right:5px; background-color: #E8E8E8; border: outset 4px; padding: 3px;} */
/* #modalContainer a.modalCloseImg {background:url(basic-x.png) no-repeat; width:25px; height:29px; display:inline; z-index:3200; position:absolute; top:-15px; right:-18px; cursor:pointer;} */
/* #modalContainer #basicModalContent {padding:8px;} */
#modalContainer {max-height:560px; overflow:hidden; width:745px; height: auto; left: 0; background-color: #E8E8E8; border: outset 4px; padding: 3px;}
</style> 
</head>
<body onload="init();">
<form id="formEdit" namespace="/orcamentoSegAuto" name="formEdit" method="post">
  
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
					<a class="Main_LeftTabsBar_ButtonRight" href="#" onclick="listaOrcamentos();">
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
								<td class="TabBody TabPanel_width">Perfil</td>
								<td class="TabRight"/>
							  </tr>
							</table>
						  </td>
						  <td>
							<table onclick="raisePanel(2)" id="tabMenu2" border="0" cellpadding="0" cellspacing="0" class="inactive">
							  <tr>
								<td class="TabLeft"></td>
								<td class="TabBody TabPanel_width">Veículo</td>
								<td class="TabRight"/>
							  </tr>
							</table>
						  </td>
						  <td>
							<table onclick="raisePanel(3)" id="tabMenu3" border="0" cellpadding="0" cellspacing="0" class="inactive">
							  <tr>
								<td class="TabLeft"></td>
								<td class="TabBody TabPanel_width">Coberturas/Serviços</td>
								<td class="TabRight"/>
							  </tr>
							</table>
						  </td>
						  <td>
							<table onclick="raisePanel(4)" id="tabMenu4" border="0" cellpadding="0" cellspacing="0" class="inactive">
							  <tr>
								<td class="TabLeft"></td>
								<td class="TabBody TabPanel_width">Calculos</td>
								<td class="TabRight"/>
							  </tr>
							</table>
						  </td>
<!--						  <td>-->
<!--							<table onclick="raisePanel(5)" id="tabMenu5" border="0" cellpadding="0" cellspacing="0" class="inactive">-->
<!--							  <tr>-->
<!--								<td class="TabLeft"></td>-->
<!--								<td class="TabBody TabPanel_width">CRM</td>-->
<!--								<td class="TabRight"/>-->
<!--							  </tr>-->
<!--							</table>-->
<!--						  </td>-->
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
	  <div class="tabPane" id="tabPane0" style="overflow:auto; height:auto; width:100%; visibility: hidden;">
	     <jsp:include page="tabPane0_noJs.jsp" flush="false"></jsp:include>
	  </div>
	  <div class="tabPane" id="tabPane1" style="overflow:auto; height:auto; visibility: hidden">
	     <jsp:include page="tabPane1_noJs.jsp" flush="false"></jsp:include>
	  </div>
	  <div class="tabPane" id="tabPane2" style="overflow:auto; height:auto; visibility: hidden">
	     <jsp:include page="tabPane2_noJs.jsp" flush="false"></jsp:include>
	  </div>
	  <div class="tabPane" id="tabPane3" style="overflow:auto; height:auto; visibility: hidden">
	     <jsp:include page="tabPane3_noJs.jsp" flush="false"></jsp:include>
	  </div>
	  <div class="tabPane" id="tabPane4" style="overflow:auto; height:auto;visibility: hidden">
	     <jsp:include page="tabPane4_noJs.jsp" flush="false"></jsp:include>
	  </div>
	  <div class="tabPane" id="tabPane5" style="overflow:auto; height:auto; visibility: hidden">
	     <jsp:include page="tabPane5_noJs.jsp" flush="false"></jsp:include>
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
<jsp:include page="../orcamentoSeguro/barraDeAcoes.jsp" flush="false"></jsp:include>

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

<div id="modalGerarProposta" style="display:none; z-index: 1000;height: 560px; width:671px;">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="Main_ContentPane_TabPane" id="tdtopTabs">
		<tr id="paramParentTabContainer" style="padding: 3px">
		  <td class="tabBackGroundInit" style="background-color: #505050"></td>
		</tr>
		<tr id="paramMainTabContainer" style="padding: 3px">
		  <td class="tabBackGroundInit" style="background-color: #505050">
			<span style="color:#FFFFFF; font-size:8pt; font-weight:bold; height:26px !important; padding:0 4px; text-align:center; white-space:nowrap;">
			  Gerar Proposta
			</span>
		  </td>
		</tr>
	</table>
	<form id="formGeraProposta" name="formGeraProposta" style="height:516px; overflow:auto;">
		<s:textfield style="display:none;" id="paramOrcamentoFranquiasProposta" name="orcamentoFranquias.id"/>
		<div id="dadosGerarProposta"></div>
	</form>
	<table width="100%" align="center" style="bottom: 0px; background-color: #E8E8E8; position: absolute; z-index: 100;">
		<tr>
			<td align="right">
			  <a href="#" class="button" onclick="gerarProposta();" >
				<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">Gerar Proposta</td>
					<td class="wButton_right"/>
				  </tr>
				</table>
			  </a>
			</td>
			<td align="left">
			  <a href="#" class="button" onclick="closeModalGerarProposta();" >
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
	<input class="modalClose" id="closeDiv" style="display:none;" />
</div>

<div id="modalGerarOrcamento" style="display:none; z-index: 1000;height: 650px; width:500px;">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="Main_ContentPane_TabPane" id="tdtopTabs">
		<tr id="paramParentTabContainer" style="padding: 3px">
		  <td class="tabBackGroundInit" style="background-color: #505050"></td>
		</tr>
		<tr id="paramMainTabContainer" style="padding: 3px">
		  <td class="tabBackGroundInit" style="background-color: #505050">
			<span style="color:#FFFFFF; font-size:8pt; font-weight:bold; height:26px !important; padding:0 4px; text-align:center; white-space:nowrap;">
			  Gerar Orçamento
			</span>
		  </td>
		</tr>
	</table>
	<form id="formGeraOrcamento" name="formGeraProposta" style="height:460px; overflow:auto;">
		<fieldset>
			<legend></legend>
			<table width="100%">
				<tr>
					<td>
						<label>Imprimir Cobertura?</label>
					</td>
					<td>
						<s:select style="width: 50px;" theme="simple" id="possuiCobServ" name="possuiCobServ" list="#{true:'SIM',false:'NAO'}" tabindex="4" value="%{corretoraEmUso.isOrcamentoCobertura}"/>
					</td>
				</tr>
				<tr>
					<td>
						<label>Enviar orçamento por e-mail?</label>
					</td>
					<td>
						<s:select style="width: 50px;" theme="simple" id=""  name="" list="#{true:'SIM',false:'NAO'}" tabindex="4" value="%{corretoraEmUso.isOrcamentoPorEmail}"/>
					</td>
				</tr>
				<tr>
					<td valign="bottom">
						<label>Avisar via SMS?</label>
					</td>
					<td valign="bottom">
						<s:select style="width: 50px;" theme="simple" id="isEnvioSms"  name="" list="#{true:'SIM',false:'NAO'}" tabindex="4" value="%{corretoraEmUso.isOrcamentoSmsCliente}"/>
					</td>
					<td valign="bottom">
						<label>Telefone</label><br />
						<s:textfield cssClass="clFone" id="telefoneCliente" theme="simple"/>
					</td>
				</tr>
				<tr>
					<td valign="bottom">
						<label>Avisar o Corretor?</label>
					</td>
					<td valign="bottom">
						<s:select style="width: 50px;" theme="simple" id="isEnvioProdutor"  name="" list="#{true:'SIM',false:'NAO'}" tabindex="4" value="%{corretoraEmUso.isOrcamentoSmsProdutor}"/>
					</td>
					<td valign="bottom">
						<label>Telefone</label><br />
						<s:textfield cssClass="clFone" theme="simple" id="telefoneProdutor"/>
					</td>
				</tr>
			</table>
		</fieldset>
		<fieldset>
			<legend>Dados de e-mail</legend>
			<table width="100%">
				<tr>
					<td>
						<label>Destinatário</label>
					</td>
					<td>
						<s:textfield theme="simple" style="width:97%" id="emailCliente" name="emailTo"/>
					</td>
				</tr>
				<tr>
					<td>
						<label>Cópia</label>
					</td>
					<td>
						<s:textfield theme="simple" style="width:97%" name="emailCC"/>
					</td>
				</tr>
				<tr>
					<td>
						<label>Assunto</label>
					</td>
					<td>
						<s:textfield theme="simple" style="width:97%" name="assuntoEmail" value="%{templateMensagem.assunto}"/>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label>Mensagem:</label>
						<s:textarea id="editor" style="width: 420px; height: 100px" name="textoEmail" value="%{templateMensagem.corpoTexto}"/>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div id="msgEmail" class="vh" style="width:0px; height:0px;"></div>
					</td>
				</tr>
			</table>
		</fieldset>
	</form>
	<s:if test="%{corretoraEmUso.isOrcamentoSmsCliente}">
		<form id="formEnviarSms" name="formEnviarSms" style="overflow:auto;" method="get">
			<fieldset>
				<legend>SMS</legend>
				<table width="100%">
					<tr>
						<td>
							<s:textarea style="width: 420px; height: 60px" name="mensagem" value="%{templateSms.corpoTexto}" readonly="true"/>
						</td>
					</tr>
				</table>
<!-- 				<input type="hidden" name="metodo" value="envio" /> -->
				<input type="hidden" name="usuario" value="i9tecnologia"/>
				<input type="hidden" name="senha" value="i91822"/>
				<input type="hidden" name="celulares" id="celularCliente"/>
			</fieldset>
		</form>
	</s:if>
	<table width="100%" align="center" style="bottom: 0px; background-color: #E8E8E8; position: absolute; z-index: 100;">
		<tr>
			<td align="right">
			  <a href="#" class="button" onclick="if(confirma('Confirma envio de e-mail?')){enviarOrcamento();}" >
				<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">Enviar</td>
					<td class="wButton_right"/>
				  </tr>
				</table>
			  </a>
			</td>
			<td align="center" width="75px">
			  <input type="button" id="btnf12" style="display: none;" onclick="gerarOrcamentoPdf();"/>
			  <a href="#" class="button" onclick="$('#btnf12').click();">
			  <table onmouseout="this.className='wButton'; return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton">
				<tr>
				  <td class="wButton_left"></td>
				  <td class="wButton_text wButton_width">Visualizar</td>
				  <td class="wButton_right"/>
				</tr>
			  </table>
			  </a>
		   </td>
		   <td align="left">
			  <a href="#" class="button" onclick="closeModalGerarProposta();" >
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
	<script>
		$().ready(function() {
			// Mascara de telefone.
		    $(".clFone").setMask({mask : '(99) 9999-9999', autoTab: false});
		    $(".clFone").DefaultValue("(__) ____-____");
 		});
	</script>
	<input class="modalClose" id="closeDiv" style="display:none;" />
</div>

<form id="formLookup" name="formLookup">
  	<s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>
<!-- 	<input type="hidden" id="currentTabId" name="currentTab" value="0"/> -->
	<input type="hidden" id="idRelatorio" name="idRelatorio" value="AUTO"/>
	<input type="hidden" id="gpOrcamentoSeguroId" name="orcamentoSeguro.id" />
	<input type="hidden" id="gpSeguradoraId" name="seguradora.id" />
	<input type="hidden" id="gpRamoId" name="ramo.id" />
	<input type="hidden" id="gpBlnPossuiPerfil" name="orcamentoSeguro.blnPossuiPerfil" />
	<input type="hidden" id="gpTipoCliente" name="tipoCliente" />
	<input type="hidden" id="gpClienteId" name="orcamentoSeguro.cliente.id" />
	<input type="hidden" id="gpPessoaFisicaId" name="pessoaFisica.id" />
	<input type="hidden" id="gpClienteCpf" name="pessoaFisica.cpfOuCnpj" />
	<input type="hidden" id="gpClienteCnpj" name="pessoaJuridica.cpfOuCnpj" />
	<input type="hidden" id="gpGrupoDeVendaId" name="orcamentoSeguro.grupoDeVenda.id" />
	<input type="hidden" id="gpQuantParc" name="orcamentoSeguro.qtdeParcelas" />
	<input type="hidden" id="gpValorDemaisParcelas" name="orcamentoSeguro.valorDemaisParcelas" />
	<input type="hidden" id="gpFormaPagamento" name="orcamentoSeguro.formaPagamento" />
	<input type="hidden" id="gpFormaPagamento1aParcela" name="orcamentoSeguro.formaPagamento1aParcela" />
	<input type="hidden" id="gpNroBanco" name="orcamentoSeguro.nroBanco" />
	<input type="hidden" id="gpCodigoAgencia" name="orcamentoSeguro.codigoAgencia" />
	<input type="hidden" id="gpContaCorrente" name="orcamentoSeguro.contaCorrente" />
	<input type="hidden" id="gpContaDigito" name="orcamentoSeguro.contaDigito" />
	<input type="hidden" id="gpOrcamentoSeguradoraId" name="orcamentoSeguradora.id" />
	<s:hidden id="gpVistoriadoraId" name="orcamentoSeguro.vistoriadora.id" />

	<input type="hidden" id="gpDataVencim1aParcela" name="orcamentoSeguro.dataVencim1aParcela" />
	<input type="hidden" id="gpValor1aParcela" name="orcamentoSeguro.valor1aParcela" />
	<input type="hidden" id="gpPremioTotal" name="orcamentoSeguro.premioTotal"/>
	
	<input type="hidden" id="gpBlnEndosso" name="blnEndosso"/>
	<input type="hidden" id="gpBlnRenovacao" name="blnRenovacao"/>
</form>
<form id="formCondutor" name="formCondutor">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>
  	<input type="hidden" id="fcCondutorCPF" name="condutor.cpf"/>
	<input type="hidden" id="fcCondutorId" name="condutor.id"/>
	<input type="hidden" id="fcClienteCondutorId" name="clienteCondutorId"/>
	<input type="hidden" id="fcCondutorNome" name="condutor.nome"/>
	<input type="hidden" id="fcCondutorTipoCondutor" name="condutor.tipoCondutor"/>
	<input type="hidden" id="fcCondutorDataNascimento" name="condutor.dataNascimento"/>
	<input type="hidden" id="fcCondutorSexo" name="condutor.sexo"/>
	<input type="hidden" id="fcCondutorTelefones" name="condutor.telefones"/>
	<input type="hidden" id="fcCondutorEstadoCivil" name="condutor.estadoCivil"/>
	<input type="hidden" id="fcCondutorCNH" name="condutor.cnh"/>
	<input type="hidden" id="fcCondutorData1aHabilitacao" name="condutor.data1aHabilitacao"/>
	<input type="hidden" id="fcCondutorDataVencHabilitacao" name="condutor.dataVencHabilitacao"/>
	<input type="hidden" id="fcCondutorProfissao" name="condutor.profissao.descricao"/>
	<input type="hidden" id="fcCondutorProfissaoId" name="condutor.profissao.id"/>
	<input type="hidden" id="fcCondutorOrcamento" name="condutor.orcamentoSeguro.id"/>
	<input type="hidden" id="fcIsCondutorPrincipal" name="condutor.isCondutorPrincipal"/>
	<input type="hidden" id="fcEscolaridadeCondutor" name="condutor.escolaridade.id"/>
	<input type="hidden" id="fcRelacaoCondutorSegurado" name="condutor.relacaoCondutorSegurado.id"/>
	<input type="hidden" id="fcEmailCondutor" name="condutor.email"/>
</form>
<form id="formOrcamentoSeguradora" name="formOrcamentoSeguradora">
	<s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>
	<input type="hidden" id="paramOrcamentoSeguradoraId" name="orcamentoSeguradora.id"/>
	<input type="hidden" id="paramOrcamentoSeguroIdModal" name="orcamentoSeguro.id"/>
	<input type="hidden" id="paramSeguradoraIdModal" name="seguradora.id"/>
	<input type="hidden" id="paramFranquiaOrcamentoSeguradoraId" name="orcamentoFranquias.id"/>
	<input type="hidden" id="paramTipoCliente" name="tipoCliente"/>
</form>
<form id="formAnexo" name="formAnexo" enctype="multipart/form-data">
  	<s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>
	<input type="hidden" id="faPropostaAnexoOrcamentoSeguradoraId" name="propostaAnexo.orcamentoSeguradora.id" />
<!-- 	<input type="hidden" id="faOrcamentoSeguradoraId" name="orcamentoSeguradora.id" /> -->
</form>
  <jsp:include page="modalAddCobertura.jsp" flush="false"></jsp:include>
  <jsp:include page="modalAddServico.jsp" flush="false"></jsp:include>
  <jsp:include page="../orcamentoSeguro/novaCotacaoModal.jsp" flush="false"></jsp:include>
  <jsp:include page="modalOrcamentoSegAuto.jsp" flush="false"></jsp:include>
  <jsp:include page="modalAddSeguradora.jsp" flush="false"></jsp:include>
  <jsp:include page="modalAddFranquiaSeguradora.jsp" flush="false"></jsp:include>
  <jsp:include page="modalAddCoberturaSeguradora.jsp" flush="false"></jsp:include>
  <jsp:include page="modalAddServicoSeguradora.jsp" flush="false"></jsp:include>

  <s:if test="orcamentoSeguro.statusOperacional != 0 && orcamentoSeguro.statusOperacional != 5 && orcamentoSeguro.statusOperacional != 8">
	<script>
	
	$(document).ready(function(){
		editavel = false;
		$('#allForms').readonly(true);
		$('#divButtonNew').hide();
		$('#divButtonDelete').hide();

		$('#btnf7').click(function (e) {
			e.preventDefault();
			$('#paramEndosso').modal({onShow: modalEndosso, close: false});
		});
	});

	</script>
  </s:if>
  <s:if test="orcamentoSeguro.statusOperacional > 4">
	  <script>
		$(document).ready(function(){
 		    $('#dadosApolice input').attr('readonly','true');
		    $('#dadosApolice input[type=text]').addClass('readonly');
		});
	  	
	  </script>
  </s:if>

	 <jsp:include page="../jqueryCalculadora.jsp" flush="false"></jsp:include>
<script>
selectDadosArrendatario($('#segPropArrend').val());
selectFinanciado($('#finan').val());
$(document).ready(function(){
	disableDadosClientes();
	MaskInput($('#dataOrcamentoSeguro').get(0), "99/99/9999");
	MaskInput($('#dataVistoria').get(0), "99/99/9999");
	MaskInput($('#dataEmissaoApolice').get(0), "99/99/9999");
	//MaskInput($('#orcamentoCondutorDataNascimento').get(0), "99/99/9999");
	//MaskInput($('#orcamentoCondutorData1aHabilitacao').get(0), "99/99/9999");
	MaskInput($('#inicioVigencia').get(0), "99/99/9999");
	MaskInput($('#terminoVigencia').get(0), "99/99/9999");
	MaskInput($('#dataVencim1aParcela').get(0), "99/99/9999");
	MaskInput($('#orcamentoSeguroDataVistoria').get(0), "99/99/9999");
	MaskInput($('#dataGeracao').get(0), "99/99/9999");
	MaskInput($('#dataTransmissao').get(0), "99/99/9999");
	MaskInput($('#nroCheque1Parcela').get(0), "9999999999");
	MaskInput($('#nroBanco1Parcela').get(0), "9999");
	MaskInput($('#nroBanco').get(0), "9999");
	MaskInput($('#contaCorrente').get(0), "999999999999999");

// 	if(isEmpty('#orcamentoSeguroId')){
		MaskInput($('#dataFundacao').get(0), "99/99/9999");
		MaskInput($('#dataNascimento').get(0), "99/99/9999");
		MaskInput($('#dataEmissao').get(0), "99/99/9999");
		MaskInput($('#data1aHabilitacao').get(0), "99/99/9999");

		$("#clientePFNome").autocomplete('<s:url value="/objlookup/getClientePFListByNome.action" includeParams="none" />', {idFieldsToUpdate:["#clienteId"],onItemSelect:carregaCliente, mustMatch:0, autoFill:false,width:400,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
		$("#clienteCpf").autocomplete('<s:url value="/objlookup/getClienteListByCpf.action" includeParams="none" />', {idFieldsToUpdate:["#clienteId"],onItemSelect:carregaCliente, mustMatch:0, autoFill:false,width:400,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
		$("#clientePJNome").autocomplete('<s:url value="/objlookup/getClientePJListByNome.action" includeParams="none" />', {idFieldsToUpdate:["#clienteId"],onItemSelect:carregaCliente, mustMatch:0, autoFill:false,width:400,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
		$("#clienteCnpj").autocomplete('<s:url value="/objlookup/getClienteListByCnpj.action" includeParams="none" />', {idFieldsToUpdate:["#clienteId"],onItemSelect:carregaCliente, mustMatch:0, autoFill:false,width:400,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
		
		$("#condutorNome").autocomplete('<s:url value="/objlookup/getClientePFListByNome.action" includeParams="none" />', {idFieldsToUpdate:["#clienteCondutorId"],onItemSelect:carregaCondutor, mustMatch:0, autoFill:false,width:400,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
		$("#condutorCpf").autocomplete('<s:url value="/objlookup/getClienteListByCpf.action" includeParams="none" />', {idFieldsToUpdate:["#clienteCondutorId"],onItemSelect:carregaCondutor, mustMatch:0, autoFill:false,width:400,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
// 	}
	$("#seguradoraNome").autocomplete('<s:url value="/objlookup/getSeguradoraByNome.action" includeParams="none" />', {idFieldsToUpdate:["#seguradoraId"]});
	$("#autorGeracaoNome").autocomplete('<s:url value="/objlookup/getPessoaList.action" includeParams="none" />', {idFieldsToUpdate:["#autorGeracaoId"]});
	$("#marcaNome").autocomplete('<s:url value="/objlookup/getMarcaList.action" includeParams="none" />', {idFieldsToUpdate:["#marcaId"],autoFill:false,width:400,max:300,scroll:true,scrollHeight:150,onItemSelect:clearModeloVeiculoValues,onClear:clearModeloVeiculoValues});
	$("#modeloVeiculoDescricao").autocomplete('<s:url value="/objlookup/getModeloVeiculoList.action" includeParams="none" />', {idFieldsToUpdate:["#modeloVeiculoId","#codigoFipe"],extraParams:{'fabricante.id':function(){return $("#marcaId").val();}},autoFill:false,width:400,max:300,scroll:true,scrollHeight:150});
	$("#corPredominante").autocomplete('<s:url value="/objlookup/getCorList.action" includeParams="none" />', {minChars:1,mustMatch:0,autoFill:false,width:400,max:300,scroll:true,scrollHeight:150});
	$("#regiaoTarifacao").autocomplete('<s:url value="/objlookup/getCepOrCidadeList.action" includeParams="none" />', {mustMatch:0,autoFill:false, width:400,max:300,scroll:true,scrollHeight:150,minChars:2,width:300,formatItemOnSelect:splitResultGetFirst});
	$("#cepRes").autocomplete('<s:url value="/objlookup/getCepList.action" includeParams="none" />', {idFieldsToUpdate:["#bairroRes", "#cidadeRes","#ufRes","#lograRes"],mustMatch:0,minChars:6,width:300,autoFill:false,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
	$("#cepCom").autocomplete('<s:url value="/objlookup/getCepList.action" includeParams="none" />', {idFieldsToUpdate:["#bairroCom", "#cidadeCom","#ufCom","#lograCom"],mustMatch:0,minChars:6,width:300,autoFill:false,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
	$("#condutorNome").keydown(function(event){return handleFocusNomeCondutor(event, this.value, '#tablePerfil');});
	$("#condutorProfissao").autocomplete('<s:url value="/objlookup/getProfissaoByNome.action" includeParams="none" />', {idFieldsToUpdate:["#condutorProfissaoId"]});
	$("#escolaridadeCondutor").autocomplete('<s:url value="/objlookup/getEscolaridade.action" includeParams="none" />', {idFieldsToUpdate:["#escolaridadeCondutorId"]});
	
	$('.alfanumerico').alphanumeric();
	
	$("#profissaoNome").autocomplete('<s:url value="/objlookup/getProfissaoByNome.action" includeParams="none" />', 
	{
		idFieldsToUpdate:["#profissaoId"],
		autoFill:false,
	});
	
	if($('#propostaId').val() != null && $('#propostaId').val() != ""){
		setAlterado(true);
	}
	setTipoPessoa($("#arrTipoPessoa").val());
	selectRastreador($("#selectRastreadorId").val());
	selectBloqueador($("#selectBloqueadorId").val());
	
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
	$('#gpOrcamentoSeguroId').val($('#orcamentoSeguroId').val());
	if($('#orcamentoSeguroId').val() != ""){
		openWin('', 'report', '800', '600', 'resizable=yes');
		submitForm($('#formLookup').get(0), getContextApp()+'/report/runjasper.action', false, "report");
	}else{
		alert('Favor, salvar a orcamentoSeguro.');
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

	$('#btnf14').click(function (e) {
		e.preventDefault();
		$('#paramOrcamentoSeguro').modal({onShow: modalNovaOrcamentoSeguro, close: false});
	});

});
// define a mascara padrão para telefone  
$().ready(function() {
	// Mascara de telefone.
    $(".clData").setMask({mask : '39/19/9999', autoTab: false});
    $(".clCPF").setMask({mask : '999.999.999-99', autoTab: false});
    $(".clCNPJ").setMask({mask : '99.999.999/9999-99', autoTab: false});
    $(".clFone").setMask({mask : '(99) 9999-9999', autoTab: false});
    $(".clFone").DefaultValue("(__) ____-____");
    // Converte para upper e elimina brancos no inicio e brancos duplos.
    $(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
    $(".clValor1").setMask({mask : '9,999.999.999.999', type : 'reverse',defaultValue:"00"});
    $(".clValor").setMask({mask : '99',  type : 'reverse',defaultValue:"0"});
    $(".clNumero4").setMask({mask : '9999',  type : 'reverse',defaultValue:"1"});
    $(".clCep").setMask({mask : '99999-999', autoTab: false});
    $("#placaVeiculo").setMask({mask : 'aaa9999', autoTab: false});
 	
 });

function modalNovaOrcamentoSeguro (dialog) {
	setTimeout(function(){
	  paramNovaOrcamentoSeguro();}
	,500);
}

function modalEndosso (dialog) {
	setTimeout(function(){
	  paramEndosso();}
	,500);
}
disabilitarCamposEnviadoParaCalculo();
</script>
<div class="panel">
	<a href="#">Atualizar</a>
</div>
<p class="flip">Novo Pedido de Orçamento</p>
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
	stlCentral.setHeight(xbToInt(stlClient.getHeight() - stlNavegador.getHeight() - 9 - 17)); 
	stlTabFiller.setHeight(xbToInt(stlClient.getHeight() - stlNavegador.getHeight() - 9 - 16 - 34)); 
	stlAllForms.setHeight(xbToInt(stlClient.getHeight() - stlNavegador.getHeight() - 9 - 16 - 40)); 
	stlAllForms.setWidth(xbToInt(stlTabFiller.getWidth()-6)); 
//	stlTabFiller.setWidth(xbToInt(stlClient.getWidth()-100)); 

	bodyOnLoad();
	
	apoliceCancelada($("#motivo"));
	
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
	setTimeout(function(){
		if(!isEmpty('#outraProfissaoNome')){
			$('#checkProfissao').attr('checked',true);
			ativarOutraProfissao($('#checkProfissao')[0]);
		}
	},300);
}
buttonMenuVisibility('buttonMenu', 'hide');

$('input[name=bancosRelacionamentoIds]:checked').each(function(){
	objeto = $(this)[0];
	habilitaDesabilitaCamposBanco(objeto);
});

if(!isEmpty('#orcamentoSeguroId')){
	setTimeout(function(){
		raisePanel('<s:property value="currentTab"/>');
	},300);
}
if($('#tipoProposta').val() != 6){
	desabilitarCamposTela('formularioRenovacao');
}

$.ajaxPollSettings.pollingType = "timed";
$.ajaxPollSettings.interval = 60000;
$.ajaxPollSettings.maxInterval = 60000;
$.ajaxPollSettings.durationUntilMaxInterval = 60000;
$.ajaxPoll({
	url: getContextApp()+'/orcamentoSegAuto/atualizacaoPolling.action',
	type: "POST",
	data: { queryId: 1234 },
	dataType: "text",
	successCondition: function(result) {
		if (result != null) {
		    try {
			    if(totalOrcamento != 0 && totalOrcamento < result){
			    	$(".flip").animate({ width: 200, height: 100 }, "fast");
			    }
		    	totalOrcamento = result;
		        return eval(result)["complete"];
	        }
	        catch (ex) {
	            return false;
	        }
        }
	},
	success: function(data) {
		
	}
});
$(".flip").mouseleave(function () {
    $(".panel").slideUp("fast");
    $(".flip").animate({ width: 0, height: 0 }, "fast");
});
var area1 = null;
function toggleArea1() {
	if(!area1) {
		area1 = new nicEditor({fullPanel : true}).panelInstance('editor',{hasPanel : true});
	} else {
		area1.removeInstance('editor');
		area1 = null;
	}
}
bkLib.onDomLoaded(function() { toggleArea1(); });
//mostrarMenu('buttonMenu');
</script>
