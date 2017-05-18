<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	request.setAttribute("decorator", "none");
	response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.setHeader("Pragma","no-cache"); //HTTP 1.0
	response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
try {
%>

<div id="paramEndosso" style="display:none" >
  <form id="paramFormEndosso" name="paramFormEndosso">
    <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>
  
	<s:textfield theme="simple" id="currentTabId" name="currentTab" cssStyle="display:none;" />
    <s:textfield theme="simple" id="propostaId" name="proposta.id" cssStyle="display:none"/>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="Main_ContentPane_TabPane" id="tdtopTabs">
	<tr>
	  <td colspan="2">
		<table width="100%" class="FieldGroup" border="0" cellpadding="0" cellspacing="0">
		  <tbody>
		  <tr class="FieldGroup_TopMargin"></tr>
		  <tr>
			<td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"/></td>
			<td class="FieldGroupTitle_MaxSize">Alteração/Endosso</td>
			<td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"/></td>
		  </tr>
		  <tr class="FieldGroup_BottomMargin"></tr>
		  </tbody>
		</table>
	  </td>
	</tr>
	</table>
  <fieldset>
  <legend accesskey="V"><b>Opções de alteração/endosso</b></legend>
  <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2">
      <s:textfield id="blnEndosso" name="blnEndosso" value="true" cssStyle="display:none;" theme="simple" />
    </td>
  </tr>
  <s:if test="temPedidoDeEndosso">
  <tr>
    <td colspan="2" class="TitleCell" style="text-align: left">
      <label class="LabelText" style="cursor:pointer;">Este Pedido possui PEDIDO DE ENDOSSO em aberto</label>
    </td>
  </tr>
  </s:if>
  <tr>
    <td colspan="2" class="TitleCell" style="text-align: left">
      <input type="radio" id="operacaoM" name="operacao" value="0" checked="checked" onclick="setEndosso(this);" />
      <label class="LabelText" style="cursor:pointer;" for="pf">Editar Pedido</label>
    </td>
  </tr>
  <s:if test="(proposta.statusOperacional == 9 || proposta.statusOperacional == 10) && proposta.situacaoOperacional == 0">
  <tr>
    <td colspan="2" class="TitleCell" style="text-align: left">
      <input type="radio" id="operacaoM" name="operacao" value="5" onclick="setEndosso(this);" />
      <label class="LabelText" style="cursor:pointer;" for="pf">Cancelar Endosso de Cancelamento</label>
    </td>
  </tr>
  </s:if>
  <s:if test="(proposta.statusOperacional == 2 || proposta.statusOperacional == 4) && proposta.situacaoOperacional == 0">
  <tr>
    <td colspan="2" class="TitleCell" style="text-align: left">
      <input type="radio" id="operacaoM" name="operacao" value="1" onclick="setEndosso(this);" />
      <label class="LabelText" style="cursor:pointer;" for="pf">Cancelar Pedido/Apólice</label>
    </td>
  </tr>
  </s:if>
  <s:if test="(proposta.statusOperacional == 1 || proposta.statusOperacional == 51 || proposta.statusOperacional == 81) && proposta.situacaoOperacional == 0">
  <tr>
    <td colspan="2" class="TitleCell" style="text-align: left">
      <input type="radio" id="operacaoM" name="operacao" value="6" onclick="setEndosso(this);" />
      <label class="LabelText" style="cursor:pointer;" for="pf">Cancelar Validação de Pedido</label>
    </td>
  </tr>
  </s:if>
  <s:if test="(proposta.statusOperacional == 6 || proposta.statusOperacional == 7 || proposta.statusOperacional == 9 || proposta.statusOperacional == 10) && proposta.situacaoOperacional == 0">
  <tr>
    <td colspan="2" class="TitleCell" style="text-align: left">
      <input type="radio" id="operacaoM" name="operacao" value="4" onclick="setEndosso(this);" />
      <label class="LabelText" style="cursor:pointer;" for="pf">Cancelar um Endosso</label>
    </td>
  </tr>
  </s:if>
  <s:if test="(proposta.statusOperacional == 2 || proposta.statusOperacional == 4 || proposta.statusOperacional == 6 || proposta.statusOperacional == 7) && !temPedidoDeEndosso && proposta.situacaoOperacional == 0">
  <tr>
    <td colspan="2" class="TitleCell" style="text-align: left">
      <input type="radio" id="operacaoM" name="operacao" value="2" onclick="setEndosso(this);" />
      <label class="LabelText" style="cursor:pointer;" for="pf">Endosso Cancelamento</label>
    </td>
  </tr>
  <tr>
    <td colspan="2" class="TitleCell" style="text-align: left">
      <input type="radio" id="operacaoM" name="operacao" value="3" onclick="setEndosso(this);" />
      <label class="LabelText" style="cursor:pointer;" for="pf">Endosso Alteração</label>
    </td>
  </tr>
  <tr>
    <td colspan="2" class="TitleCell" style="text-align: left">
    <div id="divEndosso" style="display: none">
	<fieldset>
	<legend accesskey="V"><b>Dados a serem alterados</b></legend>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="Main_ContentPane_TabPane" id="tdtopTabs">
	  <tr>
	    <td width="50%" class="TitleCell" style="text-align: left"><label class="LabelText" for="paramRamoId">Tipo do Endosso</label></td>
	    <td width="50%">
	    	<s:select theme="simple" cssStyle="width: 100%" tabindex="0" id="tipoEndosso" name="tipoEndosso" list="endossoList" listKey="id" listValue="nome" headerKey="" headerValue="-- Selecione --" onchange="$('#tipoEndosso').val(this.value)"/>
	    </td>
	  </tr>
<!-- 	  <tr>
	    <td colspan="2" class="TitleCell" style="text-align: left">
	      <input type="checkbox" class="checkList" id="dadosCadastro" name="dados" value="true">      
	      <label class="LabelText" style="cursor:pointer;" for="dadosCadastro">Dados Cadastrais</label>
	    </td>
	  </tr>
    <s:if test="proposta.ramo.id == ramoAutomovel">
	  <tr>
	    <td colspan="2" class="TitleCell" style="text-align: left">
	      <input type="checkbox" class="checkList" id="dadosCondutor" name="dados" value="true">      
	      <label class="LabelText" style="cursor:pointer;" for="dadosCondutor">Dados Condutor</label>
	    </td>
	  </tr>
	</s:if>
	  <tr>
	    <td colspan="2" class="TitleCell" style="text-align: left">
	      <input type="checkbox" class="checkList" id="dadosRisco" name="dados" value="true">      
	      <label class="LabelText" style="cursor:pointer;" for="dadosRisco">Risco/Coberturas/Pêemios</label>
	    </td>
	  </tr> -->
	</table>
	</fieldset>
	</div>
    </td>
   </tr>
   </s:if>
  </table>
  </fieldset>
  <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2" class="TitleCell" style="text-align: left">&nbsp;</td>
  </tr>
  <tr> 
  	<td><div align="center">
		<input type="button" id="btnf15" style="display: none;" onclick="fechaParamEndosso();executarAcao();"/>
  		<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton"
		onclick="document.getElementById('btnf15').click()">
		<tr>
            <td class="wButton_left"></td>
            <td class="wButton_text wButton_width" >F2-Confirmar</td>
            <td class="wButton_right"/>
        </tr>
    </table></div>
    </td>
  	<td><div align="center">
		<input type="button" class="modalClose" id="btnf9" style="display: none;" onclick="fechaParamEndosso();"/>
  		<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton"
		onclick="document.getElementById('btnf9').click()">
		<tr>
            <td class="wButton_left"></td>
            <td class="wButton_text wButton_width">F9-Cancelar</td>
            <td class="wButton_right" />
        </tr>
    </table></div>
    <input type="button" id="btnf11" style="display: none;" onclick="mostrarMenu('buttonMenu');setTimeout('init()',300);return false;"/>
    </td>
    </tr>
  </table>
  </form>
  </div>
  
<script>
 
function paramEndosso(){
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
	                  param:      "executarBotao('btnf15');"};

}

function fechaParamEndosso(){
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

function setEndosso(op){
	if (op.value == '3')
		$('#divEndosso').show();
	else
		$('#divEndosso').hide(); 
}

function executarAcao(){
	for (var i=0; i < $('[name=operacao]').length; i++) {
		if ($('[name=operacao]')[i].checked && $('[name=operacao]')[i].value=='3') {
			if (confirm('Confirme sua opção de ENDOSSAR esta proposta?')){
				$('#operacao').val($('[name=operacao]')[i].value);
				endossar();
			}
		}else if ($('[name=operacao]')[i].checked && $('[name=operacao]')[i].value=='2') {
			if (confirm('Confirme sua opção de ENDOSSO DE CANCELAMENTO para esta proposta?')){
				$('#operacao').val($('[name=operacao]')[i].value);
				endossar();
			}
		}else if ($('[name=operacao]')[i].checked && $('[name=operacao]')[i].value=='6') {
			if (confirm('Confirme sua opção de CANCELAMENTO da validação do Pedido?')){
				$('#operacao').val($('[name=operacao]')[i].value);
				endossar();
			}
		}else if ($('[name=operacao]')[i].checked && $('[name=operacao]')[i].value=='4') {
			if (confirm('Confirme sua opção de CANCELAR ESTE ENDOSSO de proposta?')){
				$('#operacao').val($('[name=operacao]')[i].value);
				endossar();
			}
		}else if ($('[name=operacao]')[i].checked && $('[name=operacao]')[i].value=='5') {
			if (confirm('Confirme sua opção de CANCELAR ENDOSSO DE CANCELAMENTO de proposta? Esta opção irá retornar a proposta ao ultimo status!')){
				$('#operacao').val($('[name=operacao]')[i].value);
				endossar();
			}
		}else if ($('[name=operacao]')[i].checked && $('[name=operacao]')[i].value=='1') {
			if (confirm('Confirme sua opção de CANCELAR esta proposta?')){
				$('#operacao').val($('[name=operacao]')[i].value);
				endossar();
			}
		}else if ($('[name=operacao]')[i].checked && $('[name=operacao]')[i].value=='0'){
			editar();
		}
	}
}

function editar(){
	document.getElementById('btnf9').click();
	editavel = true;
    
	$('.div_overlay').remove();

	$('#divButtonNew').show();
	$('#divButtonDelete').show();
	//$('#dadosApolice').readonly(true);
}
function endossar(){
    submitForm(document.paramFormEndosso, getContextApp()+'/proposta/endossoRenovacao.action', false);
}
function endossoCancelamento(){
    submitForm(document.paramFormEndosso, getContextApp()+'/proposta/endossoRenovacao.action', false);
}
</script>
<% } catch (Exception e) {e.printStackTrace();}%>