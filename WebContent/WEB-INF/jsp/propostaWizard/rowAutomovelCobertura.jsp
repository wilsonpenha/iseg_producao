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
	<s:textfield theme="simple" id="automovelCoberturaId%{automovelCoberturaList.size()-1}" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelCoberturaCollection[%{automovelCoberturaList.size()-1}].id" value="%{automovelCobertura.id}" cssStyle="display:none"/>
	<s:textfield theme="simple" id="automovelCoberturaId%{automovelCoberturaList.size()-1}" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelCoberturaCollection[%{automovelCoberturaList.size()-1}].coberturasIseg.id" value="%{automovelCobertura.coberturasIseg.id}" cssStyle="display:none"/>
	<s:textfield theme="simple" id="automovelCoberturaId%{automovelCoberturaList.size()-1}" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelCoberturaCollection[%{automovelCoberturaList.size()-1}].cobertura.id" value="%{automovelCobertura.cobertura.id}" cssStyle="display:none"/>
	<s:textfield theme="simple" id="coberturaAutomovelId%{automovelCoberturaList.size()-1}" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelCoberturaCollection[%{automovelCoberturaList.size()-1}].automovel.id" value="%{proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.id}" cssStyle="display:none"/>
	<s:textfield theme="simple" id="coberturaBlnFranquia%{automovelCoberturaList.size()-1}" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelCoberturaCollection[%{automovelCoberturaList.size()-1}].blnInformaFranquia" value="%{automovelCobertura.blnInformaFranquia}" cssStyle="display:none"/>
	<s:textfield theme="simple" id="coberturaSequencia%{automovelCoberturaList.size()-1}" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelCoberturaCollection[%{automovelCoberturaList.size()-1}].sequencia" value="%{automovelCoberturaList.size()-1+1}" cssStyle="display:none"/>
	<s:if test="%{automovelCobertura.descricao != null}">
		<s:textfield theme="simple" id="coberturaDescricao%{automovelCoberturaList.size()-1}" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelCoberturaCollection[%{automovelCoberturaList.size()-1}].descricao" value="%{automovelCobertura.descricao}" onchange="setAutomovelAlterado(true);"/>
	</s:if>
	<s:else>
		<s:property value="%{automovelCobertura.coberturasIseg.descricao}"/>
	</s:else>
  </td>
  <td><s:textfield theme="simple" id="coberturaLmi%{automovelCoberturaList.size()-1}" cssClass="clValor2 currency" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelCoberturaCollection[%{automovelCoberturaList.size()-1}].lmi" onkeyup="enableDisableDadosCobertura('%{automovelCoberturaList.size()-1}');" onchange="setAutomovelAlterado(true);" cssStyle="width:80%" /></td>
  <s:if test="automovelCobertura.blnInformaFranquia">
    <td><s:textfield theme="simple" id="coberturaFranquia%{automovelCoberturaList.size()-1}" cssClass="clValor2 currency" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelCoberturaCollection[%{automovelCoberturaList.size()-1}].franquia" value="%{automovelCobertura.franquia}" cssStyle="width:80%" onchange="setAutomovelAlterado(true);"/></td>
    <td><s:textfield theme="simple" id="coberturaTextoFranquia%{automovelCoberturaList.size()-1}" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelCoberturaCollection[%{automovelCoberturaList.size()-1}].textoFranquia" maxlength="100" cssStyle="width:96%" onchange="setAutomovelAlterado(true);"/></td>
  </s:if>
  <s:else>
    <td></td><td></td>
  </s:else>
  <td><s:textfield theme="simple" id="coberturaPremio%{automovelCoberturaList.size()-1}" cssClass="clValor2 currency" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelCoberturaCollection[%{automovelCoberturaList.size()-1}].premio" cssStyle="width:80%" onchange="setAutomovelAlterado(true);"/></td>
</tr>


<script>
$().ready(function() {
    $(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
 })
</script>
<% } catch (Exception e) {e.printStackTrace();}%>