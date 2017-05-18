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
    
	<div id="divDadosComissao">
	  <table>
	    <tr>
		  <td colspan="4">
		    <div class="divMessages"id="divMessagesTab5" style="padding-bottom: 10px;">
		  	  <s:actionerror/>
			  <s:actionmessage/>
			  <s:fielderror/>
		    </div>
		  </td>
	    </tr>
	  </table>
	  <fieldset>
		<legend><b>Comissão a Receber</b></legend>
		<table id="tableComissao" width="100%" cellspacing="0" cellpadding="0" align="center" class="Main_Client_TableEdition">
		  <tr>
			<td>
			  <label for="grupoDeVendaId">Prêmio Líquido:</label><br/>
			  <s:textfield theme="simple" id="premioLiquidoComTab" name="proposta.premioLiquido" cssClass="dojoValidateValid readonly" readonly="true" disabled="true" />
			</td>
			<td>
			  <label for="produtorGerenteNome">Percentual Comissão:</label><br/>
			  <s:textfield theme="simple" cssClass="TextBox_OneCells_width readonly" id="fatorComTab" disabled="true" name="proposta.fator" readonly="true" />
			</td>
			<td>
			  <label for="totalComissao">Valor Comissão:</label><br/>
			  <s:textfield theme="simple" readonly="true" cssClass="TextBox_OneCells_width clValor2 currency" id="totalComissao" name="proposta.valorComissao" onblur="$('#totalComissao').attr('readonly',true);" onkeyup="calculaFator();" onchange="setAlterado(true);" />
			</td>
		  </tr>
		  <tr>
			<td width="20%">
			  <label class="LabelText" for="tipoRecebimentoComissao">Tipo de Recebimento de Comissão:</label><br/>
			  <s:select theme="simple" id="tipoRecebimentoComissao" cssClass="dojoValidateValid requiredField" list="tipoRecebimentoComissaoList" name="proposta.tipoRecebimentoComissao" onchange="showOptionsRecebimentoComissao();"/>
			</td>
			<td width="20%">
			  <label id="labelOpcoesRecebComissao" class="LabelText"></label><br/>
			  <s:textfield theme="simple" id="quantParcComissao" cssClass="clValor currency" name="proposta.quantParcelasComissao" size="5" maxlength="3" onchange="setAlterado(true);"/>
			  <s:select theme="simple" cssClass="dojoValidateValid" id="descontaCustoApoliceIof" list="#{'true':'SIM', 'false':'NAO'}" name="proposta.descontaCustoApoliceIof" headerKey="" headerValue=" -- " cssStyle="display:none;" onchange="setAlterado(true);" />
			</td>
			<td width="20%"></td>
			<td width="40%"></td>
		  </tr>
		</table>
	  </fieldset>
	  <fieldset>
		  <legend><b>Comissionamento</b></legend>
		  <div id="divComissaoPagar">
		  <table width="100%" cellspacing="0" cellpadding="0" class="Main_Client_TableEdition">
			<tr>
			  <td width="34%">
				<label for="grupoDeVendaId">Produtor/Grupo:</label><br/>
				<s:textfield theme="simple" id="grupoVendaQE" name="proposta.grupoDeVenda.quebraExclusividade" cssStyle="display:none;"/>
				<s:textfield theme="simple" id="percComissaoMax"  name="proposta.seguradora.percComissaoMax" cssStyle="display:none;"/>
				<s:textfield theme="simple" id="percComissaoMin"  name="proposta.seguradora.percComissaoMin"  cssStyle="display:none;"/>
				<s:select theme="simple" id="grupoDeVendaId" name="proposta.grupoDeVenda.id" cssClass="dojoValidateValid" list="grupoDeVendaList" listKey="id" listValue="nomeDoGrupo"  headerKey="" headerValue=" -- Selecione -- " onchange="alert('Está alteração não afeta outras propostas nem o cadastro do segurado!\n');"/>
			  </td>
			  <td width="33%">
				<label for="produtorGerenteNome">Produtor</label><br/>
				<s:select style="width: 97%" theme="simple" name="proposta.produtor.id" cssClass="dojoValidateValid" list="produtorList" listKey="id" listValue="nome"/>
			  </td>
			</tr>
			<tr><td colspan="2">
			<table width="100%" cellspacing="0" cellpadding="0" class="Main_Client_TableEdition">
			    <tr>
				  <td>
					<table class="FieldGroup" border="0" cellpadding="0" cellspacing="0">
					  <tbody>
						<tr class="FieldGroup_TopMargin"></tr>
						<tr>
						  <td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></img></td>
						  <td class="FieldGroupTitle">Repasse de Comisses</td>
						  <td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></img></td>
						  <td class="FieldGroupContent"></td>
						</tr>
						<tr class="FieldGroup_BottomMargin"></tr>
					  </tbody>
					</table>
				  </td>
				</tr>
				<tr>
				  <td>
					<div class="divMessages" id="divMessagesComissionados"></div>
				  </td>
				</tr>
				<tr>
				  <td>
					<div id="divListaDeRepasse">
					  <s:set var="totalPercentualComissao" value="0" />
					  <table id="tableComissionadoItens" class="listItens">
						<tr style="height: 20px;" class="listItensHeader">
						  <td width="30%">Nome</td>
						  <td width="12%">Tp Comisso</td>
						  <td width="12%">Dt Lanamento</td>
						  <td width="12%">Dt Extrato</td>
						  <td width="12%">Dt Pagamento</td>
						  <td width="10%">% Comisso</td>
						  <td width="12%">Vlr Comisso</td>
						</tr>
						<s:iterator value="repassePropostaList" status="stat">
						<tr style="height: 20px;">
						  <s:if test="comissionado.id != null">
							  <td>
							  	<c:set var="totalRepasseComissao" value="${valorPago+totalRepasseComissao}" />
							    <s:property value="comissionado.pessoa.nome"/>&nbsp;
							  </td>
							  <td><s:property value="getTipoComissaoDescricao(comissionado.tipoComissao)" />&nbsp;</td>
							  <td align="right"><s:property value="borderoLancamento.dataLancamento"/>&nbsp;</td>
							  <td align="right"><s:property value="dataLancamento"/>&nbsp;</td>
							  <td align="right"><s:property value="dataPagamento"/>&nbsp;</td>
							  <td align="right"><fmt:formatNumber value="${comissionado.comissao}" type="currency" currencySymbol=""/>&nbsp;</td>
							  <td align="right"><fmt:formatNumber value="${valorPago}" type="currency" currencySymbol=""/>&nbsp;</td>
						  </s:if>
						  <s:elseif test="agenciado.id != null">
							  <td>
							  	<c:set var="totalRepasseComissao" value="${valorPago+totalRepasseComissao}" />
							    <s:property value="agenciado.pessoa.nome"/>&nbsp;
							  </td>
							  <td><s:property value="getTipoComissaoDescricao(agenciado.tipoComissao)" />&nbsp;</td>
							  <td align="right"><s:property value="borderoLancamento.dataLancamento"/>&nbsp;</td>
							  <td align="right"><s:property value="dataLancamento"/>&nbsp;</td>
							  <td align="right"><s:property value="dataPagamento"/>&nbsp;</td>
							  <td align="right"><fmt:formatNumber value="${agenciado.comissao}" type="currency" currencySymbol=""/>&nbsp;</td>
							  <td align="right"><fmt:formatNumber value="${valorPago}" type="currency" currencySymbol=""/>&nbsp;</td>
						  </s:elseif>
						</tr>
						</s:iterator>
						<tr style="height: 20px;">
						  <td><b>Total:</b></td>
						  <td colspan="6" align="right"><b><fmt:formatNumber value="${totalRepasseComissao}" type="currency" currencySymbol=""/></b>&nbsp;</td>
						</tr>
					  </table>
					</div>
				  </td>
				</tr>
			  </table>			
			</td>
			</tr>
		  </table>
		  </div>
	  </fieldset>
	</div>
<% } catch (Exception e) {e.printStackTrace();}%>