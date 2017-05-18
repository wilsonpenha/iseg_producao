<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xml:lang="en" xmlns="http://www.w3.org/1999/xhtml" lang="en">

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
<script language="javascript" charset="UTF-8" src="<s:url value="/common/geral.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/confirm.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/js/borderoComissao/script.js?v=2" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/js/wizard/hotkeys.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/js/borderoComissao/tab-panel.js?v=1" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/wizardFinal/tabpane.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery-1.5.1.min.js?v=0" includeParams="none"/>"></script>

<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery-1.3.2-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery-form.js" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.readonly.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/common.js" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/lightbox/jquery.lightbox-0.5.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.carousel.min.js?v=1" includeParams="none"/>"></script>

<script language="javascript" charset="UTF-8" src="<s:url value="/common/ui.core-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/ui.accordion-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.bestupper-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.meiomask-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery-form-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.form-new-pack.js?v=0" includeParams="none"/>"></script>
<script charset="UTF-8" src="<s:url value="/common/jquery.simplemodal-1.1.1-pack.js?v=0" includeParams="none"/>" type='text/javascript'></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.autocomplete-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/common-pack.js?v=3" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/is-date-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/event-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/masked-input-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/xbLibrary-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/xbDebug-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/xbDOM-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/xbStyle-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/xbStyle-css-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/ui.dialog.js?v=0" includeParams="none"/>"></script>

<script type="text/javascript">defineContext('<s:url value="/" includeParams="none"/>');</script>

<script language="javascript">

var selected = false;
var alterado = false;
var cancelada = false;
var editavel = true;

// Define as PF's no Wizard
// F2
// Define as PF's no Wizard
// F2
keyActions [0] = {character:  113,
				  actionType: "code",
				  param:      "executarBotao('btnf3');"};
// F4                 
keyActions [1] = {character:  115,	
                  actionType: "code",
                  param:      "executarBotao('btnf4');"};
// F5                 
keyActions [2] = {character:  116,	
                  actionType: "code",
                  param:      "executarBotao('btnf5');"};
// F7                  
keyActions [3] = {character:  118,	
                  actionType: "code",
                  param:      "executarBotao('btnf7');"};
// F8                  
keyActions [4] = {character:  119,	
                  actionType: "code",
                  param:      "executarBotao('btnf8');"};
// F9                  
keyActions [5] = {character:  120,	
                  actionType: "code",
                  param:      "executarBotao('btnf9');"};

// F10                  
keyActions [6] = {character:  121,	
                  actionType: "code",
                  param:      "executarBotao('btnf10');"};

// F11                  
keyActions [7] = {character:  122,	
                  actionType: "code",
                  param:      "executarBotao('btnf11');"};

// F10                  
keyActions [8] = {character:  121,	
                  actionType: "code",
                  param:      "executarBotao('btnf10');"};

</script>

<style>
fieldset {
	padding: 5px;
	margin-bottom: 8px;
}

div {background-color: #E8E8E8;}

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
#modalContainer {max-height:560px; overflow:hidden; width:760px; height: 440px; left: 0; background-color: #E8E8E8; border: outset 4px; padding: 3px;}
</style>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="init();focusFirst();">
<form id="formEdit" namespace="/borderoComissao" name="formEdit" method="post">
  <s:token/>
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
					<a class="Main_LeftTabsBar_ButtonLeft" href="#" onclick="mostrarMenu('buttonMenu');resizeArea(true);return false;">
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
					<a class="Main_LeftTabsBar_ButtonRight" href="#" onclick="submitForm(document.formEdit, '<s:url value='/borderoComissao/displayList.action' includeParams="none"/>', false);">
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

<div id="allForms" style="overflow:hidden; width:100%;" class="tabPane" >
  <div class="tabPane" id="tabPane0" style="height:auto; width:100%; visibility: hidden;">
	<div id="divForm1" style="overflow:auto; height:99%; width:100%">
	  <table width="100%" border="0" cellpadding="0" cellspacing="0">
	  <tr>
		<td>
		  <s:textfield theme="simple" name="borderoComissao.id" id="comissaoId" cssStyle="display: none;"/>
		  <s:textfield theme="simple" name="borderoComissao.situacao" id="situacao" cssStyle="display: none;"/>
		  <s:textfield theme="simple" name="borderoComissao.dataLancamento" id="bcDataLancamento" cssStyle="display: none;"/>
		  <fieldset>
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<s:if test="borderoComissao.id != null">
				  <tr>
				    <td width="35%">
				      <label class="LabelText" for="seguradoraId">Seguradora</label><br />
					  <s:textfield theme="simple" name="borderoComissao.seguradora.id" id="seguradoraId" cssStyle="display: none;"/>
				      <s:select theme="simple" cssClass="dojoValidateValid requiredField" disabled="true" cssStyle="width: 95%" tabindex="0" id="seguradoraId" name="borderoComissao.seguradora.id" list="seguradoraList" listKey="id" listValue="nome" headerKey="" headerValue="-- Selecione --" />
				    </td>
				</s:if>
				<s:else>
				  <tr>
				    <td>
						<label class="LabelText" for="seguradoNome">Localize a seguradora por um segurado no extrato:</label><br />
						<s:textfield theme="simple" id="seguradoNome" cssClass="TextBox_TwoCells_width" name="seguradoNome" />
				    </td>
				  </tr>
				  <tr>
				    <td width="35%">
				      <label class="LabelText" for="seguradoraId">Seguradora</label><br />
					  <s:textfield theme="simple" name="seguradora.id" id="seguradoraId" cssStyle="display: none;"/>
				      <s:select theme="simple" cssClass="dojoValidateValid requiredField" cssStyle="width: 95%" tabindex="0" id="sSeguradoraId" name="borderoComissao.seguradora.id" list="seguradoraList" listKey="id" listValue="nome" headerKey="" headerValue="-- Selecione --" />
				    </td>
				</s:else>
				<td width="15%">
				   <label class="LabelText" for="dataExtrato">Data do Extrato</label><br />
				   <s:textfield theme="simple" cssClass="clData requiredField" id="dataExtrato" name="borderoComissao.dataDocumento" onblur="isValidDate(this)" size="10" onchange="setAlterado(true);"/>
				</td>
				<td width="25%">
				  <label class="LabelText" for="nroExtrato">Nro do Extrato</label><br /> 
				  <s:textfield theme="simple" cssClass="requiredField" id="nroExtrato" name="borderoComissao.nroExtrato" />
				</td>
				<td width="25%">
				  <label class="LabelText" for="valorTotal">Total liquido</label><br />
				  <s:textfield theme="simple" cssClass="clValor2 TextBox_OneCells_width requiredField currency" id="valorTotal" name="borderoComissao.valorTotal" onchange="setAlterado(true);" />
				</td>
				<td style="text-align: left; vertical-align: bottom;">
				  <label for="valorPagamento">Total Parcial:</label><br/>
				  <s:textfield theme="simple" readonly="true" cssClass="clValor2 currency" size="15" name="totalParcial" id="totalParcial" />
				</td>
			  </tr> 
			</table>
		  </fieldset>
	    </td>
	  </tr>
 	  <s:if test="borderoComissao.id != null">
      <tr>
	  <td>
	  <fieldset>
		  <legend><b>Lançamento</b></legend>
		  <div id="divComissaoPagar">
		  <table width="100%" cellspacing="0" cellpadding="0" class="Main_Client_TableEdition">
			<tr>
			  <td>
				<div id="divDadosBaixa">
				<div id="divDadosBaixaDeComissao">
				<table id="tableLancamento" width="100%" cellspacing="0" cellpadding="0" align="center" class="Main_Client_TableEdition">
				  <tr><td>
				   <s:textfield theme="simple" name="borderoLancamento.proposta.isFatura" id="isFatura" cssStyle="display: none;"/>
				   <s:textfield theme="simple" name="borderoLancamento.id" id="lancamentoId" cssStyle="display: none;"/>
				   <s:textfield theme="simple" name="borderoLancamento.borderoComissao.id" id="borderoComissaoId" cssStyle="display: none;"/>
				   <s:textfield theme="simple" name="borderoLancamento.proposta.id" id="propostaId" cssStyle="display: none;"/>
				   <s:textfield theme="simple" name="borderoLancamento.situacao" id="situacao" cssStyle="display: none;"/>
				   <s:textfield theme="simple" name="borderoLancamento.sequencia" id="sequencia" value="%{countLancamentos}" cssStyle="display: none;"/>
				   <s:textfield theme="simple" name="borderoLancamento.dataLancamento" id="blDataLancamento" cssStyle="display: none;"/>
				  <div id="lancamento1">
				  <table width="100%" cellpadding="0" cellspacing="0">
				  <tr>
				    <td colspan="6">
				    <fieldset>
		  			<legend><b>Apólice</b></legend>
				    <table width="100%" cellpadding="0" cellspacing="0" border="0" >
					<tr>
						<td class="TextBox_ContentCell">
						  <table width="100%" border="0" cellpadding="0" cellspacing="0">
						  <tr>
						    <td width="30%" class="TitleCell" style="text-align: left"><label class="LabelText" for="ramoId">Ramo</label></td>
						    <td width="70%">
							    <s:textfield theme="simple" name="ramo.subRamo.id" id="ramoId" cssStyle="display: none;"/>
						    	<s:select theme="simple" cssClass="Combo Combo_TwoCells_width" cssStyle="width: 180px" tabindex="0" id="sRamoId" name="borderoLancamento.ramo.subRamo.id" list="ramoList" listKey="id" listValue="nome" headerKey="" headerValue="-- Selecione --" onchange="limparCampos();carregaSubRamosLote();"/>
						    </td>
						  </tr>
						  <tr>
						  <td colspan="2">
						  <table width="100%" border="0" cellpadding="0" cellspacing="0">
						  <tr>
						    <td width="30%" class="TitleCell" style="text-align: left"><label class="LabelText" for="subRamoId">Sub-Ramo</label>
							    <s:textfield theme="simple" name="ramo.id" id="subRamoId" cssStyle="display: none;"/>
						    </td>
						    <td width="70%"><div id="divRamos"><s:select theme="simple" cssClass="Combo Combo_TwoCells_width" cssStyle="width: 180px" tabindex="0" id="sSubRamoId" name="borderoLancamento.ramo.id" list="subRamoList" listKey="id" listValue="nome" headerKey="" headerValue="-- Selecione --"/></div></td>
						  </tr>
						  </table>
						  </td>
						  </tr>
						  </table>
						</td>
					    <td class="TextBox_ContentCell"> 
					      <label class="LabelText" for="nomeSegurado">Nome do Segurado</label><br />
						  <s:textfield theme="simple" cssClass="dojoValidateValid" id="nomeSegurado" name="borderoLancamento.nomeSegurado" size="30" />
					    </td> 
					    <td class="TextBox_ContentCell">
					      <label class="LabelText" for="nroApolice">Nro da Apólice</label><br />
						  <s:textfield theme="simple" id="nroApolice" name="borderoLancamento.nroApolice" />
					    </td>
						<td style="text-align: left; vertical-align: bottom;">
						  <label for="valorPagamento">Prêmio Líquido:</label><br/>
						  <s:textfield theme="simple" cssClass="clValor2 currency" size="15" name="borderoLancamento.premioLiquido" id="premioLiquido" />
						</td>
						<td class="TextBox_ContentCell">
						  <label for="valorPagamento">Saldo Comissões:</label><br/>
						  <s:textfield theme="simple" cssClass="clValor2 currency" size="15" name="saldoComissao" id="saldoComissao" />
						</td>
					    </tr>
				    </table>
				    </fieldset>
				    </td>
				  </tr>
				  <tr>
					<td colspan="6">
					<fieldset>
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
					  <tr>
						<td style="text-align: left; vertical-align: bottom; padding-bottom: 2px;" width="25%">
						   <label class="LabelText" for="tipoLancamento">Tipo Lanc.</label><br/>
						   <s:select theme="simple" cssClass="Combo Combo_OneCells_width" id="tipoLancamento" name="borderoLancamento.tipoLancamento.id" list="tipoLancamentoByCorretoraList" listKey="id" listValue="nome" value="0" headerKey="" headerValue="-- Selecione --"/>
						</td>
						<td colspan="2" style="text-align: left; vertical-align: bottom;  bottom; padding-bottom: 2px;">
						  <div id="divNroParcela">
						  <label for="nroDaParcela">Parcela:</label><br/>
						  <s:textfield theme="simple" cssClass="dojoValidateValid currency" name="borderoLancamento.nroParcela" id="nroParcela" size="10"/>
						  </div>
						  <div id="divParcelaReferencia" style="display: none;">
						  <label for="parcelaReferencia">Parcela Ref.:</label><br/>
						  <s:textfield theme="simple" cssClass="dojoValidateValid clParcelaReferencia" name="referencia" id="referenciaParcela" size="7"/> mm/aaaa
						  </div>
						</td>
						<td style="text-align: left; vertical-align: bottom;  bottom; padding-bottom: 2px;">
						  <label for="valorPagamento">% Comissão:</label><br/>
						  <s:textfield theme="simple" cssClass="clValor2 currency" size="10" name="borderoLancamento.percentualComissao" id="percentualComissao" />
						</td>
						<td style="text-align: left; vertical-align: bottom;  bottom; ">
						  <label for="valorPagamento">Valor/Comissão:</label><br/>
						  <s:textfield theme="simple" cssClass="clValor2 clCalculator currency" size="13" name="borderoLancamento.valorComissao" id="valorComissao" />
						</td>
						<s:if test="borderoComissao.situacao == 0  && borderoComissao.id != null">
						<td style="text-align: left; vertical-align: bottom;" width="10%">&nbsp;<br />
						  <a href="#" class="button" onclick="inserirLancamento();">
							<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton">
							  <tr>
								<td class="wButton_left"></td>
								<td class="wButton_text wButton_width">Adicionar</td>
								<td class="wButton_right"/>
							  </tr>
							</table>
						  </a>
						</td>
						<td style="text-align: left; vertical-align: bottom;" width="15%">&nbsp;<br />
						  <a href="#" class="button" onclick="inserirLancamentoLimpar();">
							<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton">
							  <tr>
								<td class="wButton_left"></td>
								<td class="wButton_text wButton_width">Adicionar/Limpar</td>
								<td class="wButton_right"/>
							  </tr>
							</table>
						  </a>
						</td>
						<td style="text-align: left; vertical-align: bottom;" width="10%">&nbsp;<br />
						  <a href="#" class="button" onclick="limpar();">
							<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton">
							  <tr>
								<td class="wButton_left"></td>
								<td class="wButton_text wButton_width">Limpar</td>
								<td class="wButton_right"/>
							  </tr>
							</table>
						  </a>
						</td>
						</s:if>
						<s:else>
						<td style="text-align: left; vertical-align: bottom;" width="35%">&nbsp;<br /></td>
						</s:else>
					  </tr>
					</table>
					</fieldset>
						</td>
					  </tr>
					  </table>
					  </div>
					</td>
				  </tr>
				  <tr>
				     <td>
				      <br/>
				  </td>
				  </tr>
				</table>
				</div>
				<div id="divListaComissoes">
				  <table>
				    <tr>
					  <td colspan="4">
					    <div class="divMessages" id="divMessagesTab1" style="padding-bottom: 2px;">
					  	  <s:actionerror/>
						  <s:actionmessage/>
						  <s:fielderror/>
					    </div>
					  </td>
				    </tr>
				  </table>
				  <s:set var="totalPercentualComissao" value="0" />
				  <table id="tableComissionadoItens" class="listItens">
					<tr style="height: 20px;" class="listItensHeader">
					  <td width="5%">Ações</td>
					  <td width="10%">Tipo</td>
					  <td width="15%">Ramo</td>
					  <td width="5%">Apólice</td>
					  <td width="25%">Segurado</td>
					  <td width="5%">Parc</td>
					  <td width="8%">Prêmio</td>
					  <td width="8%">% Comissão</td>
					  <td width="8%">Comissão</td>
					  <td width="8%">Situação</td>
					</tr>
					<s:iterator value="borderoLancamentoList" status="stat">
					<tr style="height: 20px;">
					  <td nowrap="nowrap" class="small_image">
					  	<c:set var="totalValorComissao" value="${valorComissao+totalValorComissao}" />
						<s:textfield theme="simple" name="borderoComissao.borderoLancamentoCollection[%{#stat.index}].id" id="borderoLancamentoId%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="borderoComissao.borderoLancamentoCollection[%{#stat.index}].proposta.id" id="propostaId%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="borderoComissao.borderoLancamentoCollection[%{#stat.index}].borderoComissao.id" id="borderoComissaoId%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="borderoComissao.borderoLancamentoCollection[%{#stat.index}].ramo.id" id="ramoId%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="borderoComissao.borderoLancamentoCollection[%{#stat.index}].nroApolice" id="nroApolice%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="borderoComissao.borderoLancamentoCollection[%{#stat.index}].nomeSegurado" id="nomeSegurado%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="borderoComissao.borderoLancamentoCollection[%{#stat.index}].nroParcela" id="nroParcela%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="borderoComissao.borderoLancamentoCollection[%{#stat.index}].referenciaParcela" id="referenciaParcela%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="borderoComissao.borderoLancamentoCollection[%{#stat.index}].premioLiquido" id="premioLiquido%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="borderoComissao.borderoLancamentoCollection[%{#stat.index}].percentualComissao" id="percentualComissao%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="borderoComissao.borderoLancamentoCollection[%{#stat.index}].valorComissao" id="valorComissao%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="borderoComissao.borderoLancamentoCollection[%{#stat.index}].sequencia" id="sequencia%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="borderoComissao.borderoLancamentoCollection[%{#stat.index}].situacao" id="situacao%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="borderoComissao.borderoLancamentoCollection[%{#stat.index}].tipoLancamento.id" id="tipoLancamento%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="borderoComissao.borderoLancamentoCollection[%{#stat.index}].dataLancamento" id="dataLancamento%{#stat.index}" cssStyle="display: none;"/>
						<s:if test="situacao < 2">
							<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/delete.gif" includeParams="none"/>" onclick="if(confirma('Confirma exclusão?')){removeLancamento('<s:property value="id"/>');}"/>
							<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/edit.gif" includeParams="none"/>" onclick="if(confirma('Confirma edição?')){editarLancamento('<s:property value="id"/>');}"/>
						</s:if>
						<s:if test="%{proposta == null}">
							<img alt="Referenciar a uma proposta" title="Referenciar a uma proposta" style="cursor:pointer;width: 26px;" src="<s:url value="/common/web/images/link.png" includeParams="none"/>" onclick="abrirModal('<s:property value="id"/>');"/>
						</s:if>
						<s:else>
							<img alt="Referenciar a uma proposta" title="Referenciar a uma proposta" style="width: 26px;" src="<s:url value="/common/web/images/link-disable.png" includeParams="none"/>"/>
						</s:else>
					  </td>
					  <td><s:property value="tipoLancamento.nome"/>&nbsp;</td>
					  <td ><s:property value="ramo.nomeRamoSubRamo"/>&nbsp;</td>
					  <td ><s:property value="nroApolice"/>&nbsp;</td>
					  <td ><s:property value="nomeSegurado"/>&nbsp;</td>
					  <s:if test="ramo.id==5 || ramo.subRamo.id=10">
						  <td align="center"><fmt:formatDate value="${referenciaParcela}" pattern="MM/yyyy"/></td>
					  </s:if>
					  <s:else>
						  <td align="right"><s:property value="nroParcela"/>&nbsp;</td>
					  </s:else>
					  <td align="right"><fmt:formatNumber value="${premioLiquido}" type="currency" currencySymbol=""/>&nbsp;</td>
					  <td align="right"><fmt:formatNumber value="${percentualComissao}" type="currency" currencySymbol=""/>&nbsp;</td>
					  <td align="right"><fmt:formatNumber value="${valorComissao}" type="currency" currencySymbol=""/>&nbsp;</td>
					  <td ><s:property value="situacaoDesc"/>&nbsp;</td>
					</tr>
					</s:iterator>
				  </table>
				</div>
				</div>
			  </td>
			</tr>
		  </table>
		  </div>
	  </fieldset>
		  </td>
		</tr>
		</s:if>
	</table>
	</div>
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
<tr>
  <td height="*" valign="top"><div id="navegador" style="width:98%; height:30px; margin: 5px 0px 4px 4px; z-index:1;" >
    <table border="0" cellpadding="0" cellspacing="0">
	  <tr>
		<td>
		  <input type="button" id="btnf3" style="display: none;" onclick="criarLote();"/>
		  <table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton"
			   onclick="document.getElementById('btnf3').click()">
			<tr>
			  <td class="wButton_left"></td>
			  <td class="wButton_text wButton_width">F2-Novo lote</td>
			  <td class="wButton_right"/>
			</tr>
		  </table>
		  </a>
		</td>
		<s:if test="borderoComissao.situacao == 0 || borderoComissao.situacao == null">
		<td>
		  <input type="button" id="btnf4" style="display: none;" onclick="if (confirma('Confirma alterações?')){salvarBordero();alterado=false;}"/>
		  <a href="#" class="button" onclick="$('#btnf4').click();">
		  <table onmouseout="this.className='wButton'; return true;" onmouseover="this.className='wButton_hover'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" onclick="">
			<tr>
			  <td class="wButton_left"></td>
			  <td class="wButton_text wButton_width">F4-Salvar</td>
			  <td class="wButton_right"/>
			</tr>
		  </table>
		  </a>
		</td>
		<td>
		  <input type="button" id="btnf5" style="display: none;" onclick="if (confirma('Confirma a efetivação das baixas?')){efetivarBaixa()}"/>
		  <a href="#" class="button" onclick="$('#btnf5').click();" title="Efetiva baixas dos lançamentos sem fechar o lote.">
		  <table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Efetiva baixas dos lançamentos sem fechar o lote.'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" onclick="">
			<tr>
			  <td class="wButton_left"></td>
			  <td class="wButton_text wButton_width">F5-Efetivar baixa</td>
			  <td class="wButton_right"/>
			</tr>
		  </table>
		  </a>
		</td>
		<td>
		  <input type="button" id="btnf6" style="display: none;" onclick="if (confirma('Confirma o fechamento do lote?')){fecharLote()}"/>
		  <a href="#" class="button" onclick="$('#btnf6').click();" title="Efetiva baixas dos lançamentos e fecha o lote.">
		  <table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" onclick="">
			<tr>
			  <td class="wButton_left"></td>
			  <td class="wButton_text wButton_width">F6-Fechar lote</td>
			  <td class="wButton_right"/>
			</tr>
		  </table>
		  </a>
		</td>
		<td>
		  <input type="button" id="btnf7" style="display: none;" onclick="if (confirma('Confirma a exclusão?')){excluir();}"/>
		  <a href="#" class="button" onclick="$('#btnf7').click();">
		  <table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" onclick="">
			<tr>
			  <td class="wButton_left"></td>
			  <td class="wButton_text wButton_width">F7-Excluir Lote</td>
			  <td class="wButton_right"/>
			</tr>
		  </table>
		  </a>
		</td>
		</s:if>
		<s:if test="borderoComissao.situacao == 1">
			<td>
			  <input type="button" id="btnf5" style="display: none;" onclick="if (confirma('Confirma a Geração de Lote de Estorno?')){gerarLoteEstorno()}"/>
			  <a href="#" class="button" onclick="$('#btnf5').click();">
			  <table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" onclick="">
				<tr>
				  <td class="wButton_left"></td>
				  <td class="wButton_text wButton_width">F5-Gerar Lote Estorno</td>
				  <td class="wButton_right"/>
				</tr>
			  </table>
			  </a>
			</td>
		</s:if>
		<s:if test="borderoComissao.situacao == 2">
			<td>
			  <input type="button" id="btnf5" style="display: none;" onclick="if (confirma('Confirma a Copia do Lote Estornado?')){copiarLote()}"/>
			  <a href="#" class="button" onclick="$('#btnf5').click();">
			  <table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" onclick="">
				<tr>
				  <td class="wButton_left"></td>
				  <td class="wButton_text wButton_width">F5-Gerar Copia em aberto</td>
				  <td class="wButton_right"/>
				</tr>
			  </table>
			  </a>
			</td>
		</s:if>
		
		<td>
		  <input type="button" id="btnf8" style="display: none;" onclick="if (confirma('Confirma?')){displayList();alterado=false;}"/>
		  <a href="#" class="button" onclick="$('#btnf8').click();">
		  <table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" onclick="">
			<tr>
			  <td class="wButton_left"></td>
			  <td class="wButton_text wButton_width">F8-Fechar</td>
			  <td class="wButton_right"/>
			</tr>
		  </table>
		  </a>
		</td>
		<td>
		  <input type="reset" id="btnf3" style="display: none;" onclick="alterado=false;"/>
		  <a href="#" class="button" onclick="$('#btnf3').click();">
		  <table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" onclick="">
			<tr>
			  <td class="wButton_left"></td>
			  <td class="wButton_text wButton_width">F3-Restaurar</td>
			  <td class="wButton_right"/>
			</tr>
		  </table>
		  </a>
		</td>
		<td>
		  <input type="reset" id="btnf10" style="display: none;" onclick="openWinReport();"/>
		  <a href="#" class="button" onclick="$('#btnf10').click();">
		  <table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" onclick="">
			<tr>
			  <td class="wButton_left"></td>
			  <td class="wButton_text wButton_width">F10-Imprimir lote</td>
			  <td class="wButton_right"/>
			</tr>
		  </table>
		  </a>
		</td>
	  </tr>
	</table>
	</div>
	</td>
	</tr>
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
<jsp:include page="modallinkProposta.jsp" flush="false"></jsp:include>
<div id="saveProgressModal" class="pageloader" style="display:none;z-index:4050;">Salvando...<br/></div>
<div id="loadProgressModal" class="pageloader" style="display:none;z-index:4050;">Carregando...<br/></div>
<!-- ========================= end of tabbed-frame div ======================== -->
<form id="formLookup" name="formLookup">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<input type="hidden" id="currentTabId" name="currentTab" value="0"/>
	<input type="hidden" id="gpBorderoId" name="borderoComissao.id" />
	<input type="hidden" id="gpSeguradoraId" name="seguradora.id" />
	<input type="hidden" id="gpRamoId" name="ramo.id" />
	<input type="hidden" id="gpTipoCliente" name="tipoCliente" />
	<input type="hidden" id="gpClienteId" name="proposta.cliente.id" />
	<input type="hidden" id="gpGrupoDeVendaId" name="proposta.grupoDeVenda.id" />
	<input type="hidden" id="gpQuantParc" name="proposta.qtdeParcelas" />
	<input type="hidden" id="gpValorDemaisParcelas" name="proposta.valorDemaisParcelas" />
	<input type="hidden" id="gpFormaPagamento" name="proposta.formaPagamento" />
	<input type="hidden" id="gpNroBanco" name="proposta.nroBanco" />
	<input type="hidden" id="gpCodigoAgencia" name="proposta.codigoAgencia" />
	<input type="hidden" id="gpContaCorrente" name="proposta.contaCorrente" />
	<s:hidden id="gpVistoriadoraId" name="proposta.vistoriadora.id" />

	<input type="hidden" id="gpDataVencim1aParcela" name="proposta.dataVencim1aParcela" />
	<input type="hidden" id="gpValor1aParcela" name="proposta.valor1aParcela" />
	<input type="hidden" id="gpPremioTotal" name="proposta.premioTotal"/>
	
	<input type="hidden" id="gpBlnEndosso" name="blnEndosso"/>
	<input type="hidden" id="gpBlnRenovacao" name="blnRenovacao"/>
</form>

<jsp:include page="../jqueryCalculadora.jsp" flush="false"></jsp:include>

<script>

function openWinReport(){
	openWin('', 'report', '800', '600', 'resizable=yes');
	submitForm($('#formEdit').get(0), getContextApp()+'/jasperreportComissoes/loteLancamentoReport.action', false, "report");
}

function excluir(){
	submitForm($('#formEdit').get(0), getContextApp()+'/borderoComissao/excluir.action', false);
}

function displayList(){
	submitForm($('#formEdit').get(0), getContextApp()+'/borderoComissao/displayList.action', false);
}



$().ready(function() {

	//$("#nroApolice").autocomplete('<s:url value="/objlookup/getComissoesPorNroApoliceList.action" includeParams="none" />', {idFieldsToUpdate:["#nomeSegurado","#percentualComissao","#valorComissao","#premioLiquido","#nroParcela","#propostaId"],extraParams:{'fabricante.id':function(){return $("#marcaId").val();}},autoFill:false,width:400,max:300,scroll:true,scrollHeight:150});
	$("#nroApolice").autocomplete('<s:url value="/objlookup/getComissoesPorNroApoliceList.action" includeParams="none" />', {idFieldsToUpdate:["#ramoId","#subRamoId","#nomeSegurado","#percentualComissao","#propostaId","#valorComissao","#nroParcela","#referenciaParcela","#saldoComissao","#premioLiquido","#referenciaParcela","#isFatura"],extraParams:{'seguradora.id':function(){return $("#seguradoraId").val();},'ramo.id':function(){return $("#sSubRamoId").val();},'ramo.subRamo.id':function(){return $("#sRamoId").val();},'tipoLancamento':function(){return $("#tipoLancamento").val();}},onItemSelect:function(){$('#sRamoId').val($('#ramoId').val()); carregaSubRamosLote(); setTimeout(function() { $('#sSubRamoId').val($('#subRamoId').val()); }, 300);},mustMatch:0, autoFill:false,width:500,max:300,scroll:true,scrollHeight:150,cacheLength:1, formatItemOnSelect:splitResultGetFirst});
	$("#nomeSegurado").autocomplete('<s:url value="/objlookup/getComissoesPorNomeSeguradoList.action" includeParams="none" />', {idFieldsToUpdate:["#ramoId","#subRamoId","#nroApolice","#propostaId","#percentualComissao","#valorComissao","#nroParcela","#referenciaParcela","#saldoComissao","#premioLiquido","#referenciaParcela","#isFatura"],extraParams:{'seguradora.id':function(){return $("#seguradoraId").val();},'ramo.id':function(){return $("#sSubRamoId").val();},'ramo.subRamo.id':function(){return $("#sRamoId").val();},'tipoLancamento':function(){return $("#tipoLancamento").val();}},onItemSelect:function(){$('#sRamoId').val($('#ramoId').val()); carregaSubRamosLote(); setTimeout(function() { $('#sSubRamoId').val($('#subRamoId').val()); }, 300);},mustMatch:0, autoFill:false,width:500,max:300,scroll:true,scrollHeight:150,cacheLength:1, formatItemOnSelect:splitResultGetFirst});
	$("#seguradoNome").autocomplete('<s:url value="/objlookup/getSeguradoraBySeguradoNome.action" includeParams="none" />', {idFieldsToUpdate:["#seguradoraId"],onItemSelect:function(){setTimeout(function() { $('#sSeguradoraId').val($('#seguradoraId').val()); }, 300);},mustMatch:0,autoFill:false, width:400,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});

	// Mascara de telefone.
    $(".clData").setMask({mask : '39/19/9999', autoTab: false});
    $(".clParcelaReferencia").setMask({mask : '19/9999', autoTab: false});
    $(".clFone").setMask({mask : '(99) 9999-9999', autoTab: false});
    $(".clFone").DefaultValue("(__) ____-____");
    // Converte para upper e elimina brancos no inicio e brancos duplos.
    $(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
    $(".clValor3").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"-000"});
    $(".clValor1").setMask({mask : '9,999.999.999.999', type : 'reverse',defaultValue:"00"});
    $(".clValor").setMask({mask : '99', defaultValue:"0"});

});

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
				//salvarProposta();
				return false;
			}else{
				e.preventDefault();
				return false;
			}
		}
	});

	$('#btnf14').click(function (e) {
		e.preventDefault();
		$('#paramProposta').modal({onOpen: modalOpen, close: false});
	});

});

function criarLote(){
	submitForm($('#formEdit').get(0), getContextApp()+'/borderoComissao/novo.action', false);
}
function modalOpen (dialog) {
	/*dialog.overlay.fadeIn('slow', function () {
		dialog.container.fadeIn('slow', function () {
			dialog.data.slideDown('slow');
		});
	});*/
	
	setTimeout(function(){
	  paramNovaProposta();}
	,2000);
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
	//stlClient.setWidth(stlTdtopButtons.getWidth()+11);
	stlCorpo.setHeight(xbToInt(stlClient.getHeight() - stlNavegador.getHeight() - 9 -10)); 
	stlCentral.setHeight(xbToInt(stlClient.getHeight() - stlNavegador.getHeight() - 9 - 17)); 
	stlTabFiller.setHeight(xbToInt(stlClient.getHeight() - stlNavegador.getHeight() - 9 - 16)); 
	stlAllForms.setHeight(xbToInt(stlClient.getHeight() - stlNavegador.getHeight() - 9 - 16)); 
	//stlAllForms.setWidth(xbToInt(stlTabFiller.getWidth())); 
//	stlTabFiller.setWidth(xbToInt(stlClient.getWidth()-100)); 

	bodyOnLoad();
	
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
//buttonMenuVisibility('buttonMenu', 'show');
//mostrarMenu('buttonMenu');
</script>
