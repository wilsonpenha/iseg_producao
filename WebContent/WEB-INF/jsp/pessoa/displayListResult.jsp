<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8"%>
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
<input type="hidden" id="page" name="page" value="${page}">
<input type="hidden" name="listCount" value="${listCount}">
<input id="totalRegistros" type="text" value="<s:property value="firstPosition"/>-<s:property value="lastPosition"/>/<s:property value="listCount"/>" style="display:none;"/>
<table class="tableTag" id="DivTable" width="100%" align="center" border="0" cellpadding="0" cellspacing="0">
	<tr height="20px" bgcolor="#A0CC84"><td id="" width="1%" nowrap="1"><b>&nbsp;</b></td>
	<td width="50%" nowrap="1"><b>Nome</b><img src="<s:url value="/common/images/asc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '1' ,'aa','1');"><img src="<s:url value="/common/images/desc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '1' ,'ad','1');"></td>
	<td width="50%" nowrap="1"><b>CPF/CNPJ</b><img src="<s:url value="/common/images/asc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '2' ,'aa','1');"><img src="<s:url value="/common/images/desc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '2' ,'ad','1');"></td>
	</tr>
	<s:iterator value="pessoas" status="rowstatus">
		<s:if test="#rowstatus.odd == true">
			<tr style="{cursor:hand}" id="linha<s:property value="id"/>" style="{cursor:hand;}" onMouseover="setColorOn('linha<s:property value="id"/>');" onMouseout="setColorOff('linha<s:property value="id"/>');" bgcolor="#EBF3E4">
		</s:if>
		<s:else>
			<tr style="{cursor:hand}" id="linha<s:property value="id"/>" style="{cursor:hand}" onMouseover="setColorOn('linha<s:property value="id"/>');" onMouseout="setColorOff('linha<s:property value="id"/>');" bgcolor="#CBE3BB">
		</s:else>
			<td id="<s:property value="id"/>" >
				<input type="checkbox" class="checkList" name="id" value="<s:property value="id"/>">
			</td>
			<td id="<s:property value="id"/>" onClick="javascript:var obj = new Object();if (document.all){obj.value=this.innerText.substring(this.innerText.indexOf('|')+1)}else{obj.value=this.textContent.substring(this.textContent.indexOf('|')+1)};document.formLista.elements[elemento_no_formulario2('pessoa.id',document.formLista)].value = obj.value;document.formLista.action=getContextApp()+'/pessoa/editar.action';document.formLista.submit();"><s:property value="nome"/><span style="display: none">|<s:property value="id"/></span></td>
			<td id="<s:property value="id"/>" onClick="javascript:var obj = new Object();if (document.all){obj.value=this.innerText.substring(this.innerText.indexOf('|')+1)}else{obj.value=this.textContent.substring(this.textContent.indexOf('|')+1)};document.formLista.elements[elemento_no_formulario2('pessoa.id',document.formLista)].value = obj.value;document.formLista.action=getContextApp()+'/pessoa/editar.action';document.formLista.submit();"><s:property value="cpfOuCnpj"/><span style="display: none">|<s:property value="id"/></span></td>
		</tr>
	</s:iterator>
</table>
<script type="text/javascript">
	setTimeout(function(){
		$('#bookmark')[0].innerHTML = $('#totalRegistros').val();
	}
	,300);
</script>