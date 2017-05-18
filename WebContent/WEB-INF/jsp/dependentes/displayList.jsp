<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page language="java" import="java.util.*" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<s:url action="lista" id="descrsUrl"/>

<s:textfield theme="simple" id="dependentesId" name="dependentes.id" cssStyle="display:none;" />
<s:textfield theme="simple" id="pessoaFisicaId" name="dependentes.pessoa.id" cssStyle="display:none;" />
<table>
  <tr>
	<td colspan="4">
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
       <td class="tableTag_cell" id="" width="35%" nowrap="1"><b>Nome</b><img src="../common/images/asc.gif" onclick="TableSortWait('DivTable', '1' ,'aa','1');"><img src="../common/images/desc.gif" onclick="TableSortWait('DivTable', '1' ,'ad','1');"></td>
       <td class="tableTag_cell" id="" width="15%" nowrap="1"><b>Parentesco</b><img src="../common/images/asc.gif" onclick="TableSortWait('DivTable', '1' ,'aa','1');"><img src="../common/images/desc.gif" onclick="TableSortWait('DivTable', '1' ,'ad','1');"></td>
       <td class="tableTag_cell" id="" width="25%" nowrap="1"><b>Telefone Celular</b><img src="../common/images/asc.gif" onclick="TableSortWait('DivTable', '1' ,'aa','1');"><img src="../common/images/desc.gif" onclick="TableSortWait('DivTable', '1' ,'ad','1');"></td>       <td class="tableTag_cell" id="" width="25%" nowrap="1"><b>Telefone</b><img src="../common/images/asc.gif" onclick="TableSortWait('DivTable', '1' ,'aa','1');"><img src="../common/images/desc.gif" onclick="TableSortWait('DivTable', '1' ,'ad','1');"></td>       
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
	    <td class="tableTag_cell" id="<s:property value="id"/>" onClick="javascript:$('#dependentesId').val('<s:property value="id"/>'); editRecord();"><s:property value="nome"/></td>	    <td class="tableTag_cell" id="<s:property value="id"/>" onClick="javascript:$('#dependentesId').val('<s:property value="id"/>'); editRecord();"><s:property value="parentesco"/></td>
        <td class="tableTag_cell" id="<s:property value="id"/>" onClick="javascript:$('#dependentesId').val('<s:property value="id"/>'); editRecord();"><s:property value="telefoneCelular"/></td>
        <td class="tableTag_cell" id="<s:property value="id"/>" onClick="javascript:$('#dependentesId').val('<s:property value="id"/>'); editRecord();"><s:property value="telefoneRecados"/></td>            
	    </tr>
	</s:iterator>
    </s:if>
</table>
</form>
<script>
function editRecord(){
    submitForm($('#formLista').get(0), getContextApp()+'/dependentes/editar.action', false);
}
</script>
<form name="formDependentes">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<input type="hidden" name="endereco.pessoa.id" value="<s:property value="dependentes.pessoa.id"/>"/>
	<input type="hidden" name="contaCorrente.pessoa.id" value="<s:property value="dependentes.pessoa.id"/>"/>
	<input type="hidden" name="pessoaFisica.id" value="<s:property value="dependentes.pessoa.id"/>"/>
