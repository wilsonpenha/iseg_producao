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
  		<td>
  			<s:textfield style="display:none" name="orcamentoSeguro.orcamentoServicosIsegCollection[%{orcamentoServicosIsegList.size()-1}].id" value="%{orcamentoServicosIsegList[orcamentoServicosIsegList.size()-1].id}"/>
  			<s:textfield style="display:none" name="orcamentoSeguro.orcamentoServicosIsegCollection[%{orcamentoServicosIsegList.size()-1}].orcamentoSeguro.id" value="%{orcamentoServicosIsegList[orcamentoServicosIsegList.size()-1].orcamentoSeguro.id}"/>
  			<s:textfield style="display:none" name="orcamentoSeguro.orcamentoServicosIsegCollection[%{orcamentoServicosIsegList.size()-1}].servicosIseg.id" value="%{orcamentoServicosIsegList[orcamentoServicosIsegList.size()-1].servicosIseg.id}"/>
<!--			<s:textfield name="orcamentoSeguro.orcamentoServicosIsegCollection[%{orcamentoServicosIsegList.size()-1}].servicosIseg.descricao" value="%{orcamentoServicosIsegList[orcamentoServicosIsegList.size()-1].servicosIseg.descricao}" onchange="setAlterado(true);"/>-->
			<s:property value="%{orcamentoServicosIsegList[orcamentoServicosIsegList.size()-1].servicosIseg.descricao}"/>
		</td>
		<td><s:select theme="simple" cssClass="" headerKey="" id="isAtiva%{#j.index}"  tabindex="6" list="#{false:'NÃO',true:'SIM'}" name="orcamentoSeguro.orcamentoServicosIsegCollection[%{orcamentoServicosIsegList.size()-1}].informaFranquia" style="width: 50px" onchange="setAlterado(true);"/></td>
		<td>
			<s:textfield theme="simple" style="width: 84%;" cssClass="TextBox_OneCells_width" id="textoDescricao%{#j.index}" name="orcamentoSeguro.orcamentoServicosIsegCollection[%{orcamentoServicosIsegList.size()-1}].textoDescricao" onchange="setAlterado(true);"/>
		</td>
  	</tr>
<script>
$().ready(function() {
    $(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
 })
</script>
<% } catch (Exception e) {e.printStackTrace();} %>