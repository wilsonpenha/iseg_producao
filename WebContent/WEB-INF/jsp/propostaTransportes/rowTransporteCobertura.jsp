<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try {
%>

			<table id="tableCoberturas" width="100%" border="0" cellpadding="2" cellspacing="1" >
				<tbody>
				  <tr>
					<td width="25%">Descrição</td>
					<td width="30%">Observações</td>
					<td width="15%">LMI</td>
					<td width="15%">Prêmio Cobertura</td>
					<td width="15%">Franquia</td>
				  </tr>
				  <s:iterator value="transporteCoberturaList" status="stat">
				  <s:if test="coberturas.id != null">
					<tr>
					  <td nowrap="nowrap">
						<s:textfield theme="simple" id="transporteCoberturasId%{#stat.index}" name="proposta.riscoTransportesCollection[0].transporteCoberturasCollection[%{#stat.index}].id" value="%{id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaId%{#stat.index}" name="proposta.riscoTransportesCollection[0].transporteCoberturasCollection[%{#stat.index}].coberturas.id" value="%{coberturas.id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaSeguradoId%{#stat.index}" name="proposta.riscoTransportesCollection[0].transporteCoberturasCollection[%{#stat.index}].riscoTransportes.id" value="%{riscoTransportes.id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaSequencia%{#stat.index}" name="proposta.riscoTransportesCollection[0].transporteCoberturasCollection[%{#stat.index}].sequencia" value="%{sequencia}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaDescricao%{#stat.index}" name="proposta.riscoTransportesCollection[0].transporteCoberturasCollection[%{#stat.index}].descricao" value="%{coberturas.descricao}" disabled="true" size="30" onchange="setSeguradoAlterado(true);" />
					  </td>
					  <td><s:textfield theme="simple" id="coberturaObservacao%{#stat.index}" name="proposta.riscoTransportesCollection[0].transporteCoberturasCollection[%{#stat.index}].textoFranquia" value="%{textoFranquia}" onchange="setSeguradoAlterado(true);" cssStyle="width:80%" /></td>
					  <td><s:textfield theme="simple" id="coberturaLmi%{#stat.index}" cssClass="clValor2 currency" name="proposta.riscoTransportesCollection[0].transporteCoberturasCollection[%{#stat.index}].lmi" value="%{lmi}" onkeyup="enableDisableDadosCobertura('%{#stat.index}');" onchange="setSeguradoAlterado(true);" cssStyle="width:80%" /></td>
					  <td><s:textfield theme="simple" id="coberturaPremio%{#stat.index}" cssClass="clValor2 currency" name="proposta.riscoTransportesCollection[0].transporteCoberturasCollection[%{#stat.index}].premio" value="%{premio}" cssStyle="width:80%" onchange="setSeguradoAlterado(true);"/></td>
					  <td><s:textfield theme="simple" id="coberturaFranquia%{#stat.index}" cssClass="clValor2 currency" name="proposta.riscoTransportesCollection[0].transporteCoberturasCollection[%{#stat.index}].franquia" value="%{franquia}" cssStyle="width:80%" onchange="setSeguradoAlterado(true);"/></td>
					</tr>
				  </s:if>
				  <s:else>
					<tr>
					  <td nowrap="nowrap">
						<s:textfield theme="simple" id="transporteCoberturasId%{#stat.index}" name="proposta.riscoTransportesCollection[0].transporteCoberturasCollection[%{#stat.index}].id" value="%{id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaSeguradoId%{#stat.index}" name="proposta.riscoTransportesCollection[0].transporteCoberturasCollection[%{#stat.index}].riscoTransportes.id" value="%{riscoTransportes.id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaSequencia%{#stat.index}" name="proposta.riscoTransportesCollection[0].transporteCoberturasCollection[%{#stat.index}].sequencia" value="%{sequencia}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaDescricao%{#stat.index}" name="proposta.riscoTransportesCollection[0].transporteCoberturasCollection[%{#stat.index}].descricao" value="%{descricao}" size="30" onchange="setSeguradoAlterado(true);" />
					  </td>
					  <td><s:textfield theme="simple" id="coberturaObservacao%{#stat.index}" name="proposta.riscoTransportesCollection[0].transporteCoberturasCollection[%{#stat.index}].textoFranquia" value="%{textoFranquia}" onchange="setSeguradoAlterado(true);" cssStyle="width:80%" /></td>
					  <td><s:textfield theme="simple" id="coberturaLmi%{#stat.index}" cssClass="clValor2 currency" name="proposta.riscoTransportesCollection[0].transporteCoberturasCollection[%{#stat.index}].lmi" value="%{lmi}" onkeyup="enableDisableDadosCobertura('%{#stat.index}');"  onchange="setSeguradoAlterado(true);" cssStyle="width:80%" /></td>
					  <td><s:textfield theme="simple" id="coberturaPremio%{#stat.index}" cssClass="clValor2 currency" name="proposta.riscoTransportesCollection[0].transporteCoberturasCollection[%{#stat.index}].premio" value="%{premio}" cssStyle="width:80%" onchange="setSeguradoAlterado(true);"/></td>
					  <td><s:textfield theme="simple" id="coberturaFranquia%{#stat.index}" cssClass="clValor2 currency" name="proposta.riscoTransportesCollection[0].transporteCoberturasCollection[%{#stat.index}].franquia" value="%{franquia}" cssStyle="width:80%" onchange="setSeguradoAlterado(true);"/></td>
					</tr>
				  </s:else>
				  </s:iterator>
				  </tbody>
				</table>
				
<script>
$().ready(function() {
    $(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
 })
</script>
<% } catch (Exception e) {e.printStackTrace();}%>