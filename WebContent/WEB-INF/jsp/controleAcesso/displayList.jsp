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


<link rel="stylesheet" href="<s:url value="/common/wizardFinal/tab-panel.css" includeParams="none"/>" type="text/css" />
<link rel="stylesheet" href="<s:url value="/common/wizardFinal/tabpane-ob.css" includeParams="none"/>" type="text/css" />
<link rel="stylesheet" href="<s:url value="/common/wizardFinal/esquema.css" includeParams="none"/>" type="text/css" />
<link rel="stylesheet" type="text/css" href="<s:url value="/common/jquery.autocomplete.css" includeParams="none"/>"></link>           
<link rel="stylesheet" type="text/css" href="<s:url value="/common/styles/loader/loader.css" includeParams="none"/>"></link>
<link rel="stylesheet" type="text/css" href="<s:url value="/common/web/skins/Default/Main/Main_Edition.css" includeParams="none" />" id="paramCSS"></link>

<script language="javascript" charset="UTF-8" src="<s:url value="/common/menu/menutree2.js?v=0" includeParams="none"/>"></script>  
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
// F2
keyActions [0] = {character:  113,
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
<form id="formLista" name="formLista" method="post">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

  <s:submit id="submitButton" cssStyle="display:none" theme="simple"/>
  <input id="propostaId" type="hidden" name="proposta.id" />
  
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
		</table>
			<div class="Main_ContentPane_Client" style="overflow:hidden;" id="client">
		  <table width="100%" summary="" id="sectionDetail" style="height: 100%; border: 3px" cellpadding="0" cellspacing="0">
			<tr>
			  <td valign="top"  style="padding-left: 10px; padding-right: 10px;">
				<table width="100%" cellspacing="0" cellpadding="0" border="0" class="Main_Client_TableRelation" style="margin: 0px 0px 0px 0px">
				  <tr>
					<td>
  <table width="100%" cellspacing="0" cellpadding="0" align="center" class="Main_Client_TableEdition">
	<tr>
	  <td colspan="4">
		<table width="100%" class="FieldGroup" border="0" cellpadding="0" cellspacing="0">
		  <tbody>
		  <tr class="FieldGroup_TopMargin"></tr>
		  <tr>
			<td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"/></td>
			<td class="FieldGroupTitle_MaxSize">Controle de Acesso aos Menus</td>
			<td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"/></td>
		  </tr>
		  <tr class="FieldGroup_BottomMargin"></tr>
		  </tbody>
		</table>
	  </td>
	</tr>
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
	  <td width="18%" class="TitleCell"><label class="LabelText" for="nroApolice">Nro da Apólice</label></td>
	  <td width="32%" class="TextBox_ContentCell">
		<s:textfield theme="simple" id="mostraUltimaLista" name="mostraUltimaLista" cssStyle="display:none;"/>
        <s:textfield theme="simple" name="borderoComissaoSearch.id" id="comissaoId" cssStyle="display: none;"/>
		<s:textfield theme="simple" cssClass="dojoValidateValid" id="nroApolice" name="borderoComissaoSearch.borderoLancamentoCollection[0].nroApolice" />
	  </td>
	  <td width="18%" class="TitleCell"><label class="LabelText" for="nroExtrato">Nro do Extrato</label></td>
	  <td width="32%" class="TextBox_ContentCell">
		<s:textfield theme="simple" cssClass="dojoValidateValid" id="nroExtrato" name="borderoComissaoSearch.nroExtrato" />
	  </td>
	</tr>
	<tr>
	  <td width="18%" class="TitleCell"><label class="LabelText" for="ramoId">Ramo</label></td>
	  <td width="32%" class="TextBox_ContentCell">
		<s:select theme="simple" cssClass="Combo Combo_TwoCells_width" id="ramoId" name="propostaSearch.ramo.id" list="ramoList" listKey="id" listValue="nome" headerKey="" headerValue="- SELECIONE -" />
	  </td>
	  <td class="TitleCell"></td>
	  <td class="Combo_ContentCell"></td>
	</tr>
	<tr>
	  <td colspan="4" class="Button_RightAlign_ContentCell">
		<div align="center">
		  <table>
			<tr>
			  <td>
				<input type="button" id="btnf5" style="display: none;" onclick="listaLista();"/>
				<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton"
					   onclick="document.getElementById('btnf5').click()">
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">F5-Pesquisar</td>
					<td class="wButton_right"/>
				  </tr>
				</table>
			  </td>
			  <td>
				<input type="button" id="btnf3" style="display: none;"/>
				<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton"
					   onclick="document.getElementById('btnf3').click()">
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">F2-Criar nova</td>
					<td class="wButton_right"/>
				  </tr>
				</table>
			  </td>
			  <td>
				<input type="button" id="btnf7" style="display: none;" onclick="clearForm('#formLista');"/>
				<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton"
					   onclick="clearForm('#formLista');">
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">F7-Limpar Dados</td>
					<td class="wButton_right"/>
				  </tr>
				</table>
			  </td>
			</tr>
		  </table>
		</div>
	  </td>
	</tr>
  </table>
  <div style="height: 290px">
  <div id="divResult" style="overflow: auto;height: 100%"></div>
  <div id="pageloader" style="display:none;">Carregando...<br/></div>
  </div>

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

<form id="formLookup" name="formLookup">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<input type="hidden" id="currentTabId" name="currentTab" value="0"/>
	<input type="hidden" id="gpPropostaId" name="proposta.id" />
	<input type="hidden" id="gpSeguradoraId" name="seguradora.id" />
	<input type="hidden" id="gpRamoId" name="ramo.id" />
	<input type="hidden" id="gpBlnPossuiPerfil" name="proposta.blnPossuiPerfil" />
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

  <div id="paramProposta" style="display:none" >
  <form id="paramFormProposta" name="paramFormProposta">
    <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>
  
	<input id="paramPropostaId" type="hidden" name="propostaSearch.id"/>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="Main_ContentPane_TabPane" id="tdtopTabs">
		<tr id="paramParentTabContainer">
			<td class="tabBackGroundInit" style="background-color: #505050"></td>
		</tr>
		<tr id="paramMainTabContainer">
		  <td class="tabBackGroundInit" style="background-color: #505050">
			  <span style="color:#FFFFFF; font-size:8pt; font-weight:bold; height:26px !important; padding:0 4px; text-align:center; white-space:nowrap;">
				  Novo Pedido de Seguro
			  </span>
		  </td>
		</tr>
	</table>
  <div align="center" style="border: solid 1px #505050; padding: 10px;" >
  <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2">
      <s:textfield id="blnPossuiPerfil" name="blnPossuiPerfil" value="true" cssStyle="display:none;" theme="simple" />
      <s:textfield id="blnEndosso" name="blnEndosso" value="true" cssStyle="display:none;" theme="simple" />
      <s:textfield id="blnRenovacao" name="blnRenovacao" value="true" cssStyle="display:none;" theme="simple" />
    </td>
  </tr>
  <tr>
    <td width="50%" class="TitleCell" style="text-align: left"><label class="LabelText" for="paramTipo">Tipo</label></td>
    <td width="50%">
      <s:select theme="simple" cssClass="Combo Combo_TwoCells_width" cssStyle="width: 100%" tabindex="0" id="paramTipo" name="tipo" list="{'NOVA','ENDOSSO','RENOVAÇÃO'}" onchange="showHideOpcoesNovaProposta();" onkeyup="showHideOpcoesNovaProposta();" />
    </td>
  </tr>
  </table>
  <table id="opcoesNovaProposta" width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="50%" class="TitleCell" style="text-align: left"><label class="LabelText" for="paramRamoId">Ramo</label></td>
    <td width="50%">
    	<s:select theme="simple" cssClass="Combo Combo_TwoCells_width" cssStyle="width: 100%" tabindex="0" id="paramRamoId" name="ramo.id" list="ramoList" listKey="id" listValue="nome" headerKey="" headerValue="-- Selecione --" onchange="carregaSeguradoras();"/>
    </td>
  </tr>
  <tr>
    <td width="50%" class="TitleCell" style="text-align: left"><label class="LabelText" for="paramSeguradoraId">Seguradora</label></td>
    <td width="50%"><div id="divSeguradoras"><s:select theme="simple" cssClass="Combo Combo_TwoCells_width" cssStyle="width: 100%" tabindex="0" id="paramSeguradoraId" name="seguradora.id" list="{}" listKey="{}" headerKey="" headerValue="-- Selecione --" /></div></td>
  </tr>
  </table>
  <div id="pessoaFisica" style="display: none;">
  <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2" class="TitleCell" style="text-align: left">
      <input type="radio" id="pf" name="tipoCliente" value="0" checked="checked" onchange="$('#blnPossuiPerfil').val('true');" />
      <label class="LabelText" style="cursor:pointer;" for="pf">Pessoa Física</label>
    </td>
  </tr>
  </table>
  </div>
  <div id="pessoaJuridicaComPerfil" style="display: none;">
  <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2" class="TitleCell" style="text-align: left">
      <input type="radio" id="pjComPerfil" name="tipoCliente" value="1" onchange="$('#blnPossuiPerfil').val('true');" />
      <label class="LabelText" style="cursor:pointer;" for="pjComPerfil">Pessoa Jurídica com perfil</label>
    </td>
  </tr>
  </table>
  </div>
  <div id="pessoaJuridicaSemPerfil" style="display: none;">
  <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2" class="TitleCell" style="text-align: left">
      <input type="radio" id="pjSemPerfil" name="tipoCliente" value="1" onchange="$('#blnPossuiPerfil').val('false');" />
      <label class="LabelText" style="cursor:pointer;" for="pjSemPerfil">Pessoa Jurídica sem perfil</label>
    </td>
  </tr>
  </table>
  </div>
  <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2" class="TitleCell" style="text-align: left">&nbsp;</td>
  </tr>
  <tr>
  	<td><div align="center">
		<input type="button" disabled="disabled" id="btnf2" style="display: none;" onclick="criarNova();"/>
  		<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton"
		onclick="document.getElementById('btnf2').click()">
		<tr>
            <td class="wButton_left"></td>
            <td class="wButton_text wButton_width" >F2-Criar nova</td>
            <td class="wButton_right"/>
        </tr>
    </table></div>
    </td>
  	<td><div align="center">
		<input type="button" class="modalClose" id="btnf9" style="display: none;" onclick="fechaParamNovaProposta();"/>
  		<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton"
		onclick="document.getElementById('btnf9').click()">
		<tr>
            <td class="wButton_left"></td>
            <td class="wButton_text wButton_width">F9-Cancelar</td>
            <td class="wButton_right"/>
        </tr>
    </table></div>
    <input type="button" id="btnf11" style="display: none;" onclick="mostrarMenu('buttonMenu');setTimeout('init()',300);return false;"/>
    </td>
    </tr>
  </table>
  </div>
  </form>
  </div>

<script>

$(document).ready(function () {
	$('#btnf3').click(function (e) {
		e.preventDefault();
		$('#paramProposta').modal({onShow: modalShow, close: false});
	});

});

function listaLista(){
	if ($('#page').val())
		$('#page').val('0');
	submitFormAjax('#formLista', getContextApp()+'/proposta/listalista.action', '#divResult');
}

function listaNext(){
	submitFormAjax('#formLista', getContextApp()+'/proposta/listanext.action', '#divResult');
}

function listaPrevious(){
	submitFormAjax('#formLista', getContextApp()+'/proposta/listaprevious.action', '#divResult');
}

function listaLast(){
	submitFormAjax('#formLista', getContextApp()+'/proposta/listalast.action', '#divResult');
}

function listaFirst(){
	submitFormAjax('#formLista', getContextApp()+'/proposta/listafirst.action', '#divResult');
}

function excluirProposta(){
	if (ConfirmaDisplayList(document.formLista,'excluir')) {
		submitForm(document.formLista, getContextApp()+'/proposta/excluir.action', false);
	}
}

function modalShow (dialog) {
	setTimeout(function(){paramNovaProposta();},2000);
}

function paramNovaProposta(){
	document.getElementById("paramSeguradoraId").focus();
	document.getElementById('btnf5').disabled=true;
	document.getElementById('btnf2').disabled=false;
// F2
keyActions [0] = {character:  113,	
                  actionType: "code",
                  param:      "executarBotao('btnf2');"};
}

function fechaParamNovaProposta(){
	document.getElementById('btnf5').disabled=false;
// F2
keyActions [0] = {character:  113,	
                  actionType: "code",
                  param:      "executarBotao('btnf3');"};
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

window.onresize = function(){init();}

jQuery(document).ready(function(){

	$('#bookmark')[0].innerHTML = '0-0/0';
	MaskInput($('#dataProposta').get(0), "99/99/9999");
	MaskInput($('#dataVencim1aParcela').get(0), "99/99/9999");

	$("#clienteNome").autocomplete('<s:url value="/objlookup/getClienteListByNome.action" includeParams="none" />', {idFieldsToUpdate:["#clienteId"],onEnterPress:"listaLista()",mustMatch:0,autoFill:false,  width:400,formatItemOnSelect:splitResultGetFirst});
	$("#clienteCpfCnpj").autocomplete('<s:url value="/objlookup/getClienteListByCpf.action" includeParams="none" />', {idFieldsToUpdate:["#clienteId"],onEnterPress:"listaLista()",mustMatch:0,autoFill:false,  width:400,formatItemOnSelect:splitResultGetFirst});

	addFunctionOnEnterPress(function(event){execOnEnterPress(event, 'listaLista()');}, 'clienteNome');
});

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
	stlClient.setHeight(xbToInt(windowHeight - stlTdtopButtons.getHeight() - stlTdBottomSeparetor.getHeight() - stlParamToolBar.getHeight()));
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
