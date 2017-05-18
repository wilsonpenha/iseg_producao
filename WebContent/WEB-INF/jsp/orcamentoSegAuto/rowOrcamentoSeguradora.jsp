<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try {
%>
<table id="calculo_<s:property value="%{orcamentoSeguradoraList[orcamentoSeguradoraList.size()-1].id}"/>" style="text-indent: 0; margin-bottom: 0px" class="listItens" width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr style="display:none;">
		<td>
<%-- 			<s:textfield name="orcamentoSeguradoraList[%{orcamentoSeguradoraList.size()-1}].orcamentoFranquiasCollection[%{orcamentoSeguradoraList[orcamentoSeguradoraList.size()-1].orcamentoFranquiasCollection.size()-1}].id" style="display:none" /> --%>
	 		<s:textfield name="orcamentoSeguro.orcamentoSeguradoraCollection[%{orcamentoSeguradoraList.size()-1}].id" value="%{orcamentoSeguradoraList[orcamentoSeguradoraList.size()-1].id}" style="display:none" />
	 		<s:textfield name="orcamentoSeguro.orcamentoSeguradoraCollection[%{orcamentoSeguradoraList.size()-1}].seguradora.id" value="%{orcamentoSeguradoraList[orcamentoSeguradoraList.size()-1].seguradora.id}" style="display:none" />
	 		<s:textfield name="orcamentoSeguro.orcamentoSeguradoraCollection[%{orcamentoSeguradoraList.size()-1}].item" value="%{orcamentoSeguradoraList[orcamentoSeguradoraList.size()-1].item}" style="display:none"/>
	 		<s:textfield name="orcamentoSeguro.orcamentoSeguradoraCollection[%{orcamentoSeguradoraList.size()-1}].custoApolice" value="%{orcamentoSeguradoraList[orcamentoSeguradoraList.size()-1].custoApolice}" style="display:none"/>
	 		<s:textfield name="orcamentoSeguro.orcamentoSeguradoraCollection[%{orcamentoSeguradoraList.size()-1}].iof" value="%{orcamentoSeguradoraList[orcamentoSeguradoraList.size()-1].iof}" style="display:none"/>
	 		<s:textfield name="orcamentoSeguro.orcamentoSeguradoraCollection[%{orcamentoSeguradoraList.size()-1}].qtdeParcelas" value="%{orcamentoSeguradoraList[orcamentoSeguradoraList.size()-1].qtdeParcelas}" style="display:none"/>
	 		<s:textfield name="orcamentoSeguro.orcamentoSeguradoraCollection[%{orcamentoSeguradoraList.size()-1}].orcamentoSeguro.id" value="%{orcamentoSeguradoraList[orcamentoSeguradoraList.size()-1].orcamentoSeguro.id}" style="display:none"/>
	 		<s:textfield name="orcamentoSeguro.orcamentoSeguradoraCollection[%{orcamentoSeguradoraList.size()-1}].orcamentoFranquiasCollection[%{orcamentoSeguradoraList[orcamentoSeguradoraList.size()-1].orcamentoFranquiasCollection.size()-1}].orcamentoSeguradora.id" value="%{orcamentoSeguradoraList[orcamentoSeguradoraList.size()-1].id}" style="display:none"/>
	 		<s:textfield name="orcamentoSeguro.orcamentoSeguradoraCollection[%{orcamentoSeguradoraList.size()-1}].orcamentoFranquiasCollection[%{orcamentoSeguradoraList[orcamentoSeguradoraList.size()-1].orcamentoFranquiasCollection.size()-1}].id" value="%{orcamentoSeguradoraList[orcamentoSeguradoraList.size()-1].orcamentoFranquiasCollection[orcamentoSeguradoraList[orcamentoSeguradoraList.size()-1].orcamentoFranquiasCollection.size()-1].id}" style="display:none"/>
	 		<s:textfield name="orcamentoSeguro.orcamentoSeguradoraCollection[%{orcamentoSeguradoraList.size()-1}].observacao" value="%{orcamentoSeguradoraList[orcamentoSeguradoraList.size()-1].observacao}" style="display:none"/>
		</td>
	</tr>
	<tr class="listItensHeader" style="visibility: hidden; height: 0px; line-height: 0px; border: 0px;">
	  	<td width="3%" colspan="3" nowrap="nowrap">Item</td>
		<td width="20%" nowrap="nowrap" >Seguradora</td>
		<td width="20%" nowrap="nowrap" >Rótulo</td>
		<td width="5%" nowrap="nowrap" >Data Cálculo</td>
		<td width="5%" nowrap="nowrap">Fator</td>
		<td width="5%" nowrap="nowrap">Tipo</td>
		<td width="17%" nowrap="nowrap">Prêmio</td>
		<td width="15%" nowrap="nowrap">Franquia</td>
		<td width="10%" colspan="5" nowrap="nowrap">Ações</td>
	</tr>
	<tr>
		<td>
			<s:checkbox name="orcamentoSegId" fieldValue="%{orcamentoSeguradoraList[orcamentoSeguradoraList.size()-1].id}" value="%{orcamentoSeguradoraList[orcamentoSeguradoraList.size()-1].id}"/>
		</td>
	 	<td>
	 		<s:textfield name="orcamentoSeguradora.item" value="%{orcamentoSeguradoraList.size()}" style="display:none;"/>
	 		<s:property value="orcamentoSeguradora.item"/>
	 	</td>
	 	<td>
	 		<s:if test="orcamentoSeguradoraList[%{orcamentoSeguradoraList.size()-1}].propostaAnexoCollection.size()>0">
	 			<a href="#"><img class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Attach" src="<s:url value="/common/web/images/blank.gif" />" title="Anexo" border="0" id="buttonFirst"></a>
	 		</s:if>
	 		<s:else >
	 			<a href="#" style="visibility: hidden;"><img class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Attach" src="<s:url value="/common/web/images/blank.gif" />" title="Anexo" border="0" id="buttonFirst"></a>
	 		</s:else>
	 	</td>
	 	<td>
	 		<s:textfield id="seguradoraNome%{orcamentoSeguradoraList.size()-1}" value="%{orcamentoSeguradoraList[orcamentoSeguradoraList.size()-1].seguradora.nome}" disabled="true" style="background: #D8D8D8; border: #D8D8D8; width: 100%;"/>
	 	</td>
	 	<td>
	 		<s:textfield style="width: 98%;" name="orcamentoSeguro.orcamentoSeguradoraCollection[%{orcamentoSeguradoraList.size()-1}].rotulo" value="%{orcamentoSeguradoraList[orcamentoSeguradoraList.size()-1].rotulo}"/>
	 	</td>
	 	<td>
	 		<s:textfield style="width: 98%;" name="orcamentoSeguro.orcamentoSeguradoraCollection[%{orcamentoSeguradoraList.size()-1}].dataCalculo" value="%{orcamentoSeguradoraList[orcamentoSeguradoraList.size()-1].dataCalculo}"/>
	 	</td>
	 	<td>
	 		<s:textfield style="width: 98%;" cssClass="TextBox_OneCells_width clValor2 currency fator" name="orcamentoSeguro.orcamentoSeguradoraCollection[%{orcamentoSeguradoraList.size()-1}].fator" value="%{orcamentoSeguradoraList[orcamentoSeguradoraList.size()-1].fator}"/>
	 	</td>
	 	<td>
	 		<s:select headerKey="" headerValue="-- Selecione --" list="tipoFranquias" name="orcamentoSeguro.orcamentoSeguradoraCollection[%{orcamentoSeguradoraList.size()-1}].orcamentoFranquiasCollection[%{orcamentoSeguradoraList[orcamentoSeguradoraList.size()-1].orcamentoFranquiasCollection.size()-1}].tipoFranquia.id" listKey="id" listValue="valor" value="%{orcamentoSeguradoraList[orcamentoSeguradoraList.size()-1].orcamentoFranquiasCollection[orcamentoSeguradoraList[orcamentoSeguradoraList.size()-1].orcamentoFranquiasCollection.size()-1].tipoFranquia.id}" cssClass="Combo_OneCell_width" />
<%-- 	 		<s:textfield style="width: 98%;" cssClass="TextBox_OneCells_width" name="orcamentoSeguro.orcamentoSeguradoraCollection[%{orcamentoSeguradoraList.size()-1}].orcamentoFranquiasCollection[%{orcamentoSeguradoraList[orcamentoSeguradoraList.size()-1].orcamentoFranquiasCollection.size()-1}].descricao" value="%{orcamentoSeguradoraList[orcamentoSeguradoraList.size()-1].orcamentoFranquiasCollection[orcamentoSeguradoraList[orcamentoSeguradoraList.size()-1].orcamentoFranquiasCollection.size()-1].tipoFranquia.valor}"/> --%>
	 	</td>
	 	<td>
	 		<s:textfield style="width: 98%;" cssClass="TextBox_OneCells_width clValor2 currency" name="orcamentoSeguro.orcamentoSeguradoraCollection[%{orcamentoSeguradoraList.size()-1}].orcamentoFranquiasCollection[%{orcamentoSeguradoraList[orcamentoSeguradoraList.size()-1].orcamentoFranquiasCollection.size()-1}].premioTotal" value="%{orcamentoSeguradoraList[orcamentoSeguradoraList.size()-1].orcamentoFranquiasCollection[orcamentoSeguradoraList[orcamentoSeguradoraList.size()-1].orcamentoFranquiasCollection.size()-1].premioTotal}"/>
	 	</td>
	 	<td>
	 		<s:textfield style="width: 98%;" cssClass="TextBox_OneCells_width clValor2 currency" name="orcamentoSeguro.orcamentoSeguradoraCollection[%{orcamentoSeguradoraList.size()-1}].orcamentoFranquiasCollection[%{orcamentoSeguradoraList[orcamentoSeguradoraList.size()-1].orcamentoFranquiasCollection.size()-1}].valorFranquia" value="%{orcamentoSeguradoraList[orcamentoSeguradoraList.size()-1].orcamentoFranquiasCollection[orcamentoSeguradoraList[orcamentoSeguradoraList.size()-1].orcamentoFranquiasCollection.size()-1].valorFranquia}"/>
	 	</td>
	 	<td align="center">
	 		<s:a href="#" onclick="if(confirma('Confirma exclusão?')){excluirSeguradora(%{orcamentoSeguradoraList[orcamentoSeguradoraList.size()-1].id});}">
	 			<img class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Delete" src="<s:url value="/common/web/images/blank.gif" />" title="Excluir" border="0" id="buttonFirst">
	 		</s:a>
	 	</td>
	 	<td align="center">
	 		<s:a href="#" onclick="abrirModalGeraProposta(%{orcamentoSeguradoraList[orcamentoSeguradoraList.size()-1].orcamentoFranquiasCollection[0].id})">
	 			<img class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_GerarProposta" src="<s:url value="/common/web/images/blank.gif" />" title="Gerar Proposta" border="0" id="buttonFirst">
	 		</s:a>
	 	</td>
	 	<td align="center">
	 		<s:a href="#" onclick="abrirDivNovaFranquiaSeguradora(%{orcamentoSeguradoraList[orcamentoSeguradoraList.size()-1].id}, '%{orcamentoSeguradoraList[orcamentoSeguradoraList.size()-1].rotulo}', %{orcamentoSeguradoraList.size()-1});$('#modalContainer');">
	 			<img class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Add" src="<s:url value="/common/web/images/blank.gif" />" title="Add Franquia" border="0" id="buttonFirst">
	 		</s:a>
	 	</td>
	 	<td align="center">
	 		<s:a href="#" onclick="setaAbaModalCalculo(%{orcamentoSeguradoraList[orcamentoSeguradoraList.size()-1].id},%{orcamentoSeguradoraList[orcamentoSeguradoraList.size()-1].seguradora.id}); abrirDivNovoCalculo();$('#modalContainer');">
	 			<img class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Search" src="<s:url value="/common/web/images/blank.gif" />" title="Detalhar" border="0" id="buttonFirst">
	 		</s:a>
	 	</td>
	 	<td align="center">
	 		<a href="#">
	 			<img class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Duplicar" src="<s:url value="/common/web/images/blank.gif" />" title="Duplicar" border="0" id="buttonFirst">
	 		</a>
	 	</td>
	</tr>
</table>
<script>
$().ready(function() {
	$(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
});
</script>
<% } catch (Exception e) {e.printStackTrace();}%>