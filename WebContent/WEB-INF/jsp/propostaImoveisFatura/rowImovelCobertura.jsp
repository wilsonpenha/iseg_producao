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
	<s:textfield theme="simple" id="imovelCoberturaId%{imovelCoberturaList.size()}" name="proposta.imovelCollection[%{itemCorrente}].imovelCoberturaCollection[%{imovelCoberturaList.size()}].id" value="%{imovelCobertura.id}" cssStyle="display:none"/>
	<s:textfield theme="simple" id="coberturaImovelId%{imovelCoberturaList.size()}" name="proposta.imovelCollection[%{itemCorrente}].imovelCoberturaCollection[%{imovelCoberturaList.size()}].imovel.id" value="%{imovelCobertura.imovel.id}" cssStyle="display:none"/>
	<s:textfield theme="simple" id="coberturaBlnFranquia%{imovelCoberturaList.size()}" name="proposta.imovelCollection[%{itemCorrente}].imovelCoberturaCollection[%{imovelCoberturaList.size()}].blnInformaFranquia" value="%{imovelCobertura.blnInformaFranquia}" cssStyle="display:none"/>
	<s:textfield theme="simple" id="coberturaSequencia%{imovelCoberturaList.size()}" name="proposta.imovelCollection[%{itemCorrente}].imovelCoberturaCollection[%{imovelCoberturaList.size()}].sequencia" value="%{imovelCoberturaList.size()+1}" cssStyle="display:none"/>
	<s:textfield theme="simple" id="coberturaDescricao%{imovelCoberturaList.size()}" name="proposta.imovelCollection[%{itemCorrente}].imovelCoberturaCollection[%{imovelCoberturaList.size()}].descricao" value="%{imovelCobertura.descricao}" onchange="setAlterado(true);"/>
  </td>
  <td><s:textfield theme="simple" id="coberturaLmi%{imovelCoberturaList.size()}" cssClass="clValor2 currency" name="proposta.imovelCollection[%{itemCorrente}].imovelCoberturaCollection[%{imovelCoberturaList.size()}].lmi" onkeypress="return Mascara('numero1', event, document.getElementById('coberturaLmi%{imovelCoberturaList.size()}'));" onkeyup="enableDisableDadosCobertura('%{imovelCoberturaList.size()}');" onblur="javascript:valida_numero(this,15,2,'coberturaLmi%{imovelCoberturaList.size()}');" onchange="setAlterado(true);" cssStyle="width:80%" /></td>
  <s:if test="imovelCobertura.blnInformaFranquia">
    <td><s:textfield theme="simple" id="coberturaFranquia%{imovelCoberturaList.size()}" cssClass="clValor2 currency" name="proposta.imovelCollection[%{itemCorrente}].imovelCoberturaCollection[%{imovelCoberturaList.size()}].franquia" value="%{imovelCobertura.franquia}" onkeypress="return Mascara('numero1', event, document.getElementById('coberturaFranquia%{imovelCoberturaList.size()}'));" onblur="javascript:valida_numero(this,15,2,'coberturaFranquia%{imovelCoberturaList.size()}');" cssStyle="width:80%" onchange="setAlterado(true);"/></td>
    <td><s:textfield theme="simple" id="coberturaTextoFranquia%{imovelCoberturaList.size()}" name="proposta.imovelCollection[%{itemCorrente}].imovelCoberturaCollection[%{imovelCoberturaList.size()}].textoFranquia" maxlength="100" cssStyle="width:96%" onchange="setAlterado(true);"/></td>
  </s:if>
  <s:else>
    <td></td><td></td>
  </s:else>
  <td><s:textfield theme="simple" id="coberturaPremio%{imovelCoberturaList.size()}" cssClass="clValor2 currency" name="proposta.imovelCollection[%{itemCorrente}].imovelCoberturaCollection[%{imovelCoberturaList.size()}].premio" onkeypress="return Mascara('numero1', event, document.getElementById('coberturaPremio%{imovelCoberturaList.size()}'));" onblur="javascript:valida_numero(this,15,2,'coberturaPremio%{imovelCoberturaList.size()}');" cssStyle="width:80%" onchange="setAlterado(true);"/></td>
</tr>


<script>
$().ready(function() {
    $(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
 })
</script>
<% } catch (Exception e) {e.printStackTrace();}%>