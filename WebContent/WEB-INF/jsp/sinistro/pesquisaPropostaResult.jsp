<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<link rel="stylesheet" href="<s:url value="/common/jquery.tooltip.css" includeParams="none"/>" />
<script language="javascript" src="<s:url value="/common/jquery-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" src="<s:url value="/common/jquery-form.js?v=0" includeParams="none"/>"></script>
<script language="javascript" src="<s:url value="/common/jquery.tooltip.js?v=0" includeParams="none"/>"></script>
<script type="text/javascript">
var linhas = "";
var count = 0;
</script>
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
	<tr height="20px" bgcolor="#A0CC84">
	<td id="" width="2%" nowrap="nowrap"><b>&nbsp;</b></td>
	<td width="10%" nowrap="nowrap"><b>Número</b><img src="<s:url value="/common/images/asc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '1' ,'aa','1');"><img src="<s:url value="/common/images/desc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '1' ,'ad','1');"></td>
	<td width="10%" nowrap="nowrap"><b>Data Proposta</b><img src="<s:url value="/common/images/asc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '2' ,'aa','1');"><img src="<s:url value="/common/images/desc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '2' ,'ad','1');"></td>
	<td width="30%" nowrap="nowrap"><b>Cliente</b><img src="<s:url value="/common/images/asc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '3' ,'aa','1');"><img src="<s:url value="/common/images/desc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '3' ,'ad','1');"></td>
	<td width="20%" nowrap="nowrap"><b>CPF/CNPJ</b><img src="<s:url value="/common/images/asc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '4' ,'aa','1');"><img src="<s:url value="/common/images/desc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '4' ,'ad','1');"></td>
	<td width="15%" nowrap="nowrap"><b>Ramo</b><img src="<s:url value="/common/images/asc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '5' ,'aa','1');"><img src="<s:url value="/common/images/desc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '5' ,'ad','1');"></td>
	<td width="15%" nowrap="nowrap"><b>Fase</b><img src="<s:url value="/common/images/asc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '6' ,'aa','1');"><img src="<s:url value="/common/images/desc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '6' ,'ad','1');"></td>
	</tr>
	<s:if test="propostas.size > 0">
	<s:iterator value="propostas" status="rowstatus">
		<s:if test="#rowstatus.odd == true">
			<tr title="<s:url value="/preSinistro/getProposta.action?proposta.id=" includeParams="none"/><s:property value="id"/>" style="{cursor:pointer;}" id="linha<s:property value="numero"/>" onMouseover="setColorOn('linha<s:property value="numero"/>');" onMouseout="setColorOff('linha<s:property value="numero"/>');" bgcolor="#EBF3E4">
		</s:if>
		<s:else> 
			<tr title="<s:url value="/preSinistro/getProposta.action?proposta.id=" includeParams="none"/><s:property value="id"/>" style="{cursor:pointer;}" id="linha<s:property value="numero"/>" onMouseover="setColorOn('linha<s:property value="numero"/>');" onMouseout="setColorOff('linha<s:property value="numero"/>');" bgcolor="#CBE3BB">
		</s:else>
			<td id="<s:property value="id"/>" >
				<input type="checkbox" class="checkList" name="id" value="<s:property value="id"/>">
			</td>
			<td id="<s:property value="id"/>" onClick="javascript:var obj = new Object();if (document.all){obj.value=this.innerText.substring(this.innerText.indexOf('|')+1)}else{obj.value=this.textContent.substring(this.textContent.indexOf('|')+1)};document.getElementById('formLista').elements[elemento_no_formulario2('proposta.id',document.getElementById('formLista'))].value = obj.value;document.getElementById('formLista').action='editar.action';document.getElementById('formLista').submit();"><s:property value="numero"/><span style="display: none">|<s:property value="id"/></span></td>
			<td id="<s:property value="id"/>" onClick="javascript:var obj = new Object();if (document.all){obj.value=this.innerText.substring(this.innerText.indexOf('|')+1)}else{obj.value=this.textContent.substring(this.textContent.indexOf('|')+1)};document.getElementById('formLista').elements[elemento_no_formulario2('proposta.id',document.getElementById('formLista'))].value = obj.value;document.getElementById('formLista').action='editar.action';document.getElementById('formLista').submit();"><s:property value="dataProposta"/><span style="display: none">|<s:property value="id"/></span></td>
			<td id="<s:property value="id"/>" onClick="javascript:var obj = new Object();if (document.all){obj.value=this.innerText.substring(this.innerText.indexOf('|')+1)}else{obj.value=this.textContent.substring(this.textContent.indexOf('|')+1)};document.getElementById('formLista').elements[elemento_no_formulario2('proposta.id',document.getElementById('formLista'))].value = obj.value;document.getElementById('formLista').action='editar.action';document.getElementById('formLista').submit();"><s:property value="cliente.nome"/><span style="display: none">|<s:property value="id"/></span></td>
			<td id="<s:property value="id"/>" onClick="javascript:var obj = new Object();if (document.all){obj.value=this.innerText.substring(this.innerText.indexOf('|')+1)}else{obj.value=this.textContent.substring(this.textContent.indexOf('|')+1)};document.getElementById('formLista').elements[elemento_no_formulario2('proposta.id',document.getElementById('formLista'))].value = obj.value;document.getElementById('formLista').action='editar.action';document.getElementById('formLista').submit();"><s:property value="cliente.cpfOuCnpj"/><span style="display: none">|<s:property value="id"/></span></td>
			<td id="<s:property value="id"/>" onClick="javascript:var obj = new Object();if (document.all){obj.value=this.innerText.substring(this.innerText.indexOf('|')+1)}else{obj.value=this.textContent.substring(this.textContent.indexOf('|')+1)};document.getElementById('formLista').elements[elemento_no_formulario2('proposta.id',document.getElementById('formLista'))].value = obj.value;document.getElementById('formLista').action='editar.action';document.getElementById('formLista').submit();"><s:property value="ramo.nome"/><span style="display: none">|<s:property value="id"/></span></td>
			<td id="<s:property value="id"/>" onClick="javascript:var obj = new Object();if (document.all){obj.value=this.innerText.substring(this.innerText.indexOf('|')+1)}else{obj.value=this.textContent.substring(this.textContent.indexOf('|')+1)};document.getElementById('formLista').elements[elemento_no_formulario2('proposta.id',document.getElementById('formLista'))].value = obj.value;document.getElementById('formLista').action='editar.action';document.getElementById('formLista').submit();"><s:property value="getStatusOperacionalDescricao(statusOperacional)"/><span style="display: none">|<s:property value="id"/></span></td>
			<script type="text/javascript">
			linhas = linhas+'#linha<s:property value="numero"/>,';
			count = count + 1;
			</script>
		</tr>
	</s:iterator>
	</s:if>
	<s:else>  
	  <tr height="20" bgcolor="#CBE3BB"><td colspan="8" style="text-align:center;font-style:italic;">Nenhum registro</td></tr>
	</s:else>
</table>
<script type="text/javascript">
	showCount();
	
if (count>0){
	$(linhas).tooltip({ 
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
}
</script>