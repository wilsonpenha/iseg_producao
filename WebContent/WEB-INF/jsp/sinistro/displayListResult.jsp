<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<table width="100%" border="0">
  <tr>
	<td>
	  <table class="FieldGroup" border="0" cellpadding="0" cellspacing="0">
		<tbody>
		  <tr class="FieldGroup_TopMargin"></tr>
			<tr>
			  <td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></td>
			  <td class="FieldGroupTitle">Resultado</td>
			  <td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></td>
			  <td class="FieldGroupContent"></td>
			</tr>
			<tr class="FieldGroup_BottomMargin"></tr>
		  </tbody>
		</table>
	  </td>
	</tr>
</table>
<input type="hidden" name="page" value="${page}">
<input type="hidden" name="listCount" value="${listCount}">
<input id="totalRegistros" type="text" value="<s:property value="firstPosition"/>-<s:property value="lastPosition"/>/<s:property value="listCount"/>" style="display:none;"/>
<table class="tableTag" id="DivTable" width="100%" align="center" border="0" cellpadding="0" cellspacing="0">
	<tr id="linha0" height="20px" bgcolor="#A0CC84"><td width="1%" nowrap="1"><b>&nbsp;</b></td>
	<td width="10%" nowrap="1"><b>Nro Proposta</b><img src="<s:url value="/common/images/asc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '1' ,'aa','1');"><img src="<s:url value="/common/images/desc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '1' ,'ad','1');"></td>
	<td width="10%" nowrap="1"><b>Data Sinistro</b><img src="<s:url value="/common/images/asc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '2' ,'aa','1');"><img src="<s:url value="/common/images/desc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '2' ,'ad','1');"></td>
	<td width="10%" nowrap="1"><b>Data Aviso</b><img src="<s:url value="/common/images/asc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '3' ,'aa','1');"><img src="<s:url value="/common/images/desc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '3' ,'ad','1');"></td>
	<td width="10%" nowrap="1"><b>Nro Sinistro Seg.</b><img src="<s:url value="/common/images/asc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '4' ,'aa','1');"><img src="<s:url value="/common/images/desc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '4' ,'ad','1');"></td>
	<td width="10%" nowrap="1"><b>Nro Apólice</b><img src="<s:url value="/common/images/asc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '5' ,'aa','1');"><img src="<s:url value="/common/images/desc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '5' ,'ad','1');"></td>
	<td width="45%" nowrap="1"><b>Cliente</b><img src="<s:url value="/common/images/asc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '6' ,'aa','1');"><img src="<s:url value="/common/images/desc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '6' ,'ad','1');"></td>
	<td width="25%" nowrap="1"><b>CPF/CNPJ</b><img src="<s:url value="/common/images/asc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '7' ,'aa','1');"><img src="<s:url value="/common/images/desc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '7' ,'ad','1');"></td>
	</tr>
	<s:iterator value="sinistros" status="rowstatus">
		<s:if test="#rowstatus.odd == true">
			<tr id="linha<s:property value="id"/>" style="{cursor: pointer;}" onMouseover="setColorOn('linha<s:property value="id"/>');" onMouseout="setColorOff('linha<s:property value="id"/>');" bgcolor="#EBF3E4">
		</s:if>
		<s:else>
			<tr id="linha<s:property value="id"/>" style="{cursor: pointer;}" onMouseover="setColorOn('linha<s:property value="id"/>');" onMouseout="setColorOff('linha<s:property value="id"/>');" bgcolor="#CBE3BB">
		</s:else>
			<td id="<s:property value="id"/>" >
				<input type="checkbox" class="checkList" id="id" name="id" value="<s:property value="id"/>">
			</td>
			<td id="<s:property value="id"/>" onClick="javascript:var obj = new Object();if (document.all){obj.value=this.innerText.substring(this.innerText.indexOf('|')+1)}else{obj.value=this.textContent.substring(this.textContent.indexOf('|')+1)};document.formLista.elements[elemento_no_formulario2('sinistro.id',document.formLista)].value = obj.value;document.formLista.action='editar.action';document.formLista.submit();"># <fmt:formatNumber value="${proposta.numero}" pattern="00000"/><span style="display: none">|<s:property value="id"/></span></td>
			<td id="<s:property value="id"/>" onClick="javascript:var obj = new Object();if (document.all){obj.value=this.innerText.substring(this.innerText.indexOf('|')+1)}else{obj.value=this.textContent.substring(this.textContent.indexOf('|')+1)};document.formLista.elements[elemento_no_formulario2('sinistro.id',document.formLista)].value = obj.value;document.formLista.action='editar.action';document.formLista.submit();"><s:property value="dataDoSinistro"/><span style="display: none">|<s:property value="id"/></span></td>
			<td id="<s:property value="id"/>" onClick="javascript:var obj = new Object();if (document.all){obj.value=this.innerText.substring(this.innerText.indexOf('|')+1)}else{obj.value=this.textContent.substring(this.textContent.indexOf('|')+1)};document.formLista.elements[elemento_no_formulario2('sinistro.id',document.formLista)].value = obj.value;document.formLista.action='editar.action';document.formLista.submit();"><s:property value="dataDoAviso"/><span style="display: none">|<s:property value="id"/></span></td>
			<td id="<s:property value="id"/>" onClick="javascript:var obj = new Object();if (document.all){obj.value=this.innerText.substring(this.innerText.indexOf('|')+1)}else{obj.value=this.textContent.substring(this.textContent.indexOf('|')+1)};document.formLista.elements[elemento_no_formulario2('sinistro.id',document.formLista)].value = obj.value;document.formLista.action='editar.action';document.formLista.submit();"><s:property value="nroSinistroSeg"/><span style="display: none">|<s:property value="id"/></span></td>
			<td id="<s:property value="id"/>" onClick="javascript:var obj = new Object();if (document.all){obj.value=this.innerText.substring(this.innerText.indexOf('|')+1)}else{obj.value=this.textContent.substring(this.textContent.indexOf('|')+1)};document.formLista.elements[elemento_no_formulario2('sinistro.id',document.formLista)].value = obj.value;document.formLista.action='editar.action';document.formLista.submit();"><s:property value="nroApolice"/><span style="display: none">|<s:property value="id"/></span></td>
			<td id="<s:property value="id"/>" onClick="javascript:var obj = new Object();if (document.all){obj.value=this.innerText.substring(this.innerText.indexOf('|')+1)}else{obj.value=this.textContent.substring(this.textContent.indexOf('|')+1)};document.formLista.elements[elemento_no_formulario2('sinistro.id',document.formLista)].value = obj.value;document.formLista.action='editar.action';document.formLista.submit();"><s:property value="proposta.cliente.nome"/><span style="display: none">|<s:property value="id"/></span></td>
			<td id="<s:property value="id"/>" onClick="javascript:var obj = new Object();if (document.all){obj.value=this.innerText.substring(this.innerText.indexOf('|')+1)}else{obj.value=this.textContent.substring(this.textContent.indexOf('|')+1)};document.formLista.elements[elemento_no_formulario2('sinistro.id',document.formLista)].value = obj.value;document.formLista.action='editar.action';document.formLista.submit();"><s:property value="proposta.cliente.cpfOuCnpj"/><span style="display: none">|<s:property value="id"/></span></td>
		</tr>
	</s:iterator>
	<s:if test="sinistros.isEmpty()"><tr height="20" bgcolor="#CBE3BB"><td colspan="8" style="text-align:center;font-style:italic;">Nenhum registro</td></tr></s:if>
</table>
<s:if test="not sinistros.isEmpty()">
<div align="center" style="padding-top:40px;">
  <table>
	<tr>
	  <td>
		<input type="button" id="btnf9" style="display: none;" onclick="excluirSinistro();"/>
		<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton"
			   onclick="$('#btnf9').click();">
		  <tr>
			<td class="wButton_left"></td>
			<td class="wButton_text wButton_width">F9-Excluir</td>
			<td class="wButton_right"/>
		  </tr>
		</table>
	  </td>
	</tr>
  </table>
</div>
</s:if>
<script type="text/javascript">
    document.getElementById("linha0").focus();
	showCount();

</script>