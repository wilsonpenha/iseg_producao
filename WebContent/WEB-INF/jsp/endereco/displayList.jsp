<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.*" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<s:url action="lista" id="descrsUrl"/>

<s:textfield theme="simple" id="enderecoId" name="endereco.id" cssStyle="display:none" />
<s:textfield theme="simple" id="enderecoPessoaId" name="endereco.pessoa.id" cssStyle="display:none" />
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
       <td class="tableTag_cell" id="" width="40%" nowrap="1"><b>Bairro</b><img src="../common/images/asc.gif" onclick="TableSortWait('DivTable', '1' ,'aa','1');"><img src="../common/images/desc.gif" onclick="TableSortWait('DivTable', '1' ,'ad','1');"></td>       <td class="tableTag_cell" id="" width="30%" nowrap="1"><b>Logradouro</b><img src="../common/images/asc.gif" onclick="TableSortWait('DivTable', '1' ,'aa','1');"><img src="../common/images/desc.gif" onclick="TableSortWait('DivTable', '1' ,'ad','1');"></td>       <td class="tableTag_cell" id="" width="30%" nowrap="1"><b>Número</b><img src="../common/images/asc.gif" onclick="TableSortWait('DivTable', '1' ,'aa','1');"><img src="../common/images/desc.gif" onclick="TableSortWait('DivTable', '1' ,'ad','1');"></td>       
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
	    <td class="tableTag_cell" id="<s:property value="id"/>" onClick="javascript:var obj = new Object();if (document.all){obj.value=this.innerText.substring(this.innerText.indexOf('|')+1)}else{obj.value=this.textContent.substring(this.textContent.indexOf('|')+1)};document.formLista.elements[elemento_no_formulario2('endereco.id',document.formLista)].value = obj.value;document.formLista.action='editar.action';document.formLista.submit();"><s:property value="bairro"/><span style="display: none">|<s:property value="id"/></span></td>        <td class="tableTag_cell" id="<s:property value="id"/>" onClick="javascript:var obj = new Object();if (document.all){obj.value=this.innerText.substring(this.innerText.indexOf('|')+1)}else{obj.value=this.textContent.substring(this.textContent.indexOf('|')+1)};document.formLista.elements[elemento_no_formulario2('endereco.id',document.formLista)].value = obj.value;document.formLista.action='editar.action';document.formLista.submit();"><s:property value="logradouro"/><span style="display: none">|<s:property value="id"/></span></td>        <td class="tableTag_cell" id="<s:property value="id"/>" onClick="javascript:var obj = new Object();if (document.all){obj.value=this.innerText.substring(this.innerText.indexOf('|')+1)}else{obj.value=this.textContent.substring(this.textContent.indexOf('|')+1)};document.formLista.elements[elemento_no_formulario2('endereco.id',document.formLista)].value = obj.value;document.formLista.action='editar.action';document.formLista.submit();"><s:property value="numero"/><span style="display: none">|<s:property value="id"/></span></td>            
	    </tr>
	</s:iterator>
    </s:if>
</table>

</form>
<form name="formEnderecoTabs">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<input type="hidden" name="seguradora.id" value="<s:property value="endereco.pessoa.id"/>"/>
	<input type="hidden" name="perfil.seguradora.id" value="<s:property value="endereco.pessoa.id"/>"/>
	<input type="hidden" name="coberturas.seguradora.id" value="<s:property value="endereco.pessoa.id"/>"/>
	<input type="hidden" name="condicaoPagamento.seguradora.id" value="<s:property value="endereco.pessoa.id"/>"/>
	<input type="hidden" name="servicos.seguradora.id" value="<s:property value="endereco.pessoa.id"/>"/>
	
	<input type="hidden" name="pessoaFisica.id" value="<s:property value="endereco.pessoa.id"/>"/>
	<input type="hidden" name="pessoaJuridica.id" value="<s:property value="endereco.pessoa.id"/>"/>
	<input type="hidden" name="produtor.id" value="<s:property value="endereco.pessoa.id"/>"/>
	<input type="hidden" name="corretora.id" value="<s:property value="endereco.pessoa.id"/>"/>
	<input type="hidden" name="smsEventosCorretora.corretora.id" value="<s:property value="endereco.pessoa.id"/>"/>
	<input type="hidden" name="smsTelefonesProdutor.produtor.id" value="<s:property value="endereco.pessoa.id"/>"/>
	<input type="hidden" name="oficina.id" value="<s:property value="endereco.pessoa.id"/>" />
	<input type="hidden" name="contaCorrente.pessoa.id" value="<s:property value="endereco.pessoa.id"/>"/>
	<input type="hidden" name="dependentes.pessoa.id" value="<s:property value="endereco.pessoa.id"/>"/>
	<input type="hidden" name="corretoraTipoLancamento.corretora.id" value="<s:property value="endereco.pessoa.id"/>"/>
		