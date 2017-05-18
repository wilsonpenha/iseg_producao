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
  
	  <s:textfield theme="simple" id="blnGerarParcelas" name="blnGerarParcelas" value="false" cssStyle="display:none"/>
	<div id="divForm3" style="width:100%">
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
	  <table width="98%" border="0" cellpadding="0" cellspacing="0">
		<tr>
		  <td>
			<fieldset>
			<legend accesskey="P"><b><u>P</u>rêmio e Vigência</b></legend>
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
			  <tr>
				<td width="20%" class="TextBox_ContentCell">
				  <label class="LabelText" for="premioLiquido">Prêmio Líquido</label><br />
				  <s:textfield theme="simple" cssClass="TextBox_OneCells_width requiredField clCalculator clValor2 currency" id="premioLiquido" name="proposta.premioLiquido" onblur="" onchange="javascript:calculaIOF($('#calcularIOF').get(0).checked);calculaPremioTotal();setAlterado(true);" />
				</td>
				<td width="20%" class="TextBox_ContentCell">
				  <label class="LabelText" for="custoApolice">Custo da Apólice</label><br />
				  <s:textfield theme="simple" cssClass="TextBox_OneCells_width clCalculator clValor2 currency" id="custoApolice" name="proposta.custoApolice" onblur="" onchange="javascript:calculaIOF($('#calcularIOF').get(0).checked);calculaPremioTotal();setAlterado(true);" />
				</td>
				<td width="20%" class="TextBox_ContentCell">
				  <label class="LabelText" for="desconto">Juros/Desconto</label><br />
				  <s:textfield theme="simple" cssClass="TextBox_OneCells_width clCalculator clValor2 currency" id="desconto" name="proposta.desconto" onblur="" onchange="javascript:calculaIOF($('#calcularIOF').get(0).checked);calculaPremioTotal();setAlterado(true);"/>
				</td>
				<td width="20%" class="TextBox_ContentCell">
				  <s:checkbox theme="simple" name="proposta.calcularIof" id="calcularIOF" value="proposta.calcularIof" onclick="if(this.checked){this.value=true;calculaIOF(true);calculaPremioTotal();}else{this.value=false;}">Calcular IOF ? </s:checkbox> <br />
				  <s:textfield theme="simple" id="percentualIOF" name="percentualIOF" cssStyle="display:none;"/>
				  <s:textfield theme="simple" cssClass="TextBox_OneCells_width clCalculator clValor2 currency" id="iof" name="proposta.iof" onblur="javascript:calculaPremioTotal();" onchange="setAlterado(true);"/>
				</td>
				<td width="20%" class="TextBox_ContentCell">
				  <label class="LabelText" for="premioTotal">Prêmio Total</label><br />
				  <s:textfield theme="simple" readonly="true" cssClass="TextBox_OneCells_width clValor2 currency" id="premioTotal" name="proposta.premioTotal" onchange="setAlterado(true);" />
				</td>
			  </tr>
			  <tr>
				<td class="TextBox_ContentCell">
				  <label class="LabelText" for="fator">Código operação</label><br />
				  <s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" id="fator" name="proposta.fator" onkeyup="calculaTotalComissao();" onchange="setAlterado(true);"/>
				</td>
				<td class="TextBox_ContentCell">
				  	<label class="LabelText" for="inicioVigencia">Início Vigência</label><br/>
					<s:textfield theme="simple" cssClass="TextBox_OneCells_width requiredField" id="inicioVigencia" name="proposta.inicioVigencia" onblur="if (isValidDate(this)){confirmaInicioVigencia(this)}" size="10" onkeyup="if ($('#propostaOriginalId').val()==''){addYearAndSetField(this.value, 1, document.getElementById('terminoVigencia'));}"/>
		  		</td>
		  		<td class="TextBox_ContentCell">
				  	<label class="LabelText" for="terminoVigencia">Término Vigência</label><br/>
				  	<s:if test="proposta.statusOperacional > 4">
						<s:textfield theme="simple" id="terminoVigencia" name="proposta.terminoVigencia" style="display:none"/>
						<s:textfield theme="simple" disabled="true" cssClass="TextBox_OneCells_width requiredField" id="terminoVigenciaRO" name="proposta.terminoVigencia" size="10"/>
				  	</s:if>
				  	<s:else>
						<s:textfield theme="simple" cssClass="TextBox_OneCells_width requiredField" id="terminoVigencia" name="proposta.terminoVigencia" onblur="isValidDate(this)" size="10"/>
				  	</s:else>
		  		</td>
				<td class="TextBox_ContentCell">
				  <label class="LabelText" for="quantParc">Quantidade Parcelas Total</label><br/>
				  <s:textfield theme="simple" id="quantParc" cssClass="clValor currency" name="proposta.qtdeParcelas" size="3" maxlength="2" onblur="calculaParcelas();" onchange="setAlterado(true);" onkeyup="showHideDadosDemaisParcelas();"/>
				</td>
			  	<td></td>
			  </tr>
			  <tr>
				<td>
				  <label class="LabelText" for="formaPagamento1aParcela">Forma de Pagamento 1a Parcela</label><br />
				  <s:select theme="simple" cssClass="TextBox_OneCells_width requiredField" id="formaPagamento1aParcela" name="proposta.formaPagamento1aParcela" headerKey="" headerValue="-- Selecione --" list="formaPagamentoList" onchange="showHideDadosFormaPagamento();setAlterado(true);" />
				</td>
			  	<td>
			  	  <label class="LabelText" for="dataVencim1aParcela">Data Vencimento 1a Parcela</label><br />
				  <s:textfield theme="simple" id="dataVencim1aParcela" name="proposta.dataVencim1aParcela" onblur="isValidDate(this)" size="10" maxlength="10" onchange="setAlterado(true);"/>
				</td>
				<td>
				  <label class="LabelText" for="valor1aParcela">Valor 1a Parcela</label><br />
				  <s:textfield theme="simple" id="valor1aParcela" name="proposta.valor1aParcela" cssClass="TextBox_OneCells_width clCalculator clValor2 currency" onchange="calculaDemaisParcelas();setAlterado(true);"/>
				</td>
				<td>
				  <label id="labelFormaPagamento" class="LabelText" for="formaPagamento">Forma de Pagamento Demais Parcelas</label><br />
				  <s:select theme="simple" cssClass="TextBox_OneCells_width requiredField" id="formaPagamento" name="proposta.formaPagamento" headerKey="" headerValue="-- Selecione --" list="formaPagamentoList" onchange="showHideDadosFormaPagamento();setAlterado(true);" />
				</td>
			    <td>
			      <label id="labelValorDemaisParcelas" class="LabelText" for="valorDemaisParcelas">Valor Demais Parcelas</label><br />
				  <s:textfield theme="simple" id="valorDemaisParcelas" name="proposta.valorDemaisParcelas" cssClass="TextBox_OneCells_width clValor2 currency" onchange="setAlterado(true);"/>
				</td>
			  </tr>
			</table>
			<table id="tableDadosDebitoConta" width="98%" border="0" cellpadding="0" cellspacing="0" style="display:none;">
				<tr>
				  <td>
					<fieldset>
					<legend accesskey="C"><b>Dados para Débito em <u>C</u>onta</b></legend>
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
					  <tr>
						<td width="20%">
						  <label class="LabelText" for="nroBanco">Banco</label><br />
						  <s:textfield theme="simple" id="nroBanco" name="proposta.nroBanco" size="20" maxlength="30" onchange="setAlterado(true);" />
						</td>
						<td width="20%">
						  <label class="LabelText" for="codigoAgencia">Agência</label><br />
						  <s:textfield theme="simple" id="codigoAgencia" name="proposta.codigoAgencia" size="10" maxlength="10" onchange="setAlterado(true);"/>
						</td>
						<td width="20%">
						  <label class="LabelText" for="contaCorrente">Nro Conta</label><br />
						  <s:textfield theme="simple" id="contaCorrente" name="proposta.contaCorrente" size="15" maxlength="15" onchange="setAlterado(true);"/>
						</td>
						<td width="20%">
						  <label class="LabelText" for="contaCorrente">Digito Conta</label><br />
						  <s:textfield theme="simple" id="contaDigito" name="proposta.contaDigito" size="3" maxlength="2" onchange="setAlterado(true);"/>
						</td>
						<td width="20%">
						  <label class="LabelText" for="titularCorrente">Titular da Conta</label><br />
						  <s:textfield theme="simple" id="titularCorrente" cssClass="clTextoRestrito" name="proposta.titularCcorrente" size="40" maxlength="50" onchange="setAlterado(true);"/>
						</td>
					  </tr>
					</table>
					</fieldset>
				  </td>
				</tr>
			  </table>
			  <table id="tableDadosCartaoCredito" width="98%" border="0" cellpadding="0" cellspacing="0" style="display:none;">
				<tr>
				  <td>
					<fieldset>
					<legend accesskey="r"><b>Dados para Pagamento via Cartão de C<u>r</u>édito</legend>
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
					  <tr>
						<td><br />
						  
						</td>
						<td><br />
						  
						</td>
						<td><br />
						  
						</td>
						<td><br />
						  
						</td>
					  </tr>
					</table>
					</fieldset>
				  </td>
				</tr>
			  </table>
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
			  <tr>
				<td colspan="5">
				  <table class="FieldGroup" border="0" cellpadding="0" cellspacing="0">
					<tbody>
					  <tr class="FieldGroup_TopMargin"></tr>
					  <tr>
						<td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></img></td>
						<td class="FieldGroupTitle">Resumo Parcelas</td>
						<td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></img></td>
						<td class="FieldGroupContent"></td>
					  </tr>
					  <tr class="FieldGroup_BottomMargin"></tr>
					</tbody>
				  </table>
				</td>
			  </tr>
			  <tr>
				<td colspan="5">
				  <div id="divParcelas">
				  <table id="tableParcelas" class="listItens"> 
					<tr class="listItensHeader">
						<td width="10%">Parcela</td>
						<td width="10%">Banco</td>
						<td width="10%">Agência</td>
						<td width="10%">Nro Conta</td>
						<td width="15%">Nro Cheque</td>
						<td width="15%">Valor</td>
						<td width="15%">Vencimento</td>
						<td width="15%">Nro Documento</td>
					</tr>
					<s:iterator value="proposta.parcelasPropostaCollection" status="stat">
						<tr>
							<td>
								<s:property value="nroParcela"/>
								<s:textfield name="proposta.parcelasPropostaCollection[%{#stat.index}].id" theme="simple" cssStyle="display:none;"/>
								<s:textfield name="proposta.parcelasPropostaCollection[%{#stat.index}].nroParcela" theme="simple" cssStyle="display:none;"/>
								<s:textfield name="proposta.parcelasPropostaCollection[%{#stat.index}].proposta.id" theme="simple" cssStyle="display:none;"/>
							</td>
							<td align="right">
							  <s:textfield id="banco%{#stat.index}" name="proposta.parcelasPropostaCollection[%{#stat.index}].nroBanco" cssStyle="width:100%;" theme="simple" />
							</td>
							<td align="right">
							  <s:textfield id="agencia%{#stat.index}" name="proposta.parcelasPropostaCollection[%{#stat.index}].codigoAgencia" cssStyle="width:100%;" theme="simple" />
							</td>
							<td align="right">
							  <s:textfield id="nroConta%{#stat.index}" name="proposta.parcelasPropostaCollection[%{#stat.index}].contaCorrente" cssStyle="width:100%;" theme="simple" />
							</td>
							<td align="right">
							  <s:textfield id="nroCheque%{#stat.index}" name="proposta.parcelasPropostaCollection[%{#stat.index}].nroCheque" cssStyle="width:100%;" theme="simple" />
							</td>
							<td align="right">
							  <s:textfield id="valorParcela%{#stat.index}" name="proposta.parcelasPropostaCollection[%{#stat.index}].valorParcela" cssStyle="width:100%;text-align:right;" theme="simple"  cssClass="clValor2 currency"/>
							</td>
							<td align="right">
							  <s:textfield id="vencimento%{#stat.index}" name="proposta.parcelasPropostaCollection[%{#stat.index}].vencimento" cssStyle="width:100%;" theme="simple" size="10" maxlength="10" onblur="isValidDate(this)" cssClass="clData"/>
							</td>
							<td align="right">
							  <s:textfield id="nroDocumento%{#stat.index}" name="proposta.parcelasPropostaCollection[%{#stat.index}].nroDocumento" cssStyle="width:100%;" theme="simple" maxlength="100"/>
							</td>
						</tr>
					</s:iterator>
					<s:if test="proposta.parcelasPropostaCollection.isEmpty()"><tr class="emptyRow"><td colspan="8">Vazio</td></tr></s:if>
				  </table>
				  </div>
				</td>
			  </tr>
			  <tr>
			    <td>
				<table border="0" cellpadding="0" cellspacing="0"><tr><td><label id="labelCover">
			      <a href="#" class="button" onclick="carregaParcelas();" >
				  <table style="width: 120px" onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
				    <tr>
					  <td class="wButton_left"></td>
					  <td class="wButton_text wButton_width">Gerar Parcelas</td>
					  <td class="wButton_right"/>
				    </tr>
				  </table>
				  </a></label></td></tr>
			    </table>
			    </td>
			  </tr>
			</table>
			</fieldset>
		  </td>
		</tr>
	  </table>
	  <table width="98%" border="0" cellpadding="0" cellspacing="0">
		<tr>
		  <td>
			<fieldset>
			<legend accesskey="R"><b><u>R</u>enovação - Informação da Apólice Anterior</b></legend>
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
			  <tr>
				<td width="30%">
				  <label for="automovelSeguradoraId">Seguradora</label><br />
				  <s:select theme="simple" id="imovelSeguradoraId" headerKey="" headerValue="-- Selecione --" name="proposta.imovelCollection[%{itemCorrente}].seguradora.id" list="seguradoraList" listKey="id" listValue="nome" onchange="setAlterado(true);"/>
				</td>
				<td width="20%">
				  <label for="nroApoliceAnterior">Nro da Apólice</label><br />
				  <s:textfield theme="simple" id="nroApoliceAnterior" name="proposta.imovelCollection[%{itemCorrente}].nroApoliceAnterior" size="15" maxlength="20" onchange="setAlterado(true);"/>
				</td>
				<td width="20%">
				  <label for="codigoIdentificacaoAnterior">C.I.</label><br />
				  <s:textfield theme="simple" id="codigoIdentificacaoAnterior" name="proposta.imovelCollection[%{itemCorrente}].codigoIdentificacaoAnterior" size="20" maxlength="20" onchange="setAlterado(true);"/>
				</td>
				<td width="15%">
				  <label for="categoriaRenovacao">Bônus Percentual</label><br />
				  <s:textfield theme="simple" id="categoriaRenovacao" name="proposta.imovelCollection[%{itemCorrente}].categoria" size="15" maxlength="20" onchange="setAlterado(true);"/>
				</td>
				<td width="15%">
				  <label for="classeBonus">Classe Bônus</label><br />
				  <s:textfield theme="simple" id="classeBonus" name="proposta.imovelCollection[%{itemCorrente}].classeBonus" size="15" maxlength="20" onchange="setAlterado(true);"/>
				</td>
			  </tr>
			  <tr><td><input id="lastfield4" name="lastfield4" onkeyup="nextTab(event);" class="invisible" /></td></tr>
			</table>
			</fieldset>
		  </td>
		</tr>
	  </table>
	</div>

<% } catch (Exception e) {e.printStackTrace();}%>