<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try {
%>
<style>
	#jquery-lightbox{
		z-index: 4001;	
	}
	#jquery-overlay{
		z-index: 4000;
	}
</style>
<div class="sub_top_page">
	<div class="sections_menu" style="margin: 6px 0px 0px 0px;">
	  <table border="0" cellpadding="0" cellspacing="0">
		<tr id="rowTabs">
		   <s:iterator value="orcamentoSeguradora.orcamentoFranquiasCollection" status="i">
		   	  <s:if test="%{#i.index==0}">
		   	  <td style="display:none;">
		   	  	<s:textfield id="paramOrcamentoSeguradoraIdModal" name="orcamentoSeguradora.id" style="display:none;"/>
		   	  	<s:textfield id="paramPropostaAnexoOrcamentoSeguradoraId" name="propostaAnexo.orcamentoSeguradora.id" value="%{orcamentoSeguradora.id}" style="display:none;"/>
				<s:textfield id="paramOrcamentoSeguroIdModal" name="orcamentoSeguradora.orcamentoSeguro.id" style="display:none;"/>
				<s:textfield name="orcamentoSeguradora.rotulo" style="display:none;"/>
				<s:textfield name="orcamentoSeguradora.item" style="display:none;"/>
				<s:textfield id="paramSeguradoraModal" name="orcamentoSeguradora.seguradora.id" style="display:none;"/>
				<s:textfield id="paramRamoIdModal" name="orcamentoSeguro.ramo.id" style="display:none;"/>
				<s:textfield name="orcamentoSeguradora.dataCalculo" style="display:none;"/>
				<s:textfield name="orcamentoSeguradora.fator" style="display:none;"/>
				<s:textfield id="tabsModalOrcamentoSeguradoraNome" value="%{orcamentoSeguradora.seguradora.nome}" style="display:none;"/>
		      </td>
		   	  </s:if>
			  <td>
				<table onclick="abrirAba(this);" id="tabModal<s:property value="%{#i.index}"/>" border="0" cellpadding="0" cellspacing="0" class="inactive">
				  <tr>
					<td class="TabLeft"></td>
					<td class="TabBody"><s:property value="%{tipoFranquia.valor}"/></td>
					<td class="TabRight"/>
				  </tr>
				</table>
			  </td>
		  </s:iterator>
		  <td>
			<table onclick="abrirAba(this);" id="tabModal<s:property value="%{orcamentoSeguradora.orcamentoFranquiasCollection.size()}"/>" border="0" cellpadding="0" cellspacing="0" class="inactive">
			  <tr>
				<td class="TabLeft"></td>
				<td class="TabBody TabPanel_width">Coberturas e Serviços</td>
				<td class="TabRight"/>
			  </tr>
			</table>
		  </td>
		  <td>
			<table onclick="abrirAba(this);carregarPropostaAnexosOrcamento($('#paramOrcamentoSeguradoraIdModal').val());" id="tabModal<s:property value="%{orcamentoSeguradora.orcamentoFranquiasCollection.size()+1}"/>" border="0" cellpadding="0" cellspacing="0" class="inactive">
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
  <div id="allForms" style="overflow:auto; overflow-x: hidden; width:99%; position: inherit; max-height: 480px;" class="tabPane" >
  	<s:iterator value="orcamentoSeguradora.orcamentoFranquiasCollection" status="j">
	  <div class="tabPane" id="tabPaneModal<s:property value="%{#j.index}"/>" style="overflow:auto; height:auto; width:100%; display: none; position: relative;">
	     <table width="98%" border="0" cellpadding="0" cellspacing="0">
	     	<tr>
	     		<td>
	     			<s:textfield name="orcamentoSeguradora.orcamentoFranquiasCollection[%{#j.index}].orcamentoSeguradora.id" value="%{orcamentoSeguradora.id}" style="display:none;"/>
	     			<s:textfield name="orcamentoSeguradora.orcamentoFranquiasCollection[%{#j.index}].id" value="%{id}" style="display:none;"/>
	     			<s:textfield name="orcamentoSeguradora.orcamentoFranquiasCollection[%{#j.index}].tipoFranquia.id" value="%{tipoFranquia.id}" style="display:none;"/>
	     			<fieldset>
	     			<legend>Prêmios</legend>
					<table border="0" cellpadding="0" cellspacing="0" width="100%">
					  <tr>
					  	<td class="TextBox_ContentCell"  width="33%">
						  <label class="LabelText" for="premioTotal">Prêmio Total</label><br />
						  <s:textfield theme="simple" cssClass="TextBox_OneCells_width requiredField clCalculator clValor2 currency" id="premioTotalReduzido%{#j.index}" name="orcamentoSeguradora.orcamentoFranquiasCollection[%{#j.index}].premioTotal" value="%{premioTotal}" onchange="calculoAlterado = true;"/>
						</td>
						<td class="TextBox_ContentCell"  width="33%">
						  <label class="LabelText" for="fator">Franquia</label><br />
						  <s:textfield theme="simple" cssClass="TextBox_OneCells_width requiredField clCalculator clValor2 currency" id="franquia%{#j.index}" name="orcamentoSeguradora.orcamentoFranquiasCollection[%{#j.index}].valorFranquia" value="%{valorFranquia}" onchange="calculoAlterado = true;"/>
						</td>
						<td class="TextBox_ContentCell" width="33%">
						  <label class="LabelText" for="premioLiquido">Prêmio Líquido Total</label><br />
						  <s:textfield theme="simple" cssClass="TextBox_OneCells_width clCalculator clValor2 currency" id="premioLiquido%{#j.index}" name="orcamentoSeguradora.orcamentoFranquiasCollection[%{#j.index}].premioLiquido" onchange="calculoAlterado = true;"/>
						</td>
					  </tr>
					  <tr>
						<td class="TextBox_ContentCell">
						  <label class="LabelText">Custo da Apólice</label><br />
						  <s:textfield theme="simple" cssClass="TextBox_OneCells_width clCalculator clValor2 currency" name="orcamentoSeguradora.orcamentoFranquiasCollection[%{#j.index}].custoApolice" onchange="calculoAlterado = true;"/>
						</td>
						<td class="TextBox_ContentCell">
						  <label>IOF</label> <br />
						  <s:textfield theme="simple" cssClass="TextBox_OneCells_width clCalculator clValor2 currency" name="orcamentoSeguradora.orcamentoFranquiasCollection[%{#j.index}].iof" onchange="calculoAlterado = true;"/>
						</td>
						<td>
							<label>% Fator</label><br />
							<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency readonly" readonly="true" value="%{orcamentoSeguradora.fator}" onchange="calculoAlterado = true;"/>
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
									<s:textfield theme="simple" size="3" maxlength="2" id="qtd_parcela%{#j.index}"/>
								</td>
								<td width="25%"></td>
								<td width="25%"></td>
								<td width="25%" valign="bottom">
								  <a href="#" class="button" onclick="" >
									<table onclick="gerarParcelas('#lstParcelas<s:property value="%{#j.index}"/>','#premioTotalReduzido<s:property value="%{#j.index}"/>','#qtd_parcela<s:property value="%{#j.index}"/>','#debRed<s:property value="%{#j.index}"/>','#carneRed<s:property value="%{#j.index}"/>','#credRed<s:property value="%{#j.index}"/>','#cheqRed<s:property value="%{#j.index}"/>',<s:property value="%{id}"/>,<s:property value="%{#j.index}"/>);" onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
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
											<tr style="display:none;">
												<td>
													<s:textfield id="formaPagamento" value="%{orcamentoSeguradora.orcamentoFranquiasCollection[#j.index].parcelasOrcamentoCollection[0].formaPagamento}" onchange="calculoAlterado = true;"/>
												</td>
											</tr>
											<tr>
												<td>
													<input type="radio" id="formaPagamentoDeb<s:property value="{#j.index}"/>" value="4" <s:property value="%{orcamentoSeguradora.orcamentoFranquiasCollection[#j.index].parcelasOrcamentoCollection[0].formaPagamento == 4 ? 'checked' : ''}"/> name="orcamentoSeguradora.orcamentoFranquiasCollection<s:property value="{#j.index}"/>.parcelasOrcamentoCollection[0].formaPagamento" onchange="calculoAlterado = true;"/>
												</td>
												<td>
													<input type="radio" id="formaPagamentoCar<s:property value="{#j.index}"/>" value="3" <s:property value="%{orcamentoSeguradora.orcamentoFranquiasCollection[#j.index].parcelasOrcamentoCollection[0].formaPagamento == 3 ? 'checked' : ''}"/> name="orcamentoSeguradora.orcamentoFranquiasCollection<s:property value="{#j.index}"/>.parcelasOrcamentoCollection[0].formaPagamento" onchange="calculoAlterado = true;"/>
												</td>
												<td>
													<input type="radio" id="formaPagamentoCre<s:property value="{#j.index}"/>" value="2" <s:property value="%{orcamentoSeguradora.orcamentoFranquiasCollection[#j.index].parcelasOrcamentoCollection[0].formaPagamento == 2 ? 'checked' : ''}"/> name="orcamentoSeguradora.orcamentoFranquiasCollection<s:property value="{#j.index}"/>.parcelasOrcamentoCollection[0].formaPagamento" onchange="calculoAlterado = true;"/>
												</td>
												<td>
												    
													<input type="radio" id="formaPagamentoChe<s:property value="{#j.index}"/>" value="5" <s:property value="%{orcamentoSeguradora.orcamentoFranquiasCollection[#j.index].parcelasOrcamentoCollection[0].formaPagamento == 5 ? 'checked' : ''}"/> name="orcamentoSeguradora.orcamentoFranquiasCollection<s:property value="{#j.index}"/>.parcelasOrcamentoCollection[0].formaPagamento" onchange="calculoAlterado = true;"/>
												</td>
											</tr>
											<tr>
												<td width="25%">
													<label>Debito em Conta</label><br />
													<s:textfield theme="simple" size="3" id="debRed%{#j.index}" name="orcamentoSeguradora.orcamentoFranquiasCollection[%{#j.index}].parcelasOrcamentoCollection[%{#j.index}].qtdParcelaDebito" onchange="calculoAlterado = true;"/>
												</td>
												<td width="25%">
													<label>Carnê</label><br />
													<s:textfield theme="simple" size="3" id="carneRed%{#j.index}" name="orcamentoSeguradora.orcamentoFranquiasCollection[%{#j.index}].parcelasOrcamentoCollection[%{#j.index}].qtdParcelaCarne" onchange="calculoAlterado = true;"/>
												</td>
												<td width="25%">
													<label>Cartão de Crédito</label><br />
													<s:textfield theme="simple" size="3" id="credRed%{#j.index}" name="orcamentoSeguradora.orcamentoFranquiasCollection[%{#j.index}].parcelasOrcamentoCollection[%{#j.index}].qtdParcelaCredito" onchange="calculoAlterado = true;"/>
												</td>
												<td width="25%">
													<label>Cheque Pré-Datado</label><br />
													<s:textfield theme="simple" size="3" id="cheqRed%{#j.index}" name="orcamentoSeguradora.orcamentoFranquiasCollection[%{#j.index}].parcelasOrcamentoCollection[%{#j.index}].qtdParcelaCheque" onchange="calculoAlterado = true;"/>
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
						<table width="100%" class="listItens" id="lstParcelas<s:property value="%{#j.index}"/>">
							<tr class="listItensHeader" id="lstCabecalho<s:property value="%{#j.index}"/>">
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
							<s:iterator value="%{orcamentoSeguradora.orcamentoFranquiasCollection[#j.index].parcelasOrcamentoCollection}" status="i">
							<s:if test="%{valorParcelaDebito != null && valorParcelaCarne != null && valorParcelaCredito != null && valorParcelaCheque != null}">
							<tr style="display:none;">
								<td>
									<s:textfield style="display:none;" name="orcamentoSeguradora.orcamentoFranquiasCollection[%{#j.index}].parcelasOrcamentoCollection[%{#i.index}].id"/>
									<s:textfield style="display:none;" name="orcamentoSeguradora.orcamentoFranquiasCollection[%{#j.index}].parcelasOrcamentoCollection[%{#i.index}].orcamentoFranquias.id"/>
									<s:textfield style="display:none;" name="orcamentoSeguradora.orcamentoFranquiasCollection[%{#j.index}].parcelasOrcamentoCollection[%{#i.index}].qtdParcelas" value="%{#i.index+1}"/>									
								</td>
							</tr>
							<tr>
								<td><s:property value="%{#i.index+1}"/>x</td>
								<td>
									<s:textfield cssClass="TextBox_OneCells_width clCalculator clValor2 currency" style="width:93%" name="orcamentoSeguradora.orcamentoFranquiasCollection[%{#j.index}].parcelasOrcamentoCollection[%{#i.index}].valorParcelaDebito" onchange="calculoAlterado = true;"/>
								</td>
								<td><s:property value="%{#i.index+1}"/>x</td>
								<td>
									<s:textfield cssClass="TextBox_OneCells_width clCalculator clValor2 currency" style="width:93%" name="orcamentoSeguradora.orcamentoFranquiasCollection[%{#j.index}].parcelasOrcamentoCollection[%{#i.index}].valorParcelaCarne" onchange="calculoAlterado = true;"/>
								</td>
								<td><s:property value="%{#i.index+1}"/>x</td>
								<td>
									<s:textfield cssClass="TextBox_OneCells_width clCalculator clValor2 currency" style="width:93%" name="orcamentoSeguradora.orcamentoFranquiasCollection[%{#j.index}].parcelasOrcamentoCollection[%{#i.index}].valorParcelaCredito" onchange="calculoAlterado = true;"/>
								</td>
								<td><s:property value="%{#i.index+1}"/>x</td>
								<td>
									<s:textfield cssClass="TextBox_OneCells_width clCalculator clValor2 currency" style="width:93%" name="orcamentoSeguradora.orcamentoFranquiasCollection[%{#j.index}].parcelasOrcamentoCollection[%{#i.index}].valorParcelaCheque" onchange="calculoAlterado = true;"/>
								</td>
							</tr>
							</s:if>
							</s:iterator>
						</table>
					</fieldset>
	     		</td>
	     	</tr>
	     </table>
	  </div>
	</s:iterator>
	  <div class="tabPane" id="tabPaneModal<s:property value="%{orcamentoSeguradora.orcamentoFranquiasCollection.size()}"/>" style="overflow:auto; height:auto; width:100%; display: none; position: relative;">
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
									<label><s:property value="%{orcamentoSeguro.automovelOrcamentoCollection[0].tipoIndenizacao}"/></label>
								</td>
								<td>
									<label>Percentual/LMI</label><br />
									<s:textfield theme="simple" id="cascoLmiSeguradora" cssClass="TextBox_OneCells_width clValor2 currency readonly" value="%{orcamentoSeguro.automovelOrcamentoCollection[0].valorCasco}" disabled="true" size="14" maxlength="14" onchange="calculoAlterado = true;"/>
								</td>
	  						</tr>
	  						<s:iterator value="orcamentoSeguradora.orcamentoFranquiasCollection" status="i">
	  						<tr>
	  							<td></td>
	  							<td>
	  								<label class="LabelText" for="fator"><s:property value="%{tipoFranquia.valor}" /></label>
	  							</td>
	  							<td valign="top">
	  								<label class="LabelText" for="fator">Franquia</label><br />
									<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" value="%{valorFranquia}" size="14" maxlength="14" onchange="calculoAlterado = true;"/>
								</td>
								<td>
									<label>Observações</label><br />
									<s:textfield theme="simple" name="orcamentoSeguradora.orcamentoFranquiasCollection[%{#i.index}].observacao" onchange="calculoAlterado = true;"/>
								</td>
								<td>
									<label>Premio Líquido</label><br />
									<s:textfield theme="simple" cssClass="TextBox_OneCells_width currency" value="%{premioLiquido}" size="12" maxlength="14" onchange="calculoAlterado = true;"/>
								</td>
	  						</tr>
	  						</s:iterator>
	  					</table>
	  				</fieldset>
	  			</td>
	  		</tr>
	  		<tr>
	  			<td>
				     <fieldset>
						<legend>Coberturas Contradadas</legend>
						<table width="100%" id="tableCoberturaContratada">
							<s:iterator value="orcamentoSeguradora.orcamentoCoberturaCollection" status="k">
								<tr>
									<td>
										<s:textfield name ="orcamentoSeguradora.orcamentoCoberturaCollection[%{#k.index}].orcamentoSeguradora.id" value="%{orcamentoSeguradora.id}" style="display:none"/>
										<s:textfield name ="orcamentoSeguradora.orcamentoCoberturaCollection[%{#k.index}].id" value="%{id}" style="display:none"/>
										<s:textfield name ="orcamentoSeguradora.orcamentoCoberturaCollection[%{#k.index}].descricao" value="%{descricao}" style="display:none"/>
										<s:textfield name ="orcamentoSeguradora.orcamentoCoberturaCollection[%{#k.index}].sequencia" value="%{sequencia}" style="display:none"/>
										<s:if test="%{coberturasList.size() > 0}">
											<s:textfield name ="orcamentoSeguradora.orcamentoCoberturaCollection[%{#k.index}].coberturasIseg.id" style="display:none"/>
											<s:select theme="simple" style="width:250px" name="orcamentoSeguradora.orcamentoCoberturaCollection[%{#k.index}].coberturas.id" headerKey=""  headerValue="-- Selecione --" list="coberturasList" listKey="id" listValue="descricao" value="%{coberturas.id}" onchange="calculoAlterado = true;"/>
										</s:if>
										<s:else>
											<s:select theme="simple" style="width:250px" name="orcamentoSeguradora.orcamentoCoberturaCollection[%{#k.index}].coberturasIseg.id" headerKey=""  headerValue="-- Selecione --" list="coberturasIsegList" listKey="id" listValue="descricao" onchange="calculoAlterado = true;"/>
										</s:else>
									</td>
									<td></td>
									<td>
										<s:if test="%{#k.index == 0}">
											<label>Percentual/LMI</label><br />
										</s:if>
										<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" name="orcamentoSeguradora.orcamentoCoberturaCollection[%{#k.index}].lmi" size="14" maxlength="14" onchange="calculoAlterado = true;"/>
									</td>
									<td>
										<s:if test="%{#k.index == 0}">
											<label class="LabelText" for="fator">Franquia</label><br />
										</s:if>
										<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" name="orcamentoSeguradora.orcamentoCoberturaCollection[%{#k.index}].franquia" size="10" maxlength="14" onchange="calculoAlterado = true;"/>
									</td>
									<td>
										<s:if test="%{#k.index == 0}">
											<label>Observações</label><br />
										</s:if>
										<s:textfield theme="simple" name="orcamentoSeguradora.orcamentoCoberturaCollection[%{#k.index}].textoFranquia" onchange="calculoAlterado = true;"/>
									</td>
									<td>
										<s:if test="%{#k.index == 0}">
											<label>Premio Líquido</label><br />
										</s:if>
										<s:textfield theme="simple" name="orcamentoSeguradora.orcamentoCoberturaCollection[%{#k.index}].premio" cssClass="TextBox_OneCells_width clValor2 currency" size="12" maxlength="14" onchange="calculoAlterado = true;"/>
									</td>
								</tr>
							</s:iterator>
						</table>
						<table>
							<tr>
	  							<td valign="bottom">
							      <a href="#" class="button" onclick="abrirModalCoberturaSeguradora();">
									  <table onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
									    <tr>
										  <td class="wButton_left"></td>
										  <td class="wButton_text wButton_width">Adicionar Cobertura</td>
										  <td class="wButton_right"/>
									    </tr>
									  </table>
								  </a>
					    		</td>
	  						</tr>
						</table>
					</fieldset>
					<fieldset>
						<legend>Serviços Contradados</legend>
						<table width="100%" id="tableServicoContratado">
							<s:iterator value="orcamentoSeguradora.orcamentoServicosCollection" status="x">
							<tr>
								<td>
									<s:textfield name ="orcamentoSeguradora.orcamentoServicosCollection[%{#x.index}].orcamentoSeguradora.id" value="%{orcamentoSeguradora.id}" style="display:none"/>
									<s:textfield name ="orcamentoSeguradora.orcamentoServicosCollection[%{#x.index}].id" value="%{id}" style="display:none"/>
									<s:textfield name ="orcamentoSeguradora.orcamentoServicosCollection[%{#x.index}].descricao" value="%{descricao}" style="display:none"/>
									<s:textfield name ="orcamentoSeguradora.orcamentoServicosCollection[%{#x.index}].sequencia" value="%{sequencia}" style="display:none"/>
									<s:if test="%{servicosList.size() > 0}">
										<s:select theme="simple" style="width:250px" name="orcamentoSeguradora.orcamentoServicosCollection[%{#x.index}].servicos.id" headerKey=""  headerValue="-- NÃO CONTRATADO --" list="servicosList" listKey="id" listValue="descricao" value="%{servicos.id}" onchange="calculoAlterado = true;"/>
									</s:if>
									<s:else>
										<s:select theme="simple" style="width:250px" name="orcamentoSeguradora.orcamentoServicosCollection[%{#x.index}].servicosIseg.id" headerKey=""  headerValue="-- NÃO CONTRATADO --" list="servicoIsegList" listKey="id" listValue="descricao" onchange="calculoAlterado = true;"/>
									</s:else>
								</td>
								<td>
									<s:if test="%{#x.index == 0}">
									<label>Franquia</label><br />
									</s:if>
									<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" size="14" maxlength="14" name="orcamentoSeguradora.orcamentoServicosCollection[%{#x.index}].franquia" onchange="calculoAlterado = true;"/>
								</td>
								<td>
									<s:if test="%{#x.index == 0}">
									<label>Observações</label><br />
									</s:if>
									<s:textfield theme="simple" name="orcamentoSeguradora.orcamentoServicosCollection[%{#x.index}].textoFranquia" onchange="calculoAlterado = true;"/>
								</td>
								<td>
									<s:if test="%{#x.index == 0}">
									<label>Premio Líquido</label><br />
									</s:if>
									<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" size="12" maxlength="14" name="orcamentoSeguradora.orcamentoServicosCollection[%{#x.index}].premio" onchange="calculoAlterado = true;"/>
								</td>
							</tr>
							</s:iterator>
						</table>
						<table>
							<tr>
								<td valign="bottom">
							      <a href="#" class="button" onclick="abrirModalServicoSeguradora();">
									  <table onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
									    <tr>
										  <td class="wButton_left"></td>
										  <td class="wButton_text wButton_width">Adicionar Serviço</td>
										  <td class="wButton_right"/>
									    </tr>
									  </table>
								  </a>
							    </td>
						    </tr>
						</table>
					</fieldset>
				</td>
			</tr>
			<tr>
				 <td>
				 	<label>Observações:</label><br />
				 	<s:textarea style="width: 100%" rows="3" name="orcamentoSeguradora.observacao" onchange="calculoAlterado = true;"/>
				 </td>
			</tr>
		</table>
	  </div>
  	  <div class="tabPane" id="tabPaneModal<s:property value="%{orcamentoSeguradora.orcamentoFranquiasCollection.size()+1}"/>" style="overflow:auto; height:auto; width:100%; display: none; position: relative;">
  	  	<table width="98%" border="0" cellpadding="0" cellspacing="0">
	  		<tr>
	  			<td>
	  				<fieldset>
						<legend accesskey=""><b>Anexo</b></legend>
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
						  <tr>
							<td>
							  <label for="dataDoProposta">Arquivo p/ upload (Não pode ser maior que 2048000 bytes / 2MB)</label><br />
							  <s:file theme="simple" id="arquivoAnexo" name="fileUpload" size="40" />
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
							    <a href="#" class="button" onclick="inserirOrcamentoAnexo();" >
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
   <script>
   	    $().ready(function() {
   	 		$(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
   	    });
		abrirAba(document.getElementById(modalAbaAtual));
	
		if($('#formaPagamento').val()=='2'){
 			$('#formaPagamentoCre').attr('checked',true);
		}
		if($('#formaPagamento').val()=='3'){
		 	$('#formaPagamentoCar').attr('checked',true);
		}
		if($('#formaPagamento').val()=='4'){
			$('#formaPagamentoDeb').attr('checked',true);
		}
		if($('#formaPagamento').val()=='5'){
		 	$('#formaPagamentoChe').attr('checked',true);
		}
   
   	    setTimeout(function(){
   	 		$("#"+modalAbaAtual).click();
	    },1000);
   </script>
   <script language="javascript">
		$('#gallery a.galleryLink').lightBox({fixedNavigation:true});
		$(document).ready(function() {
			$('#mycarousel').jcarousel();
		});
	</script>
<% } catch (Exception e) {e.printStackTrace();}%>