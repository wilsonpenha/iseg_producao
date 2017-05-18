<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	#modalContainer {max-height:560px; overflow:hidden; width:671px; height: auto; left: 0; background-color: #E8E8E8; border: outset 4px; padding: 3px;}
</style>
<jsp:include page="../jqueryCalculadora.jsp" flush="false"></jsp:include>
<div id="novoCalculo" style="display:none; z-index: 1000;height: 560px;">
	 <table width="100%" border="0" cellspacing="0" cellpadding="0" class="Main_ContentPane_TabPane" id="tdtopTabs">
		<tr id="paramParentTabContainer" style="padding: 3px">
		  <td class="tabBackGroundInit" style="background-color: #505050"></td>
		</tr>
		<tr id="paramMainTabContainer" style="padding: 3px">
		  <td class="tabBackGroundInit" style="background-color: #505050">
			<span style="color:#FFFFFF; font-size:8pt; font-weight:bold; height:26px !important; padding:0 4px; text-align:center; white-space:nowrap;">
			  Novo Cálculo - Bradesco
			</span>
		  </td>
		</tr>
	</table>
	<form id="formCalculo" name="formCalculo">
	<table style="height:100%" width="100%" border="0" cellpadding="0" cellspacing="0">
	  <tr>
		<td>
		  <div id="corpo" style="width:100%; z-index:1; overflow: hidden; height: autopx;" >
			<table style="height:100%" width="100%" border="0" cellpadding="0" cellspacing="0">
			  <tr>
				<td height="*" valign="top" id="tdDivCentral">
				  <div id="central" style="width:100%; z-index:1; overflow: hidden; height: autopx;" > 
					<div id="tabFrame" class="main_page" style="background-color:#E8E8E8;">
					  <div class="sub_top_page">
						<div class="sections_menu" style="margin: 6px 0px 0px 0px;">
						  <table border="0" cellpadding="0" cellspacing="0">
							<tr>
							  <td>
								<table onclick="abrirAba(this);" id="tabModal0" border="0" cellpadding="0" cellspacing="0" class="active">
								  <tr>
									<td class="TabLeft"></td>
									<td class="TabBody">Franquia 25%</td>
									<td class="TabRight"/>
								  </tr>
								</table>
							  </td>
							  <td>
								<table onclick="abrirAba(this);" id="tabModal1" border="0" cellpadding="0" cellspacing="0" class="inactive">
								  <tr>
									<td class="TabLeft"></td>
									<td class="TabBody">Franquia 50%</td>
									<td class="TabRight"/>
								  </tr>
								</table>
							  </td>
							  <td>
								<table onclick="abrirAba(this);" id="tabModal2" border="0" cellpadding="0" cellspacing="0" class="inactive">
								  <tr>
									<td class="TabLeft"></td>
									<td class="TabBody">Franquia 100%</td>
									<td class="TabRight"/>
								  </tr>
								</table>
							  </td>
							  <td>
								<table onclick="abrirAba(this);" id="tabModal3" border="0" cellpadding="0" cellspacing="0" class="inactive">
								  <tr>
									<td class="TabLeft"></td>
									<td class="TabBody TabPanel_width">Coberturas e Serviços</td>
									<td class="TabRight"/>
								  </tr>
								</table>
							  </td>
							  <td>
								<table onclick="abrirAba(this);" id="tabModal4" border="0" cellpadding="0" cellspacing="0" class="inactive">
								  <tr>
									<td class="TabLeft"></td>
									<td class="TabBody TabPanel_width">Anexos</td>
									<td class="TabRight"/>
								  </tr>
								</table>
							  </td>
							</tr>
						  </table>
						</div>
					  </div>
					  <div id="allForms" style="overflow:auto; overflow-x: hidden; width:100%; position: inherit; max-height: 480px;" class="tabPane" >
						  <div class="tabPane" id="tabPaneModal0" style="overflow:auto; height:auto; width:100%; display: true; position: inherit;">
						     <table width="98%" border="0" cellpadding="0" cellspacing="0">
						     	<tr>
						     		<td>
						     			<fieldset>
						     			<legend>Prêmios</legend>
										<table border="0" cellpadding="0" cellspacing="0" width="100%">
										  <tr>
										  	<td class="TextBox_ContentCell"  width="33%">
											  <label class="LabelText" for="premioTotal">Prêmio Total</label><br />
											  <s:textfield theme="simple" cssClass="TextBox_OneCells_width requiredField clCalculator clValor2 currency" id="premioTotalReduzido" name="orcamentoSeguro.premioTotal"/>
											</td>
											<td class="TextBox_ContentCell"  width="33%">
											  <label class="LabelText" for="fator">Franquia</label><br />
											  <s:textfield theme="simple" cssClass="TextBox_OneCells_width requiredField clCalculator clValor2 currency" id="fator" name="orcamentoSeguro.fator"/>
											</td>
											<td class="TextBox_ContentCell" width="33%">
											  <label class="LabelText" for="premioLiquido">Prêmio Líquido Total</label><br />
											  <s:textfield theme="simple" cssClass="TextBox_OneCells_width clCalculator clValor2 currency" id="premioLiquido" name="orcamentoSeguro.premioLiquido" onblur="" onchange="javascript:calculaIOF($('#calcularIOF').get(0).checked);calculaPremioTotal();setAlterado(true);" />
											</td>
										  </tr>
										  <tr>
											<td class="TextBox_ContentCell">
											  <label class="LabelText" for="custoApolice">Custo da Apólice</label><br />
											  <s:textfield theme="simple" cssClass="TextBox_OneCells_width clCalculator clValor2 currency" id="custoApolice" name="orcamentoSeguro.custoApolice" onblur="" onchange="javascript:calculaIOF($('#calcularIOF').get(0).checked);calculaPremioTotal();setAlterado(true);" />
											</td>
											<td class="TextBox_ContentCell">
											  <label>IOF</label> <br />
											  <s:textfield theme="simple" cssClass="TextBox_OneCells_width clCalculator clValor2 currency" id="iof" name="orcamentoSeguro.iof" onblur="javascript:calculaPremioTotal();" onchange="setAlterado(true);"/>
											</td>
											<td>
												<label>% de Comissão</label><br />
												<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency readonly" disabled="true"/>
											</td>
										  </tr>
										</table>
										</fieldset>
										<fieldset>
						  					<legend>Casco Franquia</legend>
						  					<table width="100%">
						  						<tr>
						  							<td>
														<label>COBERTURA CASCO:</label>
													</td>
													<td>
														<label>Valor Ref</label>
													</td>
													<td>
														<label>Percentual/LMI</label><br />
														<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency readonly" disabled="true" size="14" maxlength="14"/>
													</td>
													<td valign="top"><label class="LabelText" for="fator">Franquia</label><br />
														<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" size="10" maxlength="14"/>
													</td>
													<td>
														<label>Observações</label><br />
														<s:textfield theme="simple"/>
													</td>
													<td>
														<label>Premio Líquido</label><br />
														<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" size="12" maxlength="14"/>
													</td>
						  						</tr>
						  					</table>
						  				</fieldset>
										<fieldset>
											<legend>Configurar Parcelas</legend>
											<table width="100%">
												<tr>
													<td width="25%">
														<label>Qtd Total Parcelas(1-12)</label><br />
														<s:textfield theme="simple" size="3" maxlength="2" id="qtd_parcela"/>
													</td>
													<td width="25%"></td>
													<td width="25%"></td>
													<td width="25%" valign="bottom">
													  <a href="#" class="button" onclick="" >
														<table onclick="gerarParcelas('lstParcelas','lstCabecalho','qtd_parcela','debRed','carneRed','credRed','cheqRed','premioTotalReduzido','Reduzida');" onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
														  <tr>
															<td class="wButton_left"></td>
															<td class="wButton_text wButton_width">Calcular Parcelas</td>
															<td class="wButton_right"/>
														  </tr>
														</table>
													  </a>
													</td>
												</tr>
												<tr>
													<td colspan="4">
														<fieldset>
															<legend>Quantidade Parcelas sem juros</legend>
															<table width="100%">
																<tr>
																	<td width="25%">
																		<label>Debito em Conta</label><br />
																		<s:textfield theme="simple" size="3" id="debRed"/>
																	</td>
																	<td width="25%">
																		<label>Carnê</label><br />
																		<s:textfield theme="simple" size="3" id="carneRed"/>
																	</td>
																	<td width="25%">
																		<label>Cartão de Crédito</label><br />
																		<s:textfield theme="simple" size="3" id="credRed"/>
																	</td>
																	<td width="25%">
																		<label>Cheque Pré-Datado</label><br />
																		<s:textfield theme="simple" size="3" id="cheqRed"/>
																	</td>
																</tr>
															</table>
														</fieldset>
													</td>
												</tr>
											</table>
										</fieldset>
										<fieldset>
											<legend>Formas de Pagamento</legend>
											<table width="100%" class="listItens" id="lstParcelas">
												<tr class="listItensHeader" id="lstCabecalho">
													<td colspan="2" width="25%">
														Debito em Conta
													</td>
													<td colspan="2" width="25%">
														Carnê
													</td>
													<td colspan="2" width="25%">
														Cartão de Crédito
													</td>
													<td colspan="2" width="25%">
														Cheque Pré-Datado
													</td>
												</tr>
											</table>
										</fieldset>
						     		</td>
						     	</tr>
						     </table>
						  </div>
						  <div class="tabPane" id="tabPaneModal1" style="overflow:auto; height:auto; width:100%; display: none; position: inherit;">
						     <table width="98%" border="0" cellpadding="0" cellspacing="0">
						     	<tr>
						     		<td>
						     			<fieldset>
						     			<legend>Prêmios</legend>
										<table border="0" cellpadding="0" cellspacing="0" width="100%">
										  <tr>
										  	<td class="TextBox_ContentCell"  width="33%">
											  <label class="LabelText" for="premioTotal">Prêmio Total</label><br />
											  <s:textfield theme="simple" cssClass="TextBox_OneCells_width requiredField clCalculator clValor2 currency" id="premioTotalReduzido" name="orcamentoSeguro.premioTotal"/>
											</td>
											<td class="TextBox_ContentCell"  width="33%">
											  <label class="LabelText" for="fator">Franquia</label><br />
											  <s:textfield theme="simple" cssClass="TextBox_OneCells_width requiredField clCalculator clValor2 currency" id="fator" name="orcamentoSeguro.fator"/>
											</td>
											<td class="TextBox_ContentCell" width="33%">
											  <label class="LabelText" for="premioLiquido">Prêmio Líquido Total</label><br />
											  <s:textfield theme="simple" cssClass="TextBox_OneCells_width clCalculator clValor2 currency" id="premioLiquido" name="orcamentoSeguro.premioLiquido" onblur="" onchange="javascript:calculaIOF($('#calcularIOF').get(0).checked);calculaPremioTotal();setAlterado(true);" />
											</td>
										  </tr>
										  <tr>
											<td class="TextBox_ContentCell">
											  <label class="LabelText" for="custoApolice">Custo da Apólice</label><br />
											  <s:textfield theme="simple" cssClass="TextBox_OneCells_width clCalculator clValor2 currency" id="custoApolice" name="orcamentoSeguro.custoApolice" onblur="" onchange="javascript:calculaIOF($('#calcularIOF').get(0).checked);calculaPremioTotal();setAlterado(true);" />
											</td>
											<td class="TextBox_ContentCell">
											  <label>IOF</label> <br />
											  <s:textfield theme="simple" cssClass="TextBox_OneCells_width clCalculator clValor2 currency" id="iof" name="orcamentoSeguro.iof" onblur="javascript:calculaPremioTotal();" onchange="setAlterado(true);"/>
											</td>
											<td>
												<label>% de Comissão</label><br />
												<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency readonly" disabled="true"/>
											</td>
										  </tr>
										</table>
										</fieldset>
										<fieldset>
						  					<legend>Casco Franquia</legend>
						  					<table width="100%">
						  						<tr>
						  							<td>
														<label>COBERTURA CASCO:</label>
													</td>
													<td>
														<label>Valor Ref</label>
													</td>
													<td>
														<label>Percentual/LMI</label><br />
														<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency readonly" disabled="true" size="14" maxlength="14"/>
													</td>
													<td valign="top"><label class="LabelText" for="fator">Franquia</label><br />
														<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" size="10" maxlength="14"/>
													</td>
													<td>
														<label>Observações</label><br />
														<s:textfield theme="simple"/>
													</td>
													<td>
														<label>Premio Líquido</label><br />
														<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" size="12" maxlength="14"/>
													</td>
						  						</tr>
						  					</table>
						  				</fieldset>
										<fieldset>
											<legend>Configurar Parcelas</legend>
											<table width="100%">
												<tr>
													<td width="25%">
														<label>Qtd Total Parcelas(1-12)</label><br />
														<s:textfield theme="simple" size="3" maxlength="2" id="qtd_parcela"/>
													</td>
													<td width="25%"></td>
													<td width="25%"></td>
													<td width="25%" valign="bottom">
													  <a href="#" class="button" onclick="" >
														<table onclick="gerarParcelas('lstParcelas','lstCabecalho','qtd_parcela','debRed','carneRed','credRed','cheqRed','premioTotalReduzido','Reduzida');" onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
														  <tr>
															<td class="wButton_left"></td>
															<td class="wButton_text wButton_width">Calcular Parcelas</td>
															<td class="wButton_right"/>
														  </tr>
														</table>
													  </a>
													</td>
												</tr>
												<tr>
													<td colspan="4">
														<fieldset>
															<legend>Quantidade Parcelas sem juros</legend>
															<table width="100%">
																<tr>
																	<td width="25%">
																		<label>Debito em Conta</label><br />
																		<s:textfield theme="simple" size="3" id="debRed"/>
																	</td>
																	<td width="25%">
																		<label>Carnê</label><br />
																		<s:textfield theme="simple" size="3" id="carneRed"/>
																	</td>
																	<td width="25%">
																		<label>Cartão de Crédito</label><br />
																		<s:textfield theme="simple" size="3" id="credRed"/>
																	</td>
																	<td width="25%">
																		<label>Cheque Pré-Datado</label><br />
																		<s:textfield theme="simple" size="3" id="cheqRed"/>
																	</td>
																</tr>
															</table>
														</fieldset>
													</td>
												</tr>
											</table>
										</fieldset>
										<fieldset>
											<legend>Formas de Pagamento</legend>
											<table width="100%" class="listItens" id="lstParcelas">
												<tr class="listItensHeader" id="lstCabecalho">
													<td colspan="2" width="25%">
														Debito em Conta
													</td>
													<td colspan="2" width="25%">
														Carnê
													</td>
													<td colspan="2" width="25%">
														Cartão de Crédito
													</td>
													<td colspan="2" width="25%">
														Cheque Pré-Datado
													</td>
												</tr>
											</table>
										</fieldset>
						     		</td>
						     	</tr>
						     </table>
						  </div>
						  <div class="tabPane" id="tabPaneModal2" style="overflow:auto; height:auto; width:100%; display: none; position: inherit;">
						     <table width="98%" border="0" cellpadding="0" cellspacing="0">
						     	<tr>
						     		<td>
						     			<fieldset>
						     			<legend>Prêmios</legend>
										<table border="0" cellpadding="0" cellspacing="0" width="100%">
										  <tr>
										  	<td class="TextBox_ContentCell"  width="33%">
											  <label class="LabelText" for="premioTotal">Prêmio Total</label><br />
											  <s:textfield theme="simple" cssClass="TextBox_OneCells_width requiredField clCalculator clValor2 currency" id="premioTotalReduzido" name="orcamentoSeguro.premioTotal"/>
											</td>
											<td class="TextBox_ContentCell"  width="33%">
											  <label class="LabelText" for="fator">Franquia</label><br />
											  <s:textfield theme="simple" cssClass="TextBox_OneCells_width requiredField clCalculator clValor2 currency" id="fator" name="orcamentoSeguro.fator"/>
											</td>
											<td class="TextBox_ContentCell" width="33%">
											  <label class="LabelText" for="premioLiquido">Prêmio Líquido Total</label><br />
											  <s:textfield theme="simple" cssClass="TextBox_OneCells_width clCalculator clValor2 currency" id="premioLiquido" name="orcamentoSeguro.premioLiquido"/>
											</td>
										  </tr>
										  <tr>
											<td class="TextBox_ContentCell">
											  <label class="LabelText" for="custoApolice">Custo da Apólice</label><br />
											  <s:textfield theme="simple" cssClass="TextBox_OneCells_width clCalculator clValor2 currency" id="custoApolice" name="orcamentoSeguro.custoApolice" onblur="" onchange="javascript:calculaIOF($('#calcularIOF').get(0).checked);calculaPremioTotal();setAlterado(true);" />
											</td>
											<td class="TextBox_ContentCell">
											  <label>IOF</label> <br />
											  <s:textfield theme="simple" cssClass="TextBox_OneCells_width clCalculator clValor2 currency" id="iof" name="orcamentoSeguro.iof" onblur="javascript:calculaPremioTotal();" onchange="setAlterado(true);"/>
											</td>
											<td>
												<label>% de Comissão</label><br />
												<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency readonly" disabled="true"/>
											</td>
										  </tr>
										</table>
										</fieldset>
										<fieldset>
						  					<legend>Casco Franquia</legend>
						  					<table width="100%">
						  						<tr>
						  							<td>
														<label>COBERTURA CASCO:</label>
													</td>
													<td>
														<label>Valor Ref</label>
													</td>
													<td>
														<label>Percentual/LMI</label><br />
														<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency readonly" disabled="true" size="14" maxlength="14"/>
													</td>
													<td valign="top"><label class="LabelText" for="fator">Franquia</label><br />
														<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" size="10" maxlength="14"/>
													</td>
													<td>
														<label>Observações</label><br />
														<s:textfield theme="simple"/>
													</td>
													<td>
														<label>Premio Líquido</label><br />
														<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" size="12" maxlength="14"/>
													</td>
						  						</tr>
						  					</table>
						  				</fieldset>
										<fieldset>
											<legend>Configurar Parcelas</legend>
											<table width="100%">
												<tr>
													<td width="25%">
														<label>Qtd Total Parcelas(1-12)</label><br />
														<s:textfield theme="simple" size="3" maxlength="2" id="qtd_parcela"/>
													</td>
													<td width="25%"></td>
													<td width="25%"></td>
													<td width="25%" valign="bottom">
													  <a href="#" class="button" onclick="" >
														<table onclick="gerarParcelas('lstParcelas','lstCabecalho','qtd_parcela','debRed','carneRed','credRed','cheqRed','premioTotalReduzido','Reduzida');" onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
														  <tr>
															<td class="wButton_left"></td>
															<td class="wButton_text wButton_width">Calcular Parcelas</td>
															<td class="wButton_right"/>
														  </tr>
														</table>
													  </a>
													</td>
												</tr>
												<tr>
													<td colspan="4">
														<fieldset>
															<legend>Quantidade Parcelas sem juros</legend>
															<table width="100%">
																<tr>
																	<td width="25%">
																		<label>Debito em Conta</label><br />
																		<s:textfield theme="simple" size="3" id="debRed"/>
																	</td>
																	<td width="25%">
																		<label>Carnê</label><br />
																		<s:textfield theme="simple" size="3" id="carneRed"/>
																	</td>
																	<td width="25%">
																		<label>Cartão de Crédito</label><br />
																		<s:textfield theme="simple" size="3" id="credRed"/>
																	</td>
																	<td width="25%">
																		<label>Cheque Pré-Datado</label><br />
																		<s:textfield theme="simple" size="3" id="cheqRed"/>
																	</td>
																</tr>
															</table>
														</fieldset>
													</td>
												</tr>
											</table>
										</fieldset>
										<fieldset>
											<legend>Formas de Pagamento</legend>
											<table width="100%" class="listItens" id="lstParcelas">
												<tr class="listItensHeader" id="lstCabecalho">
													<td colspan="2" width="25%">
														Debito em Conta
													</td>
													<td colspan="2" width="25%">
														Carnê
													</td>
													<td colspan="2" width="25%">
														Cartão de Crédito
													</td>
													<td colspan="2" width="25%">
														Cheque Pré-Datado
													</td>
												</tr>
											</table>
										</fieldset>
						     		</td>
						     	</tr>
						     </table>
						  </div>
						  <div class="tabPane" id="tabPaneModal3" style="overflow:auto; height:auto; width:100%; display: none; position: inherit;">
						  	<table width="98%" border="0" cellpadding="0" cellspacing="0">
						  		<tr>
						  			<td>
						  				<fieldset>
						  					<legend>Casco Franquia</legend>
						  					<table width="100%">
						  						<tr>
						  							<td>
														<label>COBERTURA CASCO:</label>
													</td>
													<td>
														<label>Valor Ref</label>
													</td>
													<td>
														<label>Percentual/LMI</label><br />
														<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency readonly" disabled="true" size="14" maxlength="14"/>
													</td>
						  						</tr>
						  						<tr>
						  							<td></td>
						  							<td>
						  								<label class="LabelText" for="fator">Franquia 25%</label>
						  							</td>
						  							<td valign="top">
						  								<label class="LabelText" for="fator">Franquia</label><br />
														<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" size="14" maxlength="14"/>
													</td>
													<td>
														<label>Observações</label><br />
														<s:textfield theme="simple"/>
													</td>
													<td>
														<label>Premio Líquido</label><br />
														<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" size="12" maxlength="14"/>
													</td>
						  						</tr>
						  						<tr>
						  							<td></td>
						  							<td>
						  								<label class="LabelText" for="fator">Franquia 50%</label>
						  							</td>
						  							<td valign="top">
														<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" size="14" maxlength="14"/>
													</td>
													<td>
														<s:textfield theme="simple"/>
													</td>
													<td>
														<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" size="12" maxlength="14"/>
													</td>
						  						</tr>
						  						<tr>
						  							<td></td>
						  							<td>
						  								<label class="LabelText" for="fator">Franquia 100%</label>
						  							</td>
						  							<td valign="top">
														<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" size="14" maxlength="14"/>
													</td>
													<td>
														<s:textfield theme="simple"/>
													</td>
													<td>
														<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" size="12" maxlength="14"/>
													</td>
						  						</tr>
						  					</table>
						  				</fieldset>
						  			</td>
						  		</tr>
						  		<tr>
						  			<td>
									     <fieldset>
											<legend>Coberturas Contradadas</legend>
											<table width="100%">
												<tr>
													<td>
														<label>DANOS MATERIAIS:</label>
													</td>
													<td></td>
													<td>
														<label>Percentual/LMI</label><br />
														<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency readonly" disabled="true" size="14" maxlength="14"/>
													</td>
													<td valign="top"><label class="LabelText" for="fator">Franquia</label><br />
														<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" size="10" maxlength="14"/>
													</td>
													<td>
														<label>Observações</label><br />
														<s:textfield theme="simple"/>
													</td>
													<td>
														<label>Premio Líquido</label><br />
														<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" size="12" maxlength="14"/>
													</td>
												</tr>
												<tr>
													<td>
														<label>DANOS CORPORAIS:</label>
													</td>
													<td></td>
													<td>
														<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency readonly" disabled="true" size="14" maxlength="14"/>
													</td>
													<td>
														<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" size="10" maxlength="14"/>
													</td>
													<td>
														<s:textfield theme="simple"/>
													</td>
													<td>
														<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" size="12" maxlength="14"/>
													</td>
												</tr>
												<tr>
													<td>
														<label>DANOS MORAIS:</label>
													</td>
													<td></td>
													<td>
														<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency readonly" disabled="true" size="14" maxlength="14"/>
													</td>
													<td>
														<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" size="10" maxlength="14"/>
													</td>
													<td>
														<s:textfield theme="simple"/>
													</td>
													<td>
														<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" size="12" maxlength="14"/>
													</td>
												</tr>
												<tr>
													<td>
														<label>MORTE:</label>
													</td>
													<td></td>
													<td>
														<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency readonly" disabled="true" size="14" maxlength="14"/>
													</td>
													<td>
														<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" size="10" maxlength="14"/>
													</td>
													<td>
														<s:textfield theme="simple"/>
													</td>
													<td>
														<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" size="12" maxlength="14"/>
													</td>
												</tr>
											</table>
										</fieldset>
										<fieldset>
											<legend>Serviços Contradados</legend>
											<table width="100%">
												<tr>
													<td>
														<label>VIDROS:</label>
													</td>
													<td valign="bottom">
														<s:select theme="simple" cssClass="requiredField" headerKey=""  tabindex="6" list="{'SIM','NÃO'}" style="width: 50px" />
													</td>
													<td>
														<label>Franquia</label><br />
														<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" size="14" maxlength="14"/>
													</td>
													<td>
														<label>Observações</label><br />
														<s:textfield theme="simple"/>
													</td>
													<td>
														<label>Premio Líquido</label><br />
														<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" size="12" maxlength="14"/>
													</td>
												</tr>
												<tr>
													<td>
														<label>LANTERNAS/FAROIS/RETROVISORES:</label>
													</td>
													<td>
														<s:select theme="simple" cssClass="requiredField" headerKey=""  tabindex="6" list="{'SIM','NÃO'}" style="width: 50px" />
													</td>
													<td>
														<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" size="14" maxlength="14"/>
													</td>
													<td>
														<s:textfield theme="simple"/>
													</td>
													<td>
														<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" size="12" maxlength="14"/>
													</td>
												</tr>
												<tr>
													<td>
														<label>CARRO RESERVA ESPECIAL 15 DIAS:</label>
													</td>
													<td>
														<s:select theme="simple" cssClass="requiredField" headerKey=""  tabindex="6" list="{'SIM','NÃO'}" style="width: 50px" />
													</td>
													<td>
														<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" size="14" maxlength="14"/>
													</td>
													<td>
														<s:textfield theme="simple"/>
													</td>
													<td>
														<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" size="12" maxlength="14"/>
													</td>
												</tr>
												<tr>
													<td>
														<label>ASSIST 24 HRS PLANO 4 :</label>
													</td>
													<td>
														<s:select theme="simple" cssClass="requiredField" headerKey=""  tabindex="6" list="{'SIM','NÃO'}" style="width: 50px" />
													</td>
													<td>
														<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" size="14" maxlength="14"/>
													</td>
													<td>
														<s:textfield theme="simple"/>
													</td>
													<td>
														<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" size="12" maxlength="14"/>
													</td>
												</tr>
											</table>
										</fieldset>
									</td>
								</tr>
								<tr>
									 <td>
									 	<label>Observações:</label><br />
									 	<s:textarea style="width: 100%" rows="3"/>
									 </td>
								</tr>
							</table>
						  </div>
					  	  <div class="tabPane" id="tabPaneModal4" style="overflow:auto; height:auto; width:100%; display: none; position: inherit;">
					  	  	<table width="98%" border="0" cellpadding="0" cellspacing="0">
						  		<tr>
						  			<td>
						  				<fieldset>
											<legend accesskey=""><b>Anexo</b></legend>
											<table width="100%" border="0" cellpadding="0" cellspacing="0">
											  <tr>
												<td>
												  <label for="dataDoProposta">Arquivo p/ upload (Não pode ser maior que 2048000 bytes / 2MB)</label><br />
												  <s:file theme="simple" id="arquivoAnexo" name="fileUpload" size="100" />
												</td>
											  </tr>
											</table>
											<br/>
											<hr/>
											<table width="100%" border="0" cellpadding="0" cellspacing="0">
												<tr>
												  <td style="width:105px;">
												    <a href="#" class="button" onclick="apagarDadosPropostaAnexo();" tabindex="-1"> 
													<table onmouseout="this.className='wButton'; return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton">
													  <tr>
														<td class="wButton_left"></td>
														<td class="wButton_text wButton_width">Apagar Dados</td>
														<td class="wButton_right"/>
													  </tr>
													</table>
												    </a>
												  </td>
												  <td style="width:80px;">
												    <a href="#" class="button" onclick="inserirPropostaAnexo();" >
													<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
													  <tr>
														<td class="wButton_left"></td>
														<td class="wButton_text wButton_width">Adicionar</td>
														<td class="wButton_right"/>
													  </tr>
													</table>
													</a>
												  </td>
												  <td>&nbsp;</td>
												</tr>
											</table>
											<div id="divListaAnexo" style="border: 1px;overflow:auto;"></div>
									  </fieldset>
						  			</td>
						  		</tr>
							</table>  	
					  	  </div>
					  </div>
				      <div id="saveProgress" class="pageloader" style="display:none;z-index:10;">Salvando...<br/></div>
				      <div id="loadProgress" class="pageloader" style="display:none;z-index:10;">Carregando...<br/></div>
				    </div>
				  </div>   
				</td>
			  </tr>  
			</table>
		  </div>
		</td>
	  </tr>
	</table>
	  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>
	</form>
	<table width="100%" align="center" style="bottom: 0px; background-color: #E8E8E8; position: absolute; z-index: 100;">
		<tr>
			<td align="right">
			  <a href="#" class="button" onclick="$('#closeDiv').click()" >
				<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">Salvar</td>
					<td class="wButton_right"/>
				  </tr>
				</table>
			  </a>
			</td>
			<td align="left">
			  <a href="#" class="button" onclick="$('#closeDiv').click()" >
				<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">Cancelar</td>
					<td class="wButton_right"/>
				  </tr>
				</table>
			  </a>
			</td>
		</tr>
	</table>
	<input class="modalClose" id="closeDiv" style="display:none;" />
  </div>
<script type="text/javascript">
	var abaAnt = null;
	var divAnt = null;
  	function abrirAba(abaAtual){
  		if(abaAnt == null && divAnt == null || document.getElementById(abaAnt.id).getAttribute("class") != "active"){
  			abaAnt = document.getElementById("tabModal0");
  			divAnt = document.getElementById("tabPaneModal0");
  		}
  		abaAnt.setAttribute("class","inactive");
 			abaAtual.setAttribute("class","active");
 			abaAnt = abaAtual;
  		if(divAnt != null && document.getElementById(divAnt.id).style.display != "none"){
  			div = document.getElementById("tabPaneModal"+abaAtual.id.replace("tabModal",""));
  			divAnt.style.display = "none";
  			div.style.display = "";
  			divAnt = div;
  		}
  	}
</script>
<script>
 		function gerarParcelas(id_tabela,id_cabecalho,id_campo_parcela,id_campo_deb,id_campo_carne,id_campo_cred,id_campo_cheq, id_premio_total,sufixo){
 			object = document.getElementById(id_tabela);
 			cabecalho = document.getElementById(id_cabecalho);
 			qtd_parcela = document.getElementById(id_campo_parcela).value;
 			qtd_deb = document.getElementById(id_campo_deb).value;
 			qtd_carne = document.getElementById(id_campo_carne).value;
 			qtd_cred = document.getElementById(id_campo_cred).value;
 			qtd_cheq = document.getElementById(id_campo_cheq).value;
 			premio_total = document.getElementById(id_premio_total).value.replace(',','.');
 			if(qtd_parcela <=12){
	  			object.innerHTML = cabecalho.outerHTML;
	  			for(var i = 0 ; i < qtd_parcela ; i++){
	  				object.innerHTML += '<tr>'+
										 	'<td>'+i+1+'x</td>'+
											'<td><s:textfield theme="simple" size="14" cssClass="TextBox_OneCells_width currency" name="deb'+i+'" id="deb'+i+sufixo+'" onkeypress="Mascara(\'numero3\',event,this,6);"/></td>'+
											'<td>'+i+1+'x</td>'+
											'<td><s:textfield theme="simple" size="14" cssClass="TextBox_OneCells_width currency" name="carne'+i+'" id="carne'+i+sufixo+'" onkeypress="Mascara(\'numero3\',event,this,6);"/></td>'+
											'<td>'+i+1+'x</td>'+
											'<td><s:textfield theme="simple" size="14" cssClass="TextBox_OneCells_width currency" name="cred'+i+'" id="cred'+i+sufixo+'" onkeypress="Mascara(\'numero3\',event,this,6);"/></td>'+
											'<td>'+i+1+'x</td>'+
											'<td><s:textfield theme="simple" size="14" cssClass="TextBox_OneCells_width currency" name="cheq'+i+'" id="cheq'+i+sufixo+'" onkeypress="Mascara(\'numero3\',event,this,6);"/></td>'+
										'</tr>';
					if(qtd_deb >= i)
					{
						valor = (Number(premio_total)/ i);
						ob = document.getElementById('deb'+i+sufixo+'');
						ob.setAttribute("value", valor);
					}
					if(qtd_carne >= i)
					{
						valor = (Number(premio_total)/ i);
						ob = document.getElementById('carne'+i+sufixo+'');
						ob.setAttribute("value", valor);
					}
					if(qtd_cred >= i)
					{
						valor = (Number(premio_total)/ i);
						ob = document.getElementById('cred'+i+sufixo+'');
						ob.setAttribute("value", valor);
					}
					if(qtd_cheq >= i)
					{
						valor = (Number(premio_total)/ i);
						ob = document.getElementById('cheq'+i+sufixo+'');
						ob.setAttribute("value", valor);
					}
	  			}
  		}else
  			alert("Quantidade de Parcelas Maior que 12x");
	}
</script>