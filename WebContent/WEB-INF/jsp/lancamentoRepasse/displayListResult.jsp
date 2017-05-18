<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" type="text/css" href="<s:url value="/common/web/skins/Default/Main/Client/DataGrid/DataGrid.css" includeParams="none" />" id="paramCSS"></link>

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

<s:textfield theme="simple" id="repasseComissaoId" name="repasseComissao.id" cssStyle="display:none;"/>

<table class="tableTag" id="DivTable" width="100%" align="center" border="0" cellpadding="0" cellspacing="0">
	<tr height="20px" bgcolor="#A0CC84">
	<td width="30%" nowrap="nowrap"><b>Produtor</b></td>
	<td width="10%" nowrap="nowrap"><b>Data Lancto</b></td>
	<td width="30%" nowrap="nowrap"><b>Descrição</b></td>
	<td width="10%" nowrap="nowrap"><b>Valor</b></td>
	<td width="10%" nowrap="nowrap"><b>Data Pagto</b></td>
	<td width="5%" nowrap="nowrap"><b>Situação</b></td>
	<td width="5%" nowrap="nowrap"><b>Tipo</b></td>
	</tr>
	<s:if test="repasseComissaoList.size > 0">
	
    <s:set var="totalPercentualComissao" value="0" />
	<s:iterator value="repasseComissaoList" status="rowstatus">
		<s:if test="#rowstatus.odd == true">
			<tr id="linha<s:property value="id"/>" style="{cursor:pointer;}" onMouseover="setColorOn('linha<s:property value="id"/>');" onMouseout="setColorOff('linha<s:property value="id"/>');" bgcolor="#EBF3E4">
		</s:if>
		<s:else>
			<tr id="linha<s:property value="id"/>" style="{cursor:pointer;}" onMouseover="setColorOn('linha<s:property value="id"/>');" onMouseout="setColorOff('linha<s:property value="id"/>');" bgcolor="#CBE3BB">
		</s:else>
		  	
		    <td id="<s:property value="id"/>" onClick="javascript:$('#repasseComissaoId').val('<s:property value="id"/>'); editRecord();" nowrap="nowrap"><s:property value="produtor.nome"/></td>
		    <td id="<s:property value="id"/>" onClick="javascript:$('#repasseComissaoId').val('<s:property value="id"/>'); editRecord();" align="center"><s:property value="dataLancamento"/></td>
		    <td id="<s:property value="id"/>" onClick="javascript:$('#repasseComissaoId').val('<s:property value="id"/>'); editRecord();"><s:property value="descricao"/></td>
		    <td id="<s:property value="id"/>" onClick="javascript:$('#repasseComissaoId').val('<s:property value="id"/>'); editRecord();" align="right"><s:property value="valorPago"/>&nbsp;</td>
		    <td id="<s:property value="id"/>" onClick="javascript:$('#repasseComissaoId').val('<s:property value="id"/>'); editRecord();" align="center"><s:property value="dataPagamento"/></td>
		    <td id="<s:property value="id"/>" onClick="javascript:$('#repasseComissaoId').val('<s:property value="id"/>'); editRecord();" nowrap="nowrap" align="center"><s:property value="situacaoDesc"/></td>
		    <td id="<s:property value="id"/>" onClick="javascript:$('#repasseComissaoId').val('<s:property value="id"/>'); editRecord();" nowrap="nowrap" align="center"><s:property value="tipoLancamentoDesc"/></td>
		</tr>
	</s:iterator>
	</s:if>
	<s:else>
	  <tr height="20" bgcolor="#CBE3BB"><td colspan="7" style="text-align:center;font-style:italic;">Nenhum Lançamento</td></tr>
	</s:else>
</table>
<script type="text/javascript">
	showCount();
	
function editRecord(){
    submitForm($('#formLista').get(0), getContextApp()+'/repasseComissao/editar.action', false);
}

</script>