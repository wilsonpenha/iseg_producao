<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<link rel="stylesheet" type="text/css" href="<s:url value="/common/web/skins/Default/Main/Client/DataGrid/DataGrid.css" includeParams="none" />" id="paramCSS"></link>
<link rel="stylesheet" href="<s:url value="/common/jquery.tooltip.css" includeParams="none"/>" />
<script language="javascript" src="<s:url value="/common/jquery.tooltip.js?v=0" includeParams="none"/>"></script>
<script type="text/javascript">
var linhas = "";
var count = 0;
</script>

<table width="99%" border="0">
  <tr> 
	<td>
	  <table class="FieldGroup" border="0" cellpadding="0" cellspacing="0">
		<tbody>
		  <tr class="FieldGroup_TopMargin"></tr> 
			<tr>
			  <td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></td>
			  <td class="FieldGroupTitle">Lista de Borderôs</td>
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

<table class="tableTag" id="DivTable" width="99%" align="center" border="0" cellpadding="0" cellspacing="0">
	<tr height="20px" bgcolor="#A0CC84">
	<td id="" width="2%" nowrap="nowrap"><b>&nbsp;</b></td>
	<td width="10%" nowrap="nowrap"><b>Nro Borderô</b><img src="<s:url value="/common/images/asc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '1' ,'aa','1');"><img src="<s:url value="/common/images/desc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '1' ,'ad','1');"></td>
	<td width="10%" nowrap="nowrap"><b>Dt Abertura</b><img src="<s:url value="/common/images/asc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '2' ,'aa','2');"><img src="<s:url value="/common/images/desc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '2' ,'ad','2');"></td>
	<td width="10%" nowrap="nowrap"><b>Dt Envio</b><img src="<s:url value="/common/images/asc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '3' ,'aa','3');"><img src="<s:url value="/common/images/desc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '3' ,'ad','3');"></td>
	<td width="68%" nowrap="nowrap"><b>Origem/Destino</b><img src="<s:url value="/common/images/asc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '5' ,'aa','5');"><img src="<s:url value="/common/images/desc.gif" includeParams="none"/>" onclick="TableSortWait('DivTable', '5' ,'ad','5');"></td>
	</tr>
	<s:if test="protocolos.size > 0">
	<s:iterator value="protocolos" status="rowstatus">
		<s:if test="#rowstatus.odd == true">
		  <tr class="tablerow0" id="linha<s:property value="id"/>" >
		</s:if>
		<s:else> 
		  <tr class="tablerow1" id="linha<s:property value="id"/>" >
		</s:else>

			<td id="<s:property value="id"/>" >
				<input type="checkbox" class="checkList" name="id" value="<s:property value="id"/>">
			</td>
			<td id="<s:property value="id"/>" onClick="javascript:$('#protocoloId').val('<s:property value="id"/>'); editRecord();"><s:property value="numero"/></td>
			<td id="<s:property value="id"/>" onClick="javascript:$('#protocoloId').val('<s:property value="id"/>'); editRecord();"><s:property value="dataAbertura"/></td>
			<td id="<s:property value="id"/>" onClick="javascript:$('#protocoloId').val('<s:property value="id"/>'); editRecord();"><s:property value="dataEnvio"/></td>
			<td id="<s:property value="id"/>" onClick="javascript:$('#protocoloId').val('<s:property value="id"/>'); editRecord();"><s:property value="destinoOrigem"/></td>
			<script type="text/javascript">
			linhas = linhas+'#linha<s:property value="id"/>,';
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
function editRecord(){
    submitForm($('#formLista').get(0), getContextApp()+'/protocolo/editar.action', false);
}

setTimeout(function(){
	$('#bookmark')[0].innerHTML = $('#totalRegistros').val();
}
,300);

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