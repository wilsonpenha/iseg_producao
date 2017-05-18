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
	  <table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
		  <td>
			<table border="0" cellpadding="0" cellspacing="0">
			  <tr>
				<td>
				<fieldset>
				<legend ><b>Apólice Inicial</b></legend>
				<table width="160px" border="0" cellpadding="0" cellspacing="0">
				  <tr>
			  		<td class="TextBox_ContentCell">
					    <label class="LabelText" for="inicio1aVigencia">&nbsp;</label><br/>
						<s:textfield theme="simple" cssClass="clData requiredField" id="inicio1aVigencia" name="proposta.inicio1aVigencia" onblur="isValidDate(this)" size="10" />
			  		</td>
			  		<td width="35px" align="center" valign="bottom">à</td>
			  		<td class="TextBox_ContentCell">
					    <label class="LabelText" for="termino1aVigencia">&nbsp;</label><br/>
						<s:textfield theme="simple" cssClass="clData requiredField" id="termino1aVigencia" name="proposta.termino1aVigencia" onblur="isValidDate(this)" size="10"/>
			  		</td>
				  </tr>
				</table>
				</fieldset>
		  		</td>
				<td>
				<fieldset>
				<legend ><b>Vigência Atual</b></legend>
				<table width="160px" border="0" cellpadding="0" cellspacing="0">
				  <tr>
			  		<td class="TextBox_ContentCell">
					    <label class="LabelText" for="inicioVigencia">&nbsp;</label><br/>
						<s:textfield theme="simple" cssClass="TextBox_OneCells_width requiredField" id="inicioVigencia" name="proposta.inicioVigencia" onblur="if (isValidDate(this)){confirmaInicioVigencia(this)}" size="10" onkeyup="if ($('#propostaOriginalId').val()==''){addYearAndSetField(this.value, 1, document.getElementById('terminoVigencia'));}"/>
			  		</td>
			  		<td width="35px" align="center" valign="bottom">à</td>
			  		<td class="TextBox_ContentCell">
					    <label class="LabelText" for="terminoVigencia">&nbsp;</label><br/>
						<s:textfield theme="simple" cssClass="TextBox_OneCells_width requiredField" id="terminoVigencia" name="proposta.terminoVigencia" onblur="isValidDate(this)" size="10"/>
			  		</td>
				  </tr>
				</table>
				</fieldset>
		  		</td>
		  		<td width="80%">
				<fieldset>
				<legend ><b>Inclusões/Agenciamento</b></legend>
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
				  <tr>
					<td class="TextBox_ContentCell" width="13%">	
					  <label class="LabelText" for="nroInclusoes">Qtde</label><br/>
					  <s:textfield theme="simple" id="nroInclusoes" cssClass="clParcelaAtual currency" name="proposta.nroInclusoes" size="3" maxLength="4" onchange="javascript:setAlterado(true);" />
					</td>
					<td class="TextBox_ContentCell" width="17%" nowrap="nowrap">	
					  <label class="LabelText" for="valorInclusoes">Valor Inclusões</label><br />
					  <s:textfield theme="simple" cssClass="clCalculator requiredField clValor2 currency" size="14" id="valorInclusoes" name="proposta.valorInclusoes" onblur="javascript:calculaValorAgenciamento();" onchange="javascript:calculaValorAgenciamento();setAlterado(true);"/>
					</td>
					<td class="TextBox_ContentCell" width="17%"><div align="center">	
					  <label class="LabelText" for="possuiAgenciamento">Agenc ?</label><br />
					  <s:select theme="simple" id="possuiAgenciamento" name="proposta.possuiAgenciamento" list="%{#{'false':'NÂO','true':'SIM'}}" onchange="setAlterado(true);" />
					  </div>
					</td>
					<td class="TextBox_ContentCell" width="17%"><div align="center">	
					  <label class="LabelText" for="pagarAgenciamentoComComissao">Agenc c/ Comissao ?</label><br />
					  <s:select theme="simple" id="pagarAgenciamentoComComissao" name="proposta.agenciamentoComComissao" list="%{#{'false':'NÂO','true':'SIM'}}" onchange="setAlterado(true);" />
					  </div>
					</td>
					<td class="TextBox_ContentCell" width="17%">	
					  <label for="produtorGerenteNome">Perc Agenc:</label><br/>
					  <s:textfield theme="simple" cssClass="clPercentual currency" size="6" id="percentualAgenciamento" name="proposta.percentualAgenciamento" onchange="setAlterado(true);" onblur="javascript:calculaValorAgenciamento();"/>
					</td>
					<td class="TextBox_ContentCell" width="17%">	
					  <label for="totalComissao">Valor Agenc:</label><br/>
					  <s:textfield theme="simple" cssClass=" clValor2 currency" id="valorAgenciamento" size="14" name="proposta.valorAgenciamento" onchange="setAlterado(true);" />
					</td>
					<td class="TextBox_ContentCell" width="19%">	
					  <label for="totalComissao">Parcelas(Agenc):</label><br/>
					  <s:textfield theme="simple" cssClass=" clParcelaAtual currency" id="parcelasAgenciamento" size="6" name="proposta.qtdeParcelasAgenciamento" onchange="setAlterado(true);" />
					</td>
				  </tr>
				</table>
				</fieldset>
		  		</td>
			  </tr>
			</table>
			<fieldset>
			<legend accesskey="P"><b><u>P</u>rêmio e Parcela Atual</b></legend>
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
			  <tr>
				<td class="TextBox_ContentCell">
			  	  <label class="LabelText" for="referenciaParcela">Referência Mes/Ano</label><br />
				  <s:textfield theme="simple" id="referenciaParcela" cssClass="clReferenciaParcela" name="referencia" onblur="isValidMesAno(this);checarReferencia(this.value);" size="10" maxlength="7" onchange="setAlterado(true);zerarValores();"/> 
				</td>
				<td class="TextBox_ContentCell">
				  <label class="LabelText" for="premioLiquido">Prêmio Líquido Mensal</label><br />
				  <s:textfield theme="simple" cssClass="clValor2 clCalculator requiredField currency" id="premioLiquido" size="14" name="proposta.premioLiquido" onblur="" onchange="javascript:calculaIOF($('#calcularIOF').get(0).checked);calculaPremioTotal();setAlterado(true);" />
				</td>
				<td class="TextBox_ContentCell">
				  <s:checkbox theme="simple" cssStyle="height: 16px" name="proposta.calcularIof" id="calcularIOF" value="proposta.calcularIof" onclick="if(this.checked){this.value=true;calculaIOF(true);calculaPremioTotal();}else{this.value=false;}">Calcular IOF ? </s:checkbox>				  
				  <s:textfield theme="simple" id="percentualIOF" name="percentualIOF" cssStyle="display:none;"/><br />
				  <s:textfield theme="simple" cssClass=" clValor2 clCalculator currency" id="iof" name="proposta.iof" size="14" onblur="javascript:calculaPremioTotal();" onchange="setAlterado(true);"/>
				</td>
				<td class="TextBox_ContentCell">
				  <label class="LabelText" for="premioTotal">Prêmio Total</label><br />
				  <s:textfield theme="simple" readonly="true" cssClass=" clValor2 currency" id="premioTotal" size="14" name="proposta.premioTotal" onchange="setAlterado(true);" />
				</td>
				<td class="TextBox_ContentCell">
				  <label class="LabelText" for="formaPagamento1aParcela">Forma de Pagamento</label><br />
				  <s:select theme="simple" cssClass=" requiredField" id="formaPagamento1aParcela" name="proposta.formaPagamento1aParcela" headerKey="" headerValue="-- Selecione --" list="formaPagamentoList" onchange="showHideDadosFormaPagamento();setAlterado(true);" />
				</td>
				<!-- <td class="TextBox_ContentCell">
				  <label class="LabelText" for="premioTotal">Renovação automatica?</label><br />
				  <s:select theme="simple" id="renovacaoAutomatica" name="proposta.renovacaoAutomatica" list="%{#{'true':'SIM','false':'NÂO'}}" onchange="setAlterado(true);" />
				</td> -->
			  </tr> 
			  <tr>
				<td class="TextBox_ContentCell">
				  <label class="LabelText" for="fator">Código Operação</label><br />
				  <s:textfield theme="simple" cssClass=" clValor2 currency" id="fator" size="10" name="proposta.fator" onkeyup="calculaTotalComissao();" onchange="setAlterado(true);"/>
				  <!--<s:select theme="simple" id="atualizarDemaisParcelas" tabindex="4" name="atualizarDemaisParcelas" list="#{'false':'MANUAL','true':'AUTOMATICA'}" title="Se MANUAL, não irá alterar o % de comissão de parcelas já geradas, se AUTOMATICA, irá alterar o % de comissão das demais parcelas!"/>-->
				</td>
				<td class="TextBox_ContentCell">
			  	  <label class="LabelText" for="dataVencim1aParcela">Data Venc da Fatura</label><br />
				  <s:textfield theme="simple" id="dataVencim1aParcela" name="proposta.dataVencim1aParcela" onblur="isValidDate(this)" size="10" maxlength="10" onchange="setAlterado(true);"/> 
				</td>
				<td class="TextBox_ContentCell">
			  	  <label class="LabelText" for="nroFatura">Nro Fatura Atual</label><br />
				  <s:textfield theme="simple" cssClass="clNumerico" id="nroFatura" name="proposta.nroFatura" size="15" maxlength="15" onchange="setAlterado(true);"/>
				</td>
				<td class="TextBox_ContentCell">	
				  <label class="LabelText" for="quantParc">Frequência de Pagamentos</label><br/>
				  <s:select theme="simple" cssClass=" requiredField" id="quantParc" name="proposta.qtdeParcelas" list="frequenciaPagamentoList" onchange="setAlterado(true);" />
				</td>
			    <td valign="bottom"><div  style="width: 97px;">
			      <table border="0" cellpadding="0" cellspacing="0"><tr><td><label id="labelCover">
			      <a href="#" class="button" onclick="carregaParcelas();">
				  <table style="width: 120px" onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
				    <tr>
					  <td class="wButton_left"></td>
					  <td class="wButton_text wButton_width">Gerar Parcelas</td>
					  <td class="wButton_right"/>
				    </tr>
				  </table>
				  </a></label></td></tr>
				  </table>
				  </div>
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
							<td width="8%">Referência</td>
							<td width="8%">Prêmio Líq</td>
							<td width="8%">Prêmio Tot</td>
							<td width="8%">Valor Agenc</td>
							<td width="7%">Vencim</td>
							<td width="7%">Nro Fat</td>
							<td width="5%">% Comiss</td>
							<td width="8%">Base Cálc</td>
							<td width="8%">Comissão</td>
							<td width="8%">Repasse</td>
						</tr>
						<s:iterator value="proposta.parcelasPropostaCollection" status="stat">
						<s:if test="referenciaParcela >= proposta.referenciaParcela">
							<tr>
								<td>
									<s:property value="referencia"/>
									<s:textfield name="proposta.parcelasPropostaCollection[%{#stat.index}].id" theme="simple" cssStyle="display:none;"/>
									<s:textfield name="proposta.parcelasPropostaCollection[%{#stat.index}].referenciaParcela" theme="simple" cssStyle="display:none;"/>
									<s:textfield name="proposta.parcelasPropostaCollection[%{#stat.index}].proposta.id" theme="simple" cssStyle="display:none;"/>
									<s:textfield name="proposta.parcelasPropostaCollection[%{#stat.index}].desconto" theme="simple" cssStyle="display:none;"/>
									<s:textfield name="proposta.parcelasPropostaCollection[%{#stat.index}].grupoDeVenda.id" id="grupoDeVendaId_%{id}" theme="simple" cssStyle="display:none;"/>
								</td>
								<td align="right" style="padding-right: 2px;">
									<s:textfield name="proposta.parcelasPropostaCollection[%{#stat.index}].valorParcela" theme="simple" cssClass="clValor2 currency" size="10" readonly="true"/>
								</td>
								<td align="right" style="padding-right: 2px;">
									<s:textfield name="proposta.parcelasPropostaCollection[%{#stat.index}].premioTotal" theme="simple" cssClass="clValor2 currency" size="10" readonly="true"/>
								</td>
								<td align="right" style="padding-right: 2px;">
									<s:textfield name="proposta.parcelasPropostaCollection[%{#stat.index}].valorAgenciamento" theme="simple" cssClass="clValor2 currency" size="10" readonly="true"/>
								</td>
								<td align="right" style="padding-right: 2px;">
								  <s:textfield id="vencimento%{#stat.index}" tabindex="10%{#stat.index}" name="proposta.parcelasPropostaCollection[%{#stat.index}].vencimento" theme="simple" size="9" maxlength="10" onblur="isValidDate(this)" cssClass="clData"/>
								</td>
								<td align="right" style="padding-right: 2px;">
								  <s:textfield id="nroDocumento%{#stat.index}" name="proposta.parcelasPropostaCollection[%{#stat.index}].nroDocumento" theme="simple" size="10" maxlength="15" />
								</td>
								<td align="right" style="padding-right: 2px;">
								  <s:textfield id="percentualComissao%{#stat.index}" tabindex="10%{#stat.index+12}" name="proposta.parcelasPropostaCollection[%{#stat.index}].percentualComissao" onblur="javascript:replicarComissao(this.value,%{#stat.index});" theme="simple"  size="6" maxlength="7" cssClass="clValor2 currency" onchange="setAlterado(true);"/>
								</td>
								<td align="right" style="padding-right: 2px;">
								  <s:textfield id="baseCalculoComissao%{#stat.index}" readonly="true" tabindex="10%{#stat.index+12}" name="proposta.parcelasPropostaCollection[%{#stat.index}].baseCalculoComissao" theme="simple"  size="10" maxlength="10" cssClass="clValor2 currency"/>
								</td>
								<td align="right" style="padding-right: 2px;">
								  <s:textfield id="valorComissao%{#stat.index}" readonly="true" tabindex="10%{#stat.index+12}" name="proposta.parcelasPropostaCollection[%{#stat.index}].valorComissao" theme="simple"  size="10" maxlength="10" cssClass="clValor2 currency"/>
								</td>
								<td align="center" style="padding-right: 2px;">
								  <input title="Referência: <fmt:formatDate value="${referenciaParcela}" pattern="MM/yyyy"/>" class="button" type="button" name="repasse" value="Repasse" onclick="abrirDivRepasse('<s:property value="referenciaParcela"/>','<s:property value="id"/>','<s:property value="id"/>');"> 
								</td>
							</tr>
						</s:if>
						</s:iterator>
						<s:if test="proposta.parcelasPropostaCollection.isEmpty()"><tr class="emptyRow"><td colspan="12">Vazio</td></tr></s:if>
					  </table>
				  </div>
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
			<legend accesskey="R"><b>Dados da <u>R</u>enovação</b></legend>
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
			  <tr>
				<td width="30%">
				  <label for="automovelSeguradoraId">Seguradora Anterior</label><br />
				  <s:select theme="simple" id="imovelSeguradoraId" headerKey="" headerValue="-- Selecione --" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].seguradora.id" list="seguradoraList" listKey="id" listValue="nome" onchange="setAlterado(true);"/>
				</td>
				<td width="20%">
				  <label for="nroApoliceAnterior">Nro da Apólice Anterior</label><br />
				  <s:textfield theme="simple" id="nroApoliceAnterior" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].nroApoliceAnterior" size="15" maxlength="20" onchange="setAlterado(true);"/>
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