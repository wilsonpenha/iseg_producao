<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try { 
%>
<table width="100%" cellspacing="0" cellpadding="0" border="0" class="Main_Client_TableRelation" style="margin: 0px 0px 0px 0px;">
  <tr>
	<td>
		<table width="100%" border="0" cellpadding="2" cellspacing="2">
		  <tr>
			<td valign="top">
			  <div>
				  <fieldset>
				  <legend accesskey="C"><b>Dados básicos do <u>S</u>egurado</b></legend>
				  <s:if test="tipoCliente == 0">
				  <table width="100%" border="0" cellpadding="2" cellspacing="0"> 
					<tr>
					  <td valign="top" valign="top" width="25%">
						<label for="clienteCpf">CPF</label><br />
						<s:property value="%{pessoaFisica.cpfOuCnpj}"/>
					  </td>
					  <td valign="top" valign="top" colspan="4" width="50%">
						<label for="clientePFNome">Nome do Segurado</label><br />
						<s:property value="%{pessoaFisica.nome}"/>
					  </td>
					  <td valign="top" valign="top" width="25%"></td>
					</tr>
					<tr>
					  <td valign="top" valign="top">
						<label for="dataNascimento">Dt. Nascimento</label><br />
						<s:property value="%{pessoaFisica.dataNascimento}"/>
					  </td>
					  <td valign="top" valign="top">
						<label for="sexo">Sexo</label><br />
						<s:property  value="%{pessoaFisica.sexo}"/>
					  </td>
					  <td valign="top" valign="top">
						<label for="pfEstadoCivil">Estado Civil</label><br />
						<s:property value="%{pessoaFisica.estadoCivil}"/>
					  </td>
					</tr>
					<tr>
					  <td valign="top" valign="top">
						<label for="cnh">CNH</label><br />
						<s:property value="%{pessoaFisica.cnh}"/>
					  </td>
					  <td valign="top" valign="top">
						<label for="data1aHabilitacao">Dt 1a. Habilitação</label><br />
						<s:property value="%{pessoaFisica.data1aHabilitacao}"/>
					  </td>
					  <td valign="top" valign="top" colspan="2">
						<label for="email">E-mail</label><br />
						<s:property value="%{pessoaFisica.email}"/>
					  </td>
					</tr>
					<tr>
					  <td valign="top" valign="top">
						<label for="telefonePreferencial">Telef. Preferencial</label><br />
						<s:property value="%{pessoaFisica.telefonePreferencial}"/>
					  </td>
					  <td valign="top" valign="top">
						<label for="telefoneAlternativo">Telefone Alternativo</label><br />
						<s:property value="%{pessoaFisica.telefoneAlternativo}"/>
					  </td>
					  <td valign="top" valign="top" colspan="2">
					    <label for="pfReferencia">Referência pessoal</label><br />
						<s:property value="%{pessoaFisica.referenciaPessoal}"/>
					  </td>
					</tr>
					<tr>
						<td valign="top" valign="top" valign="bottom">
							<label for="telefoneCelular">Telefone Celular</label><br />
							<s:property value="%{pessoaFisica.telefoneCelular}"/>
						</td>
						<td valign="top" valign="top" valign="bottom">
							<label for="condutorProfissao">Profissão</label><br />
							<s:property value="%{pessoaFisica.profissao.descricao}"/>
						</td>
						<td valign="top" valign="top" valign="bottom">
							<label for="condutorProfissao">Outra Profissão</label><br />
							<s:property value="%{pessoaFisica.profissaoNome}"/>
						</td>
						<td valign="top" valign="top" valign="bottom">
						<label for="pfGrupoDeVendaId">Grupo de Venda</label><br />
							<s:property value="%{pessoaFisica.grupoDeVenda.nomeDoGrupo}"/>
					  	</td>
					</tr>
				  </table>
				  </s:if>
				  <s:if test="tipoCliente == 1">
				  	<table width="100%" border="0" cellpadding="2" cellspacing="0">
					  <tr>
						<td valign="top" valign="top">
						  <table id="tableDadosCliente" width="100%" border="0" cellpadding="2" cellspacing="0"> 
							<tr>
							  <td valign="top" valign="top" width="20%">
								<label for="clienteCnpj">CNPJ</label><br />
								<s:property value="%{pessoaJuridica.cpfOuCnpj}"/>
							  </td>
							  <td valign="top" valign="top" colspan="2">
								<label for="clientePJNome">Nome do Segurado</label><br />
								<s:property value="%{pessoaJuridica.nome}"/>
							  </td>
							</tr>
							<tr>
							  <td valign="top" valign="top" width="20%">
								<label for="pjGrupoDeVendaId">Grupo de Venda</label><br />
								<s:property value="%{pessoaJuridica.grupoDeVenda.id}"/>
							  </td>
							  <td valign="top" valign="top" colspan="2">
								<label for="email">E-mail</label><br />
								<s:property value="%{pessoaFisica.email}"/>
							  </td>
							</tr>
							<tr>
							  <td valign="top" valign="top">
								<label for="telefonePreferencial">Telef. Preferencial</label><br />
								<s:property value="%{pessoaJuridica.telefonePreferencial}"/>
							  </td>
							  <td valign="top" valign="top">
								<label for="telefoneAlternativo">Telefone Alternativo</label><br />
								<s:property value="%{pessoaJuridica.telefoneAlternativo}"/>
							  </td>
							  <td valign="top" valign="top">
								<label for="telefoneCelular">Telefone Celular</label><br />
								<s:property value="%{pessoaJuridica.telefoneCelular}"/>
							  </td>
							  <td valign="top" valign="top" colspan="2">
							    <label for="pfReferencia">Pessoal de Referência</label><br />
								<s:property value="%{pessoaJuridica.referenciaPessoal}"/>
							  </td>
							</tr>
						  </table>
						</td>
					  </tr>
					</table>
				  </s:if>
				  </fieldset>
			  </div>
			</td>
		  </tr>
		</table>
		<table width="100%" border="0" cellpadding="2" cellspacing="0">
			<tr>
				<td valign="top" valign="top">
					<fieldset>
							<legend accesskey="V"><b>Dados do <u>V</u>eículo</b></legend>
							<table width="100%" border="0" cellpadding="0" cellspacing="0" class="padding_right">
							<tr>
								<td valign="top" valign="top">
									<label for="categoriaVeiculo">Uso do Veículo</label><br />
									<s:property value="%{orcamentoSeguro.automovelOrcamentoCollection[0].usoVeiculo.valor}"/>
								</td>
								<td valign="top" valign="top" colspan="2">
									<label for="marcaNome">Marca</label><br />
									<s:property value="%{orcamentoSeguro.automovelOrcamentoCollection[0].veiculoModelo.fabricante.nome}"/>
								</td>
								<td valign="top" valign="top" colspan="2" width="30%">
									<label>Modelo</label><br />
									<s:property value="%{orcamentoSeguro.automovelOrcamentoCollection[0].veiculoModelo.descricao}"/>
								</td>
								<td valign="top" valign="top" width="20%">
									<label for="anoFabricacao">Ano Fab.</label><br />
								   	<s:property value="%{orcamentoSeguro.automovelOrcamentoCollection[0].anoFabricacao}"/>
								</td>
								<td valign="top" valign="top" width="20%">
									<label for="anoModelo">Ano Modelo</label><br />
									<s:property value="%{orcamentoSeguro.automovelOrcamentoCollection[0].anoModelo}"/>
								</td>
							</tr>
							<tr>
							 	<td valign="top" valign="top">
									<label for="anoFabricacao">Veiculo Zero</label><br />
									<s:property value="%{orcamentoSeguro.automovelOrcamentoCollection[0].zeroKm == true?'SIM':'NÃO'}"/>
								</td>
								<td valign="top" valign="top">
									<label for="anoModelo">Nro NF.</label><br />
									<s:property value="%{orcamentoSeguro.automovelOrcamentoCollection[0].nroNf}"/>
							 	</td>
								<td valign="top" valign="top">
									<label for="tipoCombustivel">Combustível</label><br />
									<s:property value="%{orcamentoSeguro.automovelOrcamentoCollection[0].tipoCombustivel.valor"/>
								</td>
								<td valign="top" valign="top" colspan="2">
									<label for="condutorPrinc">O segurado  é o proprietário/arrendatário do veículo? </label><br />
									<s:property value="%{orcamentoSeguro.automovelOrcamentoCollection[0].isSeguradoProprietario == true?'SIM':'NÃO'}"/>
								</td>
								<td valign="top" valign="top" colspan="2">
							  		<label for="relacao">Relação Segurado/Proprietário</label><br />
							  		<s:property value="%{orcamentoSeguro.automovelOrcamentoCollection[0].proprietarioArrendatarioCollection[0].relacaoSeguradoProprietario.valor}"/>
							  	</td>
							 </tr>
							 <tr>
							 	<td valign="top" valign="top">
							 		<label for="anoFabricacao">Renavan.</label><br />
								   	<s:property value="%{orcamentoSeguro.automovelOrcamentoCollection[0].renavan}"/>
							 	</td>
							 	<td valign="top" valign="top">
							 		<label for="anoFabricacao">Placa.</label><br />
								   	<s:property value="%{orcamentoSeguro.automovelOrcamentoCollection[0].nroPlaca}"/>
							 	</td>
							 	<td valign="top" valign="top">
							 		<label for="anoFabricacao">Chassi.</label><br />
								   	<s:property value="%{orcamentoSeguro.automovelOrcamentoCollection[0].nroChassis}"/>
							 	</td>
							 	<td valign="top" valign="top">
							 		<label for="anoFabricacao">Cor.</label><br />
								   	<s:property value="%{orcamentoSeguro.automovelOrcamentoCollection[0].corPredominante}"/>
							 	</td>
							 	<td valign="top" valign="top">
									<label for="kitGas">Possui Kit Gás?</label><br />
									<s:property value="%{orcamentoSeguro.automovelOrcamentoCollection[0].isKitGas==true?'SIM':'NÃO'}"/>
								</td>
							 	<td valign="top" valign="top" colspan="2">
							 		<label for="finan">Financiado?</label><br />
									<s:property value="%{orcamentoSeguro.automovelOrcamentoCollection[0].tipoFinanciamento.valor}"/>
							 	</td>
							 </tr>
						</table>
					</fieldset>
				</td>
			</tr>
		</table>
		<fieldset>
   			<legend>Prêmios</legend>
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
			  <tr>
			  	<td>
			  		<label class="LabelText" for="premioTotal">Tipo de Franquia</label><br />
			  		<s:textfield value="%{orcamentoFranquias.tipoFranquia.valor}"/>
			  	</td>
			  </tr>
			  <tr>
			  	<td class="TextBox_ContentCell"  width="33%">
				  <label class="LabelText" for="premioTotal">Prêmio Total</label><br />
				  <s:textfield theme="simple" cssClass="TextBox_OneCells_width clCalculator clValor2 currency" value="%{orcamentoFranquias.premioTotal}"/>
				</td>
				<td class="TextBox_ContentCell"  width="33%">
				  <label class="LabelText" for="fator">Franquia</label><br />
				  <s:textfield theme="simple" cssClass="TextBox_OneCells_width clCalculator clValor2 currency" value="%{orcamentoFranquias.valorFranquia}"/>
				</td>
				<td class="TextBox_ContentCell" width="33%">
				  <label class="LabelText" for="premioLiquido">Prêmio Líquido Total</label><br />
				  <s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" value="%{orcamentoFranquias.premioLiquido}"/>
				</td>
			  </tr>
			  <tr>
				<td class="TextBox_ContentCell">
				  <label class="LabelText">Custo da Apólice</label><br />
				  <s:textfield theme="simple" cssClass="TextBox_OneCells_width clCalculator clValor2 currency" value="%{orcamentoFranquias.custoApolice}"/>
				</td>
				<td class="TextBox_ContentCell">
				  <label>IOF</label> <br />
				  <s:textfield theme="simple" cssClass="TextBox_OneCells_width clCalculator clValor2 currency" value="%{orcamentoFranquias.iof}"/>
				</td>
				<td>
					<label>% Fator</label><br />
					<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency readonly" readonly="true" value="%{orcamentoFranquias.orcamentoSeguradora.fator}"/>
				</td>
			  </tr>
			</table>
		</fieldset>
		<fieldset>
   			<legend>Forma de Pagamento</legend>
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td>
						<table class="listItens" style="width:50%">
							<s:iterator value="%{orcamentoFranquias.parcelasOrcamentoCollection}" status="i">
<!--								<tr style="display:none">-->
<!--									<td>-->
<!--										<s:textfield style="display:none;" name="orcamentoFranquias.parcelasOrcamentoCollection[%{#i.index}].id" value="%{id}"/>-->
<!--										<s:textfield style="display:none;" name="orcamentoFranquias.parcelasOrcamentoCollection[%{#i.index}].formaPagamento" value="%{orcamentoFranquias.parcelasOrcamentoCollection[0].formaPagamento}"/>-->
<!--										-->
<!--										<s:textfield style="display:none;" name="orcamentoFranquias.parcelasOrcamentoCollection[%{#i.index}].qtdParcelaDebito" value="%{orcamentoFranquias.parcelasOrcamentoCollection[0].qtdParcelaDebito}"/>-->
<!--										<s:textfield style="display:none;" name="orcamentoFranquias.parcelasOrcamentoCollection[%{#i.index}].valorParcelaDebito" value="%{valorParcelaDebito}"/>-->
<!--										-->
<!--										<s:textfield style="display:none;" name="orcamentoFranquias.parcelasOrcamentoCollection[%{#i.index}].qtdParcelaCredito" value="%{orcamentoFranquias.parcelasOrcamentoCollection[0].qtdParcelaCredito}"/>-->
<!--										<s:textfield style="display:none;" name="orcamentoFranquias.parcelasOrcamentoCollection[%{#i.index}].valorParcelaCredito" value="%{valorParcelaCredito}"/>-->
<!--										-->
<!--										<s:textfield style="display:none;" name="orcamentoFranquias.parcelasOrcamentoCollection[%{#i.index}].qtdParcelaCarne" value="%{orcamentoFranquias.parcelasOrcamentoCollection[0].qtdParcelaCarne}"/>-->
<!--										<s:textfield style="display:none;" name="orcamentoFranquias.parcelasOrcamentoCollection[%{#i.index}].valorParcelaCarne" value="%{valorParcelaCarne}"/>-->
<!--										-->
<!--										<s:textfield style="display:none;" name="orcamentoFranquias.parcelasOrcamentoCollection[%{#i.index}].qtdParcelaCheque" value="%{orcamentoFranquias.parcelasOrcamentoCollection[0].qtdParcelaCheque}"/>-->
<!--										<s:textfield style="display:none;" name="orcamentoFranquias.parcelasOrcamentoCollection[%{#i.index}].valorParcelaCheque" value="%{valorParcelaCheque}"/>-->
<!--									</td>-->
<!--								</tr>-->
								<s:if test="%{orcamentoFranquias.parcelasOrcamentoCollection[0].formaPagamento == 2}">
									<s:if test="%{valorParcelaCredito > 0}">
										<s:if test="%{#i.index==0}">
											<tr class="listItensHeader">
												<td colspan="3">
													<s:textfield style="display:none;" name="parcelasOrcamento.formaPagamento" value="%{orcamentoFranquias.parcelasOrcamentoCollection[0].formaPagamento}"/>
													Cartão de Crédito
												</td>
											</tr>
											<tr class="listItensHeader">
												<td></td>
												<td>
													Parcelas
												</td>
												<td>
													Valor
												</td>
											</tr>
										</s:if>
										<tr>
											<td>
												<input type="radio" name="parcelasOrcamento.id" value="<s:property value="%{id}"/>"/>
											</td>
											<td>
												<s:property value="%{#i.index + 1}"/>x
											</td>
											<td>
												<s:property value="%{valorParcelaCredito}"/>
											</td>
										</tr>
									</s:if>
								</s:if>
								<s:if test="%{orcamentoFranquias.parcelasOrcamentoCollection[0].formaPagamento == 3}">
									<s:if test="%{valorParcelaCarne > 0}">
										<s:if test="%{#i.index==0}">
											<tr class="listItensHeader">
												<td colspan="3">
													<s:textfield style="display:none;" name="parcelasOrcamento.formaPagamento" value="%{orcamentoFranquias.parcelasOrcamentoCollection[0].formaPagamento}"/>
													Carnê
												</td>
											</tr>
											<tr class="listItensHeader">
												<td></td>
												<td>
													Parcelas
												</td>
												<td>
													Valor
												</td>
											</tr>
										</s:if>
										<tr>
											<td>
												<input type="radio" name="parcelasOrcamento.id" value="<s:property value="%{id}"/>"/>
											</td>
											<td>
												<s:property value="%{#i.index + 1}"/>x
											</td>
											<td>
												<s:property value="%{valorParcelaCarne}"/>
											</td>
										</tr>
									</s:if>
								</s:if>
								<s:if test="%{orcamentoFranquias.parcelasOrcamentoCollection[0].formaPagamento == 4}">
									<s:if test="%{valorParcelaDebito > 0}">
										<s:if test="%{#i.index==0}">
											<tr class="listItensHeader">
												<td colspan="3">
													<s:textfield style="display:none;" name="parcelasOrcamento.formaPagamento" value="%{orcamentoFranquias.parcelasOrcamentoCollection[0].formaPagamento}"/>
													Débito em Conta
												</td>
											</tr>
											<tr class="listItensHeader">
												<td></td>
												<td>
													Parcelas
												</td>
												<td>
													Valor
												</td>
											</tr>
										</s:if>
										<tr>
											<td>
												<input type="radio" name="parcelasOrcamento.id" value="<s:property value="%{id}"/>"/>
											</td>
											<td>
												<s:property value="%{#i.index + 1}"/>x
											</td>
											<td>
												<s:property value="%{valorParcelaDebito}"/>
											</td>
										</tr>
									</s:if>
								</s:if>
								<s:if test="%{orcamentoFranquias.parcelasOrcamentoCollection[0].formaPagamento == 5}">
									<s:if test="%{valorParcelaCheque > 0}">
										<s:if test="%{#i.index==0}">
											<tr class="listItensHeader">
												<td colspan="3">
													<s:textfield style="display:none;" name="parcelasOrcamento.formaPagamento" value="%{orcamentoFranquias.parcelasOrcamentoCollection[0].formaPagamento}"/>
													Cheque
												</td>
											</tr>
											<tr class="listItensHeader">
												<td></td>
												<td>
													Parcelas
												</td>
												<td>
													Valor
												</td>
											</tr>
										</s:if>
										<tr>
											<td>
												<input type="radio" name="parcelasOrcamento.id" value="<s:property value="%{id}"/>"/>
											</td>
											<td>
												<s:property value="%{#i.index + 1}"/>x
											</td>
											<td>
												<s:property value="%{valorParcelaCheque}"/>
											</td>
										</tr>
									</s:if>
								</s:if>
							</s:iterator>
						</table>
					</td>
				</tr>
			</table>
		</fieldset>
	  </td>
	</tr>
</table>
<% } catch (Exception e) {e.printStackTrace();}%>