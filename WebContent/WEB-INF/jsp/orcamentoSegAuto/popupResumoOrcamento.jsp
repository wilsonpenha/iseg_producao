<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try { 
%>
<link rel="stylesheet" type="text/css" href="<s:url value="/common/wizardFinal/tab-panel.css" includeParams="none"/>" />
<link rel="stylesheet" type="text/css" href="<s:url value="/common/wizardFinal/tabpane-ob.css" includeParams="none"/>" />
<link rel="stylesheet" type="text/css" href="<s:url value="/common/wizardFinal/esquema.css" includeParams="none"/>" />
<link rel="stylesheet" type="text/css" href="<s:url value="/common/web/skins/Default/Main/Main_Edition.css" includeParams="none" />" id="paramCSS"></link>
<link rel="stylesheet" type="text/css" href="<s:url value="/common/web/skins/Default/Main/Client/DataGrid/DataGrid.css" includeParams="none" />" id="paramCSS"></link>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery-1.3.2-pack.js?v=0" includeParams="none"/>"></script>
<style>
	label{
		font-weight: bold;
		color: #2F2F2F;
	}
	.main_client_tablerelation{
		background-color: #F2F2F2;
	}
</style>
<table width="100%" cellspacing="0" cellpadding="0" border="0" class="Main_Client_TableRelation" style="margin: 0px 0px 0px 0px">
  <tr>
	<td>
		<div>
			<a href="#" onclick="print();">
				<img src="<s:url value="/common/web/skins/Default/Main/ToolBar/print.png" includeParams="none"/>"/>
			</a>
		</div>
		<fieldset>
			<table width="100%" border="0" cellpadding="2" cellspacing="0">
				<tr>
					<td valign="top">
						<label>Data</label><br />
						<s:property value="%{orcamentoSeguro.dataOrcamento}"/>
					</td>
					<td valign="top">
						<label>Produtor</label><br />
						<s:property value="%{orcamentoSeguro.produtor.pessoa.nome}"/>
					</td>
					<td valign="top">
						<label>Numero</label><br />
						<s:property value="%{orcamentoSeguro.numero}"/>
					</td>
				</tr>
			</table>
		</fieldset>
		<table width="100%" border="0" cellpadding="2" cellspacing="2">
		  <tr>
			<td valign="top">
			  <div id="divDadosCliente">
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
		  <tr>
		  	<td valign="top" valign="top">
		  		<fieldset>
			  		<legend><b>Dados Bancários</b></legend>
			  		<table width="100%" border="0" cellpadding="0" cellspacing="0">
				  		<tr>
				  			<td>
				  				<label>Banco</label><br/>
				  			</td>
				  			<td>
				  				<label>Tipo de Conta</label><br/>
				  			</td>
				  			<td>
				  				<label>Agência</label><br/>
				  			</td>
				  			<td>
				  				<label>Conta</label><br/>
				  			</td>
				  		</tr>
				  	 <s:iterator value="orcamentoSeguro.orcamentoBancosCollection" status="i">
						<tr>
						  <td>
							<label><s:property value="%{bancoRelacionamento.nome}"/></label>	
						  </td>
						  <td>
						  	<s:property value="%{tipoContaRelacionamento.descricao}"/>
						  </td>
						  <td>
						  	<s:property value="%{agencia}"/>
						  </td>
						  <td>
						  	<s:property value="%{conta}"/>
						  </td>
						</tr>
					</s:iterator>
				  </table>
		  		</fieldset>
		  	</td>
		  </tr>
		  <tr>
		  	<td valign="top" valign="top">
		  	  <fieldset>
				<legend accesskey="R"><b>Dados da <u>R</u>enovação</b></legend>
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
				  <tr>
				  	<td valign="top" valign="top" colspan="2">
					  <label for="automovelSeguradoraId">Seguradora Anterior</label><br />
					  <s:property value="%{orcamentoSeguro.automovelOrcamentoCollection[0].seguradora.nome}"/>
					</td>
				  	<td valign="top" valign="top">
				  		<label for="dataFim">Data do fim da vigência da apólice</label><br />
				  		<s:property value="%{orcamentoSeguro.automovelOrcamentoCollection[0].fimVigApoliceAnterior}"/>
				  	</td>
				  </tr>
				  <tr>
				  	<td valign="top" valign="top">
					  <label for="nroApoliceAnterior">Nro da Apólice Anterior</label><br />
					  <s:property  value="%{orcamentoSeguro.automovelOrcamentoCollection[0].nroApoliceAnterior}"/>
					</td>
					<td valign="top" valign="top">
					  <label for="classeBonus">Classe Bônus</label><br />
					  <s:property value="%{orcamentoSeguro.automovelOrcamentoCollection[0].classeBonus}"/>
					</td>
					<td valign="top" valign="top">
				  	  <label for="qtdSinistro">Qtd Sinistros</label><br />
					  <s:property value="%{orcamentoSeguro.automovelOrcamentoCollection[0].qtdSinistro}"/>
				  	</td>
				  </tr>
				  <tr>
					<td valign="top" valign="top">
					   <label for="ci">C.I.</label><br />
					   <s:property value="%{orcamentoSeguro.automovelOrcamentoCollection[0].codigoIdentificacaoAnterior}"/>
					</td>
				  	<td valign="top" valign="top">
				  	  <label for="apoliceCancel">Apólice Cancelada?</label><br />
					  <s:property value="%{orcamentoSeguro.automovelOrcamentoCollection[0].isApoliceCancelada == true?'SIM':'NÃO'}"/>
				  	</td>
				  	<td valign="top" valign="top">
				  	  <label for="motivo">Motivo</label><br />
					  <s:property value="%{orcamentoSeguro.automovelOrcamentoCollection[0].motivo}"/>
				  	</td>
				  </tr>
				  <tr>
				  	<td valign="top" valign="top" colspan="3">
				  		<label for="obs">Observações</label><br />
				  		<s:textarea value="%{orcamentoSeguro.automovelOrcamentoCollection[0].observacao}" disabled="true" cssClass="readOnly" style="width:90%;" rows="3"></s:textarea>
				  	</td>
				  </tr>
				</table>
				</fieldset>
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
									<s:property value="%{orcamentoSeguro.automovelOrcamentoCollection[0].isZeroKm == TRUE?'SIM':'NÃO'}"/>
								</td>
								<td valign="top" valign="top">
									<label for="anoModelo">Nro NF.</label><br />
									<s:property value="%{orcamentoSeguro.automovelOrcamentoCollection[0].nroNf}"/>
							 	</td>
								<td valign="top" valign="top">
									<label for="tipoCombustivel">Combustível</label><br />
									<s:property value="%{orcamentoSeguro.automovelOrcamentoCollection[0].tipoCombustivel.valor}"/>
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
							 	<td valign="top" valign="top" style="padding-right: 3px;">
							 		<label for="anoFabricacao">Renavan.</label><br />
								   	<s:property value="%{orcamentoSeguro.automovelOrcamentoCollection[0].renavan}"/>
							 	</td>
							 	<td valign="top" valign="top" style="padding-right: 3px;">
							 		<label for="anoFabricacao">Placa.</label><br />
								   	<s:property value="%{orcamentoSeguro.automovelOrcamentoCollection[0].nroPlaca}"/>
							 	</td>
							 	<td valign="top" valign="top" style="padding-right: 3px;">
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
							 <tr>
						 		<td valign="top" valign="top" colspan="7">
						 			<fieldset>
									 	<legend><b>Dispositivo de Segurança</b></legend>
									 	<table width="100%">
									 		<s:iterator value="orcamentoSeguro.automovelOrcamentoCollection[0].automovelOrcAcessoriosCollection" status="j">
									 			<s:if test="%{#j.index == 0}">
									 				<tr>
									 			</s:if>
									 			<s:if test="%{#j.index != 0 && #j.index % 4 == 0}">
									 				</tr>
									 				<tr>
									 			</s:if>
									 				<s:if test="%{acessorio.tipoAcessorio.valor == 'SEGURANCA' && acessorio.descricao != null}">
										 				<td valign="top" valign="top">
															<s:property value="%{acessorio.descricao}"/>
										 				</td>
									 				</s:if>
									 		</s:iterator>
									 	</table>
								 	</fieldset>
								</td>
							</tr>
							<tr>
						 		<td valign="top" valign="top" colspan="7">
						 			<fieldset>
									 	<legend for="seguranca"><b>Opcionais</b></legend>
									 	<table width="100%">
									 		<s:iterator value="orcamentoSeguro.automovelOrcamentoCollection[0].automovelOrcAcessoriosCollection" status="i">
									 			<s:if test="%{#i.index == 0}">
									 				<tr>
									 			</s:if>
									 			<s:if test="%{#i.index != 0 && #i.index % 4 == 0}">
									 				</tr>
									 				<tr>
									 			</s:if>
									 				<s:if test="%{acessorio.tipoAcessorio.valor == 'OPCIONAIS' && acessorio.descricao != null}">
										 				<td valign="top" valign="top">
															<s:property value="%{acessorio.descricao}"/>
										 				</td>
									 				</s:if> 
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
			  	<td valign="top" valign="top">
			  		<fieldset>
						<legend accesskey="P"><b>Dados do Proprietário/Arrendatário</b></legend>
						<table width="100%" border="0" cellpadding="0" cellspacing="0" id="contudor_principal">
							<tr>
								<td valign="top" valign="top">
									<label>Tipo Pessoa</label><br />
									<s:property value="%{orcamentoSeguro.automovelOrcamentoCollection[0].proprietarioArrendatarioCollection[0].tipoPessoa}"/>
								</td>
							</tr>
							<tr>
								<td valign="top" valign="top" width="25%">
									<label id="cpf_cnpj" for="condutorCPF">CPF</label><br />
									<s:property value="%{orcamentoSeguro.automovelOrcamentoCollection[0].proprietarioArrendatarioCollection[0].cpfOuCnpj}"/>
							  	</td>
								<td valign="top" valign="top" width="50%">
									<label for="condutorNome">Nome</label><br />
									<s:property value="%{orcamentoSeguro.automovelOrcamentoCollection[0].proprietarioArrendatarioCollection[0].nome}"/>
							  	</td>
							  	<td valign="top" valign="top" width="25%">
									<label for="condutorTelefones">Telefone</label><br />
									<s:property value="%{orcamentoSeguro.automovelOrcamentoCollection[0].proprietarioArrendatarioCollection[0].telefone}"/>
							  	</td>
							</tr>
							<tr id="trPessoaFisica">
								<td valign="top" valign="top" >
									<label for="condutorDataNascimento">Dt. Nascimento</label><br />
									<s:property value="%{orcamentoSeguro.automovelOrcamentoCollection[0].proprietarioArrendatarioCollection[0].dataNascimento}"/>
								</td>
							  	<td valign="top" valign="top">
									<label for="condutorData1aHabilitacao">Tempo Habilitação</label><br />
									<s:property value="%{orcamentoSeguro.automovelOrcamentoCollection[0].proprietarioArrendatarioCollection[0].tempoHabilitacao == 2?'ATÉ 2 ANOS':'MAIS DE 2 ANOS'"/>
							  	</td>
							</tr>
						</table>
					</fieldset>
			  	</td>
		  	</tr>
			<tr>
			  	<td valign="top" valign="top">
			  		<fieldset>
						<legend accesskey="P"><b>Instituição Financeira</b></legend>
						<table width="100%" border="0" cellpadding="0" cellspacing="0" id="instituicaoFinanceira">
							<tr>
								<td valign="top" valign="top">
									<label for="condutorNome">Nome</label><br />
									<s:property value="%{orcamentoSeguro.automovelOrcamentoCollection[0].nomeBanco"/>
							  	</td>
							  	<td valign="top" valign="top">
									<label for="condutorCPF">CNPJ</label><br />
									<s:property value="%{orcamentoSeguro.automovelOrcamentoCollection[0].cnpjBanco"/>
							  	</td>
							</tr>
						</table>
					</fieldset>
			  	</td>
		  	</tr>
		</table>
		<table width="100%" border="0" cellpadding="2" cellspacing="0">
			<tr>
			  	<td valign="top">
					<fieldset>
						<legend><b>Coberturas</b></legend>
						<table width="100%" id="tableCoberturas">
							<tr>
								<td valign="top">
									<label>TIPO DE COBERTURA</label>
								</td>
								<td valign="top" colspan="2">
									<s:property value="%{orcamentoSeguro.tipoCobertura.descricao}"/>
								</td>
							</tr>
							<tr>
								<td valign="top" width="23%" valign="bottom">
									<label>COBERTURA CASCO:</label>
								</td>
								<td valign="top" width="12%" valign="bottom">
									<s:property value="%{orcamentoSeguro.automovelOrcamentoCollection[0].tipoIndenizacao.valor}"/>
								</td>
								<td valign="top" width="12%">
									<label>Percentual/LMI</label><br />
									<s:property value="%{orcamentoSeguro.automovelOrcamentoCollection[0].valorCasco}"/>
								</td>
								<td valign="top">
									<label>Observações</label><br />
									<s:property value="%{orcamentoSeguro.automovelOrcamentoCollection[0].observacao}"/>
								</td>
								<td></td>
								<td></td>
								<td valign="top"><label>Percentual/LMI</label></td>
								<td valign="top">
									<label>Observações</label><br />
								</td>
							</tr>
							<s:iterator value="orcamentoSeguro.orcamentoCoberturaIsegCollection" var="orcamentoCoberturaIseg" status="j">
								<s:if test="%{#j.index == 0}">
					 				<tr>
					 			</s:if>
					 			<s:if test="%{#j.index != 0 && #j.index % 2 == 0}">
					 				</tr>
					 				<tr>
					 			</s:if>
									<td valign="top">
										<label><s:property value="#orcamentoCoberturaIseg.descricao"/>:</label>
									</td>
									<td valign="top"></td>
									<td valign="top">
										<s:property value="%{lmi}"/>
									</td>
									<td valign="top">
										<s:property value="%{textoFranquia}"/>
									</td>
						  	</s:iterator>
						</table>
					</fieldset>
					<fieldset>
						<legend><b>Serviços</b></legend>
						<table width="100%" id="tableServicos">
							<tr>
								<td valign="top" width="23%">
								</td>
								<td valign="top" width="12%">
								</td>
							</tr>
							<s:iterator value="orcamentoSeguro.orcamentoServicosIsegCollection" var="orcamentoServicosIseg" status="j">
								<s:if test="%{#j.index == 0}">
					 				<tr>
					 			</s:if>
					 			<s:if test="%{#j.index != 0 && #j.index % 2 == 0}">
					 				</tr>
					 				<tr>
					 			</s:if>
					 			<td width="50%">
						 			<table width="100%">
						 				<tr>
											<td valign="top" width="70%">
												<label><s:property value="#orcamentoServicosIseg.descricao"/>:</label>
											</td>
											<td valign="top">
												<s:property value="%{informaFranquia == true?'SIM':'NÃO'}"/>
											</td>
										</tr>
										<s:if test="%{textoDescricao != null}">
											<tr>
												<td valign="top" colspan="2" style="padding-left:10px;">
													<s:property value="%{textoDescricao}"/>
												</td>
											</tr>
										</s:if>
									</table>
								</td>
						  	</s:iterator>
						</table>
					</fieldset>	  		
		  		</td>
		  	</tr>
		</table>
		<table width="100%" border="0" cellpadding="0" cellspacing="0" style="page-break-before: always">
		  <tr>
			<td valign="top">
			  <fieldset>
				  <legend accesskey="C"><b>Localização</b></legend>
				  <table width="100%" border="0" cellpadding="0" cellspacing="3">
				  	<tr>
				  	  <td valign="top">
				  	  	<label for="tpResidenciaId">Tipo Residencia</label><br />
						<s:property value="%{orcamentoSeguro.perfilOrcamentoCollection[0].tipoResidencia.valor}"/>
				  	  </td>
				  	  <td valign="top">
				  	  	<label for="cep">CEP da Residencia</label><br />
						<s:property value="%{orcamentoSeguro.perfilOrcamentoCollection[0].cepResidencia}"/>
				  	  </td>
			  		  <td valign="top">
			  			<label for="cepPernoite">Cep de Pernoite:</label><br />
			  			<s:property value="%{orcamentoSeguro.perfilOrcamentoCollection[0].cepPernoite}"/>
			  		  </td>
			  		  <td valign="top">
			  			<label for="cepTrabalho">Cep do Trabalho:</label><br />
			  			<s:property value="%{orcamentoSeguro.perfilOrcamentoCollection[0].cepTrabalho}"/>
			  		  </td>
				  	</tr>
				  	<tr>
				  		 <td valign="top">
					  	  	<label for="qtdCarro">Quantos veículos existem na residência?</label><br />
							<s:property value="%{orcamentoSeguro.perfilOrcamentoCollection[0].qtdOutrosVeiculos}"/>
				  	  	</td>
				  	  	<td valign="top">
	  						<label>Garagem</label><br />
	  						<s:property value="%{orcamentoSeguro.perfilOrcamentoCollection[0].tipoGaragem.valor}"/>
		  				</td>
				  	</tr>
				  </table>
			  </fieldset>
			</td>
		  </tr>
		  <tr>
			<td valign="top">
			  <fieldset>
				  <legend accesskey="C"><b>Como usa o carro?</b></legend>
				  <table width="100%" border="0" cellpadding="0" cellspacing="3">
				  	<tr>
				  	  <td valign="top">
				  	  	<label for="utlCarro">Você utiliza o veículo para:</label><br />
						<s:property value="%{orcamentoSeguro.perfilOrcamentoCollection[0].utilizacaoVeiculo.valor}"/>
				  	  </td>
				  	  <td valign="top">
				  	  	<label for="km">Qual a quilometragem média rodada pelo veículo mensalmente?</label><br />
						<s:property value="%{orcamentoSeguro.perfilOrcamentoCollection[0].quilometragem}"/>&nbsp;<label>Km</label>
				  	  </td>
				  	</tr>
				  </table>
			  </fieldset>
			</td>
		  </tr>
		  <tr>
			<td valign="top">
			  <fieldset>
				  <legend accesskey="C"><b>Questionário</b></legend>
				  <table width="100%" border="0" cellpadding="0" cellspacing="0">
					  <s:iterator value="respostaPerfilList" var="respostaPerfil" status="i">
					  	<tr>
					  	  <td valign="top" width="39%">
					  	  	<label for="pergunta%{#i.index}"><s:property value="%{perguntasPerfil.pergunta}"/></label>
					  	  </td>
				  	  	  <td valign="top" width="19%">
							<s:property value="%{resposta}"/>
				  	  	  </td>
					  	</tr>
					  </s:iterator>
				  </table>
			  </fieldset>
			</td>
		  </tr>
		</table>
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
		  <tr>
			<td valign="top">
				<fieldset>
					<legend accesskey="C"><b>Condutores</b></legend>
					<table class="listItens" width="100%" border="0" cellpadding="0" cellspacing="0">
					  <tr class="listItensHeader">
						<td width="32%" nowrap="nowrap">Nome</td>
						<td width="8%" nowrap="nowrap">Principal?</td>
						<td width="10%" nowrap="nowrap">Dt Nasc.</td>
						<td width="10%" nowrap="nowrap">Sexo</td>
						<td width="10%" nowrap="nowrap">Est. Civil</td> 
						<td width="10%" nowrap="nowrap">CNH</td>
						<td width="10%" nowrap="nowrap">Dt. 1a Habil.</td> 
						<td width="10%" nowrap="nowrap">CPF</td>  
					  </tr>
					  <s:iterator value="orcamentoSeguro.condutoresCollection" status="stat">
						<tr>
						  <td nowrap="nowrap"><s:property value="nome"/>&nbsp;</td>
						  <td nowrap="nowrap"><s:property value="isCondutorPrincipal==true?'SIM':'NÃO'"/>&nbsp;</td>
						  <td nowrap="nowrap"><s:property value="dataNascimento"/>&nbsp;</td>
						  <td nowrap="nowrap"><s:property value="sexo"/>&nbsp;</td>
						  <td nowrap="nowrap"><s:property value="estadoCivil"/>&nbsp;</td>
						  <td nowrap="nowrap"><s:property value="cnh"/>&nbsp;</td>
				          <td nowrap="nowrap"><s:property value="data1aHabilitacao"/>&nbsp;</td>
						  <td nowrap="nowrap"><s:property value="cpf"/>&nbsp;</td>
						</tr>
					  </s:iterator>
					</table>
				</fieldset>
			</td>
		  </tr>
	    </table>
	  </td>
	</tr>
</table>
<% } catch (Exception e) {e.printStackTrace();}%>