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

		<table id="tableComissao" style="width: 700px;" cellspacing="0" cellpadding="0" class="Main_Client_TableEdition">
		<tr>
			<td width="34%">
				<label for="grupoDeVendaId">Produtor/Grupo:</label><br />
				<s:select theme="simple" id="comissoesGrupoDeVendaId" name="parcelasProposta.grupoDeVenda.id" cssClass="dojoValidateValid" list="grupoDeVendaList" listKey="id" listValue="nomeDoGrupo" headerKey="" headerValue=" -- Selecione -- " onchange="alterarGrupoDeVendaSemSalvar();" />
			</td>

			<td width="33%">
				<label for="produtorGerenteNome">Produtor</label><br />
				<s:textfield theme="simple" cssClass="dojoValidateValid readonly" cssStyle="width:95%" id="produtorGerenteNome" name="parcelasProposta.grupoDeVenda.produtorGerente.nome" readonly="true" />
			</td>
			<td width="33%">
				<label for="produtorGerenteNome">Aplicar p/ demais parcelas</label><br />
				<s:select theme="simple" id="demaisParcelas" headerKey="" tabindex="4" name="demaisParcelas" list="#{'NAO':'NÃO','SIM':'SIM'}" />
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
						<td class="FieldGroupTitle">Comissionados</td>
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
					<div class="divMessages" id="divMessagesComissionados"></div>
				</td>
			</tr>
			<tr>
				<td>
				<div id="divDadosComissionados">
				<table id="tableProdutor" width="100%" cellspacing="0" cellpadding="0" align="center" class="Main_Client_TableEdition">
				  <tr>
					<td width="35%"><label for="comissionadoPropostaPessoaNome">Produtor:</label><br/>
					  <s:textfield theme="simple" id="comissionadoPropostaId" name="comissionadoProposta.id" cssStyle="display:none;" />
					  <s:textfield theme="simple" id="comissionadoPropostaPessoaId" name="comissionadoProposta.pessoa.id" cssStyle="display:none;" />
					  <s:textfield theme="simple" id="comissionadoPropostaPessoaNome" name="comissionadoProposta.pessoa.nome" cssClass="dojoValidateValid requiredField clTextoRestrito" cssStyle="width:95%"/>
					</td>
					<td width="18%"><label for="comissionadoPropostaTipoComissao">Tipo Repasse:</label><br/>
					  <s:select theme="simple" cssClass="requiredField" name="comissionadoProposta.tipoComissao" id="comissionadoPropostaTipoComissao" cssStyle="width:95%" headerValue="-- Selecione --" headerKey="" list="tipoComissaoList" onchange="liberaCamposComissao(this.value);"/>
					</td>
					<td width="15%"><label for="comissionadoPropostaComissao">Repasse:</label><br/>
					  <s:textfield theme="simple" cssClass="dojoValidateValid clValor2 currency" name="comissionadoProposta.comissao" id="comissionadoPropostaComissao" onblur="javascript:calculaVlrComissaoComissionado(this.value);" size="10"/>
					</td>
					<td width="18%"><label for="comissionadoPropostaVlrComissao">Valor Repasse:</label><br/>
					  <s:textfield theme="simple" cssClass="dojoValidateValid clValor2 currency" name="comissionadoProposta.valorComissao" id="comissionadoPropostaVlrComissao" size="10" />
					</td>
					<td width="10%" align="right">
					  <a href="#" class="button" onclick="if(!comissionadoAlreadyAdd($('#comissionadoPropostaPessoaNome').val())){inserirComissionadoSemSalvar();}">
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
				</table>
				</div>
				<div id="divListaComissionados">
				  <s:set var="totalPercentualComissao" value="0" />
				  <table id="tableComissionadosRepasse" class="listItens">
					<tr style="height: 20px;" class="listItensHeader">
					  <td width="5%">Ações</td>
					  <td width="30%">Nome</td>
					  <td width="25%">Tipo Repasse</td>
					  <td width="20%">Percentual Repasse</td>
					  <td width="20%">Valor Repasse</td>
					</tr>
					<s:textfield theme="simple" id="comissionadoPropostaCount" name="comissionadoPropostaCount" cssStyle="display:none;" />
					<s:iterator value="comissionadoPropostaList" status="stat">
					<tr style="height: 20px;" id="row${stat.index}">
					  <td nowrap="nowrap" class="small_image">
						<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/delete.gif" includeParams="none"/>" onclick="if(confirma('Está operação poderá gerar estornos de repasse caso haja baixa de comissão, Confirma exclusão?')){setAlterado(true);$('#row${stat.index}').remove();}"/>
					  </td>
					  <td>
						<s:textfield theme="simple" name="comissionadoPropostaList[%{#stat.index}].id" id="comissionadoPropostaId%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="comissionadoPropostaList[%{#stat.index}].pessoa.id" id="comissionadoPropostaPessoaId%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="comissionadoPropostaList[%{#stat.index}].pessoa.nome" id="comissionadoPropostaPessoaNome%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="comissionadoPropostaList[%{#stat.index}].proposta.id" id="comissionadoPropostaPropostaId%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="comissionadoPropostaList[%{#stat.index}].comissao" id="comissionadoPropostaComissao%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="comissionadoPropostaList[%{#stat.index}].valorComissao" id="comissionadoPropostaVlrComissao%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="comissionadoPropostaList[%{#stat.index}].tipoComissao" id="comissionadoPropostaTipoComissao%{#stat.index}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="comissionadoPropostaList[%{#stat.index}].parcelasProposta.id" id="comissionadoPropostaParcelaId%{#stat.index}" cssStyle="display: none;"/>
					    <s:property value="pessoa.nome"/>&nbsp;
					  </td>
					  <td><s:property value="getTipoComissaoDescricao(tipoComissao)" />&nbsp;</td>
					  <td align="right"><s:property value="comissao"/>&nbsp;</td>
					  <td align="right"><s:property value="valorComissao"/>&nbsp;</td>
					</tr>
					</s:iterator>
				  </table>
				</div>
				</td>
			</tr>
		</table>

<script>
	$("#comissionadoPropostaPessoaNome").autocomplete('<s:url value="/objlookup/getProdutorList.action" includeParams="none" />', {idFieldsToUpdate:["#comissionadoPropostaPessoaId"]});
	
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