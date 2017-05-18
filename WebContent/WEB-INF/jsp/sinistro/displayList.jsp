<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xml:lang="en" xmlns="http://www.w3.org/1999/xhtml" lang="en">

<head>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<title>Sinistro Passo-a-Passo</title>

<head>
<meta name="GENERATOR" content="JXEd 1.0">
<meta name="ProgId" content="JXEd.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />

<script language="javascript" charset="UTF-8" src="<s:url value="/common/TableSort.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/geral.js?v=0"     includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/confirm.js?v=0"   includeParams="none"/>"></script>

<link rel="stylesheet" href="<s:url value="/common/sinistro/tab-panel.css" includeParams="none"/>" type="text/css" />
<link rel="stylesheet" href="<s:url value="/common/sinistro/tabpane-ob.css" includeParams="none"/>" type="text/css" />
<link rel="stylesheet" href="<s:url value="/common/sinistro/esquema.css" includeParams="none"/>" type="text/css" />
<link rel="stylesheet" type="text/css" href="<s:url value="/common/jquery.autocomplete.css" includeParams="none"/>"></link>
<link rel="stylesheet" type="text/css" href="<s:url value="/common/web/skins/Default/Main/Main_Edition.css" includeParams="none" />" id="paramCSS"></link>
<link rel="stylesheet" type="text/css" href="<s:url value="/common/styles/loader/loader.css" includeParams="none"/>"></link>

<script language="javascript" charset="UTF-8" src="<s:url value="/js/sinistro/script.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/js/sinistro/hotkeys.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/sinistro/tab-panel.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/sinistro/tabpane.js?v=0" includeParams="none"/>"></script>
<script language="javascript" src="<s:url value="/common/jquery-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" src="<s:url value="/common/jquery-form.js?v=0" includeParams="none"/>"></script>
<script language="javascript" src="<s:url value="/common/jquery.autocomplete-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" src="<s:url value="/common/common-pack.js?v=3" includeParams="none"/>" includeParams="none"/>"></script>
<script language="javascript" src="<s:url value="/common/is-date.js?v=0" includeParams="none"/>"></script>
<script language="javascript" src="<s:url value="/common/event.js?v=0" includeParams="none"/>"></script>
<script language="javascript" src="<s:url value="/common/masked-input.js?v=0" includeParams="none"/>"></script>
<script language="javaScript" src="<s:url value="/common/web/js/utils-pack.js?v=0" includeParams="none"/>"></script>

<script language="javascript" src="<s:url value="/common/xbLibrary.js?v=0" includeParams="none"/>"></script>
<script language="javascript" src="<s:url value="/common/xbDebug.js?v=0" includeParams="none"/>"></script>
<script language="javascript" src="<s:url value="/common/xbDOM.js?v=0" includeParams="none"/>"></script>
<script language="javascript" src="<s:url value="/common/xbStyle.js?v=0" includeParams="none"/>"></script>
<script language="javascript" src="<s:url value="/common/xbStyle-css.js?v=0" includeParams="none"/>"></script>

<script src="<s:url value="/common/jquery.simplemodal-1.1.1.js?v=0" includeParams="none"/>" type='text/javascript'></script>
<script type="text/javascript">defineContext('<s:url value="/" includeParams="none"/>');</script>

<script language="javascript">

var selected = false;
var alterado = false;

// Define as PF's no Wizard
// F2
keyActions [0] = {character:  113,
				  actionType: "code",
				  param:      "executarBotao('btnf2');"};
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
  <input id="sinistroId" type="hidden" name="sinistro.id">
  
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
					  <img class="Main_LeftTabsBar_ButtonLeft_Icon Main_LeftTabsBar_ButtonLeft_Icon_arrow_hide" src="<s:url value="/common/web/images/blank.gif" />" border="0" id="buttonMenu"></IMG>
					</a>
				  </td>
				</tr>
				<tr>
				  <td class="Main_LeftTabsBar_bg_separator_cell"></td>
				</tr>
				<tr>
				  <td>
					<div class="Main_LeftTabsBar_ButtonRight_selected">
					  <img class="Main_LeftTabsBar_ButtonRight_Icon Main_LeftTabsBar_ButtonRight_Icon_edition_selected" src="<s:url value="/common/web/images/blank.gif" />" border="0"></IMG>
					</div>
				  </td>
				</tr>
				<tr>
				  <td>
					<a class="Main_LeftTabsBar_ButtonRight" href="#" onClick="submitForm(document.formLista, '<s:url action='displayList.action' includeParams="none"/>', false);">
					  <img class="Main_LeftTabsBar_ButtonRight_Icon Main_LeftTabsBar_ButtonRight_Icon_relation" src="<s:url value="/common/web/images/blank.gif" />" border="0"></IMG>
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
				<a class="Main_NavBar_LeftButton" href="#" onClick="" border="0" onmouseover="window.status='Reload Current Page';return true;" onmouseout="window.status='';return true;"><img src="<s:url value="/common/web/images/blank.gif" />" class="Main_NavBar_LeftButton_Icon Main_NavBar_LeftButton_Icon_refresh" border="0" alt="Reload Current Page" title="Reload Current Page"></a>
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
        <DIV class="Main_ContentPane_ToolBar" id="paramToolBar">
          <table class="Main_ContentPane_ToolBar Main_ToolBar_bg" id="tdToolBar">
            <tr>
			<td width="2%" ><a href="#" onClick="" class="Main_ToolBar_Button" onMouseOver="window.status='Anexar Arquivo';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonAttachment"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Attachment" id="buttonAttachment" title="Anexar Arquivo"></a></td>
			<td width="2%" ><a href="#" onClick="" class="Main_ToolBar_Button" onMouseOver="window.status='Exportar p/ Excel';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonExportExcel"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_ExportExcel" id="buttonExportExcel" title="Exportar p/ Excel"></a></td>
			<td width="2%" ><a href="#" onClick="" class="Main_ToolBar_Button" onMouseOver="window.status='Exportar p/ CSV';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonExportCsv"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_ExportCsv" id="buttonExportCsv" title="Exportar p/ CSV"></a></td>
			<td width="2%" ><a href="#" onClick="" class="Main_ToolBar_Button" onMouseOver="window.status='Exportar p/ PDF';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonExportPDF"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_ExportPDF" id="buttonExportPDF" title="Exportar p/ PDF"></a></td>
			<td width="2%" ><a href="#" onClick="" class="Main_ToolBar_Button" onMouseOver="window.status='Efetuar uma Busca';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonSearch"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Search" id="buttonSearch" title="Efetuar uma Busca"></a></td>
			<td class="Main_ToolBar_Separator_cell" ><IMG src="<s:url value="/common/web/images/blank.gif" />" class="Main_ToolBar_Separator"></td>
			<td width="2%"><a href="#" onClick="listaFirst();" onmouseup="setTimeout('showCount()',500);" class="Main_ToolBar_Button" onMouseOver="window.status='xxxxxxxxxxxxxxxx';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonFirst"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_First" id="buttonFirst" title="Primeira Página"></a></td>
			<td width="2%" ><a href="#" onClick="listaPrevious();" onmouseup="setTimeout('showCount()',500);" class="Main_ToolBar_Button" onMouseOver="window.status='Página Anterior';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonPrevious"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Previous" id="buttonPrevious" title="Página Anterior"></a></td>
			<td width="2%" ><a href="#" onClick="listaNext();" onmouseup="setTimeout('showCount()',500);" class="Main_ToolBar_Button" onMouseOver="window.status='Próxima Página';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonNext"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Next" id="buttonNext" title="Próxima Página"></a></td>
			<td width="2%" ><a href="#" onClick="listaLast();" onmouseup="setTimeout('showCount()',500);" class="Main_ToolBar_Button" onMouseOver="window.status='Última Página';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonLast"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Last" id="buttonLast" title="Última Página"></a></td>
			<td width="1"><IMG src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_textlabel_bg_left"></td>
			<td class="Main_ToolBar_textlabel_bg_body"><nobr id="bookmark" class="Main_ToolBar_text_bookmark"><s:property value="firstPosition"/>-<s:property value="lastPosition"/>/<s:property value="listCount"/></nobr></td>
			<td width="1"><IMG src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_textlabel_bg_right"></td>
			<td class="Main_ToolBar_Separator_cell" ><IMG src="<s:url value="/common/web/images/blank.gif" />" class="Main_ToolBar_Separator"></td>
			<td class="Main_ToolBar_Space"></td>
			<!--  
			<td width="1"><IMG src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_textlabel_bg_left"></td>
			<td class="Main_ToolBar_textlabel_bg_body"><a class="Main_ToolBar_text_relatedinfo" href="#" onclick="">Linked Items</a></td>
			<td class="Main_ToolBar_textlabel_bg_right" width="2%" ><a href="#" onClick="" class="Main_ToolBar_Button" onMouseOver="window.status='Linked Items';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonRelatedInfo"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_RelatedInfo" id="buttonRelatedInfo" title="Linked Items"></a></td>
	        -->
	            </tr>
          </table>
        </DIV>
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
			<td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></td>
			<td class="FieldGroupTitle_MaxSize">Pesquisa de Sinistros</td>
			<td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></td>
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
	  <td width="18%" class="TitleCell"><label class="LabelText" for="dataSinistro">Data do Sinistro</label></td>
	  <td width="32%" class="TextBox_ContentCell" >
		<s:textfield theme="simple" cssClass="dojoValidateValid" id="dataDoSinistro" name="sinistroSearch.dataDoSinistro" onblur="isValidDate(this)" size="10" />
	  </td>
	  <td width="18%" class="TitleCell"><label class="LabelText" for="numeroSinistro">Nro da Sinistro</label></td>
	  <td width="32%" class="TextBox_ContentCell">
		<s:textfield theme="simple" cssClass="dojoValidateValid" id="numeroSinistro" name="sinistroSearch.nroSinistroSeg" maxlength="20" />
	  </td>
	</tr>
	<tr>
	  <td width="18%" class="TitleCell"><label class="LabelText" for="clienteNome">Cliente</label></td>
	  <td width="32%" class="TextBox_ContentCell">
		<s:textfield theme="simple" id="clienteId" name="sinistroSearch.proposta.cliente.id" cssStyle="display:none;"/>
		<s:textfield theme="simple" id="clienteNome" cssClass="dojoValidateValid TextBox_100percent_width" name="sinistroSearch.proposta.cliente.nome" />
	  </td>
	  <td width="18%" class="TitleCell"><label class="LabelText" for="clienteCpf">CPF</label></td>
	  <td width="32%" class="TextBox_ContentCell">
		<s:textfield theme="simple" id="clienteCpf" cssClass="dojoValidateValid TextBox_100percent_width" name="sinistroSearch.proposta.cliente.cpfOuCnpj" />
	  </td>
	</tr>
	<tr>
	  <td width="18%" class="TitleCell"><label class="LabelText" for="dataDoAviso">Data Do Aviso</label></td>
	  <td width="32%" class="TextBox_ContentCell">
		<s:textfield theme="simple" cssClass="dojoValidateValid" id="dataVencim1aParcela" name="sinistroSearch.dataDoAviso" onblur="isValidDate(this)" size="10" />
	  </td>
	  <td class="TitleCell"><span class="LabelText">Seguradora</span></td>
	  <td class="Combo_ContentCell">
		<s:select theme="simple" cssClass="ComboKeyNoUpdatable Combo_TwoCells_width" id="seguradoraId" name="sinistroSearch.proposta.seguradora.id" list="seguradoraList" listKey="id" listValue="nome" headerKey="" headerValue="-- Selecione --" />
	  </td>
	</tr>
	<tr>
	  <td width="18%" class="TitleCell"><label class="LabelText" for="nroApolice">Nro da Apólice</label></td>
	  <td width="32%" class="TextBox_ContentCell">
		<s:textfield theme="simple" cssClass="dojoValidateValid" id="nroApolice" name="sinistroSearch.nroApolice" maxlength="20" />
	  </td>
	  <td class="TitleCell"><span class="LabelText">Ramo</span></td>
	  <td class="Combo_ContentCell">
		<s:select theme="simple" cssClass="ComboKeyNoUpdatable Combo_TwoCells_width" id="ramoId" name="sinistroSearch.proposta.ramo.id" list="ramoSubRamoList" listKey="id" listValue="nomeRamoSubRamo" headerKey="" headerValue="-- Selecione --" />
	  </td>
	</tr>
	<tr>
	  <td width="18%" class="TitleCell"><label class="LabelText" for="nroApolice">Nro da Proposta</label></td>
	  <td width="32%" class="TextBox_ContentCell">
		<s:textfield theme="simple" cssClass="dojoValidateValid" id="nroApolice" name="sinistroSearch.nroProposta" maxlength="20" />
	  </td>
	  <td class="TitleCell">&nbsp;</td>
	  <td class="Combo_ContentCell">
		&nbsp;
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
			  <td>
	 		    <input type="button" id="btnf2" style="display: none;" onclick="criarNova();"/>
				<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton"
					   onclick="document.getElementById('btnf2').click()">
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">F2-Criar novo</td>
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
  <div id="divResult"></div>
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
			<td class="Main_Bottom_bg"><img src="<s:url value="/common/web/images/blank.gif" includeParams="none" />" border="0"></IMG></td>
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

<script>

$(document).ready(function () {
	listaLista();
});

function listaLista(){
	submitFormAjax('#formLista', '<s:url action="/listalista.action" includeParams="none"/>', '#divResult');
}

function listaNext(){
	submitFormAjax('#formLista', '<s:url action="/listanext.action" includeParams="none"/>', '#divResult');
}

function listaPrevious(){
	submitFormAjax('#formLista', '<s:url action="/listaprevious.action" includeParams="none"/>', '#divResult');
}

function listaLast(){
	submitFormAjax('#formLista', '<s:url action="/listalast.action" includeParams="none"/>', '#divResult');
}

function listaFirst(){
	submitFormAjax('#formLista', '<s:url action="/listafirst.action" includeParams="none"/>', '#divResult');
}

function excluirSinistro(){
	if (ConfirmaDisplayList(document.formLista,'excluir')) {
		submitFormAjax('#formLista', '<s:url action="/excluir.action" includeParams="none"/>', '#divResult');
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

window.onresize = function(){init();}

jQuery(document).ready(function(){

	MaskInput($('#dataDoSinistro')[0], "99/99/9999");
	MaskInput($('#dataDoAviso')[0], "99/99/9999");

	$("#clienteNome").autocomplete('<s:url value="/objlookup/getClienteListByNome.action" includeParams="none" />', {idFieldsToUpdate:["#clienteId"],onEnterPress:"listaLista()",mustMatch:0});
	$("#clienteCpf").autocomplete('<s:url value="/objlookup/getClienteListByCpf.action" includeParams="none" />', {idFieldsToUpdate:["#clienteId"],onEnterPress:"listaLista()",mustMatch:0});

	addFunctionOnEnterPress(function(event){execOnEnterPress(event, 'listaLista()');}, 'clienteNome');
});

function criarNova(){
	submitForm(document.formLista, '<s:url namespace="/preSinistro" action="pesquisaPropostaForm.action" includeParams="none" />', false);
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
</script>
