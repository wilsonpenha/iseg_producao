<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try {
%>

	<table id="tableBeneficiarios" class="listItens">
	  <tr class="listItensHeader">
		<td width="8%" nowrap="nowrap">Ações</td>
		<td width="47%" nowrap="nowrap">Nome</td>
		<td width="10%" nowrap="nowrap">Dt Nasc.</td>
		<td width="10%" nowrap="nowrap">Sexo</td>
		<td width="10%" nowrap="nowrap">Parentesco</td>
		<td width="15%" nowrap="nowrap">Percentual</td>
	  </tr>
	  <s:iterator value="beneficiarioList" status="stat">
		<tr>
		  <td nowrap="nowrap" class="small_image">
			<s:textfield theme="simple" id="beneficiarioSeguradoId%{#stat.index}" name="proposta.seguradoIndividualCollection[%{itemCorrente}].beneficiarioIndividualCollection[%{#stat.index}].seguradoIndividual.id" value="%{seguradoIndividual.id}" cssStyle="display:none"/>
			<s:textfield theme="simple" id="beneficiarioIndividualId%{#stat.index}" name="proposta.seguradoIndividualCollection[%{itemCorrente}].beneficiarioIndividualCollection[%{#stat.index}].id" value="%{id}" cssStyle="display:none"/>
			<s:textfield theme="simple" id="beneficiarioNome%{#stat.index}" name="proposta.seguradoIndividualCollection[%{itemCorrente}].beneficiarioIndividualCollection[%{#stat.index}].nome" value="%{nome}" cssStyle="display:none"/>
			<s:textfield theme="simple" id="beneficiarioDataNasc%{#stat.index}" name="proposta.seguradoIndividualCollection[%{itemCorrente}].beneficiarioIndividualCollection[%{#stat.index}].dataNascimento" value="%{dataNascimento}" cssStyle="display:none"/>
			<s:textfield theme="simple" id="beneficiarioSexo%{#stat.index}" name="proposta.seguradoIndividualCollection[%{itemCorrente}].beneficiarioIndividualCollection[%{#stat.index}].sexo" value="%{sexo}" cssStyle="display:none"/>
			<s:textfield theme="simple" id="beneficiarioParentesco%{#stat.index}" name="proposta.seguradoIndividualCollection[%{itemCorrente}].beneficiarioIndividualCollection[%{#stat.index}].parentesco" value="%{parentesco}" cssStyle="display:none"/>
			<s:textfield theme="simple" id="beneficiarioPercentual%{#stat.index}" name="proposta.seguradoIndividualCollection[%{itemCorrente}].beneficiarioIndividualCollection[%{#stat.index}].percentual" value="%{percentual}" cssStyle="display:none"/>
			<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/delete.gif" includeParams="none"/>" onclick="if(confirma('Confirma exclusão?')){removeBeneficiario('<s:property value="id"/>');}"/>
			<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/edit.gif" includeParams="none"/>" onclick="if(confirma('Confirma edição?')){editarBeneficiario('<s:property value="id"/>');}"/>
		  </td>
		  <td nowrap="nowrap"><s:property value="nome"/>&nbsp;</td>
		  <td nowrap="nowrap"><s:property value="dataNascimento"/>&nbsp;</td>
		  <td nowrap="nowrap"><s:property value="sexo"/>&nbsp;</td>
		  <td nowrap="nowrap"><s:property value="parentesco"/>&nbsp;</td>
		  <td nowrap="nowrap"><fmt:formatNumber value="${percentual}" type="currency" currencySymbol=""/>&nbsp;</td>
		</tr>
	  </s:iterator>
	</table>

<% } catch (Exception e) {e.printStackTrace();}%>