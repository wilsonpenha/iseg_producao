<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<%@page language="java" import="java.util.*" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<html>
<head>
<script language="javascript" src="..<s:select theme="simple" cssClass="Combo Combo_OneCells_width requiredField" id="correspondencia" name="proposta.propostaEnderecoCollection[0].correspondencia" list="#{'SIM':'SIM','NAO':'NÃO'}" />"></script>
<script language="javascript" src="../common/xbLibrary.js?v=0"></script>
<script language="javascript" src="../common/xbDebug.js?v=0"></script>
<script language="javascript" src="../common/xbDOM.js?v=0"></script>
<script language="javascript" src="../common/xbStyle.js?v=0"></script>
<script language="javascript" src="../common/xbStyle-css.js?v=0"></script>
<link href="${pageContext.request.contextPath}/common/rptStyle.css" rel="stylesheet" type="text/css">
</head>
<body >
<form>
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

<div class="divPopupIn">
<s:url action="clienteList" id="descrsUrl"/>
	<table class="tableTag" id="DivTable" width="100%" align="center" border="0" cellpadding="0" cellspacing="0">
		<s:if test="list.size > 0">
		<s:iterator value="list" status="rowstatus">
			<s:if test="#rowstatus.odd == true">
				<tr class="tablerow0" id="linha<s:property value="#rowstatus.index"/>" onKeyUp="arrowUpDown(<s:property value="#rowstatus.index"/>,event.keyCode);">
				<td class="tableTag_cell" onClick=""><a href="#" class="tablerow0" id="coluna<s:property value="#rowstatus.index"/>"><s:property value="nome"/></a></td>
			</s:if>
    		<s:else>
				<tr class="tablerow1" id="linha<s:property value="#rowstatus.index"/>" onKeyUp="arrowUpDown(<s:property value="#rowstatus.index"/>,event.keyCode);">
				<td class="tableTag_cell" onClick=""><a href="#" class="tablerow1" id="coluna<s:property value="#rowstatus.index"/>"><s:property value="nome"/></a></td>
			</s:else>
			</tr>
		</s:iterator>
		</s:if>
	</table>
</div>
</form>
</body>
</html>
<script language="javascript">
window.focus();
arrowUpDown(-1,40);


function arrowUpDown(currentLine, keycode){
	if (keycode==40){
		var nextLine = document.getElementById('linha'+currentLine+1);
		if (nextLine) {
			nextLine.focus();
			setColorOn('linha'+currentLine+1);
			setColorOff('linha'+currentLine);
		}
	} if (keycode==41) {
		var nextLine = document.getElementById('linha'+currentLine-1);
		if (nextLine) {
			nextLine.focus();
			setColorOn('linha'+currentLine-1);
			setColorOff('linha'+currentLine);
		}
	}
}
</script>

<script>
parent.mostraDiv('${divName}');

function retornaSelectList(valor,nome) {
    targetForm = eval('parent.document.${formName}');
    targetForm.elements[elemento_no_formulario2('${campoId}',targetForm)].value=valor;
    targetForm.elements[elemento_no_formulario2('${campoNome}',targetForm)].value=nome;
	parent.escodeDiv('${divName}');
}

</script>

