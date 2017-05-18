<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns:="http://www.w3.org/1999/xhtml">
 
<head>    
    
<title>iSeg - Gestão Inteligente</title>

<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"></meta>
<meta http-equiv="Expires" content="-1"></meta>
<meta http-equiv="Pragma" content="no-cache"></meta>
<meta http-equiv="Cache-Control" content="no-cache"></meta> 
    

<link rel="stylesheet" href="<s:url value="/common/wizardFinal/tab-panel.css" includeParams="none"/>" type="text/css" />
<link rel="stylesheet" href="<s:url value="/common/wizardFinal/tabpane-ob.css" includeParams="none"/>" type="text/css" />
<link rel="stylesheet" href="<s:url value="/common/wizardFinal/esquema.css" includeParams="none"/>" type="text/css" />
<link rel="stylesheet" type="text/css" href="<s:url value="/common/jquery.autocomplete.css" includeParams="none"/>"></link>           
<link rel="stylesheet" type="text/css" href="<s:url value="/common/styles/loader/loader.css" includeParams="none"/>"></link>
<link rel="stylesheet" type="text/css" href="<s:url value="/common/web/skins/Default/Main/Main_Edition.css" includeParams="none" />" id="paramCSS"></link>

<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery-1.3.2.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery-form-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.autocomplete-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/confirm-pack.js?v=0" includeParams="none"/>"></script>  
<script language="javascript" charset="UTF-8" src="<s:url value="/common/common.js?v=6" includeParams="none"/>"></script>  
<script language="javascript" charset="UTF-8" src="<s:url value="/common/web/js/utils-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/hotkeys-pack.js?v=0" includeParams="none"/>"></script>
<script language='javascript' charset="UTF-8" src="<s:url value="/common/jquery.simplemodal-1.1.1.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/is-date-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/event-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/masked-input-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/TableSort-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/js/orcamentoSegAuto/script.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/ajax/ajaxPoll.js" includeParams="none"/>"></script>

<script language="javascript" charset="UTF-8" src="<s:url value="/common/xbLibrary-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/xbDebug-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/xbDOM-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/xbStyle-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/xbStyle-css-pack.js?v=0" includeParams="none"/>"></script>


<script charset="UTF-8" type="text/javascript">defineContext('<s:url value="/" includeParams="none"/>');</script>

<script charset="UTF-8" language="javascript">

var selected = false;
var alterado = false;
var editavel = true;

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
<style>
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
    z-index:1;
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
    z-index:1;
}
</style>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="init();focusFirst();">
<form id="formLista" name="formLista" method="post">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

  <s:submit id="submitButton" name="submitButton" cssStyle="display:none" theme="simple"/>
  <s:textfield theme="simple" id="orcamentoId" name="orcamentoSeguro.id" cssStyle="display:none;" />
  <s:textfield id="blnEndosso" name="blnEndosso" value="false" cssStyle="display:none;" theme="simple" />
  
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
					<a class="Main_LeftTabsBar_ButtonRight" href="#" onclick="submitForm(document.formLista, '<s:url action='../orcamentoSeguro/displayList.action' includeParams="none"/>', false);">
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
			<td width="2%"><a href="#" onclick="listaFirst();" class="Main_ToolBar_Button" onmouseover="window.status='xxxxxxxxxxxxxxxx';return true;" onmouseout="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonFirst"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_First" id="buttonFirst" title="Primeira Página"/></a></td>
			<td width="2%"><a href="#" onclick="listaPrevious();" class="Main_ToolBar_Button" onmouseover="window.status='Página Anterior';return true;" onmouseout="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonPrevious"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Previous" id="buttonPrevious" title="Página Anterior"/></a></td>
			<td width="2%"><a href="#" onclick="listaNext();" class="Main_ToolBar_Button" onmouseover="window.status='Próxima Página';return true;" onmouseout="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonNext"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Next" id="buttonNext" title="Próxima Página"/></a></td>
			<td width="2%"><a href="#" onclick="listaLast();" class="Main_ToolBar_Button" onmouseover="window.status='Última Página';return true;" onmouseout="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonLast"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Last" id="buttonLast" title="Última Página"/></a></td>
			<td width="1"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_textlabel_bg_left"/></td>
			<td class="Main_ToolBar_textlabel_bg_body">
			  <nobr id="bookmark" class="Main_ToolBar_text_bookmark">
			    <s:property value="firstPosition"/>-<s:property value="lastPosition"/>/<s:property value="listCount"/>
			  </nobr>
			</td>
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
			<td class="FieldGroupTitle_MaxSize">Pesquisa de Cotações</td>
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
	  <td width="18%" class="TitleCell"><label class="LabelText" for="clienteNome">Segurado:</label></td>
	  <td width="32%" class="TextBox_ContentCell">
		<s:textfield theme="simple" id="mostraUltimaLista" name="mostraUltimaLista" cssStyle="display:none;"/>
		<s:textfield theme="simple" id="clienteId" name="orcamentoSearch.cliente.id" cssStyle="display:none;"/>
		<s:textfield theme="simple" id="clienteNome" cssClass="TextBox_100percent_width" name="orcamentoSearch.cliente.nome" onblur="javascript:clearSeguradoId(this.value)"/>
	  </td>
	  <td width="18%" class="TitleCell"><label class="LabelText" for="clienteCpfCnpj">CPF/CNPJ:</label></td>
	  <td width="32%" class="TextBox_ContentCell">
		<s:textfield theme="simple" id="clienteCpfCnpj" cssClass="dojoValidateValid TextBox_100percent_width" name="orcamentoSearch.cliente.cpfOuCnpj" onblur="javascript:clearSeguradoId(this.value)" />
	  </td>
	</tr>
	<tr>
	  <td width="18%" class="TitleCell"><label class="LabelText" for="numeroOrcamento">Nro Orcamento:</label></td>
	  <td width="32%" class="TextBox_ContentCell">
		<s:textfield theme="simple" cssClass="dojoValidateValid" id="numeroOrcamento" name="orcamentoSearch.numero" />
	  </td>
	  <td width="18%" class="TitleCell"><label class="LabelText" for="numeroPlaca">Nro da Placa</label></td>
	  <td width="32%" class="TextBox_ContentCell">
		<s:textfield theme="simple" cssClass="dojoValidateValid" id="numeroPlaca" name="orcamentoSearch.automovelWizCollection[0].nroPlaca" />
	  </td>
	</tr>
	<tr>
	  <td width="18%" class="TitleCell"><label class="LabelText" for="numeroChassi">Nro do Chassi:</label></td>
	  <td width="32%" class="TextBox_ContentCell">
		<s:textfield theme="simple" cssClass="dojoValidateValid" id="numeroChassi" name="orcamentoSearch.automovelWizCollection[0].nroChassis" />
	  </td>
	  <td width="18%" class="TitleCell"><label class="LabelText" for="numeroApolice">Nro da Apólice:</label></td>
	  <td width="32%" class="TextBox_ContentCell">
		<s:textfield theme="simple" cssClass="dojoValidateValid" id="numeroApolice" name="orcamentoSearch.nroApolice" />
	  </td>
	</tr>
	<tr>
      <td width="18%" class="TitleCell"><label class="LabelText" for="paramSeguradoraId">Seguradora:</label></td>
      <td width="32%" class="Combo_ContentCell">
		<s:select theme="simple" cssClass="Combo Combo_TwoCells_width" id="seguradoraId" name="orcamentoSearch.seguradora.id" list="seguradorasList" listKey="id" listValue="nome" headerKey="" headerValue="- Selecione -" />
      </td>
	  <td width="18%" class="TitleCell"><label class="LabelText" for="ramoId">Ramo:</label></td>
	  <td width="32%" class="TextBox_ContentCell">
		<s:select theme="simple" cssClass="Combo Combo_TwoCells_width" id="ramoId" name="orcamentoSearch.ramo.id" list="ramoSubRamoList" listKey="id" listValue="nomeRamoSubRamo" headerKey="" headerValue="- SELECIONE -" />
	  </td>
	</tr>
	<tr>
		<td width="18%" class="TitleCell"><span class="LabelText">Situação: </span></td>
		<td width="32%" class="TextBox_ContentCell">
		  <s:select cssClass="Combo Combo_TwoCells_width" id="situacaoCotacaoId" name="orcamentoSearch.situacao.id" listKey="id" listValue="descricao" list="statusOrcamentoList" headerKey="" headerValue="- SELECIONE -"/>
		</td>
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
			  <s:if test="checarMenuAcaoPrivilegio(menuTrigger.id,'F2-Criar nova')">
			  <td>
				<input type="button" id="btnf3" style="display: none;" />
				<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton"
					   onclick="document.getElementById('btnf3').click()">
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">F2-Criar nova</td>
					<td class="wButton_right"/>
				  </tr>
				</table>
			  </td>
			  </s:if>
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
	<input type="hidden" id="gpOrcamentoId" name="orcamentoSeguro.id" />
	<input type="hidden" id="gpSeguradoraId" name="seguradora.id" />
	<input type="hidden" id="gpRamoId" name="ramo.id" />
	<input type="hidden" id="gpBlnPossuiPerfil" name="orcamentoSeguro.blnPossuiPerfil" />
	<input type="hidden" id="gpTipoCliente" name="tipoCliente" />
	<input type="hidden" id="gpClienteId" name="orcamentoSeguro.cliente.id" />
	<input type="hidden" id="gpGrupoDeVendaId" name="orcamentoSeguro.grupoDeVenda.id" />
	<input type="hidden" id="gpQuantParc" name="orcamentoSeguro.qtdeParcelas" />
	<input type="hidden" id="gpValorDemaisParcelas" name="orcamentoSeguro.valorDemaisParcelas" />
	<input type="hidden" id="gpFormaPagamento" name="orcamentoSeguro.formaPagamento" />
	<input type="hidden" id="gpNroBanco" name="orcamentoSeguro.nroBanco" />
	<input type="hidden" id="gpCodigoAgencia" name="orcamentoSeguro.codigoAgencia" />
	<input type="hidden" id="gpContaCorrente" name="orcamentoSeguro.contaCorrente" />

	<input type="hidden" id="gpDataVencim1aParcela" name="orcamentoSeguro.dataVencim1aParcela" />
	<input type="hidden" id="gpValor1aParcela" name="orcamentoSeguro.valor1aParcela" />
	<input type="hidden" id="gpPremioTotal" name="orcamentoSeguro.premioTotal"/>
	
	<input type="hidden" id="gpBlnEndosso" name="blnEndosso"/>
	<input type="hidden" id="gpBlnRenovacao" name="blnRenovacao"/>
</form>

  <div id="paramOrcamento" style="display:none" >
  <form id="paramFormOrcamento" name="paramFormOrcamento">
    <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>
	<s:textfield id="blnOrcamento" name="blnOrcamento" cssStyle="display:none;"/>
  
	<input id="paramOrcamentoId" type="hidden" name="orcamentoSearch.id"/>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="Main_ContentPane_TabPane" id="tdtopTabs">
		<tr id="paramParentTabContainer">
			<td class="tabBackGroundInit" style="background-color: #505050"></td>
		</tr>
		<tr id="paramMainTabContainer">
		  <td class="tabBackGroundInit" style="background-color: #505050">
			  <span style="color:#FFFFFF; font-size:8pt; font-weight:bold; height:26px !important; padding:0 4px; text-align:center; white-space:nowrap;">
				  Nova Cotação de Seguro
			  </span>
		  </td>
		</tr>
	</table>
  <div align="center" style="border: solid 1px #505050; padding: 10px;" >
  <div id="pessoaFisica">
  <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
  	<td>
  		<label class="LabelText" style="cursor:pointer;" for="pf">Tipo</label>
  		<s:select id="tipoOrcamento" list="tipoPropostaList" theme="simple" name="tipoProposta"/>
  	</td>
  </tr>
  <tr>
    <td colspan="2" class="TitleCell" style="text-align: left">
      <input type="radio" id="pf" name="tipoCliente" value="0" checked="checked" onchange="$('#blnPossuiPerfil').val('true');" />
      <label class="LabelText" style="cursor:pointer;" for="pf">Pessoa Física</label>
    </td>
  </tr>
  <tr>
    <td colspan="2" class="TitleCell" style="text-align: left">
      <input type="radio" id="pj" name="tipoCliente" value="1" onchange="$('#blnPossuiPerfil').val('true');" />
      <label class="LabelText" style="cursor:pointer;" for="pj">Pessoa Jurídica</label>
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
		<input type="button" id="btnf2" style="display: none;" onclick="criarNovaCotacao();"/>
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
		<input type="button" class="modalClose" id="btnf9" style="display: none;" onclick="fechaParamNovaOrcamento();"/>
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
  <div class="panel"></div>
  <p class="flip">Novo Pedido de Orçamento <br /><a href="#" onclick="listaLista();">Atualizar</a></p>
  
</body>
</html>

<script>

function listaLista(){
	if ($('#page').val())
		$('#page').val('0');
	submitFormAjax('#formLista', getContextApp()+'/orcamentoSeguro/listalista.action', '#divResult');
}

function listaNext(){
	submitFormAjax('#formLista', getContextApp()+'/orcamentoSeguro/listanext.action', '#divResult');
}

function listaPrevious(){
	submitFormAjax('#formLista', getContextApp()+'/orcamentoSeguro/listaprevious.action', '#divResult');
}

function listaLast(){
	submitFormAjax('#formLista', getContextApp()+'/orcamentoSeguro/listalast.action', '#divResult');
}

function listaFirst(){
	submitFormAjax('#formLista', getContextApp()+'/orcamentoSeguro/listafirst.action', '#divResult');
}

function excluirOrcamento(){
	if (ConfirmaDisplayList(document.formLista,'excluir')) {
		submitForm(document.formLista, getContextApp()+'/orcamentoSeguro/excluir.action', false);
	}
}

function modalShow (dialog) {
	setTimeout(function(){paramNovaOrcamento();},2000);
}

$(document).ready(function () {
	$('#btnf3').click(function (e) {
		e.preventDefault();
		$('#paramOrcamento').modal({onShow: modalShow, close: false});
	});

});

function paramNovaOrcamento(){
	//document.getElementById('btnf5').disabled=true;
	document.getElementById('btnf2').disabled=false;
// F2
keyActions [0] = {character:  113,	
                  actionType: "code",
                  param:      "executarBotao('btnf2');"};
}

function fechaParamNovaOrcamento(){
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
	MaskInput($('#dataOrcamento').get(0), "99/99/9999");
	MaskInput($('#dataVencim1aParcela').get(0), "99/99/9999");

	$("#clienteNome").autocomplete('<s:url value="/objlookup/getClienteListByNome.action" includeParams="none" />', {idFieldsToUpdate:["#clienteId"],onEnterPress:"listaLista()",mustMatch:0,autoFill:false, width:400,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
	$("#clienteCpfCnpj").autocomplete('<s:url value="/objlookup/getPessoaByCpfOuCnpj.action" includeParams="none" />', {idFieldsToUpdate:["#clienteId"],onEnterPress:"listaLista()",mustMatch:0,autoFill:false, width:400,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});

	addFunctionOnEnterPress(function(event){execOnEnterPress(event, 'listaLista()');}, 'clienteNome'); 
});

function showHideOpcoesNovaOrcamento(){
	//$('#paramTipo').val() == 'NOVA' ? $('#opcoesNovaOrcamento').show() : $('#opcoesNovaOrcamento').hide();
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

function clearSeguradoId(campo){
	if(isEmpty('#clienteCpfCnpj') && isEmpty('#clienteNome')){
		$('#clienteId').val('');
	}
}

if ($('#mostraUltimaLista').val()=='true'){
	document.getElementById('btnf5').click();
	buttonMenuVisibility('buttonMenu', 'show');
	resizeArea(true);
}

$.ajaxPollSettings.pollingType = "timed";
$.ajaxPollSettings.interval = 250;
$.ajaxPollSettings.maxInterval = 5000;
$.ajaxPollSettings.durationUntilMaxInterval = 6000;
var totalOrcamento = 0;
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
</script>
