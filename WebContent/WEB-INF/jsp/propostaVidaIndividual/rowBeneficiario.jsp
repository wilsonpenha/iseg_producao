<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try {
%>



<tr>
  <td nowrap="nowrap">
	<s:textfield theme="simple" id="beneficiarioSeguradoId%{beneficiarioList.size()}" name="proposta.seguradoIndividualCollection[%{itemCorrente}].beneficiarioEmpresarialCollection[%{beneficiarioList.size()}].seguradoIndividual.id" value="%{seguradoIndividual.id}" cssStyle="display:none"/>
	<s:textfield theme="simple" id="beneficiarioIndividualId%{beneficiarioList.size()}" name="proposta.seguradoIndividualCollection[%{itemCorrente}].beneficiarioEmpresarialCollection[%{beneficiarioList.size()}].id" value="%{id}" cssStyle="display:none"/>
	<s:textfield theme="simple" id="beneficiarioNome%{beneficiarioList.size()}" name="proposta.seguradoIndividualCollection[%{itemCorrente}].beneficiarioEmpresarialCollection[%{beneficiarioList.size()}].nome" value="%{nome}" cssStyle="display:none"/>
	<s:textfield theme="simple" id="beneficiarioDataNasc%{beneficiarioList.size()}" name="proposta.seguradoIndividualCollection[%{itemCorrente}].beneficiarioEmpresarialCollection[%{beneficiarioList.size()}].dataNascimento" value="%{dataNascimento}" cssStyle="display:none"/>
	<s:textfield theme="simple" id="beneficiarioSexo%{beneficiarioList.size()}" name="proposta.seguradoIndividualCollection[%{itemCorrente}].beneficiarioEmpresarialCollection[%{beneficiarioList.size()}].sexo" value="%{sexo}" cssStyle="display:none"/>
	<s:textfield theme="simple" id="beneficiarioParentesco%{beneficiarioList.size()}" name="proposta.seguradoIndividualCollection[%{itemCorrente}].beneficiarioEmpresarialCollection[%{beneficiarioList.size()}].parentesco" value="%{parentesco}" cssStyle="display:none"/>
	<s:textfield theme="simple" id="beneficiarioPercentual%{beneficiarioList.size()}" name="proposta.seguradoIndividualCollection[%{itemCorrente}].beneficiarioEmpresarialCollection[%{beneficiarioList.size()}].percentual" value="%{percentual}" cssStyle="display:none"/>
  </td>
  <td nowrap="nowrap" class="small_image">
	<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/delete.gif" includeParams="none"/>" onclick="if(confirma('Confirma exclusão?')){removeBeneficiario('<s:property value="id"/>');}"/>
	<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/edit.gif" includeParams="none"/>" onclick="if(confirma('Confirma edição?')){editarBeneficiario('<s:property value="id"/>');}"/>
  </td>
  <td nowrap="nowrap"><s:property value="nome"/>&nbsp;</td>
  <td nowrap="nowrap"><s:property value="dataNascimento"/>&nbsp;</td>
  <td nowrap="nowrap"><s:property value="sexo"/>&nbsp;</td>
  <td nowrap="nowrap"><s:property value="parentesco"/>&nbsp;</td>
  <td nowrap="nowrap"><s:property value="percentual"/>&nbsp;</td>
</tr>


<script>
$().ready(function() {
    $(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
 })
</script>
<% } catch (Exception e) {e.printStackTrace();}%>