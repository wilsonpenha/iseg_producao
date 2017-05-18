<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
	
try {
%>
	<div id="divForm4" style="overflow-x:hidden; overflow-y:auto; height:98%; width:100%">
	  <table>
	    <tr>
		  <td colspan="4">
		    <div class="divMessages" id="divMessagesTab4" style="padding-bottom: 10px;">
		  	  <s:actionerror/>
			  <s:actionmessage/>
			  <s:fielderror/>
		    </div>
		  </td>
	    </tr>
	  </table>
	  <fieldset>
		  <table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
			  <td width="15%">
				<label for="dataOrcamento">Data</label><br/>
				<s:textfield theme="simple" cssClass="readonly" id="dataOrcamento" disabled="true" value="%{orcamentoSeguro.dataOrcamento}" onblur="isValidDate(this)" size="13" onchange="setAlterado(true);" />
			  </td>
			  <td width="20%">
			    <label for="situacaoOperacionalId">Situação</label><br/>
			    <s:select theme="simple" cssClass="Combo readonly" id="statusOrcamentoId" disabled="true" emptyOption="false" listKey="id" listValue="descricao" value="%{orcamentoSeguro.situacao.id}" list="statusOrcamentoList" name="statusOrcamento[]"/>
			  </td>
			  <td width="20%">
				<label for="ramoNome">Ramo</label><br />
				<s:textfield theme="simple" size="30" id="ramoNome" value="%{orcamentoSeguro.ramo.nome}" cssClass="readonly" disabled="true" readonly="true" tabindex="-1" />	
			  </td>
			  <td width="15%">
			  	<label for="ramoNome">Versão da Cotação</label><br />
				<s:textfield theme="simple" size="15" id="ramoNome" value="%{orcamentoSeguro.numero}" cssClass="readonly" readonly="true" />
			  </td>
			</tr>
		  </table>
	  </fieldset>
	  <fieldset style="float: left;">
	  	<legend>Código Operacional</legend>
	  	<table>
	  		<tr>
	  			<td class="TextBox_ContentCell">
	  				<label>Fator %</label><br />
	  				<s:textfield theme="simple" id="orcamentoSeguradoraFator" name="orcamentoSeguradora.fator" cssClass="TextBox_OneCells_width clValor2 currency requiredField" size="10" onblur="setarFatores();"/>
	  			</td>
	  		</tr>
	  	</table>
	  </fieldset>
	  <fieldset>
	  	  <legend>Adicionar Cálculo</legend>
		  <table width="100%">
			  <tr>
			    <td class="TextBox_ContentCell"  width="25%">
			      <label class="LabelText" for="seguradoraNome">Seguradora:</label><br />
				  <s:textfield theme="simple" id="seguradoraId" name="orcamentoSeguradora.seguradora.id" cssStyle="display:none;"/>
				  <s:textfield theme="simple" id="seguradoraNome" cssClass="TextBox_100percent_width requiredField" name="orcamentoSeguradora.seguradora.nome"/>
			    </td>
			    <td class="TextBox_ContentCell" width="20%">
			      <label class="LabelText" for="rotulo">Rótulo(Ex: Carro reserva ilimitado):</label><br />
			      <s:textfield theme="simple" id="orcamentoSeguradoraRotulo" name="orcamentoSeguradora.rotulo" size="40" onchange="setAlterado(true);"/>
			    </td>
			  	<td valign="bottom">
			      <a href="#" onclick="abrirDivNovaSeguradora();" class="button">
				  <table onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
				    <tr>
					  <td class="wButton_left"></td>
					  <td class="wButton_text wButton_width">Adicionar Seguradora</td>
					  <td class="wButton_right"/>
				    </tr>
				  </table>
				  </a>
			    </td>
			  	<td valign="bottom">
			      <a href="#" onclick="popupResumoOrcamento();" class="button">
				  <table onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
				    <tr>
					  <td class="wButton_left"></td>
					  <td class="wButton_text wButton_width">Visualizar Resumo Orcamento</td>
					  <td class="wButton_right"/>
				    </tr>
				  </table>
				  </a>
			    </td>
			  </tr>
		  </table>
	  </fieldset>
	  <fieldset>
	  	<legend>Lista de Cálculos Adicionados</legend>
		  <table width="100%">
			  <tr>
			  	<td>
			  		<div id="divListaCalculos" style="border: 1px;overflow:auto;">
			  			<div id="tableCalculos">
						 <s:iterator value="orcamentoSeguradoraList" status="i">
					  		<table id="calculo_<s:property value="%{id}"/>" style="text-indent: 0; margin-bottom: 0px;" class="listItens" width="100%" cellpadding="0" cellspacing="0" border="0">
					  			<tr style="display:none;">
					  				<td>
					  					<s:textfield name="orcamentoSeguro.orcamentoSeguradoraCollection[%{#i.index}].orcamentoFranquiasCollection[0].id" value="%{orcamentoSeguradoraList[#i.index].orcamentoFranquiasCollection[0].id}" style="display:none"/>
								 		<s:textfield name="orcamentoSeguro.orcamentoSeguradoraCollection[%{#i.index}].id" value="%{id}" style="display:none" />
								 		<s:textfield name="orcamentoSeguro.orcamentoSeguradoraCollection[%{#i.index}].seguradora.id" value="%{seguradora.id}" style="display:none" />
								 		<s:textfield name="orcamentoSeguro.orcamentoSeguradoraCollection[%{#i.index}].item" value="%{item}" style="display:none"/>
								 		<s:textfield name="orcamentoSeguro.orcamentoSeguradoraCollection[%{#i.index}].custoApolice" style="display:none"/>
								 		<s:textfield name="orcamentoSeguro.orcamentoSeguradoraCollection[%{#i.index}].qtdeParcelas" style="display:none"/>
								 		<s:textfield name="orcamentoSeguro.orcamentoSeguradoraCollection[%{#i.index}].orcamentoSeguro.id" value="%{orcamentoSeguro.id}" style="display:none"/>
								 		<s:textfield name="orcamentoSeguro.orcamentoSeguradoraCollection[%{#i.index}].orcamentoFranquiasCollection[0].orcamentoSeguradora.id" value="%{orcamentoSeguro.orcamentoSeguradoraCollection[#i.index].id}" style="display:none"/>
								 		<s:textfield name="orcamentoSeguro.orcamentoSeguradoraCollection[%{#i.index}].observacao" style="display:none"/>
								 		<s:textfield name="orcamentoSeguro.orcamentoSeguradoraCollection[%{#i.index}].orcamentoFranquiasCollection[0].iof" style="display:none"/>
								 		<s:textfield name="orcamentoSeguro.orcamentoSeguradoraCollection[%{#i.index}].orcamentoFranquiasCollection[0].premioLiquido" style="display:none"/>
								 		<s:textfield name="orcamentoSeguro.orcamentoSeguradoraCollection[%{#i.index}].orcamentoFranquiasCollection[0].custoApolice" style="display:none"/>
					  				</td>
					  			</tr>
					  		    <s:if test="%{#i.index == 0}">
								<tr class="listItensHeader">
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
								</s:if>
								<s:else>
								<tr class="listItensHeader" style="visibility: hidden; height: 0px; line-height: 0px; border: 0px;">
								  	<td style="height: 0px; line-height: 0px;" width="3%" colspan="3" nowrap="nowrap">Item</td>
									<td style="height: 0px; line-height: 0px;" width="20%" nowrap="nowrap" >Seguradora</td>
									<td style="height: 0px; line-height: 0px;" width="20%" nowrap="nowrap" >Rótulo</td>
									<td style="height: 0px; line-height: 0px;" width="5%" nowrap="nowrap" >Data Cálculo</td>
									<td style="height: 0px; line-height: 0px;" width="5%" nowrap="nowrap">Fator</td>
									<td style="height: 0px; line-height: 0px;" width="5%" nowrap="nowrap">Tipo</td>
									<td style="height: 0px; line-height: 0px;" width="17%" nowrap="nowrap">Prêmio</td>
									<td style="height: 0px; line-height: 0px;" width="15%" nowrap="nowrap">Franquia</td>
									<td style="height: 0px; line-height: 0px;" width="10%" colspan="5" nowrap="nowrap">Ações</td>
								</tr>
								</s:else>
								<tr>
									<td>
										<s:checkbox name="orcamentoSegId" fieldValue="%{id}" value="%{id}"/>
									</td>
									<td>
										<s:property value="%{item}"/>
									</td>
								 	<td>
								 		<s:if test="propostaAnexoCollection.size()>0">
								 			<a href="#"><img class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Attach" src="<s:url value="/common/web/images/blank.gif" />" title="Anexo" border="0" id="buttonFirst"></a>
								 		</s:if>
								 		<s:else>
								 			<a href="#" style="visibility: hidden;"><img class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Attach" src="<s:url value="/common/web/images/blank.gif" />" title="Anexo" border="0" id="buttonFirst"></a>
								 		</s:else>
								 	</td>
								 	<td>
								 		<s:textfield id="seguradoraNome%{#i.index}" name="seguradora.nome" disabled="true" style="background: #D8D8D8; border: #D8D8D8; width: 100%;"/>
								 	</td >
								 	<td >
								 		<s:textfield style="width: 98%;" name ="orcamentoSeguro.orcamentoSeguradoraCollection[%{#i.index}].rotulo" value="%{rotulo}" onchange="setAlterado(true);"/>
								 	</td>
								 	<td>
								 		<s:textfield style="width: 98%;" name ="orcamentoSeguro.orcamentoSeguradoraCollection[%{#i.index}].dataCalculo" value="%{dataCalculo}" onchange="setAlterado(true);"/>
								 	</td>
								 	<td align="center">
								 		<s:textfield style="width: 90%;" cssClass="TextBox_OneCells_width clValor2 currency fator" name ="orcamentoSeguro.orcamentoSeguradoraCollection[%{#i.index}].fator" value="%{fator}" onchange="setAlterado(true);"/>
								 	</td>
								 	<td>
								 		<s:select headerKey="" headerValue="-- Selecione --" list="tipoFranquias" name="orcamentoSeguro.orcamentoSeguradoraCollection[%{#i.index}].orcamentoFranquiasCollection[0].tipoFranquia.id" listKey="id" listValue="valor" cssClass="Combo_OneCell_width" onchange="setAlterado(true);"/>
								 	</td>
								 	<td align="center">
								 		<s:textfield style="width: 95%;" cssClass="TextBox_OneCells_width clValor2 currency" name="orcamentoSeguro.orcamentoSeguradoraCollection[%{#i.index}].orcamentoFranquiasCollection[0].premioTotal" value="%{orcamentoFranquiasCollection[0].premioTotal}" onchange="setAlterado(true);"/>
								 	</td>
								 	<td align="center">
								 		<s:textfield style="width: 95%;" cssClass="TextBox_OneCells_width clValor2 currency" name="orcamentoSeguro.orcamentoSeguradoraCollection[%{#i.index}].orcamentoFranquiasCollection[0].valorFranquia" value="%{orcamentoFranquiasCollection[0].valorFranquia}" onchange="setAlterado(true);"/>
								 	</td>
								 	<td align="center">
								 		<s:a href="#" onclick="if(confirma('Confirma exclusão?')){excluirSeguradora(%{id});}">
								 			<img class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Delete" src="<s:url value="/common/web/images/blank.gif" />" title="Excluir" border="0" id="buttonFirst">
								 		</s:a>
								 	</td>
								 	<td align="center">
								 		<s:a href="#" onclick="abrirModalGeraProposta(%{orcamentoFranquiasCollection[0].id})">
								 			<img class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_GerarProposta" src="<s:url value="/common/web/images/blank.gif" />" title="Gerar Proposta" border="0" id="buttonFirst">
								 		</s:a>
								 	</td>
								 	<td align="center">
								 		<s:a href="#" onclick="abrirDivNovaFranquiaSeguradora(%{id}, '%{rotulo}', %{#i.index});$('#modalContainer');">
								 			<img class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Add" src="<s:url value="/common/web/images/blank.gif" />" title="Add Franquia" border="0" id="buttonFirst">
								 		</s:a>
								 	</td>
								 	<td align="center">
								 		<s:a href="#" onclick="setaAbaModalCalculo(%{id},%{seguradora.id});abrirDivNovoCalculo();$('#modalContainer');">
								 			<img class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Search" src="<s:url value="/common/web/images/blank.gif" />" title="Detalhar" border="0" id="buttonFirst">
								 		</s:a>
								 	</td>
								 	<td align="center">
								 		<a href="#">
								 			<img class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Duplicar" src="<s:url value="/common/web/images/blank.gif" />" title="Duplicar" border="0" id="buttonFirst">
								 		</a>
								 	</td>
								</tr>
								<s:iterator value="orcamentoFranquiasCollection" status="j" begin="1">
									<tr style="display:none;">
										<td>
											<s:textfield name="orcamentoSeguro.orcamentoSeguradoraCollection[%{#i.index}].orcamentoFranquiasCollection[%{#j.index+1}].orcamentoSeguradora.id" value="%{orcamentoSeguradora.id}" style="display:none"/>
											<s:textfield name="orcamentoSeguro.orcamentoSeguradoraCollection[%{#i.index}].orcamentoFranquiasCollection[%{#j.index+1}].id" value="%{id}" style="display:none"/>
											<s:textfield name="orcamentoSeguro.orcamentoSeguradoraCollection[%{#i.index}].orcamentoFranquiasCollection[%{#j.index+1}].iof" style="display:none"/>
								 			<s:textfield name="orcamentoSeguro.orcamentoSeguradoraCollection[%{#i.index}].orcamentoFranquiasCollection[%{#j.index+1}].premioLiquido" style="display:none"/>
								 			<s:textfield name="orcamentoSeguro.orcamentoSeguradoraCollection[%{#i.index}].orcamentoFranquiasCollection[%{#j.index+1}].custoApolice" style="display:none"/>
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
									 		<s:select headerKey="" headerValue="-- Selecione --" list="tipoFranquias" name="orcamentoSeguro.orcamentoSeguradoraCollection[%{#i.index}].orcamentoFranquiasCollection[%{#j.index+1}].tipoFranquia.id" listKey="id" listValue="valor" cssClass="Combo_OneCell_width" onchange="setAlterado(true);" />
									 	</td>
									 	<td align="center">
									 		<s:textfield style="width: 95%;" cssClass="TextBox_OneCells_width clValor2 currency" name="orcamentoSeguro.orcamentoSeguradoraCollection[%{#i.index}].orcamentoFranquiasCollection[%{#j.index+1}].premioTotal" value="%{premioTotal}" onchange="setAlterado(true);"/>
									 	</td>
									 	<td align="center">
									 		<s:textfield style="width: 95%;" cssClass="TextBox_OneCells_width clValor2 currency" name="orcamentoSeguro.orcamentoSeguradoraCollection[%{#i.index}].orcamentoFranquiasCollection[%{#j.index+1}].valorFranquia" value="%{valorFranquia}" onchange="setAlterado(true);"/>
									 	</td>
									 	<td align="center">
									 		<s:a href="#" onclick="if(confirma('Confirma exclusão?')){removeFranquiaOrcamentoSeguradora(%{orcamentoSeguradoraList[#i.index].id},%{id});}">
									 			<img class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Delete" src="<s:url value="/common/web/images/blank.gif" />" title="Excluir" border="0" id="buttonFirst">
									 		</s:a>
									 	</td>
									 	<td align="center">
									 		<s:a href="#" onclick="abrirModalGeraProposta(%{id})">
									 			<img class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_GerarProposta" src="<s:url value="/common/web/images/blank.gif" />" title="Gerar Proposta" border="0" id="buttonFirst">
									 		</s:a>
								 		</td>
									 	<td style="background-color: #E8E8E8; border: #E8E8E8;"></td>
									 	<td style="background-color: #E8E8E8; border: #E8E8E8;"></td>
									</tr>
								</s:iterator>
							</table>
					</s:iterator>
					</div>
				</div>
			  	</td>
			  </tr>
		   </table>
	   </fieldset>
	</div>
	<div id="divPopupOrcamento"></div>

<% } catch (Exception e) {e.printStackTrace();}%>