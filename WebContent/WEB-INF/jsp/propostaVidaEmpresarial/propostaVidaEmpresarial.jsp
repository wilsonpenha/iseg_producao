<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns:="http://www.w3.org/1999/xhtml">

<head>   
<title>Proposta Passo-a-Passo</title>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">   
<meta http-equiv="Expires" content="-1"> 
<meta http-equiv="Pragma" content="no-cache">  
<meta http-equiv="Cache-Control" content="no-cache">
  
<link rel="stylesheet" type="text/css" href="<s:url value="/common/wizardFinal/tab-panel.css" includeParams="none"/>" />
<link rel="stylesheet" type="text/css" href="<s:url value="/common/wizardFinal/tabpane-ob.css" includeParams="none"/>" />
<link rel="stylesheet" type="text/css" href="<s:url value="/common/wizardFinal/esquema.css" includeParams="none"/>" />
<link rel="stylesheet" type="text/css" href="<s:url value="/common/web/skins/Default/Main/Main_Edition.css" includeParams="none" />" id="paramCSS"></link>
<link rel="stylesheet" type="text/css" href="<s:url value="/common/ui.all.css" includeParams="none"/>"></link>
<link rel="stylesheet" type="text/css" href="<s:url value="/common/jquery.autocomplete.css" includeParams="none"/>"></link>
<link rel="stylesheet" type="text/css" href="<s:url value="/common/styles/loader/loader.css" includeParams="none"/>"></link>
<link rel="stylesheet" type="text/css" href="<s:url value="/common/web/skins/Default/Main/Client/DataGrid/DataGrid.css" includeParams="none" />" id="paramCSS"></link>
<link rel="stylesheet" type="text/css" href="<s:url value="/common/lightbox/jquery.lightbox-0.5.css" includeParams="none"/>" />
<link rel="stylesheet" type="text/css" href="<s:url value="/common/jcarousel/jquery.jcarousel.css" includeParams="none"/>" />
<link rel="stylesheet" type="text/css" href="<s:url value="/common/jcarousel/skins/tango/skin.css" includeParams="none"/>" />

<script language="javascript" charset="UTF-8" src="<s:url value="/common/web/js/utils-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/geral-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/confirm-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/js/propostaVidaEmpresarial/script-pack.js?v=9" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/hotkeys-pack.js?v=1" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/js/propostaVidaEmpresarial/tab-panel-pack.js?v=1" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/wizardFinal/tabpane-pack.js?v=1" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery-1.5.1.min.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery-form-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.form-new-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.bestupper-pack.js?v=0" includeParams="none"/>"></script> 
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.meiomask-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.autocomplete-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/ui.core-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/ui.accordion-pack.js?v=0" includeParams="none"/>"></script>
<script charset="UTF-8" src="<s:url value="/common/jquery.simplemodal-1.1.1-pack.js?v=0" includeParams="none"/>" type='text/javascript'></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/common-pack.js?v=5" includeParams="none"/>"></script>
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
var seguradoAlterado = false;
var cpfClienteAlterado = false;
var cpfEstipulanteAlterado = false;
var cpfSeguradoAlterado = false;
var cnpjClienteAlterado = false;
var cnpjEstipulanteAlterado = false;

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

input.button {
  border-collapse: collapse;
  font-family: tahoma, arial, helvetica, sans-serif;
  width:54px;
  font-size: 7pt;
  color: #1b4106;
  font-weight: bold;
  CURSOR: pointer;background: url(../common/images/buttonBody.normal.png) repeat-x center;
  text-align: center;
  height: 20px;
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
<form id="formEdit" namespace="/propostaEmpresarial" name="formEdit" method="post" onSubmit="if (isNaN(window.event.keyCode)){return false;};">
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
								<td class="TabBody">Estipulante</td>
								<td class="TabRight"/>
							  </tr>
							</table>
						  </td>
						  <td>
							<table onclick="raisePanel(1)" id="tabMenu1" border="0" cellpadding="0" cellspacing="0" class="inactive">
							  <tr>
								<td class="TabLeft"></td>
								<td class="TabBody TabPanel_width">Segurados</td>
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
						  <td>
							<table onclick="raisePanel(5)" id="tabMenu5" border="0" cellpadding="0" cellspacing="0" class="inactive">
							  <tr>
								<td class="TabLeft"></td>
								<td class="TabBody TabPanel_width">Faturas</td>
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

	<div id="allForms" style="overflow:hidden; width:100%;" class="tabPane" >
	  <div class="tabPane" id="tabPane0" style="overflow:auto; height:auto; width:100%; visibility: hidden;">
	     <jsp:include page="tabPane0_noJs.jsp" flush="false"></jsp:include>
	  </div>
	  <div class="tabPane" id="tabPane1" style="overflow:auto; height:auto; visibility: hidden;overflow:auto; width:100%">
	     <jsp:include page="tabPane1_noJs.jsp" flush="false"></jsp:include>
	  </div>
	  <div class="tabPane" id="tabPane2" style="overflow:auto; height:auto; visibility: hidden;overflow:auto; width:100%">
	     <jsp:include page="tabPane2_noJs.jsp" flush="false"></jsp:include>
	  </div>
	  <div class="tabPane" id="tabPane3" style="overflow:auto; height:auto; visibility: hidden;overflow:auto; width:100%">
	     <jsp:include page="../proposta/tabApolice_noJs.jsp" flush="false"></jsp:include>
	  </div>
	  <div class="tabPane" id="tabPane4" style="overflow:auto; height:auto;visibility:hidden;overflow:auto; width:100%">
	     <jsp:include page="tabPane4_noJs.jsp" flush="false"></jsp:include>
	  </div>
	  <div class="tabPane" id="tabPane5" style="overflow:auto; height:auto;visibility:hidden;overflow:auto; width:100%">
	     <jsp:include page="tabPane5_noJs.jsp" flush="false"></jsp:include>
	  </div>   
	  <div class="tabPane" id="tabPane6" style="overflow:auto; height:auto; visibility: hidden;overflow: auto;">
	     <jsp:include page="../proposta/historicoEndosso.jsp" flush="false"></jsp:include>
	  </div>
	</div> 

  <div id="saveProgress" class="pageloader" style="display:none;z-index:5000;">Salvando...<br/></div>
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
<form id="formBeneficiario">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<s:textfield theme="simple" id="comItemCorrente" name="itemCorrente" cssStyle="display:none"/>
	<s:textfield theme="simple" id="comPropostaId" name="proposta.id" cssStyle="display:none"/>
	<s:textfield theme="simple" id="comSeguradoId" name="beneficiarioEmpresarial.seguradoEmpresarial.id" cssStyle="display:none"/>
	<s:textfield theme="simple" id="comBeneficiarioId" name="beneficiarioEmpresarial.id" cssStyle="display:none"/>
	<s:textfield theme="simple" id="comNome" name="beneficiarioEmpresarial.nome" cssStyle="display:none"/>
	<s:textfield theme="simple" id="comDataNascimento" name="beneficiarioEmpresarial.dataNascimento" cssStyle="display:none"/>
	<s:textfield theme="simple" id="comSexo" name="beneficiarioEmpresarial.sexo" cssStyle="display:none"/>
	<s:textfield theme="simple" id="comParentesco" name="beneficiarioEmpresarial.parentesco" cssStyle="display:none"/>
	<s:textfield theme="simple" id="comPercentual" name="beneficiarioEmpresarial.percentual" cssStyle="display:none"/>
</form>

<form id="formHistorico" name="formHistorico">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<input type="hidden" id="hiPropostaId" name="proposta.id" />
</form>

<form id="formComissionados"> 
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<s:textfield theme="simple" id="comPropPropostaId" name="proposta.id" cssStyle="display:none"/>
	<s:textfield theme="simple" id="comPropComissionadoParcelaId" name="comissionadoProposta.parcelasProposta.id" cssStyle="display:none"/>
	<s:textfield theme="simple" id="comPropId" name="comissionadoProposta.id" cssStyle="display:none"/>
	<s:textfield theme="simple" id="comPropPessoaId" name="comissionadoProposta.pessoa.id" cssStyle="display:none"/>
	<s:textfield theme="simple" id="comPropComissao" name="comissionadoProposta.comissao" cssStyle="display:none"/>
	<s:textfield theme="simple" id="comPropVlrComissao" name="comissionadoProposta.valorComissao" cssStyle="display:none"/>
	<s:textfield theme="simple" id="comPropTipoComissao" name="comissionadoProposta.tipoComissao" cssStyle="display:none"/>
	<s:textfield theme="simple" id="comDemaisParcelas" name="demaisParcelas" cssStyle="display:none"/>
	<s:textfield theme="simple" id="comPropComissionadoPropostaCount" name="comissionadoPropostaCount" cssStyle="display:none"/>
</form>
 
<form id="formComissionadosAgenciamento">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<s:textfield theme="simple" id="comPropAgenciadorPropostaId" name="proposta.id" cssStyle="display:none"/>
	<s:textfield theme="simple" id="comPropAgenciadorId" name="comissionadoAgenciamento.id" cssStyle="display:none"/>
	<s:textfield theme="simple" id="comPropAgenciadorAgenciamentoId" name="comissionadoAgenciamento.agenciamento.id" cssStyle="display:none"/>
	<s:textfield theme="simple" id="comPropAgenciadorPessoaId" name="comissionadoAgenciamento.pessoa.id" cssStyle="display:none"/>
	<s:textfield theme="simple" id="comPropAgenciadorComissao" name="comissionadoAgenciamento.comissao" cssStyle="display:none"/>
	<s:textfield theme="simple" id="comPropAgenciadorVlrComissao" name="comissionadoAgenciamento.valorComissao" cssStyle="display:none"/>
	<s:textfield theme="simple" id="comPropAgenciadorTipoComissao" name="comissionadoAgenciamento.tipoComissao" cssStyle="display:none"/>
	<s:textfield theme="simple" id="comPropComissionadoAgenciamentoCount" name="comissionadoAgenciamentoCount" cssStyle="display:none"/>
</form>

<form id="formAnexo" name="formAnexo" enctype="multipart/form-data">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<input type="hidden" id="faPropostaAnexoPropostaId" name="propostaAnexo.proposta.id" />
	<input type="hidden" id="faPropostaId" name="proposta.id" />
</form>

<form id="formLookup" name="formLookup">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<input type="hidden" id="gpItemCorrente" name="itemCorrente"/>
	<input type="hidden" id="idRelatorio" name="idRelatorio" value="PESSOAS_COLETIVO"/>
	<input type="hidden" id="currentTabId" name="currentTab" value="0"/>
	<input type="hidden" id="gpPropostaId" name="proposta.id" /> 
	<input type="hidden" id="gpPropostaParcelaAtual" name="proposta.parcelaAtual" />
	<input type="hidden" id="gpSeguradoraId" name="seguradora.id" />
	<input type="hidden" id="gpRamoId" name="ramo.id" />
	<input type="hidden" id="gpBlnPossuiPerfil" name="proposta.blnPossuiPerfil" />
	<input type="hidden" id="gpTipoCliente" name="tipoCliente" />
	<input type="hidden" id="gpClienteId" name="proposta.cliente.id" /> 
	<input type="hidden" id="gpClienteCpf" name="pessoaFisica.cpfOuCnpj" />  
	<input type="hidden" id="gpClienteCnpj" name="pessoaJuridica.cpfOuCnpj" />
	<input type="hidden" id="gpEstipulanteId" name="proposta.estipulante.id" /> 
	<input type="hidden" id="gpEstipulanteCnpj" name="estipulante.cpfOuCnpj" />
	<input type="hidden" id="gpGrupoDeVendaId" name="parcelasProposta.grupoDeVenda.id" />
	<input type="hidden" id="gpParcelaSelecionadaId" name="parcelasProposta.id" />
	<input type="hidden" id="gpDemaisParcelas" name="demaisParcelas" />
	<input type="hidden" id="gpAgenciamentoId" name="agenciamento.id" />
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
			  <label class="LabelText" for="paramCobDescricaoCobertura">Cobertura:</label>
			</td>
			<td width="50%" >
			  <s:textfield theme="simple" cssStyle="width: 100%" cssClass="clTextoRestritoModal" id="paramCobDescricaoCobertura" name="seguradoCoberturas.descricao" />
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
  
  <jsp:include page="formRepasseComissoes.jsp" flush="false"></jsp:include>

    <s:if test="proposta.statusOperacional != 0 && proposta.statusOperacional != 5 && proposta.statusOperacional != 8">
	<script>
	
	$(document).ready(function(){
		editavel = false;

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

	MaskInput($('#dataEmissaoApolice')[0], "99/99/9999");
	MaskInput($('#inicioVigencia')[0], "99/99/9999");
	MaskInput($('#terminoVigencia')[0], "99/99/9999");
	MaskInput($('#dataVencim1aParcela')[0], "99/99/9999");
	MaskInput($('#nroCheque1Parcela')[0], "9999999999");
	MaskInput($('#nroBanco1Parcela')[0], "9999");
	MaskInput($('#contaCorrente')[0], "999999999999999");

	if(isEmpty('#propostaId')){
		MaskInput($('#dataNascimento')[0], "99/99/9999");
		MaskInput($('#dataEmissao')[0], "99/99/9999");

		$("#clientePFNome").autocomplete('<s:url value="/objlookup/getClientePFListByNome.action" includeParams="none" />', {idFieldsToUpdate:["#clienteId"],onItemSelect:carregaCliente, mustMatch:0, autoFill:false,width:400,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
		$("#clienteCpf").autocomplete('<s:url value="/objlookup/getClienteListByCpf.action" includeParams="none" />', {idFieldsToUpdate:["#clienteId"],onItemSelect:carregaCliente, mustMatch:0, autoFill:false,width:400,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
		$("#clientePJNome").autocomplete('<s:url value="/objlookup/getClientePJListByNome.action" includeParams="none" />', {idFieldsToUpdate:["#clienteId"],onItemSelect:carregaCliente , mustMatch:0, autoFill:false,  width:400,formatItemOnSelect:splitResultGetFirst});
		$("#clienteCnpj").autocomplete('<s:url value="/objlookup/getClienteListByCnpj.action" includeParams="none" />',     {idFieldsToUpdate:["#clienteId"],onItemSelect:carregaCliente, mustMatch:0, autoFill:false,  width:400,formatItemOnSelect:splitResultGetFirst});
	}

	//$("#comissionadoPropostaPessoaNome").autocomplete('<s:url value="/objlookup/getProdutorList.action" includeParams="none" />', {idFieldsToUpdate:["#comissionadoPropostaPessoaId"]});
	//$("#comissionadoAgenciamentoPessoaNome").autocomplete('<s:url value="/objlookup/getProdutorList.action" includeParams="none" />', {idFieldsToUpdate:["#comissionadoAgenciamentoPessoaId"]});
	$("#cepRes").autocomplete('<s:url value="/objlookup/getCepList.action" includeParams="none" />', {idFieldsToUpdate:["#bairroRes", "#cidadeRes","#ufRes","#lograRes"],mustMatch:0,minChars:6,width:300,autoFill:false,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
	$("#cepCom").autocomplete('<s:url value="/objlookup/getCepList.action" includeParams="none" />', {idFieldsToUpdate:["#bairroCom", "#cidadeCom","#ufCom","#lograCom"],mustMatch:0,minChars:6,width:300,autoFill:false,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
	$("#seguradoCepRes").autocomplete('<s:url value="/objlookup/getCepList.action" includeParams="none" />', {idFieldsToUpdate:["#seguradoBairroRes", "#seguradoCidadeRes","#seguradoUfRes","#seguradoLograRes"],mustMatch:0,minChars:6,width:300,autoFill:false,formatItemOnSelect:splitResultGetFirst});
	$("#seguradoNome").autocomplete('<s:url value="/objlookup/getClientePFListByNome.action" includeParams="none" />', {idFieldsToUpdate:["#seguradoClienteId"],onItemSelect:carregaSegurado, mustMatch:0, autoFill:false,  width:400,formatItemOnSelect:splitResultGetFirst});
	$("#seguradoCpf").autocomplete('<s:url value="/objlookup/getClienteListByCpf.action" includeParams="none" />', {idFieldsToUpdate:["#seguradoClienteId"],onItemSelect:carregaSegurado, mustMatch:0, autoFill:false,  width:400,formatItemOnSelect:splitResultGetFirst,onblur:function(){validaCPF(document.formEdit.seguradoCpf)}});
	$("#pfProfissao").autocomplete('<s:url value="/objlookup/getProfissaoByNome.action" includeParams="none" />', {idFieldsToUpdate:["#pfProfissaoId"]});
	$("#nroBanco").autocomplete('<s:url value="/objlookup/getBancoByCodigoOrNome.action" includeParams="none" />', {idFieldsToUpdate:["#nroBanco"]});
	
	$("#estipulantePJNome").autocomplete('<s:url value="/objlookup/getClientePJListByNome.action" includeParams="none" />', {idFieldsToUpdate:["#estipulanteId"],onItemSelect:carregaEstipulante, mustMatch:0, autoFill:false,width:400,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
	$("#estipulanteCnpj").autocomplete('<s:url value="/objlookup/getClienteListByCnpj.action" includeParams="none" />', {idFieldsToUpdate:["#estipulanteId"],onItemSelect:carregaEstipulante, mustMatch:0, autoFill:false,width:400,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
	$("#cepEstipulante").autocomplete('<s:url value="/objlookup/getCepList.action" includeParams="none" />', {idFieldsToUpdate:["#bairroEstipulante", "#cidadeEstipulante","#ufEstipulante","#lograEstipulante"],mustMatch:0,minChars:6,width:300,autoFill:false,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});

	/*$('#comissionadoPropostaComissao').addClass('readonly');
	$('#comissionadoPropostaVlrComissao').addClass('readonly');
	$('#comissionadoPropostaComissao').attr('readonly',true)
	$('#comissionadoPropostaVlrComissao').attr('readonly',true)*/

	$('#gallery a.galleryLink').lightBox({fixedNavigation:true});
	$('#mycarousel').jcarousel();

	setTimeout(function(){carregarPropostaAnexos();},500);

	handleReadonly();
	disableDadosClientes();
	showHideDadosDemaisParcelas();
	showHideDadosFormaPagamento();
	showOptionsRecebimentoComissao();
	enableDisableDadosCobertura();

});
    
function openWinReport(){
	$('#gpPropostaId').val($('#propostaId').val());
	if($('#propostaId').val() != ""){
		openWin('', 'report', '800', '600', 'resizable=yes');
		submitForm($('#formLookup').get(0), getContextApp()+'/jasperreport/runjasper.action', false, "report");
	}else{
		alert('Favor, salvar a proposta.');
	}
}

function checarCpfSegurado(cpf){  
	setTimeout(function(){
		if (cpfSeguradoAlterado){
			if (validaCPF(document.formEdit.clienteCpf)){
				carregaSegurado();
			}
		}
	},500);
}

function checarCpfCliente(cpf){
	setTimeout(function(){
		if (cpfSeguradoAlterado){
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

function checarCnpjEstipulante(cnpj){
	setTimeout(function(){
		if (cnpjEstipulanteAlterado){
			if (validaCnpj(document.formEdit.estipulanteCnpj)){
				carregaEstipulante();
			}
		}
	},300);
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
		$('#paramProposta').modal({onShow: modalNovaProposta, close: false});
	});

});


$(document).ready(function() {
	//$('input[name="campo_cc"]').setMask('cc'); // cartão de crédito
	//$('input[name="campo_numero"]').setMask('integer'); // números inteiros
	//$('input[name="campo_money"]').setMask('decimal'); // dinheiro
	$('input[name="desconto"]').setMask('signed-decimal'); // dinheiro com valores negativos
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

//mostrarMenu('buttonMenu');
</script>
