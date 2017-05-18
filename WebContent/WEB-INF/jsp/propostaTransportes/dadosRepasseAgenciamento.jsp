<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try {
%>

		<table id="tableAgenciamento" style="width: 700px;" cellspacing="0" cellpadding="0" class="Main_Client_TableEdition">
		<tr>
			<td width="34%"><label for="agenciamentoGrupoDeVendaId">Produtor/Grupo:</label><br />
				<s:select theme="simple" disabled="true" id="grupoDeVendaId" name="agenciamento.grupoDeVenda.id" cssClass="dojoValidateValid" list="grupoDeVendaList" listKey="id" listValue="nomeDoGrupo" onchange="alterarGrupoDeVendaAgenciamentoSelecionada();" />
			</td>
			<td width="33%"><label for="produtorGerenteNome">Supervisor</label><br />
				<s:textfield theme="simple" cssClass="dojoValidateValid readonly" cssStyle="width:95%" id="produtorGerenteNome" name="agenciamento.grupoDeVenda.produtorGerente.nome" readonly="true" />
			</td>
		</tr>
		</table>
		<table style="width: 700px;" cellspacing="0" cellpadding="0" class="Main_Client_TableEdition">
		<tr>
			<td>
			<table class="FieldGroup" border="0" cellpadding="0" cellspacing="0">
				<tbody>
				<tr class="FieldGroup_TopMargin"></tr>
				<tr>
					<td class="FieldGroupTitle_Left">
						<img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></img>
					</td>
					<td class="FieldGroupTitle">Comissionados do Agenciamento</td>
					<td class="FieldGroupTitle_Right">
						<img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></img>
					</td>
					<td class="FieldGroupContent"></td>
				</tr>
				<tr class="FieldGroup_BottomMargin"></tr>
				</tbody>
			</table>
			</td>
		</tr>
		<tr>
			<td>
				<div class="divMessages" id="divMessagesComissionadosAgenciamento"></div>
			</td>
		</tr>
		<tr>
			<td>
			<div id="divDadosComissionadosAgenciamento">
				<table id="tableProdutor" width="100%" cellspacing="0" cellpadding="0" align="center" class="Main_Client_TableEdition">
				  <tr>
					<td width="35%">
					  <label for="comissionadoPropostaPessoaNome">Produtor:</label><br/>
					  <s:textfield theme="simple" id="comissionadoAgenciamentoPropostaId" name="comissionadoAgenciamentoPropostaId" cssStyle="display:none;" />
					  <s:textfield theme="simple" id="comissionadoAgenciamentoPessoaId" name="comissionadoAgenciamentoPessoaId" cssStyle="display:none;" />
					  <s:textfield theme="simple" id="comissionadoAgenciamentoPessoaNome" cssClass="dojoValidateValid requiredField clTextoRestrito" cssStyle="width:95%" name="comissionadoAgenciamentoPessoaNome"/>
	 				  <s:textfield theme="simple" name="agenciamento.id" id="agenciamentoId" cssStyle="display: none;"/>
					</td>
					<td width="18%">
					  <label for="comissionadoPropostaTipoComissao">Tipo Repasse:</label><br/>
					  <s:select theme="simple" cssClass="requiredField" id="comissionadoAgenciamentoTipoComissao" cssStyle="width:95%" headerValue="-- Selecione --" headerKey="" list="tipoComissaoList" name="comissionadoAgenciamentoTipoComissao" onchange="liberaCamposComissao(this.value);"/>
					</td>
					<td width="15%">
					  <label for="comissionadoAgenciamentoComissao">Repasse:</label><br/>
					  <s:textfield theme="simple" cssClass="dojoValidateValid clValor2 currency" name="comissionadoAgenciamentoComissao" id="comissionadoAgenciamentoComissao" onblur="javascript:calculaVlrComissaoComissionado(this.value);" size="10"/>
					</td>
					<td width="18%">
					  <label for="comissionadoAgenciamentoVlrComissao">Valor Repasse:</label><br/>
					  <s:textfield theme="simple" cssClass="dojoValidateValid clValor2 currency" name="comissionadoAgenciamentoVlrComissao" id="comissionadoAgenciamentoVlrComissao" size="10" />
					</td>
					<td width="10%" align="right">
					  <a href="#" class="button" onclick="inserirComissionadoAgenciamento();">
						<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton">
						  <tr>
							<td class="wButton_left"></td>
							<td class="wButton_text wButton_width">Adicionar</td>
							<td class="wButton_right"/>
						  </tr>
						</table>
					  </a>
					</td>
				  </tr>
				  <tr><td><br/></td></tr>
				</table>
			</div>
			<div id="divListaComissionadosAgenciamento">
			  <s:set var="totalPercentualComissao" value="0" />
			  <table id="tableComissionadoItens" class="listItens">
				<tr style="height: 20px;" class="listItensHeader">
				  <td width="5%">Ações</td>
				  <td width="30%">Nome</td>
				  <td width="25%">Tipo Repasse</td>
				  <td width="20%">Percentual Repasse</td>
				  <td width="20%">Valor Repasse</td>
				</tr>
				<s:iterator value="comissionadoAgenciamentoList" status="stat">
				<tr style="height: 20px;">
				  <td nowrap="nowrap" class="small_image">
					<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/delete.gif" includeParams="none"/>" onclick="if(confirma('Está operação poderá gerar estornos de repasse caso haja baixa de comissão, Confirma exclusão?')){setAlterado(true);removerComissionadoAgenciamento('<s:property value="id" />');}"/>
				  </td>
				  <td>
				  	<c:set var="totalValorComissao" value="${valorComissao+totalValorComissao}" />
					<s:textfield theme="simple" name="comissionadoAgenciamentoList[%{#stat.index}].id" id="comissionadoAgenciamentoId%{#stat.index}" cssStyle="display: none;"/>
					<s:textfield theme="simple" name="comissionadoAgenciamentoList[%{#stat.index}].pessoa.id" id="comissionadoAgenciamentoPessoaId%{#stat.index}" cssStyle="display: none;"/>
					<s:textfield theme="simple" name="comissionadoAgenciamentoList[%{#stat.index}].pessoa.nome" id="comissionadoAgenciamentoPessoaNome%{#stat.index}" cssStyle="display: none;"/>
					<s:textfield theme="simple" name="comissionadoAgenciamentoList[%{#stat.index}].proposta.id" id="comissionadoAgenciamentoPropostaId%{#stat.index}" cssStyle="display: none;"/>
					<s:textfield theme="simple" name="comissionadoAgenciamentoList[%{#stat.index}].agenciamento.id" id="comissionadoAgenciamentoAgenciamentoId%{#stat.index}" cssStyle="display: none;"/>
					<s:textfield theme="simple" name="comissionadoAgenciamentoList[%{#stat.index}].comissao" id="comissionadoAgenciamentoComissao%{#stat.index}" cssStyle="display: none;"/>
					<s:textfield theme="simple" name="comissionadoAgenciamentoList[%{#stat.index}].tipoComissao" id="comissionadoAgenciamentoTipoComissao%{#stat.index}" cssStyle="display: none;"/>
				    <s:property value="pessoa.nome"/>&nbsp;
				  </td>
				  <td><s:property value="getTipoComissaoDescricao(tipoComissao)" />&nbsp;</td>
				  <td align="right"><fmt:formatNumber value="${comissao}" type="currency" currencySymbol=""/>&nbsp;</td>
				  <td align="right"><fmt:formatNumber value="${valorComissao}" type="currency" currencySymbol=""/>&nbsp;</td>
				</tr>
				</s:iterator>
				<tr style="height: 20px;">
				  <td><b>Total:</b></td>
				  <td colspan="4" align="right"><b><fmt:formatNumber value="${totalValorComissao}" type="currency" currencySymbol=""/></b></td>
				</tr>
			  </table>
			</div>
			</td>
		</tr>
		</table>

<script>
	$("#comissionadoAgenciamentoPessoaNome").autocomplete('<s:url value="/objlookup/getProdutorList.action" includeParams="none" />', {idFieldsToUpdate:["#comissionadoAgenciamentoPessoaId"]});
	
	// define a mascara padrão para telefone
	$().ready(function() {
		// Mascara de telefone. 
	    $(".clData").setMask({mask : '39/19/9999', autoTab: false});
	    $(".clFone").setMask({mask : '(99) 9999-9999', autoTab: false});
	    $(".clFone").DefaultValue("(__) ____-____");
	    // Converte para upper e elimina brancos no inicio e brancos duplos.
	    $(".clValor2").setMask({mask : '99,999.999.999.9', type : 'reverse',defaultValue:"+000"});
	    $(".clValor1").setMask({mask : '9,999.999.999.9', type : 'reverse',defaultValue:"00"});
	    $(".clValor").setMask({mask : '9999',  type : 'reverse',defaultValue:"0"});
	    $(".clParcelaAtual").setMask({mask : '9999',  type : 'reverse',defaultValue:"1"});
	    $(".clNumerico").setMask({mask : '999999999999999'});
	 	
	 })
	
</script>

<% } catch (Exception e) {e.printStackTrace();}%>