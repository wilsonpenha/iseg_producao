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
	<s:textfield theme="simple" id="automovelServicoId%{automovelServicoList.size()-1}" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelServicosCollection[%{automovelServicoList.size()-1}].id" value="%{automovelServico.id}" cssStyle="display:none"/>
	<s:textfield theme="simple" id="automovelServicoId%{automovelServicoList.size()-1}" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelServicosCollection[%{automovelServicoList.size()-1}].servicosIseg.id" value="%{automovelServico.servicosIseg.id}" cssStyle="display:none"/>
	<s:textfield theme="simple" id="servicoAutomovelId%{automovelServicoList.size()-1}" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelServicosCollection[%{automovelServicoList.size()-1}].automovel.id" value="%{automovelServico.automovel.id}" cssStyle="display:none"/>
	<s:textfield theme="simple" id="servicoBlnFranquia%{automovelServicoList.size()-1}" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelServicosCollection[%{automovelServicoList.size()-1}].blnInformaFranquia" value="%{automovelServico.blnInformaFranquia}" cssStyle="display:none"/>
	<s:textfield theme="simple" id="servicoSequencia%{automovelServicoList.size()-1}" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelServicosCollection[%{automovelServicoList.size()-1}].sequencia" value="%{automovelServicoList.size()-1+1}" cssStyle="display:none"/>
	<s:if test="%{automovelServico.descricao != null}">
		<s:textfield theme="simple" id="servicoDescricao%{automovelServicoList.size()-1}" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelServicosCollection[%{automovelServicoList.size()-1}].descricao" value="%{automovelServico.descricao}" onchange="setAutomovelAlterado(true);"/>
	</s:if>
	<s:else>
		<s:property value="%{automovelServico.servicosIseg.descricao}"/>
	</s:else>
  </td>
  <td width="10%"><s:select theme="simple" id="servicoContratado%{automovelServicoList.size()-1}" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelServicosCollection[%{automovelServicoList.size()-1}].servicoContratado" list="{'NAO','SIM'}" onchange="enableDisableDadosServico('%{automovelServicoList.size()-1}');setAutomovelAlterado(true);" cssStyle="width:55px;" /></td>
  <td width="15%"><s:textfield theme="simple" id="servicoTextoDescricao%{automovelServicoList.size()-1}" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelServicosCollection[%{automovelServicoList.size()-1}].textoDescricao"  maxlength="60" cssStyle="width:96%" onchange="setAutomovelAlterado(true);"/></td>
  <s:if test="automovelServico.blnInformaFranquia">
    <td width="15%"><s:textfield theme="simple" id="servicoFranquia%{automovelServicoList.size()-1}" cssClass="clValor2 currency" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelServicosCollection[%{automovelServicoList.size()-1}].franquia" value="%{automovelServico.franquia}" onkeypress="return Mascara('numero1', event, document.getElementById('servicoFranquia%{automovelServicoList.size()-1}'));" onblur="javascript:valida_numero(this,15,2,'servicoFranquia%{automovelServicoList.size()-1}');" cssStyle="width:80%" onchange="setAutomovelAlterado(true);"/></td>
    <td width="15%"><s:textfield theme="simple" id="servicoTextoFranquia%{automovelServicoList.size()-1}" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelServicosCollection[%{automovelServicoList.size()-1}].textoFranquia"  maxlength="60" cssStyle="width:96%" onchange="setAutomovelAlterado(true);"/></td>
  </s:if>
  <s:else>
    <td width="15%"></td><td width="15%"></td>
  </s:else>
  <td width="15%"><s:textfield theme="simple" id="servicoPremio%{automovelServicoList.size()-1}" cssClass="clValor2 currency" name="proposta.propostaAutomovelCollection[%{itemCorrente}].automovel.automovelServicosCollection[%{automovelServicoList.size()-1}].premio" onkeypress="return Mascara('numero1', event, document.getElementById('servicoPremio%{automovelServicoList.size()-1}'));" onblur="javascript:valida_numero(this,15,2,'servicoPremio%{automovelServicoList.size()-1}');" cssStyle="width:80%" onchange="setAutomovelAlterado(true);"/></td>
</tr>

<script>
$().ready(function() {
    $(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
 })
</script>
<% } catch (Exception e) {e.printStackTrace();}%>