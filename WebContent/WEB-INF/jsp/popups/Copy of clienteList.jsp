<%@page language="java" import="java.util.*" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<script language="javascript" src="..<s:select theme="simple" cssClass="Combo Combo_OneCells_width requiredField" id="correspondencia" name="proposta.propostaEnderecoCollection[0].correspondencia" list="#{'SIM':'SIM','NAO':'NÃO'}" />"></script>
<link href="${pageContext.request.contextPath}/common/rptStyle.css" rel="stylesheet" type="text/css">

<form>
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

<div class="divPopupIn">
<s:url action="clienteList" id="descrsUrl"/>

	<table class="tableAutoComplete" id="DivTable" width="100%" align="center" border="0" cellpadding="0" cellspacing="0">
	<tbody>
		<tr><td>
		<s:if test="list.size > 0">
		    <s:select id="selectList" list="list" size="8" listKey="id" listValue="nome" cssClass="selectList" onkeypress="if (event.keyCode==13){retornaSelectList(this.options[this.selectedIndex].value,this.options[this.selectedIndex].text)}"/>
		</s:if></td></tr></tbody>
	</table>
</div>
</form>
<script>
parent.mostraDiv('${divName}');

function retornaSelectList(valor,nome) {
    targetForm = eval('parent.document.${formName}');
    targetForm.elements[elemento_no_formulario2('${campoId}',targetForm)].value=valor;
    targetForm.elements[elemento_no_formulario2('${campoNome}',targetForm)].value=nome;
	parent.escodeDiv('${divName}');
}

</script>

