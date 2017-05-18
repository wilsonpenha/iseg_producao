<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	request.setAttribute("decorator", "none");
	response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.setHeader("Pragma","no-cache"); //HTTP 1.0
	response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
try {
%>

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
      <s:select theme="simple" cssStyle="width: 100%" tabindex="0" id="paramTipo" name="tipoProposta" list="tipoPropostaList" onchange="showHideOpcoesNovaProposta();" onkeyup="showHideOpcoesNovaProposta();" />
    </td>
  </tr>
  </table>
  <table id="opcoesNovaProposta" width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="50%" class="TitleCell" style="text-align: left"><label class="LabelText" for="paramRamoId">Ramo</label></td>
    <td width="50%">
    	<s:select theme="simple" cssStyle="width: 100%" tabindex="0" id="paramRamoId" name="ramo.id" list="ramoList" listKey="id" listValue="nome" headerKey="" headerValue="-- Selecione --" onchange="carregaSeguradoras();"/>
    </td>
  </tr>
  <tr>
  <td colspan="2">
  <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="50%" class="TitleCell" style="text-align: left"><label class="LabelText" for="paramSubRamoId">Sub-Ramo</label></td>
    <td width="50%">
	    <div id="divRamos"><s:select theme="simple" disabled="true" cssStyle="width: 100%" tabindex="0" id="paramSubRamoId" name="ramo.id" list="{}" listKey="{}" headerKey="" headerValue="-- Selecione --" onchange="carregaSeguradoras();"/>
	    </div>
    </td>
  </tr>
  </table>
  </td> 
  </tr>
  <tr>
    <td width="50%" class="TitleCell" style="text-align: left"><label class="LabelText" for="paramSeguradoraId">Seguradora</label></td>
    <td width="50%"><div id="divSeguradoras"><s:select theme="simple" cssStyle="width: 100%" tabindex="0" id="paramSeguradoraId" name="seguradora.id" list="{}" listKey="{}" headerKey="" headerValue="-- Selecione --" /></div></td>
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
		<input type="button" id="btnf2" style="display: none;" onclick="fechaParamNovaProposta();criarNova();"/>
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

function paramNovaProposta(){
	carregaSeguradoras();
	formNavigateAlterado = false;
	document.getElementById("paramSeguradoraId").focus();
	document.getElementById('btnf3').disabled=true;
	if (document.getElementById('btnf4'))
		document.getElementById('btnf4').disabled=true;
	document.getElementById('btnf5').disabled=true;
	document.getElementById('btnf6').disabled=true;
	if (document.getElementById('btnf7'))
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
	if (document.getElementById('btnf4'))
		document.getElementById('btnf4').disabled=false;
	document.getElementById('btnf5').disabled=false;
	document.getElementById('btnf6').disabled=false;
	if (document.getElementById('btnf7'))
		document.getElementById('btnf7').disabled=false;
	document.getElementById('btnf8').disabled=false;
	document.getElementById('btnf11').disabled=false;
	// F2
	keyActions [0] = {character:  113,	
	                  actionType: "code",
	                  param:      "executarBotao('btnf14');"};
}

</script>
<% } catch (Exception e) {e.printStackTrace();}%>