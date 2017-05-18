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
						<s:textfield theme="simple" id="riscoCoberturasId%{riscoCoberturaList.size()-1}" name="proposta.riscoDiversosCollection[%{itemCorrente}].riscoCoberturasCollection[%{riscoCoberturaList.size()-1}].id" value="%{riscoCobertura.id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaSeguradoId%{riscoCoberturaList.size()-1}" name="proposta.riscoDiversosCollection[%{itemCorrente}].riscoCoberturasCollection[%{riscoCoberturaList.size()-1}].riscoDiversos.id" value="%{riscoCobertura.riscoDiversos.id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaSequencia%{riscoCoberturaList.size()-1}" name="proposta.riscoDiversosCollection[%{itemCorrente}].riscoCoberturasCollection[%{riscoCoberturaList.size()-1}].sequencia" value="%{riscoCoberturaList.size()}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaDescricao%{riscoCoberturaList.size()-1}" name="proposta.riscoDiversosCollection[%{itemCorrente}].riscoCoberturasCollection[%{riscoCoberturaList.size()-1}].descricao" value="%{riscoCobertura.descricao}" size="30" onchange="setRiscoAlterado(true);" />
					  </td>
					  <td><s:textfield theme="simple" id="coberturaObservacao%{riscoCoberturaList.size()-1}" name="proposta.riscoDiversosCollection[%{itemCorrente}].riscoCoberturasCollection[%{riscoCoberturaList.size()-1}].textoFranquia" value="%{riscoCobertura.textoFranquia}" onchange="setRiscoAlterado(true);" cssStyle="width:80%" /></td>
					  <td><s:textfield theme="simple" id="coberturaLmi%{riscoCoberturaList.size()-1}" cssClass="clValor2 currency" name="proposta.riscoDiversosCollection[%{itemCorrente}].riscoCoberturasCollection[%{riscoCoberturaList.size()-1}].lmi" value="%{riscoCobertura.lmi}" onkeyup="enableDisableDadosCobertura('%{riscoCoberturaList.size()-1}');"  onchange="setRiscoAlterado(true);" cssStyle="width:80%" /></td>
					  <td><s:textfield theme="simple" id="coberturaPremio%{riscoCoberturaList.size()-1}" cssClass="clValor2 currency" name="proposta.riscoDiversosCollection[%{itemCorrente}].riscoCoberturasCollection[%{riscoCoberturaList.size()-1}].premio" value="%{riscoCobertura.premio}" cssStyle="width:80%" onchange="setRiscoAlterado(true);"/></td>
					  <td><s:textfield theme="simple" id="coberturaFranquia%{riscoCoberturaList.size()-1}" cssClass="clValor2 currency" name="proposta.riscoDiversosCollection[%{itemCorrente}].riscoCoberturasCollection[%{riscoCoberturaList.size()-1}].franquia" value="%{riscoCobertura.franquia}" cssStyle="width:80%" onchange="setRiscoAlterado(true);"/></td>
					</tr>
				
<script>
$().ready(function() {
    $(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
 })
</script>
<% } catch (Exception e) {e.printStackTrace();}%>