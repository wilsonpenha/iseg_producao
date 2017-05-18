<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page language="java" import="java.util.*" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<link rel="stylesheet" href="<s:url value="/common/wizardFinal/esquema.css" includeParams="none"/>" type="text/css" />
<link rel="stylesheet" type="text/css" href="<s:url value="/common/jquery.autocomplete.css" includeParams="none"/>"></link>           
<link rel="stylesheet" type="text/css" href="<s:url value="/common/styles/loader/loader.css" includeParams="none"/>"></link>
<link rel="stylesheet" type="text/css" href="<s:url value="/common/web/skins/Default/Main/Main_Edition.css" includeParams="none" />" id="paramCSS"></link>

<s:url action="lista" id="descrsUrl"/>

<input type="hidden" name="produtor.id">
<table>
  <tr>
	<td colspan="4">
	  <input type="button" id="btnf3" style="display: none"/>
	  <div id="divMessages" style="padding-bottom: 10px;">
		<s:actionerror/>
		<s:actionmessage/>
		<s:fielderror/>
	  </div>
	</td>
  </tr>
</table>
<table class="tableTag" id="DivTable" width="100%" align="center" border="0" cellpadding="0" cellspacing="0">
    <tr class="tableTag_row" id="linha-1" style="{cursor:hand}" bgcolor="#A0CC84"><td id="" width="1%" nowrap="1"><b>&nbsp;</b></td>
       <td class="tableTag_cell" id="" width="20%" nowrap="1"><b>Nome</b><img src="../common/images/asc.gif" onclick="TableSortWait('DivTable', '1' ,'aa','1');"><img src="../common/images/desc.gif" onclick="TableSortWait('DivTable', '1' ,'ad','1');"></td>       <td class="tableTag_cell" id="" width="20%" nowrap="1"><b>Apelido</b><img src="../common/images/asc.gif" onclick="TableSortWait('DivTable', '1' ,'aa','1');"><img src="../common/images/desc.gif" onclick="TableSortWait('DivTable', '1' ,'ad','1');"></td>       
    </tr>
    <s:if test="list.size > 0">
    	<s:iterator value="list" status="rowstatus">
	    <s:if test="#rowstatus.odd == true">
 	        <tr class="tableTag_row" id="linha<s:property value="id"/>" onMouseover="setColorOn('linha<s:property value="id"/>');" onMouseout="setColorOff('linha<s:property value="id"/>');" bgcolor="#EBF3E4"></s:if>
	    <s:else>
	        <tr class="tableTag_row" id="linha<s:property value="id"/>" onMouseover="setColorOn('linha<s:property value="id"/>');" onMouseout="setColorOff('linha<s:property value="id"/>');" bgcolor="#CBE3BB">
	    </s:else>
	    <td class="tableTag_cell" id="<s:property value="id"/>" width="1%" >
	        <input type="checkbox" class="checkList" name="id" value="<s:property value="id"/>">
	    </td>
	    <td class="tableTag_cell" id="<s:property value="id"/>" onClick="javascript:var obj = new Object();if (document.all){obj.value=this.innerText.substring(this.innerText.indexOf('|')+1)}else{obj.value=this.textContent.substring(this.textContent.indexOf('|')+1)};document.formLista.elements[elemento_no_formulario2('produtor.id',document.formLista)].value = obj.value;document.formLista.action='editar.action';document.formLista.submit();"><s:property value="pessoa.nome"/><span style="display: none">|<s:property value="id"/></span></td>            <td class="tableTag_cell" id="<s:property value="id"/>" onClick="javascript:var obj = new Object();if (document.all){obj.value=this.innerText.substring(this.innerText.indexOf('|')+1)}else{obj.value=this.textContent.substring(this.textContent.indexOf('|')+1)};document.formLista.elements[elemento_no_formulario2('produtor.id',document.formLista)].value = obj.value;document.formLista.action='editar.action';document.formLista.submit();"><s:property value="apelido"/><span style="display: none">|<s:property value="id"/></span></td>            
	    </tr>
	</s:iterator>
    </s:if>
</table>
</form>

<div id="paramProdutor" style="display:none" >
  <form id="paramFormProdutor" name="paramFormProdutor">
    <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>
  
	<input type="hidden" name="produtor.id">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="Main_ContentPane_TabPane" id="tdtopTabs">
		<tr id="paramParentTabContainer">
			<td class="tabBackGroundInit" style="background-color: #505050"></td>
		</tr>
		<tr id="paramMainTabContainer">
		  <td class="tabBackGroundInit" style="background-color: #505050">
			  <span style="color:#FFFFFF; font-size:8pt; font-weight:bold; height:26px !important; padding:0 4px; text-align:center; white-space:nowrap;">
				  Novo Produtor
			  </span>
		  </td>
		</tr>
	</table>
  <div align="center" style="border: solid 1px #505050; padding: 10px;" >
  <div id="pessoaFisica">
  <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2" class="TitleCell" style="text-align: left">
      <input type="radio" id="pf" name="tipoClienteSN" value="0" checked="checked" />
      <label class="LabelText" style="cursor:pointer;" for="pf">Pessoa Física</label>
    </td>
  </tr>
  </table>
  </div>
  <div id="pessoaJuridicaComPerfil">
  <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2" class="TitleCell" style="text-align: left">
      <input type="radio" id="pjComPerfil" name="tipoClienteSN" value="1" />
      <label class="LabelText" style="cursor:pointer;" for="pjComPerfil">Pessoa Jurídica</label>
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
		<input type="button" id="btnf2" style="display: none;" onclick="submitForm(document.paramFormProdutor, '<s:url action="novo.action" includeParams="none" />', false);"/>
  		<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton"
		onclick="document.getElementById('btnf2').click()">
		<tr>
            <td class="wButton_left"></td>
            <td class="wButton_text wButton_width" > OK </td>
            <td class="wButton_right"/>
        </tr>
    </table></div>
    </td>
  	<td><div align="center">
		<input type="button" class="modalClose" id="btnf9" style="display: none;"/>
  		<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton"
		onclick="document.getElementById('btnf9').click()">
		<tr>
            <td class="wButton_left"></td>
            <td class="wButton_text wButton_width">Cancelar</td>
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
		$('#paramProdutor').modal({onShow: modalShow, close: false});
	});

});

function modalShow (dialog) {
//	setTimeout(function(){paramNovaProposta();},2000);
}


</script>

