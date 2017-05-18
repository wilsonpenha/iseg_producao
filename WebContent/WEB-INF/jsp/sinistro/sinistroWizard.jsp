<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

<link rel="stylesheet" type="text/css" href="<s:url value="/common/sinistro/tab-panel.css" includeParams="none"/>" />
<link rel="stylesheet" type="text/css" href="<s:url value="/common/sinistro/tabpane-ob.css" includeParams="none"/>" />
<link rel="stylesheet" type="text/css" href="<s:url value="/common/sinistro/esquema.css" includeParams="none"/>" />
<link rel="stylesheet" type="text/css" href="<s:url value="/common/jquery.autocomplete.css" includeParams="none"/>"></link>
<link rel="stylesheet" type="text/css" href="<s:url value="/common/web/skins/Default/Main/Main_Edition.css" includeParams="none" />" id="paramCSS" />
<link rel="stylesheet" type="text/css" href="<s:url value="/common/styles/loader/loader.css" includeParams="none"/>" />
<link rel="stylesheet" type="text/css" href="<s:url value="/common/jquery.tooltip.css" includeParams="none"/>" />
<link rel="stylesheet" type="text/css" href="<s:url value="/common/lightbox/jquery.lightbox-0.5.css" includeParams="none"/>" />
<link rel="stylesheet" type="text/css" href="<s:url value="/common/jcarousel/skins/tango/skin.css" includeParams="none"/>" />

<script language="javascript" charset="UTF-8" src="<s:url value="/common/geral.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/confirm.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/js/sinistro/script.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/js/sinistro/hotkeys.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/sinistro/tab-panel.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/sinistro/tabpane.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery-form.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.autocomplete-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/common-pack.js?v=3" includeParams="none"/>" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/is-date.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/event.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/masked-input.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/web/js/utils-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/xbLibrary.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/xbDebug.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/xbDOM.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/xbStyle.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/xbStyle-css.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.simplemodal-1.1.1.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.tooltip.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/lightbox/jquery.lightbox-0.5.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.carousel.min.js?v=1" includeParams="none"/>"></script>

<script type="text/javascript">defineContext('<s:url value="/" includeParams="none"/>');</script>

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
<form id="formEdit" namespace="/sinistro" name="formEdit" method="post">
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
					<a class="Main_LeftTabsBar_ButtonRight" href="#" onclick="listarSinistro();">
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
			  	<span class="Main_NavBar_Breadcrumb" id="paramBreadcrumb"> <tiles:insertAttribute name="navigation" /></span>
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
													<td class="TabBody">Dados do Sinistro</td>
													<td class="TabRight"/>
												  </tr>
												</table>
											  </td>
											  <td>
												<table onclick="raisePanel(1)" id="tabMenu1" border="0" cellpadding="0" cellspacing="0" class="inactive">
												  <tr>
													<td class="TabLeft"></td>
													<td class="TabBody TabPanel_width">Local/Condutor</td>
													<td class="TabRight"/>
												  </tr>
												</table>
											  </td>
											  <td>
												<table onclick="raisePanel(2)" id="tabMenu2" border="0" cellpadding="0" cellspacing="0" class="inactive">
												  <tr>
													<td class="TabLeft"></td>
													<td class="TabBody TabPanel_width">Descrição do Ocorrido</td>
													<td class="TabRight"/>
												  </tr>
												</table>
											  </td>
											  <td>
												<table onclick="raisePanel(3)" id="tabMenu3" border="0" cellpadding="0" cellspacing="0" class="inactive">
												  <tr>
													<td class="TabLeft"></td>
													<td class="TabBody TabPanel_width">Local de Reparo</td>
													<td class="TabRight"/>
												  </tr>
												</table>
											  </td>
											  <td>
												<table onclick="raisePanel(4)" id="tabMenu4" border="0" cellpadding="0" cellspacing="0" class="inactive">
												  <tr>
													<td class="TabLeft"></td>
													<td class="TabBody TabPanel_width">Terceiros</td>
													<td class="TabRight"/>
												  </tr>
												</table>
											  </td>
											  <td>
												<table onclick="raisePanel(5)" id="tabMenu5" border="0" cellpadding="0" cellspacing="0" class="inactive">
												  <tr>
													<td class="TabLeft"></td>
													<td class="TabBody TabPanel_width">Monitoramento</td>
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
										  	<s:textfield theme="simple" name="id" value="%{sinistro.id}" cssStyle="display:none"/>
							                <s:textfield theme="simple" id="sinistroId" name="sinistro.id" cssStyle="display:none"/>
							                <s:textfield theme="simple" id="propostaId" name="sinistro.proposta.id" cssStyle="display:none"/>
										    <s:textfield theme="simple" id="tipoCliente" name="tipoCliente" cssStyle="display:none"/>
											  <table>
											    <tr>
												  <td colspan="4">
												    <div id="divMessages1" style="padding-bottom: 10px;">
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
		  <legend accesskey="A"><b>Dados da <u>A</u>pólice</b></legend>
		  <table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
			  <td width="20%">
				<label for="nroProposta">Nro da Proposta</label><br />
				<s:textfield theme="simple" id="nroProposta" name="sinistro.nroProposta" size="15" maxlength="12" cssClass="readonly" readonly="true" />
			  </td>
			  <td width="20%">
				<label for="nroApolice">Nro da Apólice</label><br />
				<s:textfield theme="simple" id="nroApolice" name="sinistro.nroApolice" size="20" maxlength="20" cssClass="readonly" readonly="true" />
			  </td>
			  <td width="20%">
				<label for="emissao">Emissão Apólice</label><br />
				<s:textfield theme="simple" id="emissao" name="sinistro.proposta.dataEmissaoApolice" size="15" maxlength="15"  cssClass="readonly" readonly="true" />
			  </td>
			  <td width="20%">
			    <label for="inicioVigencia">Início Vigência</label><br />
				<s:textfield theme="simple" id="inicioVigencia" name="sinistro.proposta.inicioVigencia" size="15" cssClass="readonly" readonly="true" />
			  </td>
			  <td width="20%">
				<label for="terminoVigencia">Término Vigência</label><br />
			     <s:textfield theme="simple" id="terminoVigencia" name="sinistro.proposta.terminoVigencia" size="15" cssClass="readonly" readonly="true" />
			  </td>
			</tr>
			<tr>
			  <td colspan="2">
			    <label for="seguradora">Seguradora</label><br />
			     <s:textfield theme="simple" id="seguradora" name="sinistro.proposta.seguradora.nome" size="40" cssClass="readonly" readonly="true" />
			  </td>
			  <td colspan="2">
			    <label for="ramo">Ramo</label><br />
			     <s:textfield theme="simple" id="ramo" name="sinistro.proposta.ramo.nome" size="40" cssClass="readonly" readonly="true" />
			  </td>
			  <td ></td>
			</tr>
		  </table>
		  </fieldset>
	    </td>
	  </tr>
		<tr>
		  <td>
			<div id="divDadosCliente">
			<s:if test="tipoCliente == 0">
			  <fieldset>
			  <legend accesskey="C"><b>Dados do <u>S</u>egurado</b></legend>
			  <table id="tableDadosCliente" width="100%" border="0" cellpadding="2" cellspacing="0">
				<tr>
				  <td width="15%">
					<label for="clienteCpf"><a href="#" class="LabelLink" onclick="editarCliente();" tabindex="-1" title="Alterar dados Cadastrais do Segurado.">CPF</a></label><br />
					<s:textfield theme="simple" cssClass="readonly" id="clienteCpf" name="pessoaFisica.cpfOuCnpj" size="18" maxlength="14" onchange="setAlterado(true);" readonly="true"/>
				  </td>
				  <td colspan="2">
					<label for="clientePFNome">Nome do Segurado</label><br />
					<s:textfield theme="simple" id="currentTabId" name="currentTab" cssStyle="display:none;" />
					<s:textfield theme="simple" id="clienteId" name="sinistro.proposta.cliente.id" cssStyle="display:none;" />
					<s:textfield theme="simple" id="pessoaFisicaId" name="pessoaFisica.id" cssStyle="display:none;" />
					<s:textfield theme="simple" cssClass="readonly" id="clientePFNome" name="pessoaFisica.nome" size="50" maxlength="60" onchange="setAlterado(true);" readonly="true" />
				  </td>
				  <td width="15%">
					<label for="dataNascimento">Dt. Nascimento</label><br />
					<s:textfield theme="simple" cssClass="readonly" id="dataNascimento" name="pessoaFisica.dataNascimento" onblur="isValidDate(this);validaData1aHabilitacao(this, '#data1aHabilitacao');" size="12" maxlength="10" onchange="setAlterado(true);" readonly="true" />
				  </td>
				  <td width="15%">
					<label for="sexo">Sexo</label><br />
					<s:select theme="simple" cssClass="readonly" id="sexo" headerKey="" headerValue="-- Selecione --" name="pessoaFisica.sexo" list="{'MASCULINO','FEMININO'}" onchange="setAlterado(true);" disabled="true" />
				  </td>
				  <td width="15%">
					<label for="pfGrupoDeVendaId">Grupo de Venda</label><br />
					<s:select theme="simple" cssClass="readonly" id="pfGrupoDeVendaId" headerKey="" headerValue="-- Selecione --" name="pessoaFisica.grupoDeVenda.id" list="grupoDeVendaList" listKey="id" listValue="nomeDoGrupo" onchange="setAlterado(true);" disabled="true" />
				  </td>
				</tr>
				<tr>
				  <td width="15%">
					<label for="cnh">CNH</label><br />
					<s:textfield theme="simple" cssClass="readonly" id="cnh" name="pessoaFisica.cnh" size="15" maxlength="15" onchange="setAlterado(true);" readonly="true" />
				  </td>
				  <td width="20%">
					<label for="data1aHabilitacao">Dt 1a. Habilitação</label><br />
					<s:textfield theme="simple" cssClass="readonly" id="data1aHabilitacao" name="pessoaFisica.data1aHabilitacao" onblur="isValidDate(this);validaData1aHabilitacao('#dataNascimento', this);" size="12" maxlength="10" onchange="setAlterado(true);" readonly="true" />
				  </td>
				  <td width="20%">
					<label for="rg">Identidade</label><br />
					<s:textfield theme="simple" cssClass="readonly" id="rg" name="pessoaFisica.rg" size="15" maxlength="15" onchange="setAlterado(true);" readonly="true" />
				  </td>
				  <td width="15%">
					<label for="orgaoEmissor">Emissor</label><br />
					<s:textfield theme="simple" cssClass="readonly" id="orgaoEmissor" name="pessoaFisica.orgaoEmissor" size="15" maxlength="15" onchange="setAlterado(true);" readonly="true" />
				  </td>
				  <td width="15%">
					<label for="dataEmissao">Dt de Expedição</label><br />
					<s:textfield theme="simple" cssClass="readonly" id="dataEmissao" name="pessoaFisica.dataEmissao" onblur="isValidDate(this)" size="12" maxlength="10" onchange="setAlterado(true);" readonly="true" />
				  </td>
				  <td width="15%">&nbsp;</td>
				</tr>
				<tr>
				  <td>
					<label for="telefonePreferencial">Telef. Preferencial</label><br />
					<s:textfield theme="simple" cssClass="readonly" id="telefonePreferencial" name="pessoaFisica.telefonePreferencial" size="16" maxlength="16" onchange="setAlterado(true);" readonly="true" />
				  </td>
				  <td>
					<label for="telefoneAlternativo">Telefone Alternativo</label><br />
					<s:textfield theme="simple" id="telefoneAlternativo" cssClass="readonly" name="pessoaFisica.telefoneAlternativo" size="16" maxlength="16" onchange="setAlterado(true);" readonly="true" />
				  </td>
				  <td>
					<label for="telefoneCelular">Telefone Celular</label><br />
					<s:textfield theme="simple" id="telefoneCelular" cssClass="readonly" name="pessoaFisica.telefoneCelular" size="16" maxlength="16" onchange="setAlterado(true);" readonly="true" />
				  </td>
				  <td colspan="2">
					<label for="email">E-mail</label><br />
					<s:textfield theme="simple" id="email" cssClass="readonly" name="pessoaFisica.email" size="60" maxlength="80" onchange="setAlterado(true);" readonly="true" />
				  </td>
				</tr>
			  </table>
			  </fieldset>
			</s:if>
			<s:if test="tipoCliente == 1">
			  <fieldset>
			  <legend accesskey="C"><b>Dados do <u>S</u>egurado</b></legend>
			  <table id="tableDadosCliente" width="100%" border="0" cellpadding="2" cellspacing="0">
				<tr>
				  <td width="20%">
				    <label for="clienteCnpj"><a href="#" class="LabelLink" onclick="editarCliente();" tabindex="-1" title="Alterar dados Cadastrais do Segurado.">CNPJ</a></label><br />
					<s:textfield theme="simple" cssClass="readonly" id="clienteCnpj" name="pessoaJuridica.cpfOuCnpj" size="23" maxlength="21" onblur="if (validaCnpj(this)){carregaCliente();}" onchange="setAlterado(true);" readonly="true" />
				  </td>
				  <td colspan="2">
					<label for="clientePJNome">Nome do Segurado</label><br />
					<s:textfield theme="simple" id="currentTabId" name="currentTab" cssStyle="display:none;" />
					<s:textfield theme="simple" id="clienteId" name="sinistro.proposta.cliente.id" cssStyle="display:none;" />
					<s:textfield theme="simple" id="pessoaJuridicaId" name="pessoaJuridica.id" cssStyle="display:none;" />
					<s:textfield theme="simple" cssClass="requiredField" id="clientePJNome" name="pessoaJuridica.nome" size="50" maxlength="60" onchange="setAlterado(true);" readonly="true" />
				  </td>
				  <td colspan="2">
					<label for="razaoSocial">Razão Social</label><br />
					<s:textfield theme="simple" cssClass="readonly" id="razaoSocial" size="50" maxlength="60" name="pessoaJuridica.razaoSocial" onchange="setAlterado(true);" readonly="true" />
				  </td>
				</tr>
				<tr>
				  <td width="20%">
					<label for="pjGrupoDeVendaId">Grupo de Venda</label><br />
					<s:select theme="simple" cssClass="readonly" id="pjGrupoDeVendaId" headerKey="" headerValue="-- Selecione --" name="pessoaJuridica.grupoDeVenda.id" list="grupoDeVendaList" listKey="id" listValue="nomeDoGrupo" onchange="setAlterado(true);" disabled="true" />
				  </td>
				  <td width="20%">
					<label for="inscricaoEstadual">Inscrição Estadual</label><br />
					<s:textfield theme="simple" cssClass="readonly" id="inscricaoEstadual" name="pessoaJuridica.inscrEstadual" onchange="setAlterado(true);" readonly="true" />
				  </td>
				  <td width="20%">
					<label for="inscricaoMunicipal">Inscrição Municipal</label><br />
					<s:textfield theme="simple" cssClass="readonly" id="inscricaoMunicipal" name="pessoaJuridica.inscricaoMunicipal" onchange="setAlterado(true);" readonly="true" />
				  </td>
				  <td colspan="2">
					<label for="atividadeComercial">Atividade Comercial</label><br />
					<s:select theme="simple" cssClass="readonly" id="atividadeComercial" headerKey="" headerValue="-- Selecione --" name="pessoaJuridica.atividadeComercial" list="atividadeComercialList" listKey="id" listValue="valor" onchange="setAlterado(true);" disabled="true" />
				  </td>
				</tr>
				<tr>
				  <td width="20%">
					<label for="dataFundacao">Data Fundação</label><br />
					<s:textfield theme="simple" cssClass="readonly" id="dataFundacao" name="pessoaJuridica.dataFundacao" onblur="isValidDate(this)" size="12" maxlength="10" onchange="setAlterado(true);" readonly="true" />
				  </td>
				  <td width="20%">
					<label for="valorPatrimonio">Valor Patrimônio</label><br />
					<s:textfield theme="simple" cssClass="readonly" id="valorPatrimonio" name="pessoaJuridica.valorPatrimonio" size="16" onchange="setAlterado(true);" readonly="true" />
				  </td>
				  <td width="20%">
					<label for="telefonePreferencial">Telef. Preferencial</label><br />
					<s:textfield theme="simple" cssClass="readonly" id="telefonePreferencial" name="pessoaJuridica.telefonePreferencial" size="16" maxlength="16" onchange="setAlterado(true);" readonly="true" />
				  </td>
				  <td width="20%">
					<label for="telefoneAlternativo">Telefone Alternativo</label><br />
					<s:textfield theme="simple" cssClass="readonly" id="telefoneAlternativo" name="pessoaJuridica.telefoneAlternativo" size="16" maxlength="16" onchange="setAlterado(true);" readonly="true" />
				  </td>
				  <td width="20%">
					<label for="telefoneCelular">Telefone Celular</label><br />
					<s:textfield theme="simple" cssClass="readonly" id="telefoneCelular" name="pessoaJuridica.telefoneCelular" size="16" maxlength="16" onchange="setAlterado(true);" readonly="true" />
				  </td>
				</tr>
				<tr>
				  <td colspan="2">
					<label for="email">E-mail</label><br />
					<s:textfield theme="simple" cssClass="readonly" id="email" name="pessoaJuridica.email" size="40" maxlength="80" onchange="setAlterado(true);" readonly="true" />
				  </td>
				  <td colspan="2">
					<label for="homePage">Site</label><br />
					<s:textfield theme="simple" cssClass="readonly" id="homePage" name="pessoaJuridica.siteHomePage" size="40" maxlength="100" onchange="setAlterado(true);" readonly="true" />
				  </td>
				</tr>
			  </table>
			  </fieldset>
			</s:if>
			
			  <fieldset>
			  <legend accesskey="C"><b>Bem Sinistrado</b></legend>
			  <table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
				  <td><s:select theme="simple" id="itemSegurado" headerKey="" headerValue="-- Selecione --" name="sinistro.itemSegurado" list="itensSeguradosList" listKey="id" listValue="modeloVeiculo.fabricante.nome+' - '+modeloVeiculo.descricao+', Ano/Modelo: '+anoFabricacao+'/'+anoModelo+', Cor: '+corPredominante+', Placa: '+nroPlaca+', Chassis: '+nroChassis" onchange="setAlterado(true);" cssStyle="width=100%"/></td>
				</tr>
			  </table>
			  </fieldset>
			</div>
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
				  <s:select theme="simple" id="comboVistoriadora" name="sinistro.vistoriadora.id" headerKey="" headerValue="-- Selecione --" list="vistoriadorasList" listKey="id" listValue="nome" onchange="setAlterado(true);" />		  
				  ou <s:textfield theme="simple" id="NomeVistoriadora" name="sinistro.nomeVistoriadora" size="40" maxlength="40" onchange="setAlterado(true);" />
				</div>
			  </td>
			</tr>
			<tr>
			  <td width="33%">
				<label for="NomeVistoriador">Nome Vistoriador</label><br />
				<s:textfield theme="simple" id="NomeVistoriador" name="sinistro.nomeVistoriador" maxlength="30" onchange="setAlterado(true);"/>
			  </td>
			  <td  width="33%" nowrap="nowrap">
				<label for="NroVistoria">Nro da Solicitação</label><br />
				<s:textfield theme="simple" id="NroVistoria" name="sinistro.nroVistoria" maxlength="20" onchange="setAlterado(true);"/>
			  </td>
			  <td  width="33%" nowrap="nowrap">
				<label for="dataVistoria">Dt da Solicitação</label><br />
				<s:textfield theme="simple" id="dataVistoria" name="sinistro.dataVistoria" onblur="isValidDate(this)" size="10" onchange="setAlterado(true);"/>
			  </td>
			</tr>
		  </table>
		  </fieldset>
		</td>
	  </tr>
	  <tr>
		<td>
		  <fieldset>
		  <legend accesskey="S"><b>Dados do <u>S</u>inistro</b></legend>
		  <table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
			  <td width="25%">
				<label for="ordem">Ordem</label><br />
                <s:textfield theme="simple" id="ordem" name="sinistro.ordem" onchange="setAlterado(true);" />
			  </td>
			  <td  width="25%" nowrap="nowrap">
				<label for="nroSinistroSeg">Nro Sinistro na Seguradora</label><br />
                <s:textfield theme="simple" id="nroSinistroSeg" name="sinistro.nroSinistroSeg" maxlength="15" onchange="setAlterado(true);"/>
			  </td>
			  <td  width="25%" nowrap="nowrap">
				<label for="dataInclusaoSinistro">Data do Sinistro</label><br />
                <s:textfield theme="simple" id="dataInclusaoSinistro" name="sinistro.dataInclusaoSinistro" onblur="isValidDate(this)" size="10" onchange="setAlterado(true);"/>
			  </td>
	          <td width="25%" nowrap="nowrap">
	            <label for="situacao">Situação</label><br />
	            <s:select theme="simple" id="situacao" name="sinistro.situacao" headerKey="" headerValue="-- Selecione --" list="{'ABERTO','CONCLUIDO'}" onchange="setAlterado(true);"/>
	          </td>
			</tr>
			<tr>
			  <td width="25%"><label for="dataDoAviso">Data do Aviso</label><br />
                <s:textfield theme="simple" id="dataDoAviso" name="sinistro.dataDoAviso" onblur="isValidDate(this)" size="10" onchange="setAlterado(true);"/>
			  </td>
			  <td  width="25%" nowrap="nowrap"><label for="danoOcorrido">Dano Ocorrido</label><br />
			     <s:select theme="simple" id="danoOcorrido" headerKey="" headerValue="-- Selecione --" name="sinistro.danoOcorrido" list="descricaoDano" onchange="setAlterado(true);"/>
			  </td>
			  <td  width="25%" nowrap="nowrap">
				<label for="dataConclusao">Data da Conclusão</label><br />
                <s:textfield theme="simple" id="dataConclusao" name="sinistro.dataConclusao" onblur="isValidDate(this)" size="10" onchange="setAlterado(true);"/>
			  </td>
	          <td width="25%" nowrap="nowrap">&nbsp;
	          </td>
			</tr>
		  </table>
		  </fieldset>
		</td>
	  </tr>
	</table>
	
										  </div>
									    </div>
					
									    <div class="tabPane" id="tabPane1" style="height:auto; visibility: hidden">
					  					  <div id="divForm2" style="overflow:auto; height:98%; width:100%">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	  <tr>
		<td colspan="2">
		  <fieldset>
		  <legend accesskey="E"><b><u>E</u>ndereço do Acidente</b></legend>
		  <table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
			  <td width="15%">
				<label for="cepAcidente"><a href="#" class="LabelLink" onclick="openWin('${pageContext.request.contextPath}/endereco/buscaCep.action','BuscaCep','1024','600','resizable=yes,scrollbars=yes');" tabindex="-1" title="Acessar o site dos Correrios!">CEP</a></label><br />
				<s:textfield theme="simple" cssClass="clCep" id="cepAcidente" name="sinistro.cep" size="11" maxlength="9" onchange="setAlterado(true);"/>
			  </td>
			  <td width="35%">
				<label for="logradouroAcidente">Logradouro</label><br />
				<s:textfield theme="simple" cssClass="requiredField" id="logradouroAcidente" name="sinistro.logradouro" cssStyle="width:98%" maxlength="60" onchange="setAlterado(true);"/>
			  </td>
			  <td width="35%">
				<label for="complementoAcidente">Complemento</label><br />
				<s:textfield theme="simple" id="complementoAcidente" name="sinistro.complemento" cssStyle="width:98%" maxlength="60" onchange="setAlterado(true);"/>
			  </td>
			  <td width="15%">
				<label for="numeroAcidente">Número</label><br />
				<s:textfield theme="simple" id="numeroAcidente" name="sinistro.numero" maxlength="6" size="8"/>
			  </td>
			</tr>
			<tr>
			  <td colspan="2">
				<label for="bairroAcidente">Bairro</label><br />
				<s:textfield theme="simple" cssClass="requiredField" id="bairroAcidente" name="sinistro.bairro" cssStyle="width:98%" maxlength="50" onchange="setAlterado(true);"/>
			  </td>
			  <td>
				<label for="cidadeAcidente">Cidade</label><br />
				<s:textfield theme="simple" cssClass="requiredField" id="cidadeAcidente" name="sinistro.cidade" cssStyle="width:98%" maxlength="35" onchange="setAlterado(true);"/>
			  </td>
			  <td>
				<label for="ufAcidente">UF</label><br />
				<s:select theme="simple" cssClass="requiredField" id="ufAcidente" headerKey="" headerValue="-- Selecione --" name="sinistro.uf" list="ufList" listKey="uf" listValue="nome" onchange="setAlterado(true);"/>
			  </td>
			</tr>
		  </table>
		  </fieldset>
		</td>
	  </tr>
	  <tr>
		<td colspan="2">
		  <fieldset>
		  <legend accesskey="C"><b><u>C</u>ondutor</b></legend>
		  <table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
			  <td width="40%">
				<label for="condutorNome">Nome</label><br />
				<s:textfield theme="simple" id="condutorNome" name="sinistro.motorista" cssStyle="width:98%" maxlength="255" onchange="setAlterado(true);"/>
			  </td>
			  <td width="20%">
				<label for="condutorCnh">CNH</label><br />
				<s:textfield theme="simple" id="condutorCnh" name="sinistro.cnh" size="10" maxlength="60" onchange="setAlterado(true);"/>
			  </td>
			  <td width="20%">
				<label for="condutorValCnh">Validade CNH</label><br />
				<s:textfield theme="simple" id="condutorValCnh" name="sinistro.validadeCnh" onblur="isValidDate(this)" size="10" onchange="setAlterado(true);"/>
			  </td>
			  <td width="20%">
				<label for="condutorIdade">Idade</label><br />
				<s:textfield theme="simple" id="condutorIdade" name="sinistro.idade" maxlength="3" size="4"/>
			  </td>
			</tr>
		  </table>
		  </fieldset>
		</td>
	  </tr>
		</table>

										  </div>
									    </div>
					
									    <div class="tabPane" id="tabPane2" style="height:auto; visibility: hidden">
					  					  <div id="divForm3" style="overflow:auto; height:98%; width:100%">
					  					  
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	  <tr>
		<td colspan="2">
		  <fieldset>
		<legend accesskey="O"><b>Dados do Ocorrido</b></legend>
		  <table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="20%">
            	<label for="dataAcidente">Data e Hora do Acidente</label><br />
                <s:textfield theme="simple" id="dataAcidente" name="sinistro.dataAcidente" size="20"/>
            </td>
            <td width="20%">
            	<label for="usouGuincho">Usou Guincho?</label><br />
            	<s:select theme="simple" id="usouGuincho" list="#{'true':'SIM', 'false':'NÃO'}" name="sinistro.usouGuincho" headerKey="" headerValue=" -- " />
            </td>
            <td width="20%">
            	<label for="carroReserva">Carro Reserva?</label><br />
            	<s:select theme="simple" id="carroReserva" list="#{'true':'SIM', 'false':'NÃO'}" name="sinistro.carroReserva" headerKey="" headerValue=" -- " />
            </td>
            <td width="20%">
            	<label for="fezAcordo">Fez Acordo?</label><br />
            	<s:select theme="simple" id="fezAcordo" list="#{'true':'SIM', 'false':'NÃO'}" name="sinistro.fezAcordo" headerKey="" headerValue=" -- " />
            </td>
            <td width="20%">
            	<label for="policiaMilitar">Polícia Militar?</label><br />
            	<s:select theme="simple" id="policiaMilitar" list="#{'true':'SIM', 'false':'NÃO'}" name="sinistro.policiaMilitar" headerKey="" headerValue=" -- " />
            </td>
          </tr>
          <tr>
            <td width="20%">
            	<label for="policiaCivil">Polícia Civil?</label><br />
            	<s:select theme="simple" id="policiaCivil" list="#{'true':'SIM', 'false':'NÃO'}" name="sinistro.policiaCivil" headerKey="" headerValue=" -- " />
            </td>
            <td width="20%">
            	<label for="processoJuridico">Processo Jurídico?</label><br />
            	<s:select theme="simple" id="processoJuridico" list="#{'true':'SIM', 'false':'NÃO'}" name="sinistro.processoJuridico" headerKey="" headerValue=" -- " />
            </td>
            <td width="20%">
            	<label for="bo">B.O.</label><br />
                <s:textfield theme="simple" id="bo" name="sinistro.bo" size="20"/>
            </td>
            <td width="20%"></td>
            <td width="20%"></td>
          </tr>
		  <tr>
			<td colspan="5">
			  <label for="descricaoDoOcorrido">Descrição do Ocorrido</label><br />
			  <s:textarea theme="simple" id="descricaoDoOcorrido" name="sinistro.relatoDoSinistro" rows="3" cssStyle="width:100%;" onkeyup="return checkMaxLength(this, 255);" onchange="setAlterado(true);"/>
			</td>
		  </tr>
		  <tr>
			<td colspan="5">
			  <label for="avarias">Avarias:</label><br />
			  <s:textarea theme="simple" id="avarias" name="sinistro.avarias" rows="3" cssStyle="width:100%;" onkeyup="return checkMaxLength(this, 255);" onchange="setAlterado(true);"/>
			</td>
		  </tr>
		  </table>
		  </fieldset>
		</td>
	  </tr>
	</table>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	  <tr>
		<td colspan="2">
		  <fieldset>
			<legend accesskey=""><b>Anexo</b></legend>
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
			  <tr>
				<td>
				  <label for="dataDoProposta">Arquivo p/ upload (Não pode ser maior que 2048000 bytes / 2MB)</label><br />
				  <s:file theme="simple" id="arquivoAnexo" name="fileUpload" size="100" />
				</td>
			  </tr>
			</table>
			<br/>
			<hr/>
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
				  <td style="width:105px;">
				    <a href="#" class="button" onclick="apagarDadosAnexo();" tabindex="-1"> 
					<table onmouseout="this.className='wButton'; return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton">
					  <tr>
						<td class="wButton_left"></td>
						<td class="wButton_text wButton_width">Apagar Dados</td>
						<td class="wButton_right"/>
					  </tr>
					</table>
				    </a>
				  </td>
				  <td style="width:80px;">
				    <a href="#" class="button" onclick="inserirAnexo();" >
					<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
					  <tr>
						<td class="wButton_left"></td>
						<td class="wButton_text wButton_width">Adicionar</td>
						<td class="wButton_right"/>
					  </tr>
					</table>
					</a>
				  </td>
				  <td>&nbsp;</td>
				</tr>
			</table>
		  </fieldset>
		</td>
	  </tr>
	</table>
    <div id="divListaAnexo" style="border: 1px;overflow:auto;">
    <!-- 
    <s:if test="not sinistro.sinistroAnexoCollection.isEmpty()">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	  <tr>
		<td>
	  	  <div id="gallery">
            <ul id="mycarousel" class="jcarousel-skin-tango">
	  	      <s:iterator value="sinistro.sinistroAnexoCollection" status="stat">
               	<li>
				  <a class="galleryLink" href="${pageContext.request.contextPath}/sinistro/mostrarGalleryAnexo.action?sinistroAnexo.id=<s:property value="id"/>" title="batida">
	  	    		<img align="middle" src='${pageContext.request.contextPath}/sinistro/mostrarMiniaturaAnexo.action?sinistroAnexo.id=<s:property value="id"/>'  border="0" />
                  </a>
                  <img alt="" style="cursor:pointer;border-top: #F0F6F9;border-top: 1px;" src="<s:url value="/common/web/images/delete.gif" includeParams="none"/>" onclick="if(confirma('Confirma exclusão?')){removerAnexo('<s:property value="id"/>');}" />
				  <a href="${pageContext.request.contextPath}/sinistro/mostrarAnexo.action?sinistroAnexo.id=<s:property value="id"/>" title="batida" >
					<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/download.jpg" includeParams="none"/>" border="0" />
                  </a>
                </li>
	  	      </s:iterator>
			</ul>
		  </div>
		</td>
	  </tr>
	</table>
    </s:if>
     -->
	</div>
					  					  
										  </div>
									    </div>
					
									    <div class="tabPane" id="tabPane3" style="height:auto; visibility: hidden">
										  <div id="divForm4" style="overflow:auto; height:98%; width:100%">

	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	  <tr>
		<td colspan="2">
		  <fieldset>
		<legend accesskey="N"><b>Oficina</b></legend>
		  <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td colspan="2">
            	<label for="sinistroOficinaNome">Oficina</label><br />
            	<s:textfield theme="simple" id="sinistroOficinaId" name="sinistro.oficina.id" cssStyle="display:none;"/>
			    <s:textfield theme="simple" id="sinistroOficinaNome" name="sinistro.oficina.nome" onchange="setAlterado(true);" cssStyle="width:98%;"/>
              </td>
		    </tr>
		  </table>
		  <div id="divEnderecoOficina">
		  <table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
			  <td width="15%">
				<label for="cepOficina">CEP</label><br />
				<s:textfield theme="simple" cssClass="clCep readonly" id="cepOficina" name="enderecoOficina.cep" size="11" maxlength="9" readonly="true" />
			  </td>
			  <td width="35%">
				<label for="lograOficina">Logradouro</label><br />
				<s:textfield theme="simple"  id="lograOficina" name="enderecoOficina.logradouro" cssStyle="width:98%" maxlength="60" cssClass="readonly" readonly="true" />
			  </td>
			  <td width="35%">
				<label for="compOficina">Complemento</label><br />
				<s:textfield theme="simple" id="compOficina" name="enderecoOficina.complemento" cssStyle="width:98%" maxlength="60" cssClass="readonly" readonly="true" />
			  </td>
			  <td width="15%">
				<label for="numeroOficina">Número</label><br />
				<s:textfield theme="simple" id="numeroOficina" name="enderecoOficina.numero" maxlength="6" size="8" cssClass="readonly" readonly="true" />
			  </td>
			</tr>
			<tr>
			  <td colspan="2">
				<label for="bairroOficina">Bairro</label><br />
				<s:textfield theme="simple" id="bairroOficina" name="enderecoOficina.bairro" cssStyle="width:98%" maxlength="50" cssClass="readonly" readonly="true" />
			  </td>
			  <td>
				<label for="cidadeOficina">Cidade</label><br />
				<s:textfield theme="simple" id="cidadeOficina" name="enderecoOficina.cidade" cssStyle="width:98%" maxlength="35" cssClass="readonly" readonly="true" />
			  </td>
			  <td>
				<label for="ufOficina">UF</label><br />
				<s:textfield theme="simple" id="ufOficina" name="enderecoOficina.uf" cssClass="readonly" readonly="true" />
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
					
									    <div class="tabPane" id="tabPane4" style="height:auto; visibility: hidden;overflow: auto;">
										  <div id="divForm5" style="overflow:auto; height:98%; width:100%">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	  <tr>
		<td>
		  <fieldset>
		  <legend accesskey="T"><b>Dados do <u>T</u>erceiro</b></legend>
		  <div id="divDadosTerceiroEnvolvido">
		  <table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
			  <td colspan="3">
				<label for="terceiroNome">Nome</label><br />
				<s:textfield theme="simple" id="terceiroId" name="terceiroEnvolvido.id" cssStyle="display:none"/>
				<s:textfield theme="simple" cssClass="requiredField" id="terceiroNome" name="terceiroEnvolvido.nome" maxlength="60" cssStyle="width:98%;" />
			  </td>
			  <td colspan="2">
				<label for="terceiroCpfCnpj">CPF/CNPJ</label><br />
				<s:textfield theme="simple" id="terceiroCpfCnpj" name="terceiroEnvolvido.cpfOuCnpj" size="18" maxlength="18" />
			  </td>
			  <td colspan="1">
				<label for="terceiroDataNascimento">Dt. Nascimento</label><br />
				<s:textfield theme="simple" cssClass="requiredField" id="terceiroDataNascimento" name="terceiroEnvolvido.dataNascimento" onblur="isValidDate(this)" size="10" maxlength="10"/>
			  </td>
			</tr>
			<tr>
			  <td width="15%">
				<label for="cepTer"><a href="#" class="LabelLink" onclick="openWin('${pageContext.request.contextPath}/endereco/buscaCep.action','BuscaCep','1024','600','resizable=yes,scrollbars=yes');" tabindex="-1" title="Acessar o site dos Correrios!">CEP</a></label><br />
				<s:textfield theme="simple" cssClass="requiredField" id="terceiroTipoEndereco" name="terceiroEnvolvido.tipoEndereco" value="R" cssStyle="display:none;" />
				<s:textfield theme="simple" cssClass="clCep" id="cepTer" name="terceiroEnvolvido.cep" size="11" maxlength="9" onchange="setAlterado(true);"/>
			  </td>
			  <td colspan="2">
				<label for="lograTer">Logradouro</label><br />
				<s:textfield theme="simple" cssClass="requiredField" id="lograTer" name="terceiroEnvolvido.logradouro" cssStyle="width:98%" maxlength="60" onchange="setAlterado(true);"/>
			  </td>
			  <td width="20%">
				<label for="compTer">Complemento</label><br />
				<s:textfield theme="simple" id="compTer" name="terceiroEnvolvido.complemento" cssStyle="width:98%" maxlength="60" onchange="setAlterado(true);"/>
			  </td>
			  <td width="15%">
				<label for="numeroTer">Número</label><br />
				<s:textfield theme="simple" id="numeroTer" name="terceiroEnvolvido.numero" maxlength="6" size="8"/>
			  </td>
			  <td width="15%">
				<label for="foneTer">Tel. Residencial</label><br />
				<s:textfield theme="simple" id="foneTer" name="terceiroEnvolvido.telefonePreferencial" size="16" maxlength="20" onchange="setAlterado(true);"/>
			  </td>
			</tr>
			<tr>
			  <td colspan="2">
				<label for="bairroTer">Bairro</label><br />
				<s:textfield theme="simple" cssClass="requiredField" id="bairroTer" name="terceiroEnvolvido.bairro" cssStyle="width:98%" maxlength="50" onchange="setAlterado(true);"/>
			  </td>
			  <td colspan="2">
				<label for="cidadeTer">Cidade</label><br />
				<s:textfield theme="simple" cssClass="requiredField" id="cidadeTer" name="terceiroEnvolvido.cidade" cssStyle="width:98%" maxlength="35" onchange="setAlterado(true);"/>
			  </td>
			  <td width="15%">
				<label for="ufTer">UF</label><br />
				<s:select theme="simple" cssClass="requiredField" id="ufTer" headerKey="" headerValue="-- Selecione --" name="terceiroEnvolvido.uf" list="ufList" listKey="uf" listValue="nome" onchange="setAlterado(true);"/>
			  </td>
			  <td width="15%">
				<label for="celTer">Telefone Celular</label><br />
				<s:textfield theme="simple" id="celTer" name="terceiroEnvolvido.telefoneCelular" size="16" maxlength="20" onchange="setAlterado(true);"/>
			  </td>
			</tr>
			<tr>
			  <td colspan="2">
				<label for="terceiroCondutorNome">Condutor Nome</label><br />
				<s:textfield theme="simple" id="terceiroCondutorNome" name="terceiroEnvolvido.condutor" maxlength="60" cssStyle="width:98%;" />
			  </td>
			  <td width="20%">
				<label for="terceiroCondutorCpf">Condutor CPF</label><br />
				<s:textfield theme="simple" id="terceiroCondutorCpf" name="terceiroEnvolvido.condutorCpf" size="18" maxlength="18" />
			  </td>
			  <td width="15%">
				<label for="terceiroCondutorCNH">CNH</label><br />
				<s:textfield theme="simple" id="terceiroCondutorCNH" name="terceiroEnvolvido.cnh" maxlength="15" size="15" />
			  </td>
			  <td colspan="2">
				<label for="terceiroVeiculoEnvolvido">Veículo Envolvido</label><br />
				<s:textfield theme="simple" id="terceiroVeiculoEnvolvido" name="terceiroEnvolvido.veiculoEnvolvido" maxlength="60" cssStyle="width:98%;" />
			  </td>
			</tr>
			<tr>
		      <td width="15%">
			    <label for="terceiroCor">Cor</label><br />
			    <s:textfield theme="simple" id="terceiroCor" name="terceiroEnvolvido.cor" size="20" maxlength="20" onchange="setAlterado(true);"/>
			  </td>
			  <td width="20%">
			    <label for="terceiroAnoFabricacao">Ano</label><br />
			    <s:textfield theme="simple" id="terceiroAnoFabricacao" name="terceiroEnvolvido.anoFabricacao" size="10" maxlength="4" onchange="setAlterado(true);"/>
			  </td>
			  <td width="20%">
			    <label for="terceiroAnoModelo">Modelo</label><br />
			    <s:textfield theme="simple" id="terceiroAnoModelo" name="terceiroEnvolvido.anoModelo" size="10" maxlength="4" onchange="setAlterado(true);"/>
			  </td>
			  <td width="15%">
			    <label for="terceiroNroPlaca">Placa</label><br />
			    <s:textfield theme="simple" id="terceiroNroPlaca" name="terceiroEnvolvido.placa" size="10" maxlength="7" onchange="setAlterado(true);"/>
			  </td>
			  <td colspan="2">
			    <label for="terceiroOficinaNome">Oficina</label><br />
			    <s:textfield theme="simple" id="terceiroOficinaId" name="terceiroEnvolvido.oficina.id" cssStyle="display:none;"/>
			    <s:textfield theme="simple" id="terceiroOficinaNome" name="terceiroEnvolvido.oficina.nome" onchange="setAlterado(true);" cssStyle="width:98%;"/>
			  </td>
		    </tr>
		    <tr>
		      <td colspan="6">
			    <label for="terceiroAvarias">Avarias</label><br />
			    <s:textarea theme="simple" id="terceiroAvarias" name="terceiroEnvolvido.avarias" rows="3" cssStyle="width:100%;" onkeyup="return checkMaxLength(this, 255);" onchange="setAlterado(true);"/>
			  </td>
		    </tr>
		  </table>
		  </div>
		  <br/>
		  <hr/>
		  <table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
			  <td style="width:105px;">
			    <a href="#" class="button" onclick="apagarDadosTerceiroEnvolvido();" tabindex="-1">
				<table onmouseout="this.className='wButton'; return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton">
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">Apagar Dados</td>
					<td class="wButton_right"/>
				  </tr>
				</table>
			    </a>
			  </td>
			  <td style="width:80px;">
			    <a href="#" class="button" onclick="inserirTerceiroEnvolvido();" >
				<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">Adicionar</td>
					<td class="wButton_right"/>
				  </tr>
				</table>
				</a>
			  </td>
			  <td>&nbsp;</td>
			</tr>
		  </table>
		  </fieldset>
		</td>
	  </tr>
	  <tr>
		<td>
		  <div id="divListaTerceiroEnvolvido" style="border: 1px;overflow:auto;">
			<table id="tableTerceirosItens" class="listItens">
			  <tr class="listItensHeader">
				<td width="8%" nowrap="nowrap">Ações</td>
				<td width="40%" nowrap="nowrap">Nome</td>
				<td width="22%" nowrap="nowrap">CPF</td>
				<td width="30%" nowrap="nowrap">Veículo</td>
			  </tr>
			  <s:iterator value="sinistro.terceiroEnvolvidoCollection" status="stat">
				<tr id="rowTerceiroEnvolvido<s:property value="#stat.index"/>" title="<s:url value="/sinistro/showDadosTerceiroEnvolvido?terceiroEnvolvido.id=" includeParams="none"/><s:property value="id"/>">
				  <td nowrap="nowrap" class="small_image">
					<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/delete.gif" includeParams="none"/>" onclick="if(confirma('Confirma exclusão?')){removeTerceiroEnvolvido('<s:property value="id"/>');}"/>
					<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/edit.gif" includeParams="none"/>" onclick="if(confirma('Confirma edição?')){editarTerceiroEnvolvido('<s:property value="id"/>');}"/>
				  </td>
				  <td nowrap="nowrap"><s:property value="nome"/>&nbsp;</td>
				  <td nowrap="nowrap"><s:property value="cpfOuCnpj"/>&nbsp;</td>
				  <td nowrap="nowrap"><s:property value="veiculoEnvolvido"/>&nbsp;</td>
				</tr>
			  </s:iterator>
			  <s:if test="sinistro.terceiroEnvolvidoCollection.isEmpty()"><tr><td colspan="4" style="text-align: center;"><i>Vazio</i></td></tr></s:if>
			</table>
		  </div>
		</td>
	  </tr>
	</table>
										  </div>
									    </div>
					
										<div class="tabPane" id="tabPane5" style="height:auto; visibility: hidden">
										  <div id="divForm6" style="overflow:auto; height:98%; width:100%">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	  <tr>
		<td>
		  <fieldset>
		  <legend accesskey="T"><b>Acompan<u>h</u>amento</b></legend>
		  <div id="divDadosAcompanhamento">
		  <table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
		      <td>
			    <label for="acoDtLancamento">Data Lançamento</label><br />
			    <s:textfield theme="simple" id="acompanhamentoId" name="acompanhamento.id" cssStyle="display:none;" />
			    <s:textfield theme="simple" id="acoDtLancamento" name="acompanhamento.dataLancamento" onblur="isValidDate(this)" size="10" maxlength="10" />
			  </td>
			</tr>
			<tr>
			  <td>
			    <label for="acoDetalhamento">Detalhamento</label><br />
			    <s:textarea theme="simple" id="acoDetalhamento" name="acompanhamento.detalhamento" rows="3" cssStyle="width:100%;" onkeyup="return checkMaxLength(this, 255);" />
			  </td>
		    </tr>
		  </table>
		  </div>
		  <br/>
		  <hr/>
		  <table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
			  <td style="width:105px;">
			    <a href="#" class="button" onclick="apagarDadosAcompanhamento();" tabindex="-1">
				<table onmouseout="this.className='wButton'; return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton">
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">Apagar Dados</td>
					<td class="wButton_right"/>
				  </tr>
				</table>
			    </a>
			  </td>
			  <td style="width:80px;">
			    <a href="#" class="button" onclick="inserirAcompanhamento();" >
				<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">Adicionar</td>
					<td class="wButton_right"/>
				  </tr>
				</table>
				</a>
			  </td>
			  <td>&nbsp;</td>
			</tr>
		  </table>
		  </fieldset>
		</td>
	  </tr>
	  <tr>
		<td>
		  <div id="divListaAcompanhamento" style="border: 1px;overflow:auto;">
			<table id="tableAcompanhamentoItens" class="listItens">
			  <tr class="listItensHeader">
				<td width="8%" nowrap="nowrap">Ações</td>
				<td width="22%" nowrap="nowrap">Data</td>
				<td width="70%">Descrição</td>
			  </tr>
			  <s:iterator value="sinistro.acompanhamentoCollection" status="stat">
				<tr>
				  <td nowrap="nowrap" class="small_image">
					<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/delete.gif" includeParams="none"/>" onclick="if(confirma('Confirma exclusão?')){removeAcompanhamento('<s:property value="id"/>');}"/>
					<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/edit.gif" includeParams="none"/>" onclick="if(confirma('Confirma edição?')){editarAcompanhamento('<s:property value="id"/>');}"/>
				  </td>
				  <td nowrap="nowrap"><s:property value="dataLancamento"/>&nbsp;</td>
				  <td><s:property value="detalhamento"/>&nbsp;</td>
				</tr>
			  </s:iterator>
			  <s:if test="sinistro.acompanhamentoCollection.isEmpty()"><tr><td colspan="4" style="text-align: center;"><i>Vazio</i></td></tr></s:if>
			</table>
		  </div>
		</td>
	  </tr>
	</table>
	
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	  <tr>
		<td>
		  <fieldset>
		  <legend accesskey="T"><b><u>I</u>ndenização</b></legend>
		  <div id="divDadosIndenizacao">
		  <table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
		      <td width="30%">
			    <label for="indenizacaoDataPagamento">Data Pagamento</label><br />
			    <s:textfield theme="simple" id="indenizacaoId" name="indenizacao.id" cssStyle="display:none;" />
			    <s:textfield theme="simple" id="indenizacaoDataPagamento" name="indenizacao.dataPagamento" onblur="isValidDate(this)" size="10" maxlength="10" />
			  </td>
		      <td width="30%;">
			    <label for="indenizacaoValor">Valor</label><br />
			    <s:textfield theme="simple" id="indenizacaoValor" cssClass="currency" name="indenizacao.valorIndenizado" onkeypress="return Mascara('numero1', event, document.getElementById('indenizacaoValor'));" onblur="javascript:valida_numero(this,15,2,'indenizacaoValor');" size="15" onchange="setAlterado(true);"/>
			  </td>
		      <td width="40%;">
			    <label for="indenizacaoTipo">Tipo</label><br />
			    <s:select theme="simple" id="indenizacaoTipo" list="tipoIndenizacaoList" name="indenizacao.tipoIndenizacao" headerKey="" headerValue="- Selecione -" />
			  </td>
			</tr>
		  </table>
		  </div>
		  <br/>
		  <hr/>
		  <table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
			  <td style="width:105px;">
			    <a href="#" class="button" onclick="apagarDadosIndenizacao();" tabindex="-1">
				<table onmouseout="this.className='wButton'; return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton">
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">Apagar Dados</td>
					<td class="wButton_right"/>
				  </tr>
				</table>
			    </a>
			  </td>
			  <td style="width:80px;">
			    <a href="#" class="button" onclick="inserirIndenizacao();" >
				<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">Adicionar</td>
					<td class="wButton_right"/>
				  </tr>
				</table>
				</a>
			  </td>
			  <td>&nbsp;</td>
			</tr>
		  </table>
		  </fieldset>
		</td>
	  </tr>
	  <tr>
		<td>
		  <div id="divListaIndenizacao" style="border: 1px;overflow:auto;">
			<table id="tableIndenizacaoItens" class="listItens">
			  <tr class="listItensHeader">
				<td width="8%" nowrap="nowrap">Ações</td>
				<td width="32%" nowrap="nowrap">Data</td>
				<td width="30%">Valor</td>
				<td width="30%">Tipo</td>
			  </tr>
			  <s:iterator value="sinistro.indenizacaoCollection" status="stat">
				<tr>
				  <td nowrap="nowrap" class="small_image">
					<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/delete.gif" includeParams="none"/>" onclick="if(confirma('Confirma exclusão?')){removeIndenizacao('<s:property value="id"/>');}"/>
					<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/edit.gif" includeParams="none"/>" onclick="if(confirma('Confirma edição?')){editarIndenizacao('<s:property value="id"/>');}"/>
				  </td>
				  <td nowrap="nowrap"><s:property value="dataPagamento"/>&nbsp;</td>
				  <td><s:property value="valorIndenizado"/>&nbsp;</td>
				  <td><s:property value="getTipoIndenizacaoDescricao(tipoIndenizacao)" />&nbsp;</td>
				</tr>
			  </s:iterator>
			  <s:if test="sinistro.indenizacaoCollection.isEmpty()"><tr><td colspan="4" style="text-align: center;"><i>Vazio</i></td></tr></s:if>
			</table>
		  </div>
		</td>
	  </tr>
	</table>
										  </div>
										</div>
									  </div>
					    		 	<div id="saveProgress" class="pageloader" style="display: none; z-index: 10;">Salvando...<br/></div>
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
							  <input type="button" id="btnf14" style="display: none;"  onclick="if (alterado){if (ConfirmaSubmit(FORM_SINISTRO_WIZARD,OP_INSERT_UPDATE,OP_COM_CONFIRMA)){salvarSinistro()}}novoSinistro();"/>
							  <a href="#" class="button" onclick="$('#btnf14').click();alterado=false;" >
							  <table onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" onclick="" >
								<tr>
								  <td class="wButton_left"></td>
								  <td class="wButton_text wButton_width">F2-Novo</td>
								  <td class="wButton_right"/>
								</tr>
							  </table>
							  </a>
							</td>
							<td>
							  <input type="button" id="btnf4" style="display: none;" onclick="if (ConfirmaSubmit(FORM_SINISTRO_WIZARD,OP_INSERT_UPDATE,OP_COM_CONFIRMA)){salvarSinistro();alterado=false;}"/>
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
							  <input type="button" id="btnf7" style="display: none;" onclick="if (confirma('Confirma exclusão?')){submitForm(document.formEdit, '<s:url action='excluirSinistro.action' includeParams="none"/>', false);}"/>
							  <a href="#" class="button" onclick="$('#btnf7').click();">
							  <table onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" onclick="">
								<tr>
								  <td class="wButton_left"></td>
								  <td class="wButton_text wButton_width">F7-Excluir</td>
								  <td class="wButton_right"/>
								</tr>
							  </table>
							  </a>
							</td>
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
							  <input type="button" id="btnf8" style="display: none;" onclick="if (confirma('Confirma?')){submitForm(document.formEdit, '<s:url action="displayList.action" includeParams="none" />', true);alterado=false;}"/>
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
							<!-- 
							<td>
							  <input type="button" id="btnf10" style="display: none;" onclick="if(!isEmpty('#propostaId')){openWinReport();}else{alert('É necessário salvar a proposta.');}"/>
							  <a href="#" class="button" onclick="$('#btnf10').click();">
							  <table onmouseout="this.className='wButton'; return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton">
								<tr>
								  <td class="wButton_left"></td>
								  <td class="wButton_text wButton_width">F10-Imprimir Sinistro</td>
								  <td class="wButton_right"/>
								</tr>
							  </table>
							  </a>
							</td>
							 -->
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
  <div id="pageloader" style="display:none;">Carregando...<br/></div>
</form>

<!-- ========================= end of tabbed-frame div ======================== -->
<form id="formTerceiroEnvolvido" name="formTerceiroEnvolvido">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<input type="hidden" id="teTerceiroId" name="terceiroEnvolvido.id"/>
	<input type="hidden" id="teTerceiroSinistroId" name="terceiroEnvolvido.sinistro.id"/>
	<input type="hidden" id="teTerceiroNome" name="terceiroEnvolvido.nome"/>
	<input type="hidden" id="teTerceiroCpfCnpj" name="terceiroEnvolvido.cpfOuCnpj"/>
	<input type="hidden" id="teTerceiroDataNascimento" name="terceiroEnvolvido.dataNascimento"/>
	<input type="hidden" id="teTerceiroTipoEndereco" name="terceiroEnvolvido.tipoEndereco"/>
	<input type="hidden" id="teCepTer" name="terceiroEnvolvido.cep"/>
	<input type="hidden" id="teLograTer" name="terceiroEnvolvido.logradouro"/>
	<input type="hidden" id="teCompTer" name="terceiroEnvolvido.complemento"/>
	<input type="hidden" id="teNumeroTer" name="terceiroEnvolvido.numero"/>
	<input type="hidden" id="teFoneTer" name="terceiroEnvolvido.telefonePreferencial"/>
	<input type="hidden" id="teBairroTer" name="terceiroEnvolvido.bairro"/>
	<input type="hidden" id="teCidadeTer" name="terceiroEnvolvido.cidade"/>
	<input type="hidden" id="teUfTer" name="terceiroEnvolvido.uf"/>
	<input type="hidden" id="teCelTer" name="terceiroEnvolvido.telefoneCelular"/>
	<input type="hidden" id="teTerceiroCondutorNome" name="terceiroEnvolvido.condutorNome"/>
	<input type="hidden" id="teTerceiroCondutorCpf" name="terceiroEnvolvido.condutorCpf"/>
	<input type="hidden" id="teTerceiroCondutorCNH" name="terceiroEnvolvido.cnh"/>
	<input type="hidden" id="teTerceiroVeiculoEnvolvido" name="terceiroEnvolvido.veiculoEnvolvido"/>
	<input type="hidden" id="teTerceiroCor" name="terceiroEnvolvido.cor"/>
	<input type="hidden" id="teTerceiroAnoFabricacao" name="terceiroEnvolvido.anoFabricacao"/>
	<input type="hidden" id="teTerceiroAnoModelo" name="terceiroEnvolvido.anoModelo"/>
	<input type="hidden" id="teTerceiroNroPlaca" name="terceiroEnvolvido.placa"/>
</form>

<form id="formAcompanhamento" name="formAcompanhamento">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<s:textfield theme="simple" id="acoAcompanhamentoId" name="acompanhamento.id" cssStyle="display:none"/>
	<s:textfield theme="simple" id="acoAcompanhamentoSinistroId" name="acompanhamento.sinistro.id" cssStyle="display:none"/>
	<s:textfield theme="simple" id="acoAcompanhamentoDataLancamento" name="acompanhamento.dataLancamento" cssStyle="display:none"/>
	<s:textfield theme="simple" id="acoAcompanhamentoDetalhamento" name="acompanhamento.detalhamento" cssStyle="display:none"/>
</form>

<form id="formIndenizacao" name="formIndenizacao">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<s:textfield theme="simple" id="fiIndenizacaoId" name="indenizacao.id" cssStyle="display:none"/>
	<s:textfield theme="simple" id="fiIndenizacaoSinistroId" name="indenizacao.sinistro.id" cssStyle="display:none"/>
	<s:textfield theme="simple" id="fiIndenizacaoDataPagamento" name="indenizacao.dataPagamento" cssStyle="display:none"/>
	<s:textfield theme="simple" id="fiIndenizacaoValor" name="indenizacao.valorIndenizado" cssStyle="display:none"/>
	<s:textfield theme="simple" id="fiIndenizacaoTipo" name="indenizacao.tipoIndenizacao" cssStyle="display:none"/>
</form>

<form id="formAnexo" name="formAnexo" enctype="multipart/form-data">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<input type="hidden" id="faSinistroAnexoSinistroId" name="sinistroAnexo.sinistro.id" />
	<input type="hidden" id="faSinistroId" name="sinistro.id" />
</form>

<form id="formComissionados">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<s:textfield theme="simple" id="comPropPropostaId" name="proposta.id" cssStyle="display:none"/>
	<s:textfield theme="simple" id="comPropId" name="comissionadoProposta.id" cssStyle="display:none"/>
	<s:textfield theme="simple" id="comPropPessoaId" name="comissionadoProposta.pessoa.id" cssStyle="display:none"/>
	<s:textfield theme="simple" id="comPropComissao" name="comissionadoProposta.comissao" cssStyle="display:none"/>
	<s:textfield theme="simple" id="comPropTipoComissao" name="comissionadoProposta.tipoComissao" cssStyle="display:none"/>
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
	<input type="hidden" id="gpOficinaId" name="oficina.id" />
	<s:hidden id="gpVistoriadoraId" name="proposta.vistoriadora.id" />

	<input type="hidden" id="gpCondicaoPagamentoId" name="proposta.condicaoPagamento.id" />
	<input type="hidden" id="gpDataVencim1aParcela" name="proposta.dataVencim1aParcela" />
	<input type="hidden" id="gpValor1aParcela" name="proposta.valor1aParcela" />
	<input type="hidden" id="gpPremioTotal" name="proposta.premioTotal"/>
</form>
  
<script>

$(document).ready(function(){

	$("#cepTer").autocomplete('<s:url value="/objlookup/getCepList.action" includeParams="none" />', {idFieldsToUpdate:["#bairroTer", "#cidadeTer","#ufTer","#lograTer"],mustMatch:0,minChars:6,width:300,autoFill:false,formatItemOnSelect:splitResultGetFirst});
	$("#cepAcidente").autocomplete('<s:url value="/objlookup/getCepList.action" includeParams="none" />', {idFieldsToUpdate:["#bairroAcidente", "#cidadeAcidente","#ufAcidente","#logradouroAcidente"],mustMatch:0,minChars:6,width:300,autoFill:false,formatItemOnSelect:splitResultGetFirst});
	$("#terceiroOficinaNome").autocomplete('<s:url value="/objlookup/getOficinaList.action" includeParams="none" />', {idFieldsToUpdate:["#terceiroOficinaId"],mustMatch:1,minChars:2,autoFill:false});
	$("#sinistroOficinaNome").autocomplete('<s:url value="/objlookup/getOficinaList.action" includeParams="none" />', {idFieldsToUpdate:["#sinistroOficinaId"],mustMatch:1,minChars:2,autoFill:false,onItemSelect:function(){carregarEnderecoOficina();},onClear:function(){clearFieldsEnderecoOficina();}});

	MaskInput($('#dataAcidente')[0], "99/99/9999 99:99:99");
	MaskInput($('#emissao')[0], "99/99/9999");
	MaskInput($('#inicioVigencia')[0], "99/99/9999");
	MaskInput($('#terminoVigencia')[0], "99/99/9999");
	MaskInput($('#terceiroDataNascimento')[0], "99/99/9999");
	MaskInput($('#acoDtLancamento')[0], "99/99/9999");
	MaskInput($('#dataVistoria')[0], "99/99/9999");
	MaskInput($('#dataInclusaoSinistro')[0], "99/99/9999");
	MaskInput($('#dataDoAviso')[0], "99/99/9999");
	MaskInput($('#dataConclusao')[0], "99/99/9999");
	MaskInput($('#indenizacaoDataPagamento')[0], "99/99/9999");
	MaskInput($('#condutorValCnh')[0], "99/99/9999");

	$('#tableTerceirosItens tr').filter('[id^="rowTerceiroEnvolvido"]').tooltip({ 
		track: true, 
		delay: 0, 
		showURL: false, 
		opacity: 1, 
		fixPNG: true, 
		showBody: " - ", 
		extraClass: "fancy", 
		top: -15, 
		left: 5 
	});

	$('#gallery a.galleryLink').lightBox({fixedNavigation:true});
	$('#mycarousel').jcarousel();

	setTimeout(function(){carregarAnexos();},500);
});

function carregarEnderecoOficina(){
	$("#gpOficinaId").val($.trim($("#sinistroOficinaId").val()));
	submitFormAjax('#formLookup', getContextApp()+'/sinistro/carregaEnderecoOficina.action', '#divEnderecoOficina');
}

function clearFieldsEnderecoOficina(){
	$("#cepOficina").val("");
	$("#lograOficina").val("");
	$("#compOficina").val("");
	$("#numeroOficina").val("");
	$("#bairroOficina").val("");
	$("#cidadeOficina").val("");
	$("#ufOficina").val("");
}

function openWinReport(){
	var propostaId = $('#propostaId').val();
	var ramoId = $('#ramoId').val();
	if(propostaId != ""){
		//url ='<s:url value="/jasperreport/myJasperTest.action" includeParams="none"/>?proposta.id='+propostaId;
		url ='<s:url value="/reports.do" includeParams="none"/>?propostaId='+propostaId+'&ramoId='+ramoId;
		openWin(url, 'report', '750', '500', 'resizable=yes');
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
			if (ConfirmaSubmit(FORM_SINISTRO_WIZARD,OP_INSERT_UPDATE,OP_COM_CONFIRMA)){
				salvarSinistro();
				return false;
			}else{
				e.preventDefault();
				return false;
			}
		}
	});

});

function criarNova(){
	submitForm($('#formLookup')[0], getContextApp()+'/sinistro/novo.action', false);
}

function paramNovaProposta(){
	document.getElementById("paramSeguradoraId").focus();
	document.getElementById('btnf3').disabled=true;
	document.getElementById('btnf4').disabled=true;
	document.getElementById('btnf5').disabled=true;
	document.getElementById('btnf6').disabled=true;
	document.getElementById('btnf7').disabled=true;
	document.getElementById('btnf8').disabled=true;
	document.getElementById('btnf11').disabled=true;
	// F2
	keyActions [0] = {character:  113,	
	                  actionType: "code",
	                  param:      "executarBotao('btnf2');"};

}

function fechaParamNovaProposta(){
	document.getElementById('btnf3').disabled=false;
	document.getElementById('btnf4').disabled=false;
	document.getElementById('btnf5').disabled=false;
	document.getElementById('btnf6').disabled=false;
	document.getElementById('btnf7').disabled=false;
	document.getElementById('btnf8').disabled=false;
	document.getElementById('btnf11').disabled=false;
	// F2
	keyActions [0] = {character:  113,	
	                  actionType: "code",
	                  param:      "executarBotao('btnf14');"};

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
