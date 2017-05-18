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
	<s:textfield theme="simple" id="segIndividualCoberturasId%{segIndividualCoberturasList.size()}" name="proposta.seguradoIndividualCollection[%{itemCorrente}].segIndividualCoberturasCollection[%{segIndividualCoberturasList.size()}].id" value="%{segIndividualCoberturas.id}" cssStyle="display:none"/>
	<s:textfield theme="simple" id="coberturaSeguradoId%{segIndividualCoberturasList.size()}" name="proposta.seguradoIndividualCollection[%{itemCorrente}].segIndividualCoberturasCollection[%{segIndividualCoberturasList.size()}].seguradoIndividual.id" value="%{segIndividualCoberturas.seguradoIndividual.id}" cssStyle="display:none"/>
	<s:textfield theme="simple" id="coberturaBlnFranquia%{segIndividualCoberturasList.size()}" name="proposta.seguradoIndividualCollection[%{itemCorrente}].segIndividualCoberturasCollection[%{segIndividualCoberturasList.size()}].blnInformaFranquia" value="%{segIndividualCoberturas.blnInformaFranquia}" cssStyle="display:none"/>
	<s:textfield theme="simple" id="coberturaSequencia%{segIndividualCoberturasList.size()}" name="proposta.seguradoIndividualCollection[%{itemCorrente}].segIndividualCoberturasCollection[%{segIndividualCoberturasList.size()}].sequencia" value="%{segIndividualCoberturasList.size()+1}" cssStyle="display:none"/>
	<s:textfield theme="simple" id="coberturaDescricao%{segIndividualCoberturasList.size()}" name="proposta.seguradoIndividualCollection[%{itemCorrente}].segIndividualCoberturasCollection[%{segIndividualCoberturasList.size()}].descricao" value="%{segIndividualCoberturas.descricao}" onchange="setAlterado(true);"/>
  </td>
  <td><s:textfield theme="simple" id="coberturaLmi%{segIndividualCoberturasList.size()}" cssClass="clValor2 currency" name="proposta.seguradoIndividualCollection[%{itemCorrente}].segIndividualCoberturasCollection[%{segIndividualCoberturasList.size()}].lmi" onkeypress="return Mascara('numero1', event, document.getElementById('coberturaLmi%{segIndividualCoberturasList.size()}'));" onkeyup="enableDisableDadosCobertura('%{segIndividualCoberturasList.size()}');" onblur="javascript:valida_numero(this,15,2,'coberturaLmi%{segIndividualCoberturasList.size()}');" onchange="setAlterado(true);" cssStyle="width:80%" /></td>
  <s:if test="segIndividualCoberturas.blnInformaFranquia">
    <td><s:textfield theme="simple" id="coberturaFranquia%{segIndividualCoberturasList.size()}" cssClass="clValor2 currency" name="proposta.seguradoIndividualCollection[%{itemCorrente}].segIndividualCoberturasCollection[%{segIndividualCoberturasList.size()}].franquia" value="%{segIndividualCoberturas.franquia}" onkeypress="return Mascara('numero1', event, document.getElementById('coberturaFranquia%{segIndividualCoberturasList.size()}'));" onblur="javascript:valida_numero(this,15,2,'coberturaFranquia%{segIndividualCoberturasList.size()}');" cssStyle="width:80%" onchange="setAlterado(true);"/></td>
    <td><s:textfield theme="simple" id="coberturaTextoFranquia%{segIndividualCoberturasList.size()}" name="proposta.seguradoIndividualCollection[%{itemCorrente}].segIndividualCoberturasCollection[%{segIndividualCoberturasList.size()}].textoFranquia" maxlength="100" cssStyle="width:96%" onchange="setAlterado(true);"/></td>
  </s:if>
  <s:else>
    <td></td><td></td>
  </s:else>
  <td><s:textfield theme="simple" id="coberturaPremio%{segIndividualCoberturasList.size()}" cssClass="clValor2 currency" name="proposta.seguradoIndividualCollection[%{itemCorrente}].segIndividualCoberturasCollection[%{segIndividualCoberturasList.size()}].premio" onkeypress="return Mascara('numero1', event, document.getElementById('coberturaPremio%{segIndividualCoberturasList.size()}'));" onblur="javascript:valida_numero(this,15,2,'coberturaPremio%{segIndividualCoberturasList.size()}');" cssStyle="width:80%" onchange="setAlterado(true);"/></td>
</tr>


<script>
$().ready(function() {
    $(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
 })
</script>
<% } catch (Exception e) {e.printStackTrace();}%>