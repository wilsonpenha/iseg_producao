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
<link rel="stylesheet" type="text/css" href="<s:url value="/common/web/skins/Default/Main/Main_Edition.css" includeParams="none" />" id="paramCSS"></link>
<link rel="stylesheet" type="text/css" href="<s:url value="/common/styles/loader/loader.css" includeParams="none"/>"></link>
<link rel="stylesheet" type="text/css" href="<s:url value="/common/ui.all.css" includeParams="none"/>"></link>

<script language="javascript" charset="UTF-8" src="<s:url value="/common/geral.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/confirm.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/js/propostaComissao/script.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/js/wizard/hotkeys.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/js/propostaComissao/tab-panel.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/wizardFinal/tabpane.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery-form.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.autocomplete-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/common-pack.js?v=5" includeParams="none"/>" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/is-date.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/ui.core.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/ui.datepicker.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/event.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/masked-input.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/web/js/utils-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/xbLibrary.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/xbDebug.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/xbDOM.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/xbStyle.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/xbStyle-css.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.simplemodal-1.1.1.js?v=0" includeParams="none"/>"></script>

<script type="text/javascript">defineContext('<s:url value="/" includeParams="none"/>');</script>

<script language="javascript">

var selected = false;
var alterado = false;

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
</style>
</head>
<body onload="init();">
<form id="formEdit" namespace="/preBaixaComissao" name="formEdit" method="post">
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
					<a class="Main_LeftTabsBar_ButtonRight" href="#" onclick="listaComissoes();">
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
								<td class="TabBody">Comiss&otilde;es</td>
								<td class="TabRight"/>
							  </tr>
							</table>
						  </td>
						  <td>
							<table onclick="raisePanel(1)" id="tabMenu1" border="0" cellpadding="0" cellspacing="0" class="inactive">
							  <tr>
								<td class="TabLeft"></td>
								<td class="TabBody TabPanel_width">Comissionamento</td>
								<td class="TabRight"/>
							  </tr>
							</table>
						  </td>
						  <td>
							<table onclick="raisePanel(2)" id="tabMenu2" border="0" cellpadding="0" cellspacing="0" class="inactive">
							  <tr>
								<td class="TabLeft"></td>
								<td class="TabBody TabPanel_width">Lançamentos</td>
								<td class="TabRight"/>
							  </tr>
							</table>
						  </td>
						</tr>
					  </table>
					</div>
				  </div>

<div id="allForms" style="overflow:hidden; width:100%;" class="tabPane" >
  <div class="tabPane" id="tabPane0" style="height:auto; width:100%; visibility: hidden;">
	<div id="divForm1" style="overflow:auto; height:99%; width:100%">
	  <s:textfield theme="simple" id="propostaId" name="proposta.id" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="tipoCliente" name="tipoCliente" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="blnGerarParcelas" name="blnGerarParcelas" value="false" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="blnPossuiPerfil" name="proposta.blnPossuiPerfil" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="tipoLancamento" name="proposta.tipoLancamento" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="statusOperacional" name="proposta.statusOperacional" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="propostaEndossadaId" name="proposta.propostaEndossada.id" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="tipoProposta" name="proposta.tipoProposta" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="propostaNumero" name="proposta.numero" cssStyle="display:none"/>
	  <table>
	    <tr>
		  <td colspan="4">
		    <div class="divMessages" id="divMessagesTab1" style="padding-bottom: 10px;">
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
			<td width="25%">
			  <label for="nroApolice">Nro da Apólice</label><br />
			  <s:textfield theme="simple" id="nroApolice" name="proposta.nroApolice" size="20" maxlength="20" onchange="setAlterado(true);"/>
			</td>
			<td width="25%">
			  <label for="dataEmissaoApolice">Dt Emissão Apólice</label><br />
			  <s:textfield theme="simple" id="dataEmissaoApolice" cssClass="clData" name="proposta.dataEmissaoApolice" onblur="isValidDate(this)" size="10" maxlength="10" onchange="setAlterado(true);"/>
			</td>
			<s:if test="tipoCliente == 0">
			  <td colspan="2">
				<label for="clientePFNome">Nome do Segurado</label><br />
				<s:textfield theme="simple" cssClass="requiredField" id="clientePFNome" name="pessoaFisica.nome" size="50" maxlength="60" onchange="setAlterado(true);"/>
			  </td>
			</s:if>
			<s:if test="tipoCliente == 1">
			  <td colspan="2">
				<label for="clienteNome">Nome do Segurado</label><br />
				<s:textfield theme="simple" cssClass="requiredField" id="clientePJNome" name="pessoaJuridica.nome" size="50" maxlength="60" onchange="setAlterado(true);"/>
			  </td>
			</s:if>
		  </tr>
		  <tr>
			<td width="25%">
			  <label for="nroApolice">Seguradora</label><br />
			  <s:textfield theme="simple" id="seguradora" name="proposta.seguradora.nome" size="40" />
			</td>
			<td width="25%">
			  <label for="dataEmissaoApolice">Grupo de Venda/Produtor</label><br />
			  <s:textfield theme="simple" id="grupoDeVenda" name="proposta.cliente.grupoDeVenda.nomeDoGrupo" size="20" />
			</td>
		  </tr>
		</table>
		  </fieldset>
	    </td>
	  </tr>
      <tr>
		  <td>
			<fieldset>
			<legend accesskey="P"><b><u>P</u>rêmio e Vigência</b></legend>
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
			  <tr>
				<td width="20%" class="TextBox_ContentCell">
				  <label class="LabelText" for="premioLiquido">Prêmio Líquido</label><br />
				  <s:textfield theme="simple" cssClass="TextBox_OneCells_width requiredField currency" id="premioLiquido" name="proposta.premioLiquido" onkeypress="return Mascara('numero1', event, document.getElementById('premioLiquido'));" onblur="javascript:valida_numero(this,15,2,'premioLiquido');calculaIOF(true);calculaPremioTotal();" onchange="setAlterado(true);" />
				</td>
				<td width="20%" class="TextBox_ContentCell">
				  <label class="LabelText" for="custoApolice">Custo da Apólice</label><br />
				  <s:textfield theme="simple" cssClass="TextBox_OneCells_width currency" id="custoApolice" name="proposta.custoApolice" onkeypress="return Mascara('numero1', event, document.getElementById('custoApolice'));" onblur="javascript:valida_numero(this,15,2,'custoApolice');calculaIOF(true);calculaPremioTotal();" onchange="setAlterado(true);" />
				</td>
				<td width="20%" class="TextBox_ContentCell">
				  <label class="LabelText" for="iof">IOF</label><br />
				  <s:textfield theme="simple" id="percentualIOF" name="percentualIOF" cssStyle="display:none;"/>
				  <s:textfield theme="simple" cssClass="TextBox_OneCells_width currency" id="iof" name="proposta.iof" onkeypress="return Mascara('numero1', event, document.getElementById('iof'));" onblur="javascript:valida_numero(this,15,2,'iof');calculaIOF(false);calculaPremioTotal();" onchange="setAlterado(true);"/>
				</td>
				<td width="20%" class="TextBox_ContentCell">
				  <label class="LabelText" for="desconto">Juros/Desconto</label><br />
				  <s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" id="desconto" name="proposta.desconto" onkeypress="return Mascara('numero5', event, document.getElementById('desconto'));" onblur="javascript:valida_numero(this,15,2,'desconto');calculaPremioTotal();" onchange="setAlterado(true);"/>
				</td>
				<td width="20%" class="TextBox_ContentCell">
				  <label class="LabelText" for="premioTotal">Prêmio Total</label><br />
				  <s:textfield theme="simple" readonly="true" cssClass="TextBox_OneCells_width currency" id="premioTotal" name="proposta.premioTotal" onchange="setAlterado(true);" />
				</td>
			  </tr>
			  <tr>
				<td class="TextBox_ContentCell">
				  <label class="LabelText" for="fator">Comissão (%)</label><br />
				  <s:textfield theme="simple" cssClass="TextBox_OneCells_width currency" id="fator" name="proposta.fator" onkeypress="return Mascara('numero1', event, document.getElementById('fator'));" onblur="javascript:valida_numero(this,15,2,'fator');" onkeyup="calculaTotalComissao();" onchange="setAlterado(true);"/>
				</td>
				<td class="TextBox_ContentCell">
				  	<label class="LabelText" for="inicioVigencia">Início Vigência</label><br/>
					<s:textfield theme="simple" cssClass="TextBox_OneCells_width requiredField" id="inicioVigencia" name="proposta.inicioVigencia" onblur="isValidDate(this)" size="10" onkeyup="if ($('#propostaOriginalId').val()==''){addYearAndSetField(this.value, 1, document.getElementById('terminoVigencia'));}"/>
		  		</td>
		  		<td class="TextBox_ContentCell">
				  	<label class="LabelText" for="terminoVigencia">Término Vigência</label><br/>
					<s:textfield theme="simple" cssClass="TextBox_OneCells_width requiredField" id="terminoVigencia" name="proposta.terminoVigencia" onblur="isValidDate(this)" size="10"/>
		  		</td>
				<td class="TextBox_ContentCell">
				  <label class="LabelText" for="quantParc">Quantidade Parcelas Total</label><br/>
				  <s:textfield theme="simple" id="quantParc" name="proposta.qtdeParcelas" size="2" maxlength="2" onchange="calculaParcelas();setAlterado(true);" onkeyup="showHideDadosDemaisParcelas();"/>
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
				  <s:textfield theme="simple" id="valor1aParcela" name="proposta.valor1aParcela" size="10" maxlength="10" onkeypress="return Mascara('numero1', event, document.getElementById('valor1aParcela'));" onblur="javascript:valida_numero(this,15,2,'valor1aParcela');" onchange="calculaDemaisParcelas();setAlterado(true);"/>
				</td>
				<td>
				  <label id="labelFormaPagamento" class="LabelText" for="formaPagamento">Forma de Pagamento Demais Parcelas</label><br />
				  <s:select theme="simple" cssClass="TextBox_OneCells_width requiredField" id="formaPagamento" name="proposta.formaPagamento" headerKey="" headerValue="-- Selecione --" list="formaPagamentoList" onchange="showHideDadosFormaPagamento();setAlterado(true);" />
				</td>
			    <td>
			      <label id="labelValorDemaisParcelas" class="LabelText" for="valorDemaisParcelas">Valor Demais Parcelas</label><br />
				  <s:textfield theme="simple" id="valorDemaisParcelas" name="proposta.valorDemaisParcelas" size="10" maxlength="10" onkeypress="return Mascara('numero1', event, document.getElementById('valorDemaisParcelas'));" onblur="javascript:valida_numero(this,15,2,'valorDemaisParcelas');" onchange="setAlterado(true);"/>
				</td>
			  </tr>
			</table>
			</fieldset>
		  </td>
		</tr>
    <tr>
	  <td>
	  <fieldset>
		  <legend><b>Baixa de Comiss&otilde;es</b></legend>
		  <div id="divComissaoPagar">
		  <table width="100%" cellspacing="0" cellpadding="0" class="Main_Client_TableEdition">
			<tr>
			  <td>
				<div class="divMessages" id="divMessagesBaixaComissoes"></div>
			  </td>
			</tr>
			<tr>
			  <td>
				<div id="divDadosBaixaDeComissao">
				<table id="tableProdutor" width="100%" cellspacing="0" cellpadding="0" align="center" class="Main_Client_TableEdition">
				  <tr>
					<td width="10%">
					  <label for="nroDaParcela">Parcela:</label><br/>
					  <s:textfield theme="simple" readonly="true" cssClass="dojoValidateValid currency" name="propostaComissao.nroDaParcela" id="comissaoNroDaParcela" size="10"/>
						<s:textfield theme="simple" name="propostaComissao.id" id="comissaoId" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="propostaComissao.situacao" id="comissaoSituacao" cssStyle="display: none;"/>
					</td>
					<td width="15%">
					  <label for="dataPagamento">Data de Vencimento:</label><br/>
    				  <s:textfield theme="simple" readonly="true" id="comissaoDataVencimento" name="propostaComissao.dataVencimento" onblur="isValidDate(this)" size="15" maxlength="10" onchange="setAlterado(true);"/>
					</td>
					<td width="15%">
					  <label for="dataPagamento">Data do Pagamento:</label><br/>
    				  <s:textfield theme="simple" id="comissaoDataPagamento" name="propostaComissao.dataPagamento" onblur="isValidDate(this)" size="15" maxlength="10" onchange="setAlterado(true);"/>
					</td>
					<td width="15%">
					  <label for="valorPagamento">Valor Recebido:</label><br/>
					  <s:textfield theme="simple" cssClass="dojoValidateValid currency" size="15" name="propostaComissao.valorPagamento" id="comissaoValorPagamento" onkeypress="return Mascara('numero1', event, this);" onblur="javascript:valida_numero(this,15,2,'comissaoValorPagamento');" />
					</td>
					<td width="15%">
					  <label for="valorPagamento">Valor Original:</label><br/>
					  <s:textfield theme="simple" readonly="true" cssClass="dojoValidateValid currency" size="15" name="propostaComissao.comissaoValorComissao" id="comissaoValorComissao" onkeypress="return Mascara('numero1', event, this);" onblur="javascript:valida_numero(this,15,2,'comissionadoPropostaVlrComissao');" />
					</td>
					<td width="15%" align="right">
					  <a href="#" class="button" onclick="baixarComissao();">
						<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton">
						  <tr>
							<td class="wButton_left"></td>
							<td class="wButton_text wButton_width">Baixar</td>
							<td class="wButton_right"/>
						  </tr>
						</table>
					  </a>
					</td>
					<td width="15%" align="right">
					  <a href="#" class="button" onclick="estornarComissao();">
						<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton">
						  <tr>
							<td class="wButton_left"></td>
							<td class="wButton_text wButton_width">Estornar</td>
							<td class="wButton_right"/>
						  </tr>
						</table>
					  </a>
					</td>
				  </tr>
				  <tr><td><br/></td></tr>
				</table>
				</div>
				<div id="divListaComissoes">
				  <s:set var="totalPercentualComissao" value="0" />
				  <table id="tableComissionadoItens" class="listItens">
					<tr style="height: 20px;" class="listItensHeader">
					  <td width="5%">Ações</td>
					  <td width="10%">Vencimento</td>
					  <td width="15%">Parcela</td>
					  <td width="15%">Valor a Receber</td>
					  <td width="15%">Valor Recebido</td>
					  <td width="25%">Seguradora</td>
					  <td width="10%">Situação</td>
					</tr>
					<s:iterator value="proposta.propostaComissaoCollection" status="stat">
					<tr style="height: 20px;">
					  <td nowrap="nowrap" class="small_image">
					  	<c:set var="totalValorComissao" value="${valorComissao+totalValorComissao}" />
						<s:textfield theme="simple" name="proposta.propostaComissaoCollection[%{#stat.index}].id" id="propostaComissaoId%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="proposta.propostaComissaoCollection[%{#stat.index}].nroDaParcela" id="propostaComissaonroDaParcela%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="proposta.propostaComissaoCollection[%{#stat.index}].dataVencimento" id="propostaComissaoDataVencimento%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="proposta.propostaComissaoCollection[%{#stat.index}].valorComissao" id="propostaComissaoValorComissao%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="proposta.propostaComissaoCollection[%{#stat.index}].valorPagamento" id="propostaComissaoValorPagamento%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="proposta.propostaComissaoCollection[%{#stat.index}].situacao" id="propostaComissaoSituacao%{#stat.index}" cssStyle="display: none;"/>
    					 <s:if test="%{situacao < 2}">
							<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/edit.gif" includeParams="none"/>" 
							onclick="editarComissao($('#propostaComissaoId${stat.index}').val(), $('#propostaComissaonroDaParcela${stat.index}').val(), $('#propostaComissaoDataVencimento${stat.index}').val(), $('#propostaComissaoValorComissao${stat.index}').val(), $('#propostaComissaoSituacao${stat.index}').val(), $('#propostaComissaoValorPagamento${stat.index}').val())"/>
						</s:if>
					  </td>
					  <td align="right"><s:property value="dataVencimento"/>&nbsp;</td>
					  <td align="right"><s:property value="nroDaParcela"/>&nbsp;</td>
					  <td align="right"><fmt:formatNumber value="${valorComissao}" type="currency" currencySymbol=""/>&nbsp;</td>
					  <td align="right"><fmt:formatNumber value="${valorPagamento}" type="currency" currencySymbol=""/>&nbsp;</td>
					  <td align="right"><s:property value="proposta.seguradora.nome"/>&nbsp;</td>
					  <td align="right">
					     <s:if test="%{situacao == 0}">Em aberto</s:if>
    					 <s:elseif test="%{situacao == 1}">Baixa parcial</s:elseif>
    					 <s:elseif test="%{situacao == 2}">Baixado</s:elseif>
					     &nbsp;</td>
					</tr>
					</s:iterator>
				  </table>
				</div>
			  </td>
			</tr>
		  </table>
		  </div>
	  </fieldset>
		  </td>
		</tr>
	</table>
	</div>
  </div>
  <div class="tabPane" id="tabPane1" style="height:auto; visibility: hidden;overflow: auto;">
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
			<td width="34%">
			  <label for="grupoDeVendaId">Prêmio Líquido:</label><br/>
			  <s:textfield theme="simple" id="premioLiquidoComTab" name="proposta.premioLiquido" cssClass="dojoValidateValid readonly" readonly="true" disabled="true" />
			</td>
			<td width="33%">
			  <label for="produtorGerenteNome">Percentual Comissão:</label><br/>
			  <s:textfield theme="simple" cssClass="TextBox_OneCells_width readonly" id="fatorComTab" name="proposta.fator" readonly="true" />
			</td>
			<td>
			  <label for="totalComissao">Valor Comissão:</label><br/>
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_OneCell_width" id="totalComissao" name="proposta.valorComissao"  onkeypress="return Mascara('numero1', event, this);" onblur="javascript:valida_numero(this,15,2,'totalComissao');" onkeyup="calculaFator();" onchange="setAlterado(true);" />
			</td>
		  </tr>
		  <tr>
			<td width="34%">
			  <label class="LabelText" for="tipoRecebimentoComissao">Tipo de Recebimento de Comissão:</label><br/>
			  <s:select theme="simple" id="tipoRecebimentoComissao" cssClass="dojoValidateValid requiredField" list="tipoRecebimentoComissaoList" name="proposta.tipoRecebimentoComissao" onchange="showOptionsRecebimentoComissao();"/>
			</td>
			<td width="33%">
			  <label id="labelOpcoesRecebComissao" class="LabelText"></label><br/>
			  <s:textfield theme="simple" id="quantParcComissao" name="proposta.quantParcelasComissao" size="5" maxlength="3" onchange="setAlterado(true);" cssStyle="display:none;" />
			  <s:select theme="simple" cssClass="dojoValidateValid" id="descontaCustoApoliceIof" list="#{'true':'SIM', 'false':'NAO'}" name="proposta.descontaCustoApoliceIof" headerKey="" headerValue=" -- " cssStyle="display:none;" onchange="setAlterado(true);" />
			</td>
			<td width="33%"></td>
		  </tr>
		</table>
	  </fieldset>
	  <fieldset>
		  <legend><b>Comissão a Pagar</b></legend>
		  <div id="divComissaoPagar">
		  <table width="100%" cellspacing="0" cellpadding="0" class="Main_Client_TableEdition">
			<tr>
			  <td width="34%">
				<label for="grupoDeVendaId">Produtor/Grupo:</label><br/>
				<s:textfield theme="simple" id="grupoVendaQE" name="proposta.grupoDeVenda.quebraExclusividade" cssStyle="display:none;"/>
				<s:textfield theme="simple" id="percComissaoMax"  name="proposta.seguradora.percComissaoMax" cssStyle="display:none;"/>
				<s:textfield theme="simple" id="percComissaoMin"  name="proposta.seguradora.percComissaoMin"  cssStyle="display:none;"/>
				<s:select theme="simple" id="grupoDeVendaId" name="proposta.grupoDeVenda.id" cssClass="dojoValidateValid" list="grupoDeVendaList" listKey="id" listValue="nomeDoGrupo"  headerKey="" headerValue=" -- Selecione -- " onchange="if (confirm('Está alteração não afeta outras propostas nem o cadastro do segurado!\n Confirma a alteração?')){alterarGrupoDeVenda();}"/>
			  </td>
			  <td width="33%">
				<label for="produtorGerenteNome">Supervisor</label><br/>
				<s:textfield theme="simple" name="grupoDeVenda.produtorGerente.id" cssStyle="display:none;"/>
				<s:textfield theme="simple" cssClass="dojoValidateValid readonly" cssStyle="width:95%" id="produtorGerenteNome" name="proposta.grupoDeVenda.produtorGerente.nome" readonly="true"/>
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
					  <td class="FieldGroupTitle">Repasse de Comissões</td>
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
				<div id="divListaComissionados">
				  <s:set var="totalPercentualComissao" value="0" />
				  <table id="tableComissionadoItens" class="listItens">
					<tr style="height: 20px;" class="listItensHeader">
					  <td width="5%">Ações</td>
					  <td width="30%">Nome</td>
					  <td width="15%">Tp Comissão</td>
					  <td width="12%">Dt Lançamento</td>
					  <td width="12%">Dt Pagamento</td>
					  <td width="10%">% Comissão</td>
					  <td width="12%">Vlr Comissão</td>
					</tr>
					<s:iterator value="comissionadoPropostaList" status="stat">
					<tr style="height: 20px;">
					  <td nowrap="nowrap" class="small_image">
						<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/delete.gif" includeParams="none"/>" onclick="if(confirma('Está operação poderá gerar estornos de repasse caso haja baixa de comissão, Confirma exclusão?')){setAlterado(true);removerComissionado('<s:property value="id" />');}"/>
						<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/edit.gif" includeParams="none"/>" onclick="if(confirma('Confirma edição?')){editarComissionado($('#comissionadoPropostaId${stat.index}').val());}"/>
					  </td>
					  <td>
					  	<c:set var="totalRepasseComissao" value="${valorPago+totalRepasseComissao}" />
						<s:textfield theme="simple" name="comissionadoPropostaList[%{#stat.index}].id" id="comissionadoPropostaId%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="comissionadoPropostaList[%{#stat.index}].comissionado.pessoa.id" id="comissionadoPropostaPessoaId%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="comissionadoPropostaList[%{#stat.index}].comissionado.pessoa.nome" id="comissionadoPropostaPessoaNome%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="comissionadoPropostaList[%{#stat.index}].comissionado.proposta.id" id="comissionadoPropostaPropostaId%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="comissionadoPropostaList[%{#stat.index}].comissionado.comissao" id="comissionadoPropostaComissao%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="comissionadoPropostaList[%{#stat.index}].comissionado.tipoComissao" id="comissionadoPropostaTipoComissao%{#stat.index}" cssStyle="display: none;"/>
					    <s:property value="comissionado.pessoa.nome"/>&nbsp;
					  </td>
					  <td><s:property value="getTipoComissaoDescricao(comissionado.tipoComissao)" />&nbsp;</td>
					  <td align="right"><s:property value="dataLancamento"/>&nbsp;</td>
					  <td align="right"><s:property value="dataPagamento"/>&nbsp;</td>
					  <td align="right"><fmt:formatNumber value="${comissionado.comissao}" type="currency" currencySymbol=""/>&nbsp;</td>
					  <td align="right"><fmt:formatNumber value="${valorPago}" type="currency" currencySymbol=""/>&nbsp;</td>
					</tr>
					</s:iterator>
					<tr style="height: 20px;">
					  <td><b>Total:</b></td>
					  <td colspan="6" align="right"><b><fmt:formatNumber value="${totalRepasseComissao}" type="currency" currencySymbol=""/></b></td>
					</tr>
				  </table>
				</div>
			  </td>
			</tr>
		  </table>
		  </div>
	  </fieldset>
  </div>
  <div class="tabPane" id="tabPane2" style="height:auto; visibility: hidden;overflow: auto;">
	  <table>
	    <tr>
		  <td colspan="4">
		    <div class="divMessages" id="divMessagesTab2" style="padding-bottom: 10px;">
		  	  <s:actionerror/>
			  <s:actionmessage/>
			  <s:fielderror/>
		    </div>
		  </td>
	    </tr>
	  </table>
	  <fieldset>
		<legend><b>Lançamento de Baixas</b></legend>
		<table id="tableComissao" width="100%" cellspacing="0" cellpadding="0" align="center" class="Main_Client_TableEdition">
		  <tr>
			<td>
				<div id="divListaComissoes">
				  <s:set var="totalPercentualComissao" value="0" />
				  <table id="tableComissionadoItens" class="listItens">
					<tr style="height: 20px;" class="listItensHeader">
					  <td width="5%">Ações</td>
					  <td width="15%">Ramo</td>
					  <td width="5%">Apólice</td>
					  <td width="10%">Data Lancto</td>
					  <td width="10%">Nro Extrato</td>
					  <td width="5%">Parc</td>
					  <td width="10%">Prêmio</td>
					  <td width="10%">% Comissão</td>
					  <td width="10%">Comissão</td>
					  <td width="10%">Situação</td>
					</tr>
					<s:iterator value="proposta.borderoLancamentoCollection" status="stat">
					<tr style="height: 20px;">
					  <td nowrap="nowrap" class="small_image">
					  	<c:set var="totalValorComissao" value="${valorComissao+totalValorComissao}" />
						<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/delete.gif" includeParams="none"/>" onclick="if(confirma('Confirma exclusão?')){removeLancamento('<s:property value="id"/>');}"/>
						<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/edit.gif" includeParams="none"/>" onclick="if(confirma('Confirma edição?')){editarLancamento('<s:property value="id"/>');}"/>
					  </td>
					  <td ><s:property value="ramo.nome"/>&nbsp;</td>
					  <td ><s:property value="nroApolice"/>&nbsp;</td>
					  <td ><s:property value="dataLancamento"/>&nbsp;</td>
					  <td ><s:property value="borderoComissao.nroExtrato"/>&nbsp;</td>
					  <td align="right"><s:property value="nroParcela"/>&nbsp;</td>
					  <td align="right"><fmt:formatNumber value="${premioLiquido}" type="currency" currencySymbol=""/>&nbsp;</td>
					  <td align="right"><fmt:formatNumber value="${percentualComissao}" type="currency" currencySymbol=""/>&nbsp;</td>
					  <td align="right"><fmt:formatNumber value="${valorComissao}" type="currency" currencySymbol=""/>&nbsp;</td>
					  <td ><s:property value="situacaoDesc"/>&nbsp;</td>
					</tr>
					</s:iterator>
				  </table>
				</div>
			</td>
		  </tr>
		</table>
	  </fieldset>
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
		  <input type="button" id="btnf5" style="display: none;" onclick="return navigate('anterior');"/>
		  <a href="#" class="button" onclick="$('#btnf5').click();">
		  <table onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" onclick="">
			<tr>
			  <td class="wButton_left"></td>
			  <td class="wButton_text wButton_width">F5-Anterior</td>
			  <td class="wButton_right"/>
			</tr>
		  </table>
		  </a>
		</td>
		<td>
		  <input type="button" id="btnf6" style="display: none;" onclick="return navigate('proximo');"/>
		  <a href="#" class="button" onclick="$('#btnf6').click();">
		  <table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" onclick="">
			<tr>
			  <td class="wButton_left"></td>
			  <td class="wButton_text wButton_width">F6-Próximo</td>
			  <td class="wButton_right"/>
			</tr>
		  </table>
		  </a>
		</td>
		<td>
		  <input type="button" id="btnf8" style="display: none;" onclick="if (confirma('Confirma?')){listaComissoes();alterado=false;}"/>
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
	<input type="hidden" id="fcCondutorProfissao" name="condutor.profissao.descricao"/>
	<input type="hidden" id="fcCondutorCPF" name="condutor.cpf"/>
	<input type="hidden" id="fcCondutorAutomovel" name="condutor.automovel.id"/>
</form>

<form id="formComissoes">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<s:textfield theme="simple" id="comPropostaId" name="propostaComissao.proposta.id" cssStyle="display:none"/>
	<s:textfield theme="simple" id="comComissaoId" name="propostaComissao.id" cssStyle="display:none"/>
	<s:textfield theme="simple" id="comComissaoNroDaParcela" name="propostaComissao.nroDaParcela" cssStyle="display:none"/>
	<s:textfield theme="simple" id="comComissaoDataVencimento" name="propostaComissao.dataVencimento" cssStyle="display:none"/>
	<s:textfield theme="simple" id="comComissaoDataPagamento" name="propostaComissao.dataPagamento" cssStyle="display:none"/>
	<s:textfield theme="simple" id="comComissaoValorPagamento" name="propostaComissao.valorPagamento" cssStyle="display:none"/>
	<s:textfield theme="simple" id="comComissaoValorComissao" name="propostaComissao.valorComissao" cssStyle="display:none"/>
</form>

<form id="formLookup" name="formLookup">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<input type="hidden" id="currentTabId" name="currentTab" value="0"/>
	<input type="hidden" id="gpPropostaId" name="proposta.id" />
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

<script>

$(document).ready(function(){

	$('#comissaoDataPagamento').datepicker({ dateFormat: 'dd/mm/yy' });
	$('#comissaoDataPagamento').datepicker('option', 'dayNamesMin', ['Do', 'Se', 'Te', 'Qa', 'Qi', 'St', 'Sa']);
	$('#comissaoDataPagamento').datepicker('option', 'monthNames', ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro']);
	MaskInput($('#dataProposta').get(0), "99/99/9999");
	MaskInput($('#dataEmissaoApolice').get(0), "99/99/9999");
	MaskInput($('#inicioVigencia').get(0), "99/99/9999");
	MaskInput($('#terminoVigencia').get(0), "99/99/9999");
	MaskInput($('#dataVencim1aParcela').get(0), "99/99/9999");
	MaskInput($('#dataGeracao').get(0), "99/99/9999");
	MaskInput($('#dataTransmissao').get(0), "99/99/9999");
	MaskInput($('#comissaoDataPagamento').get(0), "99/99/9999");
	MaskInput($('#comissaoDataVencimento').get(0), "99/99/9999");
	MaskInput($('#nroCheque1Parcela').get(0), "9999999999");
	MaskInput($('#nroBanco1Parcela').get(0), "9999");
	MaskInput($('#nroBanco').get(0), "9999");
	MaskInput($('#contaCorrente').get(0), "999999999999999");

	var vencimentos = $('input[@id^="vencimento"]');
	for(var i=0 ; i<vencimentos.length ; i++){
		MaskInput($('#'+vencimentos[i].id).get(0), "99/99/9999");
	}

	if(isEmpty('#propostaId')){
		MaskInput($('#dataEmissao').get(0), "99/99/9999");
	}

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
	stlCorpo.setHeight(xbToInt(stlClient.getHeight() - stlNavegador.getHeight() - 9 -10)); 
	stlCentral.setHeight(xbToInt(stlClient.getHeight() - stlNavegador.getHeight() - 9 - 17)); 
	stlTabFiller.setHeight(xbToInt(stlClient.getHeight() - stlNavegador.getHeight() - 9 - 16 - 34)); 
	stlAllForms.setHeight(xbToInt(stlClient.getHeight() - stlNavegador.getHeight() - 9 - 16 - 40)); 
	stlAllForms.setWidth(xbToInt(stlTabFiller.getWidth()-6)); 
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
