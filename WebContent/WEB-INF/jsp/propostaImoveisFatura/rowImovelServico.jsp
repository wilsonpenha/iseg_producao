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
  <td width="30%" nowrap="nowrap">
	<s:textfield theme="simple" id="automovelServicoId%{automovelServicoList.size()}" name="proposta.automovelWizCollection[0].automovelServicosCollection[%{automovelServicoList.size()}].id" value="%{automovelServico.id}" cssStyle="display:none"/>
	<s:textfield theme="simple" id="servicoAutomovelId%{automovelServicoList.size()}" name="proposta.automovelWizCollection[0].automovelServicosCollection[%{automovelServicoList.size()}].automovel.id" value="%{automovelServico.automovel.id}" cssStyle="display:none"/>
	<s:textfield theme="simple" id="servicoBlnFranquia%{automovelServicoList.size()}" name="proposta.automovelWizCollection[0].automovelServicosCollection[%{automovelServicoList.size()}].blnInformaFranquia" value="%{automovelServico.blnInformaFranquia}" cssStyle="display:none"/>
	<s:textfield theme="simple" id="servicoSequencia%{automovelServicoList.size()}" name="proposta.automovelWizCollection[0].automovelServicosCollection[%{automovelServicoList.size()}].sequencia" value="%{automovelServicoList.size()+1}" cssStyle="display:none"/>
	<s:textfield theme="simple" id="servicoDescricao%{automovelServicoList.size()}" name="proposta.automovelWizCollection[0].automovelServicosCollection[%{automovelServicoList.size()}].descricao" value="%{automovelServico.descricao}" onchange="setAlterado(true);"/>
  </td>
  <td width="10%"><s:select theme="simple" id="servicoContratado%{automovelServicoList.size()}" name="proposta.automovelWizCollection[0].automovelServicosCollection[%{automovelServicoList.size()}].servicoContratado" list="{'NAO','SIM'}" onchange="enableDisableDadosServico('%{automovelServicoList.size()}');setAlterado(true);" cssStyle="width:55px;" /></td>
  <td width="15%"><s:textfield theme="simple" id="servicoTextoDescricao%{automovelServicoList.size()}" name="proposta.automovelWizCollection[0].automovelServicosCollection[%{automovelServicoList.size()}].textoDescricao"  maxlength="60" cssStyle="width:96%" onchange="setAlterado(true);"/></td>
  <s:if test="automovelServico.blnInformaFranquia">
    <td width="15%"><s:textfield theme="simple" id="servicoFranquia%{automovelServicoList.size()}" cssClass="clValor2 currency" name="proposta.automovelWizCollection[0].automovelServicosCollection[%{automovelServicoList.size()}].franquia" value="%{automovelServico.franquia}" onkeypress="return Mascara('numero1', event, document.getElementById('servicoFranquia%{automovelServicoList.size()}'));" onblur="javascript:valida_numero(this,15,2,'servicoFranquia%{automovelServicoList.size()}');" cssStyle="width:80%" onchange="setAlterado(true);"/></td>
    <td width="15%"><s:textfield theme="simple" id="servicoTextoFranquia%{automovelServicoList.size()}" name="proposta.automovelWizCollection[0].automovelServicosCollection[%{automovelServicoList.size()}].textoFranquia"  maxlength="60" cssStyle="width:96%" onchange="setAlterado(true);"/></td>
  </s:if>
  <s:else>
    <td width="15%"></td><td width="15%"></td>
  </s:else>
  <td width="15%"><s:textfield theme="simple" id="servicoPremio%{automovelServicoList.size()}" cssClass="clValor2 currency" name="proposta.automovelWizCollection[0].automovelServicosCollection[%{automovelServicoList.size()}].premio" onkeypress="return Mascara('numero1', event, document.getElementById('servicoPremio%{automovelServicoList.size()}'));" onblur="javascript:valida_numero(this,15,2,'servicoPremio%{automovelServicoList.size()}');" cssStyle="width:80%" onchange="setAlterado(true);"/></td>
</tr>

<script>
$().ready(function() {
    $(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
 })
</script>
<% } catch (Exception e) {e.printStackTrace();}%>