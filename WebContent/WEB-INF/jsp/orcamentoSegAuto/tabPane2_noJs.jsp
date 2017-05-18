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
	<s:hidden id="veiculoOrcamentoId" name="orcamentoSeguro.automovelOrcamentoCollection[0].orcamentoSeguro.id"/>
	<div id="divForm3" style="overflow:auto; height:98%; width:100%">
		 <table>
		    <tr>
			  <td colspan="4">
			    <div class="divMessages" id="divMessagesTab1" style="padding-bottom: 10px;">
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
			    </td>
		    </tr>
			<tr>
				<td>
					<fieldset>
							<legend accesskey="V"><b>Dados do <u>V</u>eículo</b></legend>
							<table width="100%" border="0" cellpadding="0" cellspacing="0" class="padding_right">
							<tr>
								<td colspan="2">
									<label for="categoriaVeiculo">Uso do Veículo</label><br />
									<s:select list="usoVeiculo" listKey="id" listValue="valor" name="orcamentoSeguro.automovelOrcamentoCollection[0].usoVeiculo.id" headerValue="-- Selecione --" headerKey="" cssClass="requiredField" />
								</td>
								<td colspan="2">
									<label for="marcaNome">Marca</label><br />
									<s:textfield id="marcaId" name="orcamentoSeguro.automovelOrcamentoCollection[0].veiculoModelo.fabricante.id" cssStyle="display:none;" theme="simple" />
									<s:textfield id="marcaNome" cssClass="clTextoRestrito requiredField alfanumerico" name="orcamentoSeguro.automovelOrcamentoCollection[0].veiculoModelo.fabricante.nome" theme="simple" cssStyle="width:97%;" onblur="checarMarcaVeiculo();" onchange="if (this.value!=''){setAutomovelAlterado(true);}"/>
								</td>
								<td colspan="2" width="30%">
									<label>Modelo</label><br />
									<s:textfield id="modeloVeiculoId" name="orcamentoSeguro.automovelOrcamentoCollection[0].veiculoModelo.id" cssStyle="display:none;" theme="simple" />
									<s:textfield id="modeloVeiculoDescricao" cssClass="clTextoRestrito requiredField alfanumerico" name="orcamentoSeguro.automovelOrcamentoCollection[0].veiculoModelo.descricao" onchange="if (this.value!=''){setAutomovelAlterado(true);}" theme="simple" cssStyle="width:97%;" onblur="checarModeloVeiculo();"/>
								</td>
								<td width="20%">
									<label for="anoFabricacao">Ano Fab.</label><br />
								   	<s:textfield theme="simple" cssClass="requiredField" id="anoFabricacao" name="orcamentoSeguro.automovelOrcamentoCollection[0].anoFabricacao" size="6" maxlength="4" onchange="setAutomovelAlterado(true);"/>
								</td>
								<td width="20%">
									<label for="anoModelo">Ano Modelo</label><br />
									<s:textfield theme="simple" cssClass="requiredField" id="anoModelo" headerValue="-- Selecione --" name="orcamentoSeguro.automovelOrcamentoCollection[0].anoModelo" size="6" maxlength="4" onchange="setAutomovelAlterado(true);"/>
								</td>
							</tr>
							<tr>
							 	<td>
									<label for="anoFabricacao">Cod. Fipe</label><br />
									<s:textfield theme="simple" cssClass="requiredField" id="codigoFipe" name="orcamentoSeguro.automovelOrcamentoCollection[0].codigoFipe" size="12" maxlength="12" onchange="setAutomovelAlterado(true);"/>
								</td>
							 	<td>
									<label for="anoFabricacao">Veiculo Zero</label><br />
									<s:select theme="simple" id="veiculoZero" name="orcamentoSeguro.automovelOrcamentoCollection[0].zeroKm" value="%{servicoContratado}" list="{'NAO','SIM'}" onchange="setAutomovelAlterado(true);" onblur="if (this.value=='NAO'){$('#nroNF').attr('readonly',true);$('#nroNF').addClass('readonly')}else{$('#nroNF').attr('readonly',false);$('#nroNF').removeClass('readonly')}" cssStyle="width:55px;" />
								</td>
								<td>
									<label for="anoModelo">Nro NF.</label><br />
									<s:textfield theme="simple" cssClass="alfanumerico" id="nroNF" readonly="true" name="orcamentoSeguro.automovelOrcamentoCollection[0].nroNf" size="15" maxlength="10" onchange="setAutomovelAlterado(true);"/>
							 	</td>
								<td>
									<label for="tipoCombustivel">Combustível</label><br />
									<s:select theme="simple" id="tipoCombustivel" name="orcamentoSeguro.automovelOrcamentoCollection[0].tipoCombustivel.id" list="tipoCombustivelList" listKey="id" listValue="valor" headerKey="" headerValue="-- Selecione --" onchange="setAutomovelAlterado(true);"/>
								</td>
								<td colspan="2">
									<label for="condutorPrinc">O segurado  é o proprietário/arrendatário do veículo? </label><br />
									<s:select theme="simple" id="segPropArrend" headerKey="" headerValue="-- Selecione --" list="#{false:'NÃO',true:'SIM'}" name="orcamentoSeguro.automovelOrcamentoCollection[0].isSeguradoProprietario" onchange="selectDadosArrendatario(this.value)"/>
								</td>
								<td colspan="2">
							  		<label for="relacao">Relação Segurado/Proprietário</label><br />
							  		<s:select id="relacaoSegProp" list="relacaoSeguradoProprietario" listKey="id" listValue="valor" name="orcamentoSeguro.automovelOrcamentoCollection[0].proprietarioArrendatario.relacaoSeguradoProprietario.id" headerValue="-- Selecione --" headerKey="" />
							  	</td>
							 </tr>
							 <tr>
							 	<td>
							 		<label for="anoFabricacao">Renavan.</label><br />
								   	<s:textfield theme="simple" size="10" maxlength="15" name="orcamentoSeguro.automovelOrcamentoCollection[0].renavan" cssClass="alfanumerico"/>
							 	</td>
							 	<td>
							 		<label for="anoFabricacao">Placa.</label><br />
								   	<s:textfield id="placaVeiculo" theme="simple" size="10" maxlength="7" name="orcamentoSeguro.automovelOrcamentoCollection[0].nroPlaca" cssClass="alfanumerico"/>
							 	</td>
							 	<td>
							 		<label for="anoFabricacao">Chassi.</label><br />
								   	<s:textfield id="chassiVeiculo" theme="simple" size="20" maxlength="17" name="orcamentoSeguro.automovelOrcamentoCollection[0].nroChassis" cssClass="alfanumerico"/>
							 	</td>
							 	<td>
							 		<label for="anoFabricacao">Cor.</label><br />
								   	<s:textfield theme="simple" size="10" maxlength="15" name="orcamentoSeguro.automovelOrcamentoCollection[0].corPredominante" id="corPredominante" cssClass="alfanumerico"/>
							 	</td>
							 	<td>
									<label for="kitGas">Possui Kit Gás?</label><br />
									<s:select theme="simple" id="kitGas" headerKey="" headerValue="-- Selecione --" list="#{false:'NÃO',true:'SIM'}" name="orcamentoSeguro.automovelOrcamentoCollection[0].isKitGas"/>
								</td>
							 	<td colspan="2">
							 		<label for="finan">Financiado?</label><br />
									<s:select id="finan" list="tipoFinanciamento" listKey="id" listValue="valor" name="orcamentoSeguro.automovelOrcamentoCollection[0].tipoFinanciamento.id" headerValue="-- Selecione --" headerKey="" onchange="selectFinanciado(this.value)"/>
							 	</td>
							 </tr>
							 <tr>
						 		<td colspan="7">
						 			<fieldset>
									 	<legend>Dispositivo de Segurança</legend>
									 	<table width="100%">
									 		<tr>
											 	<td width="25%">
													<label for="Rastreador">Rastreador</label><br />
													<s:select id="selectRastreadorId" headerKey="" headerValue="-- Selecione --"  list="rastreadorIseg" name="orcamentoSeguro.automovelOrcamentoCollection[0].rastreadorIseg.id" value="%{orcamentoSeguro.automovelOrcamentoCollection[0].rastreadorIseg.id}" listKey="id" listValue="descricao" style="width: 250px;" onchange="selectRastreador(this.value);"/>
												</td>
												<td>
													<label>Outro Rastreador</label><br />
													<s:textfield id="outroRastreador" theme="simple" cssClass="readonly" disabled="true" name="orcamentoSeguro.automovelOrcamentoCollection[0].outroRastreador" size="30" maxlength="50" />
												</td>
											 	<td width="25%">
											 		<label for="Rastreador">Bloqueador</label><br />
											 		<s:select id="selectBloqueadorId" headerKey="" headerValue="-- Selecione --" list="bloqueadorIseg" name="orcamentoSeguro.automovelOrcamentoCollection[0].bloqueadorIseg.id" value="%{orcamentoSeguro.automovelOrcamentoCollection[0].bloqueadorIseg.id}" listKey="id" listValue="descricao" style="width: 250px;" onchange="selectBloqueador(this.value);"/>
											 	</td>
											 	<td>
											 		<label>Outro Bloqueador</label><br />
											 		<s:textfield id="outroBloqueador" theme="simple" cssClass="readonly" disabled="true" name="orcamentoSeguro.automovelOrcamentoCollection[0].outroBloqueador" size="30" maxlength="50" />
												</td>
											 </tr>
									 	</table>
									 	<table width="100%">
									 		<s:iterator value="dispositivoSegurancaList" var="dispositivoSeguranca" status="j">
									 			<s:if test="%{#j.index == 0}">
									 				<tr>
									 			</s:if>
									 			<s:if test="%{#j.index != 0 && #j.index % 4 == 0}">
									 				</tr>
									 				<tr>
									 			</s:if>
									 				<td>
														<s:checkbox id="seguranca%{#j.index}" name="acessoriosId" fieldValue="%{id}" value="%{idSelecionado}" onchange="setAlterado(true);"/><s:label value="%{descricao}" for="seguranca%{#j.index}"/>
									 				</td>
									 		</s:iterator>
									 	</table>
								 	</fieldset>
								</td>
							</tr>
							<tr>
						 		<td colspan="7">
						 			<fieldset>
									 	<legend for="seguranca">Opcionais</legend>
									 	<table width="100%">
									 		<s:iterator value="opcionaisList" var="opcionais" status="i">
									 			<s:if test="%{#i.index == 0}">
									 				<tr>
									 			</s:if>
									 			<s:if test="%{#i.index != 0 && #i.index % 4 == 0}">
									 				</tr>
									 				<tr>
									 			</s:if>
									 				<td>
														<s:checkbox id="opcionais%{#i.index}" name="acessoriosId" fieldValue="%{id}" value="%{idSelecionado}" onchange="setAlterado(true);"/><s:label value="%{descricao}" for="opcionais%{#i.index}"/> 
									 				</td>
									 		</s:iterator>
									 	</table>
									 </fieldset>
								</td>
							</tr>
						</table>
					</fieldset>
				</td>
			</tr>
			<tr>
			  	<td>
			  		<fieldset>
						<legend accesskey="P"><b>Dados do Proprietário/Arrendatário</b></legend>
						<table width="100%" border="0" cellpadding="0" cellspacing="0" id="proprietarioArrendatarioTable">
							<tr>
								<td>
									<s:textfield name="orcamentoSeguro.automovelOrcamentoCollection[0].proprietarioArrendatario.id" style="display:none"/>
									<label>Tipo Pessoa</label><br />
									<s:select list="#{1:'PESSOA FÍSICA',2:'PESSOA JURÍDICA'}" id="arrTipoPessoa" name="orcamentoSeguro.automovelOrcamentoCollection[0].proprietarioArrendatario.tipoPessoa" headerValue="-- Selecione --" headerKey="" onchange="setTipoPessoa(this.value);"/>
								</td>
							</tr>
							<tr>
								<td width="25%">
									<label id="cpf_cnpj" for="condutorCPF">CPF</label><br />
									<s:textfield theme="simple" id="arrendatarioCPFCNPJ" name="orcamentoSeguro.automovelOrcamentoCollection[0].proprietarioArrendatario.cpfOuCnpj" size="17" maxlength="14" onKeyPress="return digitos(event, this);"/>
							  	</td>
								<td width="50%">
									<label for="condutorNome">Nome</label><br />
									<s:textfield theme="simple" id="arrendatarioNome" name="orcamentoSeguro.automovelOrcamentoCollection[0].proprietarioArrendatario.nome" size="43" maxlength="60" />
							  	</td>
							  	<td width="25%">
									<label for="condutorTelefones">Telefone</label><br />
									<s:textfield theme="simple" id="arrendatarioTelefones" cssClass="clFone" name="orcamentoSeguro.automovelOrcamentoCollection[0].proprietarioArrendatario.telefone" size="16" maxlength="30"/>
							  	</td>
							</tr>
							<tr id="trPessoaFisica">
								<td >
									<label for="condutorDataNascimento">Dt. Nascimento</label><br />
									<s:textfield theme="simple" cssClass="clData " id="arrendatarioDataNascimento" name="orcamentoSeguro.automovelOrcamentoCollection[0].proprietarioArrendatario.dataNascimento" onblur="isValidDate(this)" size="18" maxlength="10"/>
								</td>
							  	<td>
									<label for="condutorData1aHabilitacao">Tempo Habilitação</label><br />
									<s:select id="condutorData1aHabilitacao" list="#{2:'ATÉ 2 ANOS', 3:'MAIS DE 2 ANOS'}" headerKey="" name="orcamentoSeguro.automovelOrcamentoCollection[0].proprietarioArrendatario.tempoHabilitacao" headerValue="-- Selecione --" />
							  	</td>
							</tr>
						</table>
					</fieldset>
			  	</td>
		  	</tr>
			<tr>
			  	<td>
			  		<fieldset>
						<legend accesskey="P"><b>Instituição Financeira</b></legend>
						<table width="100%" border="0" cellpadding="0" cellspacing="0" id="instituicaoFinanceira">
							<tr>
								<td>
									<label for="condutorNome">Nome</label><br />
									<s:textfield theme="simple" cssClass=" " name="orcamentoSeguro.automovelOrcamentoCollection[0].nomeBanco" size="43" maxlength="60" />
							  	</td>
							  	<td>
									<label for="condutorCPF">CNPJ</label><br />
									<s:textfield theme="simple" cssClass="clCNPJ " name="orcamentoSeguro.automovelOrcamentoCollection[0].cnpjBanco" size="17" maxlength="14" />
							  	</td>
							</tr>
						</table>
					</fieldset>
			  	</td>
		  	</tr>
		</table>
	</div>
<% } catch (Exception e) {e.printStackTrace();}%>