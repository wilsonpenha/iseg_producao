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
		  <legend><b>Comissão a Pagar</b></legend>
		  <div id="divComissaoPagar">
		  <table width="100%" cellspacing="0" cellpadding="0" class="Main_Client_TableEdition">
			<tr>
			  <td width="34%">
				<label for="grupoDeVendaId">Produtor/Grupo:</label><br/>
				<s:textfield theme="simple" id="grupoVendaQE" name="proposta.grupoDeVenda.quebraExclusividade" cssStyle="display:none;"/>
				<s:textfield theme="simple" id="percComissaoMax"  name="proposta.seguradora.percComissaoMax" cssStyle="display:none;"/>
				<s:textfield theme="simple" id="percComissaoMin"  name="proposta.seguradora.percComissaoMin"  cssStyle="display:none;"/>
				<s:select theme="simple" id="grupoDeVendaId" name="proposta.grupoDeVenda.id" cssClass="dojoValidateValid" list="grupoDeVendaList" listKey="id" listValue="nomeDoGrupo"  headerKey="" headerValue=" -- Selecione -- " onchange="alert('Está alteração não afeta outras propostas nem o cadastro do segurado!\n');alterarGrupoDeVenda();"/>
			  </td>
			  <td width="33%">
				<label for="produtorGerenteNome">Produtor</label><br/>
				<s:select style="width: 97%" theme="simple" name="proposta.produtor.id" cssClass="dojoValidateValid" list="produtorList" listKey="id" listValue="nome"/>
			  </td>
			</tr>
		  </table>
		  </div>
	  </fieldset>
      
      
      
<script>
	$("#comissionadoPropostaPessoaNome").autocomplete('<s:url value="/objlookup/getProdutorList.action" includeParams="none" />', {idFieldsToUpdate:["#comissionadoPropostaPessoaId"]});

// define a mascara padrão para telefone
$().ready(function() {
	// Mascara de telefone.
    $(".clData").setMask({mask : '39/19/9999', autoTab: false});
    $(".clCPF").setMask({mask : '999.999.999-99', autoTab: false});
    $(".clFone").setMask({mask : '(99) 9999-9999', autoTab: false});
    $(".clFone").DefaultValue("(__) ____-____");
    // Converte para upper e elimina brancos no inicio e brancos duplos.
    $(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
    $(".clValor1").setMask({mask : '9,999.999.999.999', type : 'reverse',defaultValue:"00"});
    $(".clValor").setMask({mask : '99',  type : 'reverse',defaultValue:"0"});
 	
 })
</script>
<% } catch (Exception e) {e.printStackTrace();}%>