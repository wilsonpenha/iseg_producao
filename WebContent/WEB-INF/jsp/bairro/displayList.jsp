<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.*"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<s:url action="lista" id="descrsUrl"/>

<input type="hidden" name="bairro.id">
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
       <td class="tableTag_cell" id="" width="50%" nowrap="1"><b>Cidade : </b><img src="<s:url value="/common/images/asc.gif" />" onclick="TableSortWait('DivTable', '1' ,'aa','1');"><img src="<s:url value="/common/images/desc.gif" />" onclick="TableSortWait('DivTable', '1' ,'ad','1');"></td>       <td class="tableTag_cell" id="" width="50%" nowrap="1"><b>Bairro :</b><img src="<s:url value="/common/images/asc.gif" />" onclick="TableSortWait('DivTable', '1' ,'aa','1');"><img src="<s:url value="/common/images/desc.gif" />" onclick="TableSortWait('DivTable', '1' ,'ad','1');"></td>       
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
	    <td class="tableTag_cell" id="<s:property value="id"/>" onClick="javascript:var obj = new Object();if (document.all){obj.value=this.innerText.substring(this.innerText.indexOf('|')+1)}else{obj.value=this.textContent.substring(this.textContent.indexOf('|')+1)};document.formLista.elements[elemento_no_formulario2('bairro.id',document.formLista)].value = obj.value;document.formLista.action='editar.action';document.formLista.submit();"><s:property value="cidade.nome"/><span style="display: none">|<s:property value="id"/></span></td>        <td class="tableTag_cell" id="<s:property value="id"/>" onClick="javascript:var obj = new Object();if (document.all){obj.value=this.innerText.substring(this.innerText.indexOf('|')+1)}else{obj.value=this.textContent.substring(this.textContent.indexOf('|')+1)};document.formLista.elements[elemento_no_formulario2('bairro.id',document.formLista)].value = obj.value;document.formLista.action='editar.action';document.formLista.submit();"><s:property value="nome"/><span style="display: none">|<s:property value="id"/></span></td>
	</s:iterator>
    </s:if>
</table>