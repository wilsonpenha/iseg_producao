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
  			<s:textfield style="display:none" name="orcamentoSeguro.orcamentoCoberturaIsegCollection[%{orcamentoCoberturaIsegList.size()-1}].id" value="%{orcamentoCoberturaIsegList[orcamentoCoberturaIsegList.size()-1].id}"/>
  			<s:textfield style="display:none" name="orcamentoSeguro.orcamentoCoberturaIsegCollection[%{orcamentoCoberturaIsegList.size()-1}].orcamentoSeguro.id" value="%{orcamentoCoberturaIsegList[orcamentoCoberturaIsegList.size()-1].orcamentoSeguro.id}"/>
  			<s:textfield style="display:none" name="orcamentoSeguro.orcamentoCoberturaIsegCollection[%{orcamentoCoberturaIsegList.size()-1}].coberturasIseg.id" value="%{orcamentoCoberturaIsegList[orcamentoCoberturaIsegList.size()-1].coberturasIseg.id}"/>
<!--  			<s:textfield theme="simple" cssClass="TextBox_OneCells_width" id="orcCobIsegDescricao%{orcamentoCoberturaIsegList.size()-1}" name="orcamentoSeguro.orcamentoCoberturaIsegCollection[%{orcamentoCoberturaIsegList.size()-1}].descricao" value="%{orcamentoCoberturaIsegList[orcamentoCoberturaIsegList.size()-1].descricao}" onchange="setAlterado(true);" />-->
			<s:property value="%{orcamentoCoberturaIsegList[orcamentoCoberturaIsegList.size()-1].coberturasIseg.descricao}"/>
  		</td>
  		<td>
  		</td>
  		<td>
  			<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" name="orcamentoSeguro.orcamentoCoberturaIsegCollection[%{orcamentoCoberturaIsegList.size()-1}].lmi" onchange="setAlterado(true);"/>
  		</td>
  		<td>
  			<s:textfield theme="simple" cssClass="TextBox_OneCells_width" style="width: 80%;" id="orcCobIsegObs%{orcamentoCoberturaIsegList.size()-1}" name="orcamentoSeguro.orcamentoCoberturaIsegCollection[%{orcamentoCoberturaIsegList.size()-1}].textoFranquia" onchange="setAlterado(true);" />
  		</td>
  	</tr>
<script>
$().ready(function() {
    $(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
 });
</script>
<% } catch (Exception e) {e.printStackTrace();}%>