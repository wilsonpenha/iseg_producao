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
	<s:textfield theme="simple" id="seguradoCoberturasId%{seguradoCoberturasList.size()}" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].seguradoCoberturasCollection[%{seguradoCoberturasList.size()}].id" value="%{seguradoCoberturas.id}" cssStyle="display:none"/>
	<s:textfield theme="simple" id="coberturaSeguradoId%{seguradoCoberturasList.size()}" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].seguradoCoberturasCollection[%{seguradoCoberturasList.size()}].seguradoEmpresarial.id" value="%{seguradoEmpresarial.id}" cssStyle="display:none"/>
	<s:textfield theme="simple" id="coberturaSequencia%{seguradoCoberturasList.size()}" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].seguradoCoberturasCollection[%{seguradoCoberturasList.size()}].sequencia" value="%{seguradoCoberturas.sequencia}" cssStyle="display:none"/>
	<s:textfield theme="simple" id="coberturaDescricao%{seguradoCoberturasList.size()}" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].seguradoCoberturasCollection[%{seguradoCoberturasList.size()}].descricao" value="%{seguradoCoberturas.descricao}" size="30" onchange="setSeguradoAlterado(true);" />
  </td>
  <td><s:textfield theme="simple" id="coberturaLmi%{seguradoCoberturasList.size()}" cssClass="clValor2 currency" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].seguradoCoberturasCollection[%{seguradoCoberturasList.size()}].lmi" value="%{seguradoCoberturas.lmi}" onkeyup="enableDisableDadosCobertura('%{seguradoCoberturasList.size()}');"  onchange="setSeguradoAlterado(true);" cssStyle="width:80%" /></td>
  <td><s:textfield theme="simple" id="coberturaPremio%{seguradoCoberturasList.size()}" cssClass="clValor2 currency" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].seguradoCoberturasCollection[%{seguradoCoberturasList.size()}].premio" value="%{seguradoCoberturas.premio}" cssStyle="width:80%" onchange="setSeguradoAlterado(true);"/></td>
</tr>

<script>
$().ready(function() {
    $(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
 })
</script>
<% } catch (Exception e) {e.printStackTrace();}%>