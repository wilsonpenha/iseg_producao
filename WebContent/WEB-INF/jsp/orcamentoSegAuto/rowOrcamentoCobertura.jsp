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
			<s:textfield name="orcamentoSeguradora.orcamentoCoberturaCollection[%{orcamentoSeguradora.getOrcamentoCoberturaCollection().size()-1}].coberturas.coberturasIseg.id" style="display:none" />
			<s:textfield name="orcamentoSeguradora.orcamentoCoberturaCollection[%{orcamentoSeguradora.getOrcamentoCoberturaCollection().size()-1}].coberturasIseg.id" style="display:none" />
			<s:textfield name="orcamentoSeguradora.orcamentoCoberturaCollection[%{orcamentoSeguradora.getOrcamentoCoberturaCollection().size()-1}].coberturas.id" style="display:none" />
			<s:textfield name ="orcamentoSeguradora.orcamentoCoberturaCollection[%{orcamentoSeguradora.getOrcamentoCoberturaCollection().size()-1}].orcamentoSeguradora.id" style="display:none"/>
			<s:textfield name ="orcamentoSeguradora.orcamentoCoberturaCollection[%{orcamentoSeguradora.getOrcamentoCoberturaCollection().size()-1}].id" style="display:none"/>
			<label><s:property value="%{orcamentoSeguradora.orcamentoCoberturaCollection[orcamentoSeguradora.getOrcamentoCoberturaCollection().size()-1].coberturas.descricao}"/></label>
		</td>
		<td></td>
		<td>
			<s:if test="%{#k.index == 0}">
				<label>Percentual/LMI</label><br />
			</s:if>
			<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" name="orcamentoSeguradora.orcamentoCoberturaCollection[%{orcamentoSeguradora.getOrcamentoCoberturaCollection().size()-1}].lmi" size="14" maxlength="14" value="%{orcamentoSeguradora.orcamentoCoberturaCollection[orcamentoSeguradora.getOrcamentoCoberturaCollection().size()-1].lmi}"/>
		</td>
		<td>
			<s:if test="%{#k.index == 0}">
				<label class="LabelText" for="fator">Franquia</label><br />
			</s:if>
			<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" name="orcamentoSeguradora.orcamentoCoberturaCollection[%{orcamentoSeguradora.getOrcamentoCoberturaCollection().size()-1}].franquia" size="10" maxlength="14" value="%{orcamentoSeguradora.orcamentoCoberturaCollection[orcamentoSeguradora.getOrcamentoCoberturaCollection().size()-1].franquia}"/>
		</td>
		<td>
			<s:if test="%{#k.index == 0}">
				<label>Observações</label><br />
			</s:if>
			<s:textfield theme="simple" name="orcamentoSeguradora.orcamentoCoberturaCollection[%{orcamentoSeguradora.getOrcamentoCoberturaCollection().size()-1}].textoFranquia" value="%{orcamentoSeguradora.orcamentoCoberturaCollection[orcamentoSeguradora.getOrcamentoCoberturaCollection().size()-1].textoFranquia}" />
		</td>
		<td>
			<s:if test="%{#k.index == 0}">
				<label>Premio Líquido</label><br />
			</s:if>
			<s:textfield theme="simple" name="orcamentoSeguradora.orcamentoCoberturaCollection[%{orcamentoSeguradora.getOrcamentoCoberturaCollection().size()-1}].premio" value="%{orcamentoSeguradora.orcamentoCoberturaCollection[orcamentoSeguradora.getOrcamentoCoberturaCollection().size()-1].premio}" cssClass="TextBox_OneCells_width clValor2 currency" size="12" maxlength="14"/>
		</td>
	</tr>
<script>
$().ready(function() {
    $(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
 });
</script>
<% } catch (Exception e) {e.printStackTrace();}%>