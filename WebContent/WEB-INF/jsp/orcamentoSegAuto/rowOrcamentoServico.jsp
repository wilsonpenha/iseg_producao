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
			<s:textfield name="orcamentoSeguradora.orcamentoServicosCollection[%{orcamentoSeguradora.getOrcamentoServicosCollection().size()-1}].servicos.servicosIseg.id" style="display:none" />
			<s:textfield name="orcamentoSeguradora.orcamentoServicosCollection[%{orcamentoSeguradora.getOrcamentoServicosCollection().size()-1}].servicosIseg.id" style="display:none" />
			<s:textfield name="orcamentoSeguradora.orcamentoServicosCollection[%{orcamentoSeguradora.getOrcamentoServicosCollection().size()-1}].servicos.id" style="display:none" />
			<s:textfield name ="orcamentoSeguradora.orcamentoServicosCollection[%{orcamentoSeguradora.getOrcamentoServicosCollection().size()-1}].orcamentoSeguradora.id" style="display:none"/>
			<s:textfield name ="orcamentoSeguradora.orcamentoServicosCollection[%{orcamentoSeguradora.getOrcamentoServicosCollection().size()-1}].id" style="display:none"/>
			<label><s:property value="%{orcamentoSeguradora.orcamentoServicosCollection[orcamentoSeguradora.getOrcamentoServicosCollection().size()-1].servicos.descricao}"/></label>
		</td>
		<td>
			<s:if test="%{#k.index == 0}">
				<label class="LabelText" for="fator">Franquia</label><br />
			</s:if>
			<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" name="orcamentoSeguradora.orcamentoServicosCollection[%{orcamentoSeguradora.getOrcamentoServicosCollection().size()-1}].franquia" size="14" maxlength="14" value="%{orcamentoSeguradora.orcamentoServicosCollection[orcamentoSeguradora.getOrcamentoServicosCollection().size()-1].franquia}"/>
		</td>
		<td>
			<s:if test="%{#k.index == 0}">
				<label>Observações</label><br />
			</s:if>
			<s:textfield theme="simple" name="orcamentoSeguradora.orcamentoServicosCollection[%{orcamentoSeguradora.getOrcamentoServicosCollection().size()-1}].textoFranquia" value="%{orcamentoSeguradora.orcamentoServicosCollection[orcamentoSeguradora.getOrcamentoServicosCollection().size()-1].textoFranquia}" />
		</td>
		<td>
			<s:if test="%{#k.index == 0}">
				<label>Premio Líquido</label><br />
			</s:if>
			<s:textfield theme="simple" name="orcamentoSeguradora.orcamentoServicosCollection[%{orcamentoSeguradora.getOrcamentoServicosCollection().size()-1}].premio" value="%{orcamentoSeguradora.orcamentoServicosCollection[orcamentoSeguradora.getOrcamentoServicosCollection().size()-1].premio}" cssClass="TextBox_OneCells_width clValor2 currency" size="12" maxlength="14"/>
		</td>
	</tr>
<script>
$().ready(function() {
    $(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
 });
</script>
<% } catch (Exception e) {e.printStackTrace();}%>