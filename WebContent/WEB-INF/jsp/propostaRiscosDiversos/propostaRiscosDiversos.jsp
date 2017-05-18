<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xml:lang="en" xmlns="http://www.w3.org/1999/xhtml" lang="en">

<head>
<title>Proposta Passo-a-Passo</title> 
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
  
<script language="javaScript" charset="UTF-8" src="<s:url value="/common/web/js/utils-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/geral-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/confirm-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/js/propostaRiscosDiversos/script-pack.js?v=8" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/js/propostaRiscosDiversos/tab-panel-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/js/propostaRiscosDiversos/tabpane-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/hotkeys-pack.js?v=1" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery-1.5.1.min.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/ui.core-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/ui.accordion-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.bestupper-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.meiomask-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery-form-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.form-new-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.readonly.js?v=1" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/common-pack.js?v=5" includeParams="none"/>"></script>
<script charset="UTF-8" src="<s:url value="/common/jquery.simplemodal-1.1.1-pack.js?v=0" includeParams="none"/>" type='text/javascript'></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.autocomplete-pack.js?v=0" includeParams="none"/>"></script>
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

var divArray = ["tabPane0","tabPane1","tabPane2","tabPane3","tabPane4"];
var divReadonly_tabPane0_event = null;
var divReadonly_tabPane1_event = null;  
var divReadonly_tabPane2_event = null;
var divReadonly_tabPane3_event = null;
var divReadonly_tabPane4_event = null;

var selected = false;
var alterado = false;
var editavel = true;
var cpfClienteAlterado = false;
var cnpjClienteAlterado = false;
var riscoAlterado = false;

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
</style>

</head>
<body onload="init();">
<form id="formEdit" namespace="/propostaRiscosDiversos" name="formEdit" method="post" onSubmit="if (isNaN(window.event.keyCode)){return false;};">
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
					<a class="Main_LeftTabsBar_ButtonLeft" href="#" onclick="mostrarMenu('buttonMenu');resizeArea(true);bodyOnLoad();return false;">
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
			  	<span class="Main_NavBar_Breadcrumb" id="paramBreadcrumb"><tiles:insertAttribute name="navigation" /></span>
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
								<td class="TabBody TabPanel_width">Descr. Risco</td>
								<td class="TabRight"/>
							  </tr>
							</table>
						  </td>
						  <td>
							<table onclick="raisePanel(2)" id="tabMenu2" border="0" cellpadding="0" cellspacing="0" class="inactive">
							  <tr>
								<td class="TabLeft"></td>
								<td class="TabBody TabPanel_width">Prêmios</td>
								<td class="TabRight"/>
							  </tr>
							</table>
						  </td>
						  <td>
							<table onclick="raisePanel(3)" id="tabMenu3" border="0" cellpadding="0" cellspacing="0" class="inactive">
							  <tr>
								<td class="TabLeft"></td>
								<td class="TabBody TabPanel_width">Apólice</td>
								<td class="TabRight"/>
							  </tr>
							</table>
						  </td>
						  <td>
							<table onclick="raisePanel(4)" id="tabMenu4" border="0" cellpadding="0" cellspacing="0" class="inactive">
							  <tr>
								<td class="TabLeft"></td>
								<td class="TabBody TabPanel_width">Comercialização</td>
								<td class="TabRight"/>
							  </tr>
							</table>
						  </td>
					    <s:if test="proposta.propostaInicial != null || countEndosso > 0">
					    <script>numeroDeTabs=6</script>
						  <td>
							<table onclick="raisePanel(5)" id="tabMenu5" border="0" cellpadding="0" cellspacing="0" class="inactive">
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

<div id="allForms" style="overflow:hidden; width:100%;" class="tabPane" >
  <div class="tabPane" id="tabPane0" style="overflow:auto; height:auto; width:100%; visibility: hidden;">
	<div id="divForm1" style="width:100%">
	  <s:textfield theme="simple" id="propostaId" name="proposta.id" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="isFatura" name="proposta.isFatura" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="tipoCliente" name="tipoCliente" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="smsEncaminhado" name="proposta.smsEncaminhado" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="blnGerarParcelas" name="blnGerarParcelas" value="false" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="blnPossuiPerfil" name="proposta.blnPossuiPerfil" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="tipoLancamento" name="proposta.tipoLancamento" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="statusOperacional" name="proposta.statusOperacional" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="situacaoOperacional" name="proposta.situacaoOperacional" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="propostaEndossadaId" name="proposta.propostaEndossada.id" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="propostaRenovadaId" name="proposta.propostaRenovada.id" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="propostaOriginalId" name="proposta.propostaOriginal.id" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="propostaInicialId" name="proposta.propostaInicial.id" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="tipoProposta" name="proposta.tipoProposta" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="propostaNumero" name="proposta.numero" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="operacao" name="operacao" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="tipoEndossoId" name="proposta.tipoEndosso.id" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="tipoEndosso" name="tipoEndosso" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="blnReloaded" name="blnReloaded" value="true" cssStyle="display:none"/>
	  <table>
	    <tr>
		  <td colspan="4">
		    <div id="divMessagesTab1" class="divMessages" style="padding-bottom: 10px;">
		  	  <s:actionerror/>
			  <s:actionmessage/>
			  <s:fielderror/>
		    </div>
		  </td>
	    </tr>
	  </table>
	  <table width="100%" border="0" cellpadding="0" cellspacing="0">
	  <tr>
		<td>
		  <fieldset>
		  <table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
			  <td>
				<label for="dataProposta">Data</label>
				<s:textfield theme="simple" id="dataProposta" name="proposta.dataProposta" cssStyle="display:none;" />
				<s:textfield theme="simple" cssClass="requiredField" id="dataProposta" disabled="true" name="proposta.dataProposta" onblur="isValidDate(this)" size="10" onchange="setAlterado(true);" />
			  </td>
			  <td>
			    <s:if test="proposta.numero != null">
			      <b><span style="font-size:16px;color:red;">Localizador: <fmt:formatNumber value="${proposta.numero}" pattern="00000" /></span></b>
			    </s:if>
			  </td>
			  <td>
			    <label for="situacaoOperacionalId">Situação</label>
			    <s:select theme="simple" cssClass="Combo" id="situacaoOperacionalId" disabled="true" emptyOption="false" name="proposta.situacaoOperacional" list="situacaoOperacionalList" />
			  </td>
			</tr>
			<tr>
			  <td width="45%">
				<label for="seguradoraId">Seguradora</label><br />
				<s:textfield theme="simple" id="seguradoraId" name="proposta.seguradora.id" cssStyle="display:none;" />
				<s:textfield theme="simple" size="50" id="seguradoraNome" name="proposta.seguradora.nome" cssClass="readonly" readonly="true" tabindex="-1" />
			  </td>
			  <td width="25%">
				<label for="ramoNome">Ramo</label><br />
				<s:textfield theme="simple" id="ramoId" name="proposta.ramo.id" cssStyle="display:none;" />
				<s:textfield theme="simple" size="30" id="ramoNome" name="proposta.ramo.nome" cssClass="readonly" readonly="true" tabindex="-1" />	
			  </td>
			  <td width="30%">
			    <label for="statusOperacionalId">Fase</label><br />
			    <s:select theme="simple" cssClass="Combo" id="statusOperacionalId" disabled="true" emptyOption="false" name="proposta.statusOperacional" list="statusOperacionalList" />
			  </td>
			</tr>
			<tr>
			  <td width="40%" valign="bottom">
			  <table border="0" cellpadding="1" cellspacing="0"><tr><td><label id="labelCover">
			    <a title="Trocar Seguradora" href="#" class="button" onclick="abrirDivTrocarSeguradora();" tabindex="-1">
				<table style="width: 130px" onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton">
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">Trocar Seguradora</td>
					<td class="wButton_right"/>
				  </tr>
				</table>
			    </a></label></td></tr></table>
			  </td>
			</tr>
		  </table>
		  </fieldset>
	    </td>
	  </tr>
	  <tr>
		<td>
		  <fieldset>
		  <legend accesskey="V"><b>Dados da <u>V</u>istoria</b></legend>
		  <table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
			  <td colspan="3" nowrap="nowrap">
				<label>Vistoriadora</label>
				<div id="divVistoriadora">
				  <s:select theme="simple" id="comboVistoriadora" name="proposta.vistoriadora.id" headerKey="" headerValue="-- Selecione --" list="vistoriadorasList" listKey="id" listValue="nome" onchange="setAlterado(true);" />		  
				  ou <s:textfield theme="simple" id="propostaNomeVistoriadora" name="proposta.nomeVistoriadora" size="40" maxlength="40" onchange="setAlterado(true);" />
				</div>
			  </td>
			</tr>
			<tr>
			  <td width="33%">
				<label for="NomeVistoriador">Nome Vistoriador</label><br />
				<s:textfield theme="simple" id="NomeVistoriador" name="proposta.nomeVistoriador" maxlength="30" onchange="setAlterado(true);"/>
			  </td>
			  <td  width="33%" nowrap="nowrap">
				<label for="NroVistoria">Nro da Solicitação</label><br />
				<s:textfield theme="simple" id="NroVistoria" name="proposta.nroVistoria" maxlength="20" onchange="setAlterado(true);"/>
			  </td>
			  <td  width="33%" nowrap="nowrap">
				<label for="dataVistoria">Dt da Solicitação</label><br />
				<s:textfield theme="simple" id="dataVistoria" cssClass="clData" name="proposta.dataVistoria" onblur="isValidDate(this)" size="10" onchange="setAlterado(true);"/>
			  </td>
			</tr>
		  </table>
		  </fieldset>
		</td>
	  </tr>
	</table>
	<div id="divDadosCliente">
	<s:if test="tipoCliente == 0">
	<table width="100%" border="0" cellpadding="2" cellspacing="0">
	  <tr>
		<td>
		  <fieldset>
		  <legend accesskey="C"><b>Dados do <u>C</u>liente</b></legend>
		  <table id="tableDadosCliente" width="100%" border="0" cellpadding="2" cellspacing="0">
			<tr>
			  <td width="15%">
				<label id="labelCover" for="clienteCpfCnpj"><a href="#" class="LabelLink" onclick="editarCliente();" tabindex="-1" title="Alterar dados Cadastrais do Segurado.">CPF</a><br /></label>
				<s:textfield theme="simple" cssClass="requiredField" id="clienteCpf" name="pessoaFisica.cpfOuCnpj" size="18" maxlength="14" onblur="checarCpfCliente(this);" onchange="cpfClienteAlterado=true;setAlterado(true);"/>
				
			  </td>
			  <td colspan="2">
				<label for="clienteNome">Nome do Segurado</label><br />
				<s:textfield theme="simple" id="currentTabId" name="currentTab" cssStyle="display:none;" />
				<s:textfield theme="simple" id="clienteId" name="proposta.cliente.id" cssStyle="display:none;" />
				<s:textfield theme="simple" id="pessoaFisicaId" name="pessoaFisica.id" cssStyle="display:none;" />
				<s:textfield theme="simple" cssClass="requiredField" id="clientePFNome" name="pessoaFisica.nome" size="50" maxlength="60" onchange="setAlterado(true);"/>
			  </td>
			  <td width="15%">
				<label for="pfGrupoDeVendaId">Grupo de Venda</label><br />
				<s:select theme="simple" cssClass="requiredField" cssStyle="width:165px" id="pfGrupoDeVendaId" headerKey="" headerValue="-- Selecione --" name="pessoaFisica.grupoDeVenda.id" list="grupoDeVendaList" listKey="id" listValue="nomeDoGrupo" onchange="setAlterado(true);"/>
			  </td>
			  <td width="15%">
				<label for="dataNascimento">Dt. Nascimento</label><br />
				<s:textfield theme="simple" cssClass="clData requiredField" id="dataNascimento" name="pessoaFisica.dataNascimento" onblur="isValidDate(this)" size="12" maxlength="10" onchange="setAlterado(true);"/>
			  </td>
			  <td width="15%">
				<label for="sexo">Sexo</label><br />
				<s:select theme="simple" id="sexo" headerKey="" headerValue="-- Selecione --" name="pessoaFisica.sexo" list="{'MASCULINO','FEMININO'}" onchange="setAlterado(true);"/>
			  </td>
			</tr>
			<tr>
			  <td>
				<label for="rg">Identidade</label><br />
				<s:textfield theme="simple" id="rg" name="pessoaFisica.rg" size="15" maxlength="15" onchange="setAlterado(true);"/>
			  </td>
			  <td width="20%">
				<label for="orgaoEmissor">Emissor</label><br />
				<s:textfield theme="simple" id="orgaoEmissor" name="pessoaFisica.orgaoEmissor" size="15" maxlength="15" onchange="setAlterado(true);"/>
			  </td>
			  <td width="15%">
				<label for="dataEmissao">Dt de Expedição</label><br />
				<s:textfield theme="simple" id="dataEmissao" cssClass="clData" name="pessoaFisica.dataEmissao" onblur="isValidDate(this)" size="12" maxlength="10" onchange="setAlterado(true);"/>
			  </td>
			  <td>
				<label for="telefonePreferencial">Telef. Preferencial</label><br />
				<s:textfield theme="simple" cssClass="clFone requiredField" id="telefonePreferencial" name="pessoaFisica.telefonePreferencial" size="16" maxlength="16" onchange="setAlterado(true);"/>
			  </td>
			  <td>
				<label for="telefoneAlternativo">Telefone Alternativo</label><br />
				<s:textfield theme="simple" cssClass="clFone" id="telefoneAlternativo" name="pessoaFisica.telefoneAlternativo" size="16" maxlength="16" onchange="setAlterado(true);"/>
			  </td>
			  <td>
				<label for="telefoneCelular">Telefone Celular</label><br />
				<s:textfield theme="simple" cssClass="clFone" id="telefoneCelular" name="pessoaFisica.telefoneCelular" size="16" maxlength="16" onchange="setAlterado(true);"/>
			  </td>
			</tr>
			<tr>
			  <td colspan="3">
				<label for="email">E-mail</label><br />
				<s:textfield theme="simple" id="email" name="pessoaFisica.email" size="60" maxlength="80" onchange="setAlterado(true);"/>
			  </td>
			  <td colspan="2">
			    <label for="pfReferencia">Referência pessoal</label><br />
				<s:textfield theme="simple" id="pfReferencia" name="pessoaFisica.referenciaPessoal" cssClass="clTextoRestrito" maxlength="50" size="50" onchange="setAlterado(true);"/>
			  </td>
			</tr>
		  </table>
		  <s:if test="%{proposta.id == null}">
		    <table id="tableDadosCliente" width="100%" border="0" cellpadding="2" cellspacing="0">
		      <tr>
			    <td align="right" colspan="5">
			      <a href="#" class="button" onclick="apagarDadosCliente();" tabindex="-1">
				  <table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton">
				    <tr>
					  <td class="wButton_left"></td>
					  <td class="wButton_text wButton_width">Apagar Dados</td>
					  <td class="wButton_right"/>
				    </tr>
				  </table>
			      </a>
			    </td>
		      </tr>
		    </table>
		  </s:if>
		  </fieldset>
		</td>
	  </tr>
	  <tr>
		<td>
		  <fieldset>
		  <legend accesskey="E"><b><u>E</u>ndereço Residencial</b></legend>
		  <table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
			  <td width="10%">
				<label id="labelCover" for="cepRes"><a href="#" class="LabelLink" onclick="openWin('${pageContext.request.contextPath}/endereco/buscaCep.action','BuscaCep','1024','600','resizable=yes,scrollbars=yes');" tabindex="-1" title="Acessar o site dos Correrios!">CEP</a><br /></label>
				<s:textfield theme="simple" cssClass="requiredField" id="end0TipoEndereco" name="proposta.propostaEnderecoCollection[0].tipoEndereco" value="R" cssStyle="display:none;" />
				<s:textfield theme="simple" cssClass="requiredField" id="end0PessoaFisicaId" name="proposta.propostaEnderecoCollection[0].id" cssStyle="display:none;" />
				<s:textfield theme="simple" cssClass="clCep" id="cepRes" name="proposta.propostaEnderecoCollection[0].cep" size="11" maxlength="9" onchange="setAlterado(true);"/>
				
			  </td>
			  <td width="30%">
				<label for="lograRes">Logradouro</label><br />
				<s:textfield theme="simple" cssClass="requiredField" id="lograRes" name="proposta.propostaEnderecoCollection[0].logradouro" cssStyle="width:98%" maxlength="60" onchange="setAlterado(true);"/>
			  </td>
			  <td width="30%">
				<label for="compRes">Complemento</label><br />
				<s:textfield theme="simple" id="compRes" name="proposta.propostaEnderecoCollection[0].complemento" cssStyle="width:98%" maxlength="60" onchange="setAlterado(true);"/>
			  </td>
			  <td width="15%">
				<label for="numeroRes">Numero</label><br />
				<s:textfield theme="simple" id="numeroRes" name="proposta.propostaEnderecoCollection[0].numero" maxlength="6" size="8"/>
			  </td>
			  <td width="15%">
				<label for="foneRes">Fone Residencial</label><br />
				<s:textfield theme="simple" cssClass="clFone" id="foneRes" name="proposta.propostaEnderecoCollection[0].telefone" size="16" maxlength="20" onchange="setAlterado(true);"/>
			  </td>
			</tr>
			<tr>
			  <td colspan="2">
				<label for="bairroRes">Bairro</label><br />
				<s:textfield theme="simple" cssClass="requiredField" id="bairroRes" name="proposta.propostaEnderecoCollection[0].bairro" cssStyle="width:98%" maxlength="50" onchange="setAlterado(true);"/>
			  </td>
			  <td>
				<label for="cidadeRes">Cidade</label><br />
				<s:textfield theme="simple" cssClass="requiredField" id="cidadeRes" name="proposta.propostaEnderecoCollection[0].cidade" cssStyle="width:98%" maxlength="35" onchange="setAlterado(true);"/>
			  </td>
			  <td>
				<label for="ufRes">UF</label><br />
				<s:select theme="simple" cssClass="requiredField" id="ufRes" headerKey="" headerValue="-- Selecione --" name="proposta.propostaEnderecoCollection[0].uf" list="ufList" listKey="uf" listValue="nome" onchange="setAlterado(true);"/>
			  </td>
			  <td>
				<label for="cidadeCom">Correspondência</label><br />
			    <s:select theme="simple" cssClass="Combo Combo_OneCells_width requiredField" id="correspondenciaRes" name="proposta.propostaEnderecoCollection[0].correspondencia" list="#{'SIM':'SIM','NAO':'NÃO'}" />
			  </td>
			  <td>
				<label for="faxRes">Fax</label><br />
				<s:textfield theme="simple" cssClass="clFone" id="faxRes" name="proposta.propostaEnderecoCollection[0].fax" size="16" maxlength="20" onchange="setAlterado(true);"/>
			  </td>
			</tr>
		  </table>
		  </fieldset>
		</td>
	  </tr>
	  <tr>
		<td>
		  <fieldset>
		  <legend accesskey="L"><b>Endereço Comercia<u>L</u></b></legend>
		  <table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
			  <td width="10%">
				<label id="labelCover" for="cepCom"><a href="#" class="LabelLink" onclick="openWin('${pageContext.request.contextPath}/endereco/buscaCep.action','BuscaCep','1024','600','resizable=yes,scrollbars=yes');" tabindex="-1" title="Acessar o site dos Correrios!">CEP</a><br /></label>
				<s:textfield theme="simple" id="end1TipoEndereco" name="proposta.propostaEnderecoCollection[1].tipoEndereco" value="C" cssStyle="display:none;" />
				<s:textfield theme="simple" id="end1PessoaFisicaId" name="proposta.propostaEnderecoCollection[1].id" cssStyle="display:none;" onchange="setAlterado(true);"/>
				<s:textfield theme="simple" cssClass="clCep" id="cepCom" name="proposta.propostaEnderecoCollection[1].cep" size="11" maxlength="9"/>
				
			  </td>
			  <td width="30%">
				<label for="lograCom">Logradouro</label><br />
				<s:textfield theme="simple" id="lograCom" name="proposta.propostaEnderecoCollection[1].logradouro" cssStyle="width:98%" maxlength="60" onchange="setAlterado(true);"/>
			  </td>
			  <td width="30%">
				<label for="compCom">Complemento</label><br />
				<s:textfield theme="simple" id="compCom" name="proposta.propostaEnderecoCollection[1].complemento" cssStyle="width:98%" maxlength="60" onchange="setAlterado(true);"/>
			  </td>
			  <td width="15%">
				<label for="numeroCom">Numero</label><br />
				<s:textfield theme="simple" id="numeroCom" name="proposta.propostaEnderecoCollection[1].numero" maxlength="6" size="8" onchange="setAlterado(true);"/>
			  </td>
			  <td width="15%">
				<label for="foneCom">Fone Comercial</label><br />
				<s:textfield theme="simple" cssClass="clFone" id="foneCom" name="proposta.propostaEnderecoCollection[1].telefone" size="16" maxlength="20" onchange="setAlterado(true);"/>
			  </td>
			</tr>
			<tr>
			  <td colspan="2">
				<label for="bairroCom">Bairro</label><br />
				<s:textfield theme="simple" id="bairroCom" name="proposta.propostaEnderecoCollection[1].bairro" cssStyle="width:98%" maxlength="50" onchange="setAlterado(true);"/>
			  </td>
			  <td>
				<label for="cidadeCom">Cidade</label><br />
				<s:textfield theme="simple" id="cidadeCom" name="proposta.propostaEnderecoCollection[1].cidade" cssStyle="width:98%" maxlength="30" onchange="setAlterado(true);"/>
			  </td>
			  <td>
				<label for="ufCom">UF</label><br />
				<s:select theme="simple" id="ufCom" headerKey="" headerValue="-- Selecione --" name="proposta.propostaEnderecoCollection[1].uf" list="ufList" listKey="uf" listValue="nome" onchange="setAlterado(true);"/>
			  </td>
			  <td>
				<label for="cidadeCom">Correspondência</label><br />
			    <s:select theme="simple" cssClass="Combo Combo_OneCells_width requiredField" id="correspondenciaCom" name="proposta.propostaEnderecoCollection[1].correspondencia" list="#{'SIM':'SIM','NAO':'NÃO'}" />
			  </td>
			  <td>
				<label for="faxCom">Fax</label><br />
				<s:textfield theme="simple" cssClass="clFone" id="faxCom" name="proposta.propostaEnderecoCollection[1].fax" size="16" maxlength="20" onchange="setAlterado(true);"/>
			  </td>
			</tr>
			<tr>
			  <td align="left" colspan="5">
  			    <table border="0" cellpadding="0" cellspacing="0"><tr><td><label id="labelCover">
			    <a href="#" class="button" onclick="copiarEnderecoResidencialParaEnderecoComercial();" tabindex="-1">
				<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton">
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">Copiar Dados End. Residencial</td>
					<td class="wButton_right"/>
				  </tr>
				</table>
				</a></label></td></tr>
			    </table>
			  </td>
			</tr>
		  </table>
		  </fieldset>
		</td>
	  </tr>
	</table>
	</s:if>
	<s:if test="tipoCliente == 1">
	<table width="100%" border="0" cellpadding="2" cellspacing="0">
	  <tr>
		<td>
		  <fieldset>
		  <legend accesskey="C"><b>Dados do <u>C</u>liente</b></legend>
		  <table id="tableDadosCliente" width="100%" border="0" cellpadding="2" cellspacing="0">
			<tr>
			  <td width="20%">
				<label id="labelCover" for="clienteCnpj"><a href="#" class="LabelLink" onclick="editarCliente();" tabindex="-1" title="Alterar dados Cadastrais do Segurado.">CNPJ</a><br /></label>
				<s:textfield theme="simple" cssClass="requiredField" id="clienteCnpj" name="pessoaJuridica.cpfOuCnpj" size="23" maxlength="21" onblur="checarCnpjCliente(this);" onchange="cnpjClienteAlterado=true;setAlterado(true);"/>
				
			  </td>
			  <td colspan="2">
				<label for="clienteNome">Nome do Segurado</label><br />
				<s:textfield theme="simple" id="currentTabId" name="currentTab" cssStyle="display:none;" />
				<s:textfield theme="simple" id="clienteId" name="proposta.cliente.id" cssStyle="display:none;" />
				<s:textfield theme="simple" id="pessoaJuridicaId" name="pessoaJuridica.id" cssStyle="display:none;" />
				<s:textfield theme="simple" cssClass="requiredField" id="clientePJNome" name="pessoaJuridica.nome" size="50" maxlength="60" onchange="setAlterado(true);"/>
			  </td>
			  <td colspan="2">
				<label for="razaoSocial">Razão Social</label><br />
				<s:textfield theme="simple" cssClass="requiredField" id="razaoSocial" size="50" maxlength="60" name="pessoaJuridica.razaoSocial" onchange="setAlterado(true);"/>
			  </td>
			</tr>
			<tr>
			  <td width="20%">
				<label for="pjGrupoDeVendaId">Grupo de Venda</label><br />
				<s:select theme="simple" cssClass="requiredField" id="pjGrupoDeVendaId" headerKey="" headerValue="-- Selecione --" name="pessoaJuridica.grupoDeVenda.id" list="grupoDeVendaList" listKey="id" listValue="nomeDoGrupo" onchange="setAlterado(true);"/>
			  </td>
			  <td width="20%">
				<label for="inscricaoEstadual">Inscricao Estadual</label><br />
				<s:textfield theme="simple" id="inscricaoEstadual" name="pessoaJuridica.inscrEstadual" maxlength="14" onchange="setAlterado(true);"/>
			  </td>
			  <td width="20%">
				<label for="inscricaoMunicipal">Inscricao Municipal</label><br />
				<s:textfield theme="simple" id="inscricaoMunicipal" name="pessoaJuridica.inscricaoMunicipal" onchange="setAlterado(true);"/>
			  </td>
			  <td colspan="2">
				<label for="atividadeComercial">Atividade Comercial</label><br />
				<s:select theme="simple" id="atividadeComercial" headerKey="" headerValue="-- Selecione --" name="pessoaJuridica.atividadeComercial.id" list="atividadeComercialList" listKey="id" listValue="valor" onchange="setAlterado(true);"/>
			  </td>
			</tr>
			<tr>
			  <td width="20%">
				<label for="dataFundacao">Data Fundação</label><br />
				<s:textfield theme="simple" id="dataFundacao" cssClass="clData" name="pessoaJuridica.dataFundacao" onblur="isValidDate(this)" size="12" maxlength="10" onchange="setAlterado(true);"/>
			  </td>
			  <td width="20%">
				<label for="valorPatrimonio">Valor Patrimônio</label><br />
				<s:textfield theme="simple" id="valorPatrimonio" name="pessoaJuridica.valorPatrimonio" size="16" onchange="setAlterado(true);"/>
			  </td>
			  <td width="20%">
				<label for="telefonePreferencial">Telef. Preferencial</label><br />
				<s:textfield theme="simple" cssClass="clFone requiredField" id="telefonePreferencial" name="pessoaJuridica.telefonePreferencial" size="16" maxlength="16" onchange="setAlterado(true);"/>
			  </td>
			  <td width="20%">
				<label for="telefoneAlternativo">Telefone Alternativo</label><br />
				<s:textfield theme="simple" cssClass="clFone" id="telefoneAlternativo" name="pessoaJuridica.telefoneAlternativo" size="16" maxlength="16" onchange="setAlterado(true);"/>
			  </td>
			  <td width="20%">
				<label for="telefoneCelular">Telefone Celular</label><br />
				<s:textfield theme="simple" cssClass="clFone" id="telefoneCelular" name="pessoaJuridica.telefoneCelular" size="16" maxlength="16" onchange="setAlterado(true);"/>
			  </td>
			</tr>
			<tr>
			  <td colspan="2">
				<label for="email">E-mail</label><br />
				<s:textfield theme="simple" id="email" name="pessoaJuridica.email" size="40" maxlength="80" onchange="setAlterado(true);"/>
			  </td>
			  <td colspan="2">
				<label for="homePage">Site</label><br />
				<s:textfield theme="simple" id="homePage" name="pessoaJuridica.siteHomePage" size="40" maxlength="100" onchange="setAlterado(true);"/>
			  </td>
			  <td colspan="2">
			    <label for="pfReferencia">Pessoa de referência</label><br />
				<s:textfield theme="simple" id="pfReferencia" name="pessoaJuridica.referenciaPessoal" cssClass="clTextoRestrito" maxlength="50" onchange="setAlterado(true);"/>
			  </td>
			  <s:if test="%{proposta.id == null}">
			  </tr>
			  <tr>
			  <td align="right" colspan="1">
			  	<a href="#" class="button" onclick="apagarDadosCliente();">
				<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton">
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">Apagar Dados</td>
					<td class="wButton_right"/>
				  </tr>
				</table>
				</a>
			  </td>
		      </s:if>
			</tr>
		  </table>
		  </fieldset>
		</td>
	  </tr>
	  <tr>
		<td>
		  <fieldset>
		  <legend accesskey="E"><b><u>E</u>ndereço</b></legend>
		  <table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
			  <td width="10%">
				<label id="labelCover" for="cepRes"><a href="#" class="LabelLink" onclick="openWin('${pageContext.request.contextPath}/endereco/buscaCep.action','BuscaCep','1024','600','resizable=yes,scrollbars=yes');" tabindex="-1" title="Acessar o site dos Correrios!">CEP</a><br /></label>
				<s:textfield theme="simple" id="end0TipoEndereco" name="proposta.propostaEnderecoCollection[0].tipoEndereco" value="C" cssStyle="display:none;" />
				<s:textfield theme="simple" id="end0PessoaFisicaId" name="proposta.propostaEnderecoCollection[0].id" cssStyle="display:none;" />
				<s:textfield theme="simple" cssClass="clCep" id="cepCom" name="proposta.propostaEnderecoCollection[0].cep" size="11" maxlength="9" onchange="setAlterado(true);"/>
				
			  </td>
			  <td width="30%">
				<label for="lograRes">Logradouro</label><br />
				<s:textfield theme="simple" cssClass="requiredField" id="lograCom" name="proposta.propostaEnderecoCollection[0].logradouro" cssStyle="width:98%" maxlength="60" onchange="setAlterado(true);"/>
			  </td>
			  <td colspan="2">
				<label for="compRes">Complemento</label><br />
				<s:textfield theme="simple" id="compCom" cssClass="" name="proposta.propostaEnderecoCollection[0].complemento" cssStyle="width:98%" maxlength="60" onchange="setAlterado(true);"/>
			  </td>
			  <td width="15%">
				<label for="numeroRes">Número</label><br />
				<s:textfield theme="simple" id="numeroCom" name="proposta.propostaEnderecoCollection[0].numero" maxlength="6" size="8" onchange="setAlterado(true);"/>
			  </td>
			  <td width="15%">&nbsp;
			  </td>
			</tr>
			<tr>
			  <td colspan="2">
				<label for="bairroCom">Bairro</label><br />
				<s:textfield theme="simple" id="bairroCom" cssClass="" name="proposta.propostaEnderecoCollection[0].bairro" cssStyle="width:98%" maxlength="50" onchange="setAlterado(true);"/>
			  </td>
			  <td>
				<label for="cidadeCom">Cidade</label><br />
				<s:textfield theme="simple" id="cidadeCom" cssClass="" name="proposta.propostaEnderecoCollection[0].cidade" cssStyle="width:98%" maxlength="30" onchange="setAlterado(true);"/>
			  </td>
			  <td>
				<label for="ufCom">UF</label><br />
				<s:select theme="simple" id="ufCom" headerKey="" headerValue="-- Selecione --" name="proposta.propostaEnderecoCollection[0].uf" list="ufList" listKey="uf" listValue="nome" onchange="setAlterado(true);"/>
			  </td>
			  <td>
				<label for="cidadeCom">Correspondência</label><br />
			    <s:select theme="simple" cssClass="Combo Combo_OneCells_width requiredField" id="correspondenciaCom" name="proposta.propostaEnderecoCollection[0].correspondencia" list="#{'SIM':'SIM','NAO':'NÃO'}" />
			  </td>
			  <td> 
				<label for="faxCom">Fax</label><br />
				<s:textfield theme="simple" cssClass="clFone" id="faxCom" name="proposta.propostaEnderecoCollection[0].fax" size="16" maxlength="20" onchange="setAlterado(true);" />
			  </td>
			</tr>
		  </table>
		  </fieldset>
		</td>
	  </tr>
	</table>
	</s:if>
	</div>
	</div>
  </div>
  <div class="tabPane" id="tabPane1" style="overflow:auto; height:auto; visibility: hidden">
	<div id="divForm2" style="width:100%">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	  <tr><td>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	    <tr>
		  <td colspan="4">
			<s:textfield theme="simple" id="itemCorrente" name="itemCorrente" cssStyle="display:none;" />
			<s:textfield theme="simple" id="itens" name="itens" cssStyle="display:none;" />
			<div class="demo" id="demo">
			<div id="accordion" style="height: 0px;width: 100%; line-height: 0px;">
			<a id="itensSegurados" href="#" style="display:none; padding: 0.0em 0.0em 0.0em 0.0em; height: 0px;" onclick="setTimeout(function(){if (navigator.userAgent.indexOf('Chrome') > -1){$('#accordionContent').css('height',$('#divListaImoveis').css('height'))}},400);"></a>
			  <div id="accordionContent" style="margin-top: 1px; padding: 1px;background: #E8E8E8 none repeat scroll 0 0; -moz-border-radius: 4px; border: 1px solid #AAAAAA; z-index: 100;">
			  <div id="divListaImoveis" style="padding: 0px; background: #E8E8E8 none repeat scroll 0 0;">
				<table id="tableRiscoItens" style="padding-top: 1px;" class="listItens" style="width: 100%" cellspacing="0" cellpadding="0" border="0">
				  <tr class="listItensHeader">
					<td width="5%" nowrap="nowrap">Ações</td>
					<td width="25%" nowrap="nowrap">Risco</td>
					<td width="5%" nowrap="nowrap">CEP</td>
					<td width="30%" nowrap="nowrap">Logradouro</td>
					<td width="15%" nowrap="nowrap">Bairro</td>
					<td width="15%" nowrap="nowrap">Cidade</td>
					<td width="5%" nowrap="nowrap">UF</td>
				  </tr>
				  <s:iterator value="riscoDiversosList" status="stat">
				  <s:if test="!linhaVazia">
					<tr>
					  <td nowrap="nowrap" class="small_image">
						<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/delete.gif" includeParams="none"/>" onclick="if(confirma('Confirma exclusão?')){removerItem('${stat.index}');}"/>
						<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/edit.gif" includeParams="none"/>" onclick="editarRisco('${stat.index}')"/>
					  </td>
					  <td nowrap="nowrap"><s:property value="descricaoRiscoCurto"/>&nbsp;</td>
					  <td nowrap="nowrap"><s:property value="cep"/>&nbsp;</td>
					  <td nowrap="nowrap"><s:property value="logradouro"/>&nbsp;</td>
					  <td nowrap="nowrap"><s:property value="bairro"/>&nbsp;</td>
					  <td nowrap="nowrap"><s:property value="cidade"/>&nbsp;</td>
					  <td nowrap="nowrap"><s:property value="uf"/>&nbsp;</td>
					</tr>
				  </s:if>
				  </s:iterator>
				</table>
			  	<table style="margin-left:10px; -moz-border-radius: 4px;">
				  <tr>
				  	<td>
				      <a href="#" class="button" onclick="$('#itensSegurados').click();" >
					  <table cellpadding="0" cellspacing="0" onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
					    <tr>
						  <td class="wButton_left"></td>
						  <td class="wButton_text wButton_width">Fechar</td>
						  <td class="wButton_right"/>
					    </tr>
					  </table>
					  </a>
				    </td>
				  	<td>
				      <a href="#" class="button" onclick="novoItem();" >
					  <table cellpadding="0" cellspacing="0" onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
					    <tr>
						  <td class="wButton_left"></td>
						  <td class="wButton_text wButton_width">Novo Item</td>
						  <td class="wButton_right"/>
					    </tr>
					  </table>
					  </a>
				    </td>
				  </tr>
				</table>
			  </div>
			  </div>
			</div><!-- End accordion -->
			</div><!-- End demo -->
		  </td>
	    </tr>
	</table>
	  </td></tr>
	  <tr>
		<td>
      <table style="height: 32px; -moz-border-radius: 4px; border: 1px solid #AAAAAA;" class="Main_ContentPane_ToolBar Main_ToolBar_bg" id="tdToolBar">
        <tr>
			<td class="Main_ToolBar_Separator_cell" ><IMG src="<s:url value="/common/web/images/blank.gif" />" class="Main_ToolBar_Separator"></td>
			<td width="2%" ><a id="divButtonNew" href="#" onClick="novoItem();" class="Main_ToolBar_Button" onMouseOver="window.status='Novo Registro';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonNew"><img class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_New" src="<s:url value="/common/web/images/blank.gif" />" title="Novo Registro" border="0" id="buttonNew"></a></td>
			<td class="Main_ToolBar_Separator_cell" ><IMG src="<s:url value="/common/web/images/blank.gif" />" class="Main_ToolBar_Separator"></td>
			<td width="2%" ><a id="divButtonDelete" href="#" onClick="if(confirma('Confirma exclusão?')){removerItem();}" class="Main_ToolBar_Button" onMouseOver="window.status='Excluir Registro';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonDelete"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Delete" id="buttonDelete" title="Excluir Registro"></a></td>
			<td class="Main_ToolBar_Separator_cell" ><IMG src="<s:url value="/common/web/images/blank.gif" />" class="Main_ToolBar_Separator"></td>
			<td width="2%" ><a href="#" onClick="$('#itensSegurados').click();" class="Main_ToolBar_Button" onMouseOver="window.status='Efetuar uma Busca';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonSearch"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Search" id="buttonSearch" title="Efetuar uma busca"></a></td>
			<td class="Main_ToolBar_Separator_cell" ><IMG src="<s:url value="/common/web/images/blank.gif" />" class="Main_ToolBar_Separator"></td>
			<td width="2%" ><a href="#" onclick="primeiroItem();" class="Main_ToolBar_Button" onmouseover="window.status='Primeiro Item';return true;" onmouseout="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonPrevious"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_First" id="buttonPrevious" title="Primeiro item"/></a></td>
			<td class="Main_ToolBar_Separator_cell" ><IMG src="<s:url value="/common/web/images/blank.gif" />" class="Main_ToolBar_Separator"></td>
			<td width="2%" ><a href="#" onclick="itemAnterior();" class="Main_ToolBar_Button" onmouseover="window.status='Item Anterior';return true;" onmouseout="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonPrevious"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Previous" id="buttonPrevious" title="Item anterior"/></a></td>
			<td class="Main_ToolBar_Separator_cell" ><IMG src="<s:url value="/common/web/images/blank.gif" />" class="Main_ToolBar_Separator"></td>
			<td width="2%" ><a href="#" onclick="proximoItem();" class="Main_ToolBar_Button" onmouseover="window.status='Próximo Item';return true;" onmouseout="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonNext"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Next" id="buttonNext" title="Proximo Item"/></a></td>
			<td class="Main_ToolBar_Separator_cell" ><IMG src="<s:url value="/common/web/images/blank.gif" />" class="Main_ToolBar_Separator"></td>
			<td width="2%" ><a href="#" onclick="ultimoItem();" class="Main_ToolBar_Button" onmouseover="window.status='Último Item';return true;" onmouseout="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonNext"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Last" id="buttonNext" title="Ultimo Item"/></a></td>
			<td width="1"><IMG src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_textlabel_bg_left"></td>
			<td class="Main_ToolBar_textlabel_bg_body"><nobr id="bookmark" class="Main_ToolBar_text_bookmark">${itemCorrente+1} / ${itens}</nobr></td>
			<td width="1"><IMG src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_textlabel_bg_right"></td>
			<td class="Main_ToolBar_Separator_cell" ><IMG src="<s:url value="/common/web/images/blank.gif" />" class="Main_ToolBar_Separator"></td>
			<td class="Main_ToolBar_Space"></td>
        </tr>
      </table>
	<table>
	    <tr>
		  <td colspan="4">
		    <div id="divMessagesTab2" class="divMessages" style="padding-bottom: 1px;">
		  	  <s:actionerror/>
			  <s:actionmessage/>
			  <s:fielderror/>
		    </div>
		  </td>
	    </tr>
	</table>
	  </td></tr>
	  <tr>
		<td>
		  <fieldset>
		  <legend accesskey="R"><b>Dados do <u>R</u>isco</b></legend>
		  	<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
			  <td width="10%">
				<label id="labelCover" for="cepRis"><a href="#" class="LabelLink" onclick="openWin('${pageContext.request.contextPath}/endereco/buscaCep.action','BuscaCep','1024','600','resizable=yes,scrollbars=yes');">CEP</a><br /></label>
				<s:textfield theme="simple" id="riscoAlterado" name="riscoAlterado" cssStyle="display:none;" />
				<s:textfield theme="simple" id="riscoId" name="proposta.riscoDiversosCollection[%{itemCorrente}].id" cssStyle="display:none;" />
				<s:textfield theme="simple" id="riscoPropostaId" name="proposta.riscoDiversosCollection[%{itemCorrente}].proposta.id" cssStyle="display:none;" />
				<s:textfield theme="simple" id="riscoLinhaVazia" name="proposta.riscoDiversosCollection[%{itemCorrente}].linhaVazia" cssStyle="display:none;" />
				<s:textfield theme="simple" id="endRisTipoEndereco" name="proposta.riscoDiversosCollection[%{itemCorrente}].tipoEndereco" value="R" cssStyle="display:none;" />
				<s:textfield theme="simple" cssClass="clCep" id="cepRis" name="proposta.riscoDiversosCollection[%{itemCorrente}].cep" size="11" maxlength="9" onchange="setRiscoAlterado(true);"/>
				
			  </td>
			  <td width="30%">
				<label for="lograRis">Logradouro</label><br />
				<s:textfield theme="simple" cssClass="requiredField" id="lograRis" name="proposta.riscoDiversosCollection[%{itemCorrente}].logradouro" cssStyle="width:98%" maxlength="60" onchange="setRiscoAlterado(true);"/>
			  </td>
			  <td width="30%">
				<label for="compRis">Complemento</label><br />
				<s:textfield theme="simple" id="compRis" name="proposta.riscoDiversosCollection[%{itemCorrente}].complemento" cssStyle="width:98%" maxlength="60" onchange="setRiscoAlterado(true);"/>
			  </td>
			  <td width="15%">
				<label for="numeroRis">Número</label><br />
				<s:textfield theme="simple" id="numeroRis" name="proposta.riscoDiversosCollection[%{itemCorrente}].numero" maxlength="6" size="8"/>
			  </td>
			  <td width="15%">
				<label for="foneRis">Fone principal</label><br />
				<s:textfield theme="simple" id="foneRis" cssClass="clFone" name="proposta.riscoDiversosCollection[%{itemCorrente}].telefone" size="16" maxlength="20" onchange="setRiscoAlterado(true);"/>
			  </td>
			</tr>
			<tr>
			  <td colspan="2">
				<label for="bairroRis">Bairro</label><br />
				<s:textfield theme="simple" cssClass="requiredField" id="bairroRis" name="proposta.riscoDiversosCollection[%{itemCorrente}].bairro" cssStyle="width:98%" maxlength="50" onchange="setRiscoAlterado(true);"/>
			  </td>
			  <td>
				<label for="cidadeRis">Cidade</label><br />
				<s:textfield theme="simple" cssClass="requiredField" id="cidadeRis" name="proposta.riscoDiversosCollection[%{itemCorrente}].cidade" cssStyle="width:98%" maxlength="35" onchange="setRiscoAlterado(true);"/>
			  </td>
			  <td>
				<label for="ufRis">UF</label><br />
				<s:select theme="simple" cssClass="requiredField" id="ufRis" headerKey="" headerValue="-- Selecione --" name="proposta.riscoDiversosCollection[%{itemCorrente}].uf" list="ufList" listKey="uf" listValue="nome" onchange="setRiscoAlterado(true);"/>
			  </td>
			  <td>
				<label for="faxRis">Fax</label><br />
				<s:textfield theme="simple" id="faxRis" cssClass="clFone" name="proposta.riscoDiversosCollection[%{itemCorrente}].fax" size="16" maxlength="20" onchange="setRiscoAlterado(true);"/>
			  </td>
			</tr>
			<tr>
			<td colspan="5">
				<table border="0" cellpadding="0" cellspacing="0"><tr><td><label id="labelCover">
			    <a href="#" class="button" onclick="importarEnderecoCliente();" tabindex="-1">
				<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton">
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">Importar Dados Cliente</td>
					<td class="wButton_right"/>
				  </tr>
				</table>
				</a></label></td></tr>
			    </table>
			  </td>
			</tr>
		  </table>
		  </fieldset>
		</td>
	  </tr>   
		<tr>
		  <td colspan="5">
			<fieldset>
			<legend accesskey="o"><b><u>D</u>escricao do Risco</b></legend>
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
			  <tr>
				<td>
				  Observações:<br/>
				  <s:textarea theme="simple" cssClass="dojoValidateValid requiredField TextArea_FourCells_width TextArea_Medium_height" rows="5" id="descricaoRisco" name="proposta.riscoDiversosCollection[%{itemCorrente}].descricaoRisco" cssStyle="width:97%;" onkeyup="return checkMaxLength(this, 1000);" onchange="setRiscoAlterado(true);" />
				</td>
			  </tr>
			</table>
			</fieldset>
		  </td>
		</tr>
	  <tr>
		<td colspan="2">
		  <table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
			  <td>
				<fieldset>
				<legend accesskey="o"><b>Coberturas Contratadas</b></legend>
				  
				  <div id="divListaCoberturas">
				<table id="tableCoberturas" width="100%" border="0" cellpadding="2" cellspacing="1" >
				<tbody>
				  <tr>
					<td width="25%">Descrição</td>
					<td width="30%">Observações</td>
					<td width="15%">LMI</td>
					<td width="15%">Prêmio Cobertura</td>
					<td width="15%">Franquia</td>
				  </tr>
				  <s:iterator value="riscoCoberturaList" status="stat">
				  <s:if test="coberturas.id != null">
					<tr>
					  <td nowrap="nowrap">
						<s:textfield theme="simple" id="riscoCoberturasId%{#stat.index}" name="proposta.riscoDiversosCollection[%{itemCorrente}].riscoCoberturasCollection[%{#stat.index}].id" value="%{id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaId%{#stat.index}" name="proposta.riscoDiversosCollection[%{itemCorrente}].riscoCoberturasCollection[%{#stat.index}].coberturas.id" value="%{coberturas.id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaSeguradoId%{#stat.index}" name="proposta.riscoDiversosCollection[%{itemCorrente}].riscoCoberturasCollection[%{#stat.index}].riscoDiversos.id" value="%{riscoDiversos.id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaSequencia%{#stat.index}" name="proposta.riscoDiversosCollection[%{itemCorrente}].riscoCoberturasCollection[%{#stat.index}].sequencia" value="%{sequencia}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaDescricao%{#stat.index}" name="proposta.riscoDiversosCollection[%{itemCorrente}].riscoCoberturasCollection[%{#stat.index}].descricao" value="%{coberturas.descricao}" disabled="true" size="30" onchange="setRiscoAlterado(true);" />
					  </td>
					  <td><s:textfield theme="simple" id="coberturaObservacao%{#stat.index}" name="proposta.riscoDiversosCollection[%{itemCorrente}].riscoCoberturasCollection[%{#stat.index}].textoFranquia" value="%{textoFranquia}" onchange="setRiscoAlterado(true);" cssStyle="width:80%" /></td>
					  <td><s:textfield theme="simple" id="coberturaLmi%{#stat.index}" cssClass="clValor2 currency" name="proposta.riscoDiversosCollection[%{itemCorrente}].riscoCoberturasCollection[%{#stat.index}].lmi" value="%{lmi}" onkeyup="enableDisableDadosCobertura('%{#stat.index}');" onchange="setRiscoAlterado(true);" cssStyle="width:80%" /></td>
					  <td><s:textfield theme="simple" id="coberturaPremio%{#stat.index}" cssClass="clValor2 currency" name="proposta.riscoDiversosCollection[%{itemCorrente}].riscoCoberturasCollection[%{#stat.index}].premio" value="%{premio}" cssStyle="width:80%" onchange="setRiscoAlterado(true);"/></td>
					  <td><s:textfield theme="simple" id="coberturaFranquia%{#stat.index}" cssClass="clValor2 currency" name="proposta.riscoDiversosCollection[%{itemCorrente}].riscoCoberturasCollection[%{#stat.index}].franquia" value="%{franquia}" cssStyle="width:80%" onchange="setRiscoAlterado(true);"/></td>
					</tr>
				  </s:if>
				  <s:else>
					<tr>
					  <td nowrap="nowrap">
						<s:textfield theme="simple" id="riscoCoberturasId%{#stat.index}" name="proposta.riscoDiversosCollection[%{itemCorrente}].riscoCoberturasCollection[%{#stat.index}].id" value="%{id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaSeguradoId%{#stat.index}" name="proposta.riscoDiversosCollection[%{itemCorrente}].riscoCoberturasCollection[%{#stat.index}].riscoDiversos.id" value="%{riscoDiversos.id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaSequencia%{#stat.index}" name="proposta.riscoDiversosCollection[%{itemCorrente}].riscoCoberturasCollection[%{#stat.index}].sequencia" value="%{sequencia}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaDescricao%{#stat.index}" name="proposta.riscoDiversosCollection[%{itemCorrente}].riscoCoberturasCollection[%{#stat.index}].descricao" value="%{descricao}" size="30" onchange="setRiscoAlterado(true);" />
					  </td>
					  <td><s:textfield theme="simple" id="coberturaObservacao%{#stat.index}" name="proposta.riscoDiversosCollection[%{itemCorrente}].riscoCoberturasCollection[%{#stat.index}].textoFranquia" value="%{textoFranquia}" onchange="setRiscoAlterado(true);" cssStyle="width:80%" /></td>
					  <td><s:textfield theme="simple" id="coberturaLmi%{#stat.index}" cssClass="clValor2 currency" name="proposta.riscoDiversosCollection[%{itemCorrente}].riscoCoberturasCollection[%{#stat.index}].lmi" value="%{lmi}" onkeyup="enableDisableDadosCobertura('%{#stat.index}');"  onchange="setRiscoAlterado(true);" cssStyle="width:80%" /></td>
					  <td><s:textfield theme="simple" id="coberturaPremio%{#stat.index}" cssClass="clValor2 currency" name="proposta.riscoDiversosCollection[%{itemCorrente}].riscoCoberturasCollection[%{#stat.index}].premio" value="%{premio}" cssStyle="width:80%" onchange="setRiscoAlterado(true);"/></td>
					  <td><s:textfield theme="simple" id="coberturaFranquia%{#stat.index}" cssClass="clValor2 currency" name="proposta.riscoDiversosCollection[%{itemCorrente}].riscoCoberturasCollection[%{#stat.index}].franquia" value="%{franquia}" cssStyle="width:80%" onchange="setRiscoAlterado(true);"/></td>
					</tr>
				  </s:else>
				  </s:iterator>
				  </tbody>
				</table>            
				  </div>
				  <table>
				  <tr>
				  	<td>
					<table border="0" cellpadding="0" cellspacing="0"><tr><td><label id="labelCover">
				      <a href="#" class="button" onclick="abrirDivNovaCobertura();" >
					  <table onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
					    <tr>
						  <td class="wButton_left"></td>
						  <td class="wButton_text wButton_width">Adicionar Cobertura</td>
						  <td class="wButton_right"/>
					    </tr>
					  </table>
					</a></label></td></tr>
				    </table>
				    </td>
				  </tr>
				</table>
			    </fieldset>
	    	  </td>
	        </tr>
	      </table>
		</td>
	  </tr>
	</table>
  </div>
  </div>
  <div class="tabPane" id="tabPane2" style="overflow:auto; height:auto; visibility: hidden">
	<div id="divForm3" style="width:100%">
	  <table>
	    <tr>
		  <td colspan="4">
		    <div class="divMessages" id="divMessagesTab4" style="padding-bottom: 10px;">
		  	  <s:actionerror/>
			  <s:actionmessage/>
			  <s:fielderror/>
		    </div>
		  </td>
	    </tr>
	  </table>
	  <table width="98%" border="0" cellpadding="0" cellspacing="0">
		<tr>
		  <td>
			<fieldset>
			<legend accesskey="P"><b><u>P</u>rêmio e Vigência</b></legend>
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
			  <tr>
				<td width="20%" class="TextBox_ContentCell">
				  <label class="LabelText" for="premioLiquido">Prêmio Líquido</label><br />
				  <s:textfield theme="simple" cssClass="TextBox_OneCells_width requiredField clValor2 currency" id="premioLiquido" name="proposta.premioLiquido" onblur="" onchange="javascript:calculaIOF($('#calcularIOF').get(0).checked);calculaPremioTotal();setAlterado(true);" />
				</td>
				<td width="20%" class="TextBox_ContentCell">
				  <label class="LabelText" for="custoApolice">Custo da Apólice</label><br />
				  <s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" id="custoApolice" name="proposta.custoApolice" onblur="" onchange="javascript:calculaIOF($('#calcularIOF').get(0).checked);calculaPremioTotal();setAlterado(true);" />
				</td>
				<td width="20%" class="TextBox_ContentCell">
				  <label class="LabelText" for="desconto">Juros/Desconto</label><br />
				  <s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" id="desconto" name="proposta.desconto" onblur="" onchange="javascript:calculaIOF($('#calcularIOF').get(0).checked);calculaPremioTotal();setAlterado(true);"/>
				</td>
				<td width="20%" class="TextBox_ContentCell">
				  <s:checkbox theme="simple" name="proposta.calcularIof" id="calcularIOF" value="proposta.calcularIof" onclick="if(this.checked){this.value=true;calculaIOF(true);calculaPremioTotal();}else{this.value=false;}">Calcular IOF ? </s:checkbox> <br />
				  <s:textfield theme="simple" id="percentualIOF" name="percentualIOF" cssStyle="display:none;"/>
				  <s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" id="iof" name="proposta.iof" onblur="javascript:calculaPremioTotal();" onchange="setAlterado(true);"/>
				</td>
				<td width="20%" class="TextBox_ContentCell">
				  <label class="LabelText" for="premioTotal">Prêmio Total</label><br />
				  <s:textfield theme="simple" readonly="true" cssClass="TextBox_OneCells_width clValor2 currency" id="premioTotal" name="proposta.premioTotal" onchange="setAlterado(true);" />
				</td>
			  </tr>
			  <tr>
				<td class="TextBox_ContentCell">
				  <label class="LabelText" for="fator">Código operação</label><br />
				  <s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" id="fator" name="proposta.fator" onkeyup="calculaTotalComissao();" onchange="setAlterado(true);"/>
				</td>
				<td class="TextBox_ContentCell">
				  	<label class="LabelText" for="inicioVigencia">Início Vigência</label><br/>
					<s:textfield theme="simple" cssClass="TextBox_OneCells_width requiredField" id="inicioVigencia" name="proposta.inicioVigencia" onblur="if (isValidDate(this)){confirmaInicioVigencia(this)}" size="10" onkeyup="if ($('#propostaOriginalId').val()==''){addYearAndSetField(this.value, 1, document.getElementById('terminoVigencia'));}"/>
		  		</td>
		  		<td class="TextBox_ContentCell">
				  	<label class="LabelText" for="terminoVigencia">Término Vigência</label><br/>
				  	<s:if test="proposta.statusOperacional > 4">
						<s:textfield theme="simple" id="terminoVigencia" name="proposta.terminoVigencia" style="display:none"/>
						<s:textfield theme="simple" disabled="true" cssClass="TextBox_OneCells_width requiredField" id="terminoVigenciaRO" name="proposta.terminoVigencia" size="10"/>
				  	</s:if>
				  	<s:else>
						<s:textfield theme="simple" cssClass="TextBox_OneCells_width requiredField" id="terminoVigencia" name="proposta.terminoVigencia" onblur="isValidDate(this)" size="10"/>
				  	</s:else>
		  		</td>
				<td class="TextBox_ContentCell">
				  <label class="LabelText" for="quantParc">Quantidade Parcelas Total</label><br/>
				  <s:textfield theme="simple" id="quantParc" cssClass="clValor currency" name="proposta.qtdeParcelas" size="3" maxlength="2" onblur="calculaParcelas();" onchange="setAlterado(true);" onkeyup="showHideDadosDemaisParcelas();"/>
				</td>
			  	<td></td>
			  </tr>
			  <tr>
				<td>  
				  <label class="LabelText" for="formaPagamento1aParcela">Forma de Pagamento 1a Parcela</label><br />
				  <s:select theme="simple" cssClass="TextBox_OneCells_width requiredField" id="formaPagamento1aParcela" name="proposta.formaPagamento1aParcela" headerKey="" headerValue="-- Selecione --" list="formaPagamentoList" onchange="showHideDadosFormaPagamento();setAlterado(true);" />
				</td>
			  	<td>
			  	  <label class="LabelText" for="dataVencim1aParcela">Data Vencimento 1a Parcela</label><br />
				  <s:textfield theme="simple" id="dataVencim1aParcela" name="proposta.dataVencim1aParcela" onblur="isValidDate(this)" size="10" maxlength="10" onchange="setAlterado(true);"/>
				</td>
				<td>
				  <label class="LabelText" for="valor1aParcela">Valor 1a Parcela</label><br />
				  <s:textfield theme="simple" id="valor1aParcela" name="proposta.valor1aParcela" cssClass="TextBox_OneCells_width clValor2 currency" maxlength="12" onchange="calculaDemaisParcelas();setAlterado(true);"/>
				</td>
				<td>
				  <label id="labelFormaPagamento" class="LabelText" for="formaPagamento">Forma de Pagamento Demais Parcelas</label><br />
				  <s:select theme="simple" cssClass="TextBox_OneCells_width requiredField" id="formaPagamento" name="proposta.formaPagamento" headerKey="" headerValue="-- Selecione --" list="formaPagamentoList" onchange="showHideDadosFormaPagamento();setAlterado(true);" />
				</td>
			    <td>
			      <label id="labelValorDemaisParcelas" class="LabelText" for="valorDemaisParcelas">Valor Demais Parcelas</label><br />
				  <s:textfield theme="simple" id="valorDemaisParcelas" name="proposta.valorDemaisParcelas" cssClass="TextBox_OneCells_width clValor2 currency" maxlength="12" onchange="setAlterado(true);"/>
				</td>
			  </tr>
			</table>
			<table id="tableDadosDebitoConta" border="0" cellpadding="0" cellspacing="0" width="100%" style="display:none;">
			  <tr>
				<td colspan="5">
				  <table class="FieldGroup" border="0" cellpadding="0" cellspacing="0">
					<tbody>
					  <tr class="FieldGroup_TopMargin"></tr>
					  <tr>
						<td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></img></td>
						<td class="FieldGroupTitle">Dados para Débito em Conta</td>
						<td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></img></td>
						<td class="FieldGroupContent"></td>
					  </tr>
					  <tr class="FieldGroup_BottomMargin"></tr>
					</tbody>
				  </table>
				</td>
			  </tr>
			  <tr>
				<td width="20%">
				  <label class="LabelText" for="nroBanco">Banco</label><br />
				  <s:textfield theme="simple" id="nroBanco" name="proposta.nroBanco" size="20" maxlength="30" onchange="setAlterado(true);" />
				</td>
				<td width="20%">
				  <label class="LabelText" for="codigoAgencia">Agência</label><br />
				  <s:textfield theme="simple" id="codigoAgencia" name="proposta.codigoAgencia" size="10" maxlength="10" onchange="setAlterado(true);"/>
				</td>
				<td width="20%">
				  <label class="LabelText" for="contaCorrente">Nro Conta</label><br />
				  <s:textfield theme="simple" id="contaCorrente" name="proposta.contaCorrente" size="15" maxlength="15" onchange="setAlterado(true);"/>
				</td>
				<td width="20%">
				  <label class="LabelText" for="contaCorrente">Digito Conta</label><br />
				  <s:textfield theme="simple" id="contaDigito" name="proposta.contaDigito" size="3" maxlength="2" onchange="setAlterado(true);"/>
				</td>
				<td width="20%">
				  <label class="LabelText" for="titularCorrente">Titular da Conta</label><br />
				  <s:textfield theme="simple" id="titularCorrente" cssClass="clTextoRestrito" name="proposta.titularCcorrente" size="40" maxlength="50" onchange="setAlterado(true);"/>
				</td>
			  </tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
			  <tr>
				<td colspan="5">
				  <table class="FieldGroup" border="0" cellpadding="0" cellspacing="0">
					<tbody>
					  <tr class="FieldGroup_TopMargin"></tr>
					  <tr>
						<td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></img></td>
						<td class="FieldGroupTitle">Resumo Parcelas</td>
						<td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></img></td>
						<td class="FieldGroupContent"></td>
					  </tr>
					  <tr class="FieldGroup_BottomMargin"></tr>
					</tbody>
				  </table>
				</td>
			  </tr>
			  <tr>
				<td colspan="5">
				  <div id="divParcelas">
				  <table id="tableParcelas" class="listItens"> 
					<tr class="listItensHeader">
						<td width="10%">Parcela</td>
						<td width="10%">Banco</td>
						<td width="10%">Agência</td>
						<td width="10%">Nro Conta</td>
						<td width="15%">Nro Cheque</td>
						<td width="15%">Valor</td>
						<td width="15%">Vencimento</td>
						<td width="15%">Nro Documento</td>
					</tr>
					<s:iterator value="proposta.parcelasPropostaCollection" status="stat">
						<tr>
							<td>
								<s:property value="nroParcela"/>
								<s:textfield name="proposta.parcelasPropostaCollection[%{#stat.index}].id" theme="simple" cssStyle="display:none;"/>
								<s:textfield name="proposta.parcelasPropostaCollection[%{#stat.index}].nroParcela" theme="simple" cssStyle="display:none;"/>
								<s:textfield name="proposta.parcelasPropostaCollection[%{#stat.index}].proposta.id" theme="simple" cssStyle="display:none;"/>
							</td>
							<td >
							  <s:textfield id="banco%{#stat.index}" name="proposta.parcelasPropostaCollection[%{#stat.index}].nroBanco" cssStyle="width:97%;" theme="simple" />
							</td>
							<td >
							  <s:textfield id="agencia%{#stat.index}" name="proposta.parcelasPropostaCollection[%{#stat.index}].codigoAgencia" cssStyle="width:97%;" theme="simple" />
							</td>
							<td >
							  <s:textfield id="nroConta%{#stat.index}" name="proposta.parcelasPropostaCollection[%{#stat.index}].contaCorrente" cssStyle="width:97%;" theme="simple" />
							</td>
							<td >
							  <s:textfield id="nroCheque%{#stat.index}" name="proposta.parcelasPropostaCollection[%{#stat.index}].nroCheque" cssStyle="width:97%;" theme="simple" />
							</td>
							<td >
							  <s:textfield id="valorParcela%{#stat.index}" name="proposta.parcelasPropostaCollection[%{#stat.index}].valorParcela" cssStyle="width:97%;text-align:right;" theme="simple"  cssClass="clValor2 currency"/>
							</td>
							<td >
							  <s:textfield id="vencimento%{#stat.index}" name="proposta.parcelasPropostaCollection[%{#stat.index}].vencimento" cssStyle="width:97%;" theme="simple" size="10" maxlength="10" onblur="isValidDate(this)" cssClass="clData"/>
							</td>
							<td a>
							  <s:textfield id="nroDocumento%{#stat.index}" name="proposta.parcelasPropostaCollection[%{#stat.index}].nroDocumento" cssStyle="width:97%;" theme="simple" maxlength="100"/>
							</td>
						</tr>
					</s:iterator>
					<s:if test="proposta.parcelasPropostaCollection.isEmpty()"><tr class="emptyRow"><td colspan="8">Vazio</td></tr></s:if>
				  </table>
				  </div>
				</td>
			  </tr> 
			  <tr>
			    <td>
				<table border="0" cellpadding="0" cellspacing="0"><tr><td><label id="labelCover">
			      <a href="#" class="button" onclick="carregaParcelas();" >
				  <table style="width: 120px" onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
				    <tr>
					  <td class="wButton_left"></td>
					  <td class="wButton_text wButton_width">Gerar Parcelas</td>
					  <td class="wButton_right"/>
				    </tr>
				  </table>
				</a></label></td></tr>
			    </table>
			    </td>
			  </tr>
			</table>
			</fieldset>
		  </td>  
		</tr>
	  </table>
	  <table width="98%" border="0" cellpadding="0" cellspacing="0">
		<tr>
		  <td>
			<fieldset>
			<legend accesskey="o"><b><u>O</u>bservações</b></legend>
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
			  <tr>
				<td>
				  Observações:<br/>
				  <s:textarea theme="simple" cssClass="dojoValidateValid requiredField TextArea_FourCells_width TextArea_Medium_height" rows="3" id="observacoes" name="proposta.observacoes" cssStyle="width:97%;" onkeyup="return checkMaxLength(this, 1000);" onchange="setAlterado(true);" />
				</td>
			  </tr>
			</table>
			</fieldset>
		  </td>
		</tr>
	  </table>
	</div>
  </div>

  <div class="tabPane" id="tabPane3" style="overflow:auto; height:auto; visibility: hidden">
     <jsp:include page="../proposta/tabApolice_noJs.jsp" flush="false"></jsp:include>
  </div>
	<div class="tabPane" id="tabPane4" style="overflow:auto; height:auto; visibility: hidden;overflow: auto;">
	<div id="divDadosComissao">
	  <table>
	    <tr>
		  <td colspan="4">
		    <div class="divMessages"id="divMessagesTab5" style="padding-bottom: 10px;">
		  	  <s:actionerror/>
			  <s:actionmessage/>
			  <s:fielderror/>
		    </div>
		  </td>
	    </tr>
	  </table>
	  <fieldset>
		<legend><b>Comissão a Receber</b></legend>
		<table id="tableComissao" width="100%" cellspacing="0" cellpadding="0" align="center" class="Main_Client_TableEdition">
		  <tr>
			<td>
			  <label for="grupoDeVendaId">Prêmio Líquido:</label><br/>
			  <s:textfield theme="simple" id="premioLiquidoComTab" name="proposta.premioLiquido" cssClass="dojoValidateValid readonly" readonly="true" disabled="true" />
			</td>
			<td>
			  <label for="produtorGerenteNome">Percentual Comissão:</label><br/>
			  <s:textfield theme="simple" cssClass="TextBox_OneCells_width readonly" id="fatorComTab" disabled="true" name="proposta.fator" readonly="true" />
			</td>
			<td>
			  <label for="totalComissao">Valor Comissão:</label><br/>
			  <s:textfield theme="simple" readonly="true" cssClass="TextBox_OneCells_width clValor2 currency" id="totalComissao" name="proposta.valorComissao" onblur="$('#totalComissao').attr('readonly',true);" onkeyup="calculaFator();" onchange="setAlterado(true);" />
			</td>
			<td align="left">
			<table border="0" cellpadding="0" cellspacing="0"><tr><td><label id="labelCover">
			  <a href="#" class="button" onclick="$('#totalComissao').attr('readonly',false);$('#totalComissao').focus();">
				<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton">
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">Alterar Valor</td>
					<td class="wButton_right"/>
				  </tr>
				</table>
				</a></label></td></tr>
			    </table>
			</td>
		  </tr>
		  <tr>
			<td width="20%">
			  <label class="LabelText" for="tipoRecebimentoComissao">Tipo de Recebimento de Comissão:</label><br/>
			  <s:select theme="simple" id="tipoRecebimentoComissao" cssClass="dojoValidateValid requiredField" list="tipoRecebimentoComissaoList" name="proposta.tipoRecebimentoComissao" onchange="showOptionsRecebimentoComissao();"/>
			</td>
			<td width="20%">
			  <label id="labelOpcoesRecebComissao" class="LabelText"></label><br/>
			  <s:textfield theme="simple" id="quantParcComissao" cssClass="clValor currency" name="proposta.quantParcelasComissao" size="5" maxlength="3" onchange="setAlterado(true);"/>
			  <s:select theme="simple" cssClass="dojoValidateValid" id="descontaCustoApoliceIof" list="#{'true':'SIM', 'false':'NAO'}" name="proposta.descontaCustoApoliceIof" headerKey="" headerValue=" -- " cssStyle="display:none;" onchange="setAlterado(true);" />
			</td>
			<td width="20%"></td>
			<td width="40%"></td>
		  </tr>
		</table>
	  </fieldset>
	  <fieldset>
		  <legend><b>Comissão a Pagar</b></legend>
		  <div id="divComissaoPagar">
		  <table id="tableComissao" width="100%" cellspacing="0" cellpadding="0" class="Main_Client_TableEdition"> 
			<tr>
			  <td width="34%">
				<label for="grupoDeVendaId">Produtor/Grupo:</label><br/>
				<s:textfield theme="simple" id="grupoVendaQE" name="proposta.grupoDeVenda.quebraExclusividade" cssStyle="display:none;"/>
				<s:textfield theme="simple" id="percComissaoMax"  name="proposta.seguradora.percComissaoMax" cssStyle="display:none;"/>
				<s:textfield theme="simple" id="percComissaoMin"  name="proposta.seguradora.percComissaoMin"  cssStyle="display:none;"/>
				<s:select theme="simple" id="grupoDeVendaId" name="proposta.grupoDeVenda.id" cssClass="dojoValidateValid" list="grupoDeVendaList" listKey="id" listValue="nomeDoGrupo" headerKey="" headerValue=" -- Selecione -- " onchange="alert('Está alteração não afeta outras propostas nem o cadastro do segurado!\n');alterarGrupoDeVenda();"/>
			  </td>
			  <td width="33%">
				<label for="produtorGerenteNome">Produtor</label><br/>
				<s:select style="width: 97%" theme="simple" name="proposta.produtor.id" cssClass="dojoValidateValid" list="produtorList" listKey="id" listValue="nome"/>
			  </td>
			</tr>
		  </table>
		  <table width="100%" cellspacing="0" cellpadding="0" class="Main_Client_TableEdition">
		    <tr>
			  <td>
				<table class="FieldGroup" border="0" cellpadding="0" cellspacing="0">
				  <tbody>
					<tr class="FieldGroup_TopMargin"></tr>
					<tr>
					  <td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></img></td>
					  <td class="FieldGroupTitle">Comissionados</td>
					  <td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></img></td>
					  <td class="FieldGroupContent"></td>
					</tr>
					<tr class="FieldGroup_BottomMargin"></tr>
				  </tbody>
				</table>
			  </td>
			</tr>
			<tr>
			  <td>
				<div class="divMessages" id="divMessagesComissionados"></div>
			  </td>
			</tr>
			<tr>
			  <td>
				<div id="divDadosComissionados">
				<table id="tableProdutor" width="100%" cellspacing="0" cellpadding="0" align="center" class="Main_Client_TableEdition">
				  <tr>
					<td width="35%">
					  <label for="comissionadoPropostaPessoaNome">Produtor:</label><br/>
					  <s:textfield theme="simple" id="comissionadoPropostaId" name="proposta.propostaComissaoCollection[].id" cssStyle="display:none;" />
					  <s:textfield theme="simple" id="comissionadoPropostaPessoaId" name="proposta.propostaComissaoCollection[].pessoa.id" cssStyle="display:none;" />
					  <s:textfield theme="simple" id="comissionadoPropostaPessoaNome" cssClass="dojoValidateValid requiredField " cssStyle="width:95%" name="proposta.propostaComissaoCollection[].pessoa.nome"/>
					</td>
					<td width="18%">
					  <label for="comissionadoPropostaTipoComissao">Tipo Repasse:</label><br/>
					  <s:select theme="simple" cssClass="requiredField" id="comissionadoPropostaTipoComissao" cssStyle="width:95%" headerValue="-- Selecione --" headerKey="" list="tipoComissaoList" name="proposta.propostaComissaoCollection[].tipoComissao" onchange="liberaCamposComissao(this.value);"/>
					</td>
					<td width="15%">
					  <label for="comissionadoPropostaComissao">Repasse:</label><br/>
					  <s:textfield theme="simple" cssClass="dojoValidateValid clValor2 currency" name="proposta.propostaComissaoCollection[].comissao" id="comissionadoPropostaComissao" onblur="javascript:calculaVlrComissaoComissionado(this.value);" />
					</td>
					<td width="18%">
					  <label for="comissionadoPropostaVlrComissao">Valor Repasse:</label><br/>
					  <s:textfield theme="simple" cssClass="dojoValidateValid clValor2 currency" name="proposta.propostaComissaoCollection[].valorComissao" id="comissionadoPropostaVlrComissao"  />
					</td>
					<td width="10%" align="right">
					<table border="0" cellpadding="0" cellspacing="0"><tr><td><label id="labelCover">
					  <a href="#" class="button" onclick="inserirComissionado();">
						<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton">
						  <tr>
							<td class="wButton_left"></td>
							<td class="wButton_text wButton_width">Adicionar</td>
							<td class="wButton_right"/>
						  </tr>
						</table>
						</a></label></td></tr>
					    </table>
					</td>
				  </tr>
				  <tr><td><br/></td></tr>
				</table>
				</div>
				<div id="divListaComissionados">
				  <s:set var="totalPercentualComissao" value="0" />
				  <table id="tableComissionadoItens" class="listItens">
					<tr style="height: 20px;" class="listItensHeader">
					  <td width="5%">Ações</td>
					  <td width="30%">Nome</td>
					  <td width="25%">Tipo Repasse</td>
					  <td width="20%">Percentual Repasse</td>
					  <td width="20%">Valor Repasse</td>
					</tr>
					<s:iterator value="comissionadoPropostaList" status="stat">
					<tr style="height: 20px;">
					  <td id="labelCover" nowrap="nowrap" class="small_image">
						<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/delete.gif" includeParams="none"/>" onclick="if(confirma('Está operação poderá gerar estornos de repasse caso haja baixa de comissão, Confirma exclusão?')){setAlterado(true);removerComissionado('<s:property value="id" />');}"/>
					  </td>
					  <td>
					  	<c:set var="totalValorComissao" value="${valorComissao+totalValorComissao}" />
						<s:textfield theme="simple" name="comissionadoPropostaList[%{#stat.index}].id" id="comissionadoPropostaId%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="comissionadoPropostaList[%{#stat.index}].pessoa.id" id="comissionadoPropostaPessoaId%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="comissionadoPropostaList[%{#stat.index}].pessoa.nome" id="comissionadoPropostaPessoaNome%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="comissionadoPropostaList[%{#stat.index}].proposta.id" id="comissionadoPropostaPropostaId%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="comissionadoPropostaList[%{#stat.index}].comissao" id="comissionadoPropostaComissao%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="comissionadoPropostaList[%{#stat.index}].tipoComissao" id="comissionadoPropostaTipoComissao%{#stat.index}" cssStyle="display: none;"/>
					    <s:property value="pessoa.nome"/>&nbsp;
					  </td>
					  <td><s:property value="getTipoComissaoDescricao(tipoComissao)" />&nbsp;</td>
					  <td align="right"><fmt:formatNumber value="${comissao}" type="currency" currencySymbol=""/>&nbsp;</td>
					  <td align="right"><fmt:formatNumber value="${valorComissao}" type="currency" currencySymbol=""/>&nbsp;</td>
					</tr>
					</s:iterator>
					<tr style="height: 20px;">
					  <td><b>Total:</b></td>
					  <td colspan="4" align="right"><b><fmt:formatNumber value="${totalValorComissao}" type="currency" currencySymbol=""/></b></td>
					</tr>
				  </table>
				</div> 
			  </td>
			</tr>
			<tr><td>
			<table width="100%" cellspacing="0" cellpadding="0" class="Main_Client_TableEdition">
			    <tr>
				  <td>
					<table class="FieldGroup" border="0" cellpadding="0" cellspacing="0">
					  <tbody>
						<tr class="FieldGroup_TopMargin"></tr>
						<tr>
						  <td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></img></td>
						  <td class="FieldGroupTitle">Repasse de Comisses</td>
						  <td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></img></td>
						  <td class="FieldGroupContent"></td>
						</tr>
						<tr class="FieldGroup_BottomMargin"></tr>
					  </tbody>
					</table>
				  </td>
				</tr>
				<tr>
				  <td>
					<div class="divMessages" id="divMessagesComissionados"></div>
				  </td>
				</tr>
				<tr>
				  <td>
					<div id="divListaDeRepasse">
					  <s:set var="totalPercentualComissao" value="0" />
					  <table id="tableComissionadoItens" class="listItens">
						<tr style="height: 20px;" class="listItensHeader">
						  <td width="30%">Nome</td>
						  <td width="12%">Tp Comisso</td>
						  <td width="12%">Dt Lanamento</td>
						  <td width="12%">Dt Extrato</td>
						  <td width="12%">Dt Pagamento</td>
						  <td width="10%">% Comisso</td>
						  <td width="12%">Vlr Comisso</td>
						</tr>
						<s:iterator value="repassePropostaList" status="stat">
						<tr style="height: 20px;">
						  <s:if test="comissionado.id != null">
							  <td>
							  	<c:set var="totalRepasseComissao" value="${valorPago+totalRepasseComissao}" />
							    <s:property value="comissionado.pessoa.nome"/>&nbsp;
							  </td>
							  <td><s:property value="getTipoComissaoDescricao(comissionado.tipoComissao)" />&nbsp;</td>
							  <td align="right"><s:property value="borderoLancamento.dataLancamento"/>&nbsp;</td>
							  <td align="right"><s:property value="dataLancamento"/>&nbsp;</td>
							  <td align="right"><s:property value="dataPagamento"/>&nbsp;</td>
							  <td align="right"><fmt:formatNumber value="${comissionado.comissao}" type="currency" currencySymbol=""/>&nbsp;</td>
							  <td align="right"><fmt:formatNumber value="${valorPago}" type="currency" currencySymbol=""/>&nbsp;</td>
						  </s:if>
						  <s:elseif test="agenciado.id != null">
							  <td>
							  	<c:set var="totalRepasseComissao" value="${valorPago+totalRepasseComissao}" />
							    <s:property value="agenciado.pessoa.nome"/>&nbsp;
							  </td>
							  <td><s:property value="getTipoComissaoDescricao(agenciado.tipoComissao)" />&nbsp;</td>
							  <td align="right"><s:property value="borderoLancamento.dataLancamento"/>&nbsp;</td>
							  <td align="right"><s:property value="dataLancamento"/>&nbsp;</td>
							  <td align="right"><s:property value="dataPagamento"/>&nbsp;</td>
							  <td align="right"><fmt:formatNumber value="${agenciado.comissao}" type="currency" currencySymbol=""/>&nbsp;</td>
							  <td align="right"><fmt:formatNumber value="${valorPago}" type="currency" currencySymbol=""/>&nbsp;</td>
						  </s:elseif>
						</tr>
						</s:iterator>
						<tr style="height: 20px;">
						  <td><b>Total:</b></td>
						  <td colspan="6" align="right"><b><fmt:formatNumber value="${totalRepasseComissao}" type="currency" currencySymbol=""/></b>&nbsp;</td>
						</tr>
					  </table>
					</div>
				  </td>
				</tr>
			  </table>			
			</td>
			</tr>
		  </table>
		  </div>
	  </fieldset>
	</div>
  </div>
  <div class="tabPane" id="tabPane5" style="overflow:auto; height:auto; visibility: hidden;overflow: auto;">
     <jsp:include page="../proposta/historicoEndosso.jsp" flush="false"></jsp:include>
  </div>
  
	</div>
    <div id="saveProgress" class="pageloader" style="display: none; z-index: 10;">Salvando...<br/></div>
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
  <div id="pageloader" style="display:none;">Carregando...<br/></div>
</form>

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
			  <label class="LabelText" for="paramCobDescricaoCobertura">Cobertura:</label>
			</td>
			<td width="50%" >
			  <s:textfield theme="simple" cssStyle="width: 100%" cssClass="clTextoRestritoModal" id="paramCobDescricaoCobertura" name="riscoCobertura.descricao" />
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
	</form>
  </div>
  
  <!-- ========================= end of tabbed-frame div ======================== -->
<form id="formComissionados">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<s:textfield theme="simple" id="comPropPropostaId" name="proposta.id" cssStyle="display:none"/>
	<s:textfield theme="simple" id="comPropId" name="comissionadoProposta.id" cssStyle="display:none"/>
	<s:textfield theme="simple" id="comPropPessoaId" name="comissionadoProposta.pessoa.id" cssStyle="display:none"/>
	<s:textfield theme="simple" id="comPropComissao" name="comissionadoProposta.comissao" cssStyle="display:none"/>
	<s:textfield theme="simple" id="comPropTipoComissao" name="comissionadoProposta.tipoComissao" cssStyle="display:none"/>
</form>

<form id="formHistorico" name="formHistorico">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<input type="hidden" id="hiPropostaId" name="proposta.id" />
</form>

<form id="formRiscoCobertura">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<s:textfield theme="simple" id="rcRiscoDiversoId" name="riscoCobertura.riscoDiversos.id" cssStyle="display:none"/>
	<s:textfield theme="simple" id="rcRiscoCoberturaId" name="riscoCobertura.id" cssStyle="display:none"/>
	<s:textfield theme="simple" id="rcRiscoCoberturaNome" name="riscoCobertura.cobertura" cssStyle="display:none"/>
	<s:textfield theme="simple" id="rcRiscoCoberturaPremio" name="riscoCobertura.premio" cssStyle="display:none"/>
	<s:textfield theme="simple" id="rcRiscoCoberturaLMI" name="riscoCobertura.lmi" cssStyle="display:none"/>
	<s:textfield theme="simple" id="rcRiscoCoberturaFranquia" name="riscoCobertura.franquia" cssStyle="display:none"/>
	<s:textfield theme="simple" id="rcRiscoCoberturaTextoFranquia" name="riscoCobertura.textoFranquia" cssStyle="display:none"/>
</form>

<form id="formAnexo" name="formAnexo" enctype="multipart/form-data">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<input type="hidden" id="faPropostaAnexoPropostaId" name="propostaAnexo.proposta.id" />
	<input type="hidden" id="faPropostaId" name="proposta.id" />
</form>

<form id="formLookup" name="formLookup">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<input type="hidden" id="currentTabId" name="currentTab" value="0"/>
	<input type="hidden" id="idRelatorio" name="idRelatorio" value="RDIVERSOS"/>
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

  <s:if test="proposta.statusOperacional != 0 && proposta.statusOperacional != 5 && proposta.statusOperacional != 8">
	<script>
	
	$(document).ready(function(){
		editavel = false;

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

	MaskInput($('#inicioVigencia')[0], "99/99/9999");
	MaskInput($('#terminoVigencia')[0], "99/99/9999");
	MaskInput($('#propostaDataVistoria')[0], "99/99/9999");
	MaskInput($('#nroCheque1Parcela')[0], "9999999999");
	MaskInput($('#nroBanco1Parcela')[0], "9999");
	$("#nroBanco").autocomplete('<s:url value="/objlookup/getBancoByCodigoOrNome.action" includeParams="none" />', {idFieldsToUpdate:["#nroBanco"]});
	MaskInput($('#contaCorrente')[0], "999999999999999");

	if(isEmpty('#propostaId')){
		MaskInput($('#dataFundacao')[0], "99/99/9999");
		MaskInput($('#dataNascimento')[0], "99/99/9999");
		MaskInput($('#dataEmissao')[0], "99/99/9999");

		$("#clientePFNome").autocomplete('<s:url value="/objlookup/getClientePFListByNome.action" includeParams="none" />', {idFieldsToUpdate:["#clienteId"],onItemSelect:carregaCliente, mustMatch:0, autoFill:false,width:400,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
		$("#clienteCpf").autocomplete('<s:url value="/objlookup/getClienteListByCpf.action" includeParams="none" />', {idFieldsToUpdate:["#clienteId"],onItemSelect:carregaCliente, mustMatch:0, autoFill:false,width:400,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
		$("#clientePJNome").autocomplete('<s:url value="/objlookup/getClientePJListByNome.action" includeParams="none" />', {idFieldsToUpdate:["#clienteId"],onItemSelect:carregaCliente, mustMatch:0, autoFill:false,width:400,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
		$("#clienteCnpj").autocomplete('<s:url value="/objlookup/getClienteListByCnpj.action" includeParams="none" />', {idFieldsToUpdate:["#clienteId"],onItemSelect:carregaCliente, mustMatch:0, autoFill:false,width:400,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
	}else{
		//$("#clausulaSeguro").keydown(function(event){return nextTab(event);});
		//$(getLastEnabledElement($('#tableComissionadoItens'))).keydown(function(event){return nextTab(event);});
	}

	$("#condutorNome").keydown(function(event){return handleFocusNomeCondutor(event, this.value, '#tablePerfil');});
	showHideDadosFormaPagamento();

	//$("#faxCom").keydown(function(event){return nextTab(event);});
	//$("#faxComPJ").keydown(function(event){return nextTab(event);});
	
	$("#comissionadoPropostaPessoaNome").autocomplete('<s:url value="/objlookup/getProdutorList.action" includeParams="none" />', {idFieldsToUpdate:["#comissionadoPropostaPessoaId"]});
	$("#cepRes").autocomplete('<s:url value="/objlookup/getCepList.action" includeParams="none" />', {idFieldsToUpdate:["#bairroRes", "#cidadeRes","#ufRes","#lograRes"],mustMatch:0,minChars:6,width:300,autoFill:false,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
	$("#cepCom").autocomplete('<s:url value="/objlookup/getCepList.action" includeParams="none" />', {idFieldsToUpdate:["#bairroCom", "#cidadeCom","#ufCom","#lograCom"],mustMatch:0,minChars:6,width:300,autoFill:false,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
	$("#cepRis").autocomplete('<s:url value="/objlookup/getCepList.action" includeParams="none" />', {idFieldsToUpdate:["#bairroRis", "#cidadeRis","#ufRis","#lograRis"],onEnterPress:"setRiscoAlterado(true)",mustMatch:0,minChars:6,width:300,autoFill:false,formatItemOnSelect:splitResultGetFirst});
	
	$('#gallery a.galleryLink').lightBox({fixedNavigation:true});
	$('#mycarousel').jcarousel();

	setTimeout(function(){carregarPropostaAnexos();},500);

	handleReadonly();
});

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

// define a mascara padrão para telefone
$().ready(function() {
	// Mascara de telefone.
    $(".clCep").setMask({mask : '99999-999', autoTab: false});
    $(".clData").setMask({mask : '39/19/9999', autoTab: false});
    $(".clFone").setMask({mask : '(99) 9999-9999', autoTab: false});
    $(".clFone").DefaultValue("(__) ____-____");
    // Converte para upper e elimina brancos no inicio e brancos duplos.
    $(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
    $(".clValor1").setMask({mask : '9,999.999.999.999', type : 'reverse',defaultValue:"00"});
    $(".clValor").setMask({mask : '99',  type : 'reverse',defaultValue:"0"});
 	
 })

function openWinReport(){
	$('#gpPropostaId').val($('#propostaId').val());
	if($('#propostaId').val() != ""){
		openWin('', 'report', '800', '600', 'resizable=yes');
		submitForm($('#formLookup').get(0), getContextApp()+'/jasperreport/runjasper.action', false, "report");
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

	$(window).unload(function(e){
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

	$('#btnf14').click(function (e) {
		e.preventDefault();
		$('#paramProposta').modal({onOpen: modalNovaProposta, close: false});
	});

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
	stlAllForms.setWidth(xbToInt(stlTabFiller.getWidth()-6)); 
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
buttonMenuVisibility('buttonMenu', 'hide');

if(!isEmpty('#propostaId')){
	setTimeout(function(){
		raisePanel('<s:property value="currentTab"/>');
	},300);
}

</script>
