<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try {
%>
<tr style="display:none">
	<td>
		<s:textfield name="orcamentoSeguro.orcamentoSeguradoraCollection[%{itemCorrente}].orcamentoFranquiasCollection[%{orcamentoSeguradoraList[itemCorrente].orcamentoFranquiasCollection.size()-1}].id" value="%{orcamentoSeguradoraList[itemCorrente].orcamentoFranquiasCollection[orcamentoSeguradoraList[itemCorrente].orcamentoFranquiasCollection.size()-1].id}" style="display:none"/>
		<s:textfield name="orcamentoSeguro.orcamentoSeguradoraCollection[%{itemCorrente}].orcamentoFranquiasCollection[%{orcamentoSeguradoraList[itemCorrente].orcamentoFranquiasCollection.size()-1}].orcamentoSeguradora.id" value="%{orcamentoSeguradoraList[itemCorrente].id}" style="display:none"/>
		<s:textfield name="orcamentoSeguro.orcamentoSeguradoraCollection[%{itemCorrente}].orcamentoFranquiasCollection[%{orcamentoSeguradoraList[itemCorrente].orcamentoFranquiasCollection.size()-1}].orcamentoSeguradora.orcamentoSeguro.id" value="%{orcamentoSeguradoraList[itemCorrente].orcamentoSeguro.id}" style="display:none"/>
		<s:textfield name="orcamentoSeguro.orcamentoSeguradoraCollection[%{itemCorrente}].orcamentoFranquiasCollection[%{orcamentoSeguradoraList[itemCorrente].orcamentoFranquiasCollection.size()-1}].iof" style="display:none"/>
		<s:textfield name="orcamentoSeguro.orcamentoSeguradoraCollection[%{itemCorrente}].orcamentoFranquiasCollection[%{orcamentoSeguradoraList[itemCorrente].orcamentoFranquiasCollection.size()-1}].premioLiquido" style="display:none"/>
		<s:textfield name="orcamentoSeguro.orcamentoSeguradoraCollection[%{itemCorrente}].orcamentoFranquiasCollection[%{orcamentoSeguradoraList[itemCorrente].orcamentoFranquiasCollection.size()-1}].custoApolice" style="display:none"/>
	</td>
</tr>
<tr>
 	<td style="background-color: #E8E8E8; border: #E8E8E8;" nowrap="nowrap"></td>
 	<td style="background-color: #E8E8E8; border: #E8E8E8;" nowrap="nowrap"></td>
	<td style="background-color: #E8E8E8; border: #E8E8E8;" nowrap="nowrap" ></td>
	<td style="background-color: #E8E8E8; border: #E8E8E8;" nowrap="nowrap" ></td>
	<td style="background-color: #E8E8E8; border: #E8E8E8;" nowrap="nowrap" ></td>
	<td style="background-color: #E8E8E8; border: #E8E8E8;" nowrap="nowrap"></td>
	<td style="background-color: #E8E8E8; border: #E8E8E8;" nowrap="nowrap"></td>
 	<td>
 		<s:select headerKey="" headerValue="-- Selecione --" list="tipoFranquias" name="orcamentoSeguro.orcamentoSeguradoraCollection[%{itemCorrente}].orcamentoFranquiasCollection[%{orcamentoSeguradoraList[itemCorrente].orcamentoFranquiasCollection.size()-1}].tipoFranquia.id" listKey="id" listValue="valor" value="%{orcamentoSeguradoraList[itemCorrente].orcamentoFranquiasCollection[orcamentoSeguradoraList[itemCorrente].orcamentoFranquiasCollection.size()-1].tipoFranquia.id}" cssClass="Combo_OneCell_width" onchange="setAlterado(true);" />
 	</td>
 	<td align="center">
 		<s:textfield style="width: 95%;" cssClass="TextBox_OneCells_width clValor2 currency" name="orcamentoSeguro.orcamentoSeguradoraCollection[%{itemCorrente}].orcamentoFranquiasCollection[%{orcamentoSeguradoraList[itemCorrente].orcamentoFranquiasCollection.size()-1}].premioTotal" value="%{orcamentoSeguradoraList[itemCorrente].orcamentoFranquiasCollection[orcamentoSeguradoraList[itemCorrente].orcamentoFranquiasCollection.size()-1].premioTotal}" onchange="setAlterado(true);"/>
 	</td>
 	<td align="center">
 		<s:textfield style="width: 95%;" cssClass="TextBox_OneCells_width clValor2 currency" name="orcamentoSeguro.orcamentoSeguradoraCollection[%{itemCorrente}].orcamentoFranquiasCollection[%{orcamentoSeguradoraList[itemCorrente].orcamentoFranquiasCollection.size()-1}].valorFranquia" value="%{orcamentoSeguradoraList[itemCorrente].orcamentoFranquiasCollection[orcamentoSeguradoraList[itemCorrente].orcamentoFranquiasCollection.size()-1].valorFranquia}" onchange="setAlterado(true);"/>
 	</td>
 	<td align="center">
 		<s:a href="#" onclick="if(confirma('Confirma exclusão?')){removeFranquiaOrcamentoSeguradora(%{orcamentoSeguradoraList[itemCorrente].id},%{orcamentoSeguradoraList[itemCorrente].orcamentoFranquiasCollection[orcamentoSeguradoraList[itemCorrente].orcamentoFranquiasCollection.size()-1].id});}">
 			<img class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Delete" src="<s:url value="/common/web/images/blank.gif" />" title="Excluir" border="0" id="buttonFirst">
 		</s:a>
 	</td>
 	<td align="center">
 		<s:a href="#" onclick="abrirModalGeraProposta(orcamentoSeguro.orcamentoSeguradoraCollection[%{itemCorrente}].orcamentoFranquiasCollection[%{orcamentoSeguradoraList[itemCorrente].orcamentoFranquiasCollection.size()-1}].id)">
 			<img class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_GerarProposta" src="<s:url value="/common/web/images/blank.gif" />" title="Gerar Proposta" border="0" id="buttonFirst">
 		</s:a>
 	</td>
 	<td style="background-color: #E8E8E8; border: #E8E8E8;"></td>
 	<td style="background-color: #E8E8E8; border: #E8E8E8;"></td>
</tr>
<script>
$().ready(function() {
    $(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
 });
</script>

<% } catch (Exception e) {e.printStackTrace();}%>