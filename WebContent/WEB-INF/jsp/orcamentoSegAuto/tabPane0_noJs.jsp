<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8"%>
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
	<div id="divForm1" style="overflow:auto; height:99%; width:100%">
	  <s:textfield theme="simple" id="orcamentoSeguroId" name="orcamentoSeguro.id" cssStyle="display:none;"/>
	  <s:textfield theme="simple" id="orcamentoSeguroPropostaId" name="orcamentoSeguro.proposta.id" cssStyle="display:none;"/>
 	  <s:textfield theme="simple" id="automovelOrcamentoId" name="orcamentoSeguro.automovelOrcamentoCollection[0].id" cssStyle="display:none;"/>
 	  <s:textfield theme="simple" id="perfilOrcamentoId" name="orcamentoSeguro.perfilOrcamentoCollection[0].id" cssStyle="display:none;"/>
	  <s:textfield theme="simple" id="tipoCliente" name="tipoCliente" cssStyle="display:none"/>
	  <s:textfield theme="simple" name="orcamentoSeguro.tipoPessoa" value="%{tipoCliente}" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="blnPossuiPerfil" name="pessoaFisica.blnPossuiPerfil" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="tipoLancamento" name="pessoaFisica.tipoLancamento" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="situacaoOperacional" name="pessoaFisica.situacaoOperacional" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="tipoProposta" name="orcamentoSeguro.tipoProposta" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="pessoaFisicaNumero" name="pessoaFisica.numero" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="operacao" name="operacao" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="blnReloaded" name="blnReloaded" value="true" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="ramoId" name="orcamentoSeguro.ramo.id" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="orcamentoSeguroNumero" name="orcamentoSeguro.numero" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="propostaId" name="proposta.id" cssStyle="display:none"/>
	  
	  <table>
	    <tr>
		  <td colspan="4">
		    <div class="divMessages" id="divMessagesTab0" style="padding-bottom: 10px;">
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
					<s:textfield theme="simple" cssClass="readonly" readonly="true" id="dataOrcamento" name="orcamentoSeguro.dataOrcamento" onblur="isValidDate(this)" size="13" onchange="setAlterado(true);" />
				  </td>
				  <td width="20%">
				    <label for="situacaoOperacionalId">Situação</label><br/>
				    <s:textfield style="display:none" name="orcamentoSeguro.situacao.id" id="statusOrcamento"/>
				    <s:select theme="simple" cssClass="Combo readonly" id="statusOrcamentoId" disabled="true" emptyOption="false" listKey="id" listValue="descricao" value="%{orcamentoSeguro.situacao.id}"  list="statusOrcamentoList" name="statusOrcamento[]"/>
				  </td>
				  <td width="20%">
					<label for="ramoNome">Ramo</label><br />
					<s:textfield theme="simple" size="30" id="ramoNome" name="orcamentoSeguro.ramo.nome" cssClass="readonly" disabled="true" readonly="true" tabindex="-1" />	
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
	</table>
	<table width="100%" border="0" cellpadding="2" cellspacing="0">
	  <tr>
		<td>
			<fieldset>
			  <legend accesskey="C"></legend>
			  	<table width="100%" border="0" cellpadding="2" cellspacing="0">
			  		<tr>
			  			<td>
			  				<label>Grupo de Venda</label><br />
			  				<s:select theme="simple" cssClass="" id="grupoDeVendaOrc" cssStyle="width:165px" headerKey="" headerValue="-- Selecione --" list="grupoDeVendaList" listKey="id" listValue="nomeDoGrupo" name="orcamentoSeguro.grupoDeVenda.id" onchange="listaCorretorPorGrupoDeVenda(this.value);"/>
			  			</td>
			  			<td>
			  				<label>Corretor</label><br />
			  				<div id="comboCorretorPorGrupoDeVenda">
			  					<s:select theme="simple" cssClass="" cssStyle="width:165px" headerKey="" headerValue="-- Selecione --" list="corretorList" listKey="id" listValue="nome" name="orcamentoSeguro.produtor.id"/>
			  				</div>
			  			</td>
			  			<td>
			  				<label>Data de Validade</label><br />
			  				<s:textfield theme="simple" cssClass="clData" size="25%" name="orcamentoSeguro.dataValidade"/>
			  			</td>
			  			<td>
			  				<label>Data Agendamento</label><br />
			  				<s:textfield theme="simple" cssClass="clData" size="25%" name="orcamentoSeguro.dataAgendamento"/>
			  			</td>
			  		</tr>
			  		<tr>
			  			<td colspan="4">
			  				<label>Observações</label><br />
			  				<s:textarea rows="3" style="width: 97%;" name="orcamentoSeguro.observacao"/>
			  			</td>
			  		</tr>
			  	</table>
			 </fieldset>
		</td>
	  </tr>
	</table>
	<table width="100%" border="0" cellpadding="2" cellspacing="0">
	  <tr>
		<td>
		  <div id="divDadosCliente">
			  <fieldset>
			  <legend accesskey="C"><b>Dados básicos do <u>S</u>egurado</b></legend>
			  <s:if test="tipoCliente == 0">
			  <table id="tableDadosCliente" width="100%" border="0" cellpadding="2" cellspacing="0"> 
			  	<tr>
				  <td>
					 <s:textfield theme="simple" id="currentTabId" name="currentTab" cssStyle="display:none;" />
					 <s:textfield theme="simple" id="clienteId" name="orcamentoSeguro.cliente.id" cssStyle="display:none;" />
					 <s:textfield theme="simple" id="pessoaFisicaId" name="pessoaFisica.id" cssStyle="display:none;" />
				  </td>
				</tr>
				<tr>
				  <td width="25%">
					<label for="clienteCpf"><a href="#" class="LabelLink" onclick="editarCliente();" tabindex="-1" title="Alterar dados Cadastrais do Segurado.">CPF</a></label><br />
					<s:textfield theme="simple" cssClass="requiredField" title="autocomplete" id="clienteCpf" name="pessoaFisica.cpfOuCnpj" size="18" maxlength="14" onblur="checarCpfCliente(this);" onchange="cpfClienteAlterado=true;setAlterado(true);$('#clienteId').val('');" tabindex="1"/>
				  </td>
				  <td colspan="4" width="50%">
					<label for="clientePFNome">Nome do Segurado</label><br />
					<s:textfield theme="simple" cssClass="requiredField clTextoRestrito alfanumerico" id="clientePFNome" name="pessoaFisica.nome" size="50" maxlength="60" onchange="setAlterado(true);" tabindex="2"/>
				  </td>
				  <td width="25%"></td>
				</tr>
				<tr>
				  <td>
					<label for="dataNascimento">Dt. Nascimento</label><br />
					<s:textfield theme="simple" cssClass="clData " id="dataNascimento" name="pessoaFisica.dataNascimento" onblur="isValidDate(this);validaData1aHabilitacao('#dataNascimento', '#data1aHabilitacao');" size="18" maxlength="10" onchange="setAlterado(true);" tabindex="3"/>
				  </td>
				  <td>
					<label for="sexo">Sexo</label><br />
					<s:select theme="simple" id="sexo" headerKey="" headerValue="-- Selecione --" name="pessoaFisica.sexo" list="{'MASCULINO','FEMININO'}" onchange="setAlterado(true);" tabindex="4" />
				  </td>
				  <td>
					<label for="pfEstadoCivil">Estado Civil</label><br />
					<s:select theme="simple" id="pfEstadoCivil" headerKey="" headerValue="-- Selecione --" name="pessoaFisica.estadoCivil" list="{'CASADO','DIVORCIADO','SOLTEIRO','UNIÃO ESTÁVEL','VIÚVO'}" tabindex="5"/>
				  </td>
				</tr>
				<tr>
				  <td>
					<label for="cnh">CNH</label><br />
					<s:textfield theme="simple" id="cnh" cssClass="alfanumerico" name="pessoaFisica.cnh" size="18" maxlength="15" onchange="setAlterado(true);" tabindex="6"/>
				  </td>
				  <td>
					<label for="data1aHabilitacao">Dt 1a. Habilitação</label><br />
					<s:textfield theme="simple" cssClass="clData" id="data1aHabilitacao" name="pessoaFisica.data1aHabilitacao" onblur="isValidDate(this);validaData1aHabilitacao('#dataNascimento', '#data1aHabilitacao');" size="16" maxlength="10" onchange="setAlterado(true);" tabindex="7"/>
				  </td>
				  <td colspan="2">
					<label for="email">E-mail</label><br />
					<s:textfield theme="simple" id="email" name="pessoaFisica.email" size="52" maxlength="80" onchange="setAlterado(true);" tabindex="8"/>
				  </td>
				</tr>
				<tr>
				  <td>
					<label for="telefonePreferencial">Telef. Preferencial</label><br />
					<s:textfield theme="simple" cssClass="clFone" id="telefonePreferencial" name="pessoaFisica.telefonePreferencial" size="18" maxlength="16" onchange="setAlterado(true);" tabindex="9"/>
				  </td>
				  <td>
					<label for="telefoneAlternativo">Telefone Alternativo</label><br />
					<s:textfield theme="simple" id="telefoneAlternativo" cssClass="clFone" name="pessoaFisica.telefoneAlternativo" size="16" maxlength="16" onchange="setAlterado(true);" tabindex="10"/>
				  </td>
				  <td colspan="2">
				    <label for="pfReferencia">Referência pessoal</label><br />
					<s:textfield theme="simple" id="pfReferencia" name="pessoaFisica.referenciaPessoal" cssClass="clTextoRestrito alfanumerico" size="45" maxlength="50" onchange="setAlterado(true);" tabindex="11"/>
				  </td>
				</tr>
				<tr>
					<td valign="bottom">
						<label for="telefoneCelular">Telefone Celular</label><br />
						<s:textfield theme="simple" id="telefoneCelular" cssClass="clFone" name="pessoaFisica.telefoneCelular" size="18" maxlength="18" onchange="setAlterado(true);" tabindex="12"/>
					</td>
					<td valign="bottom">
						<label for="condutorProfissao">Profissão</label><br />
						<s:textfield id="profissaoId" name="pessoaFisica.profissao.id" style="display:none"/>
						<s:textfield theme="simple" id="profissaoNome" cssClass="clTextoRestrito ac_input alfanumerico" style="background-color: #FFF;" title="autocomplete" name="pessoaFisica.profissao.descricao" size="30" maxlength="30" tabindex="13" onchange="setAlterado(true);" onkeydown="clearProfissao(event);"/>
					</td>
					<td valign="bottom">
						<label for="condutorProfissao">Outra Profissão</label><input type="checkbox" id="checkProfissao" onclick="ativarOutraProfissao(this)"><br />
						<s:textfield theme="simple" id="outraProfissaoNome" cssClass="clTextoRestrito readonly" disabled="true" style="background-color: #FFF;" title="autocomplete" name="pessoaFisica.profissaoNome" size="30" maxlength="30" tabindex="14"/>
					</td>
					<td valign="bottom">
<!--					<label for="pfGrupoDeVendaId">Grupo de Venda</label><br />-->
<!--						<s:select theme="simple" cssClass="" cssStyle="width:165px" id="pfGrupoDeVendaId" headerKey="" headerValue="-- Selecione --" name="pessoaFisica.grupoDeVenda.id" list="grupoDeVendaList" listKey="id" listValue="nomeDoGrupo" onchange="setAlterado(true);" tabindex="15"/>-->
				  	</td>
					<s:if test="pessoaFisica.id == null">
						<td>&nbsp;</td>
						<td valign="bottom" align="right">
						    <a href="#" class="button" onclick="apagarDadosCliente();" tabindex="-1" style="float: right; width: 100px">
								<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton">
									<tr>
										<td class="wButton_left"></td>
										<td class="wButton_text wButton_width">Apagar Dados</td>
										<td class="wButton_right"/>
								  	</tr>
								</table>
						    </a>
					  	</td>
					</s:if>
				</tr>
			  </table>
			  </s:if>
			  <s:if test="tipoCliente == 1">
			  	<table width="100%" border="0" cellpadding="2" cellspacing="0">
				  <tr>
					<td>
					  <s:textfield theme="simple" id="currentTabId" name="currentTab" cssStyle="display:none;" />
					  <s:textfield theme="simple" id="clienteId" name="orcamentoSeguro.cliente.id" cssStyle="display:none;" />
					  <s:textfield theme="simple" id="pessoaJuridicaId" name="pessoaJuridica.id" cssStyle="display:none;" />
					</td>
				  </tr>
				  <tr>
					<td>
					  <table id="tableDadosCliente" width="100%" border="0" cellpadding="2" cellspacing="0"> 
						<tr>
						  <td width="20%">
							<label for="clienteCnpj">CNPJ</label><br />
							<s:textfield theme="simple" cssClass="requiredField" title="autocomplete" id="clienteCnpj" name="pessoaJuridica.cpfOuCnpj" size="23" maxlength="21" onblur="checarCnpjCliente(this);" onchange="cnpjClienteAlterado=true;setAlterado(true);" onkeypress="cnpjClienteAlterado=true;setAlterado(true);" tabindex="1"/>
						  </td>
						  <td colspan="2">
							<label for="clientePJNome">Nome do Segurado</label><br />
							<s:textfield theme="simple" cssClass="requiredField clTextoRestrito alfanumerico" id="clientePJNome" name="pessoaJuridica.nome" size="50" maxlength="60" onchange="setAlterado(true);" tabindex="2"/>
						  </td>
						  <s:if test="pessoaFisica.id == null">
						  <td align="right" colspan="3">
						    <a href="#" class="button" onclick="apagarDadosCliente();" tabindex="-1">
							<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton">
							  <tr>
								<td class="wButton_left"></td>
								<td class="wButton_text wButton_width">Apagar Dados</td>
								<td class="wButton_right"/>
							  </tr>
							</table>
						    </a>
						  </td>
						  </s:if>
						</tr>
						<tr>
						  <td width="20%">
							<label for="pjGrupoDeVendaId">Grupo de Venda</label><br />
							<s:select theme="simple" cssClass="requiredField" cssStyle="width:165px" id="pjGrupoDeVendaId" headerKey="" headerValue="-- Selecione --" name="pessoaJuridica.grupoDeVenda.id" list="grupoDeVendaList" listKey="id" listValue="nomeDoGrupo" onchange="setAlterado(true);" tabindex="3"/>
						  </td>
						  <td colspan="2">
							<label for="email">E-mail</label><br />
							<s:textfield theme="simple" id="email" name="pessoaFisica.email" size="45" maxlength="80" onchange="setAlterado(true);" tabindex="4"/>
						  </td>
						</tr>
						<tr>
						  <td>
							<label for="telefonePreferencial">Telef. Preferencial</label><br />
							<s:textfield theme="simple" cssClass="requiredField clFone" id="telefonePreferencial" name="pessoaJuridica.telefonePreferencial" size="16" maxlength="16" onchange="setAlterado(true);" tabindex="5"/>
						  </td>
						  <td>
							<label for="telefoneAlternativo">Telefone Alternativo</label><br />
							<s:textfield theme="simple" id="telefoneAlternativo" cssClass="clFone" name="pessoaJuridica.telefoneAlternativo" size="16" maxlength="16" onchange="setAlterado(true);" tabindex="6"/>
						  </td>
						  <td>
							<label for="telefoneCelular">Telefone Celular</label><br />
							<s:textfield theme="simple" id="telefoneCelular" cssClass="clFone" name="pessoaJuridica.telefoneCelular" size="16" maxlength="16" onchange="setAlterado(true);" tabindex="7"/>
						  </td>
						  <td colspan="2">
						    <label for="pfReferencia">Pessoal de Referência</label><br />
							<s:textfield theme="simple" id="pfReferencia" name="pessoaJuridica.referenciaPessoal" cssClass="clTextoRestrito alfanumerico" size="50" maxlength="50" onchange="setAlterado(true);" tabindex="8"/>
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
	  	<td>
	  	  <fieldset>
			<legend><b>Dados da Vigência</b></legend>
			<table width="100%" border="0" cellpadding="0" cellspacing="0" id="dadosVigencia">
			  <tr>
	  			<td class="TextBox_ContentCell" width="100px">
				  	<label class="LabelText" for="inicioVigencia">Início Vigência</label><br/>
					<s:textfield theme="simple" cssClass="TextBox_OneCells_width requiredField" id="inicioVigencia" name="orcamentoSeguro.inicioVigencia" onblur="if (isValidDate(this)){confirmaInicioVigencia(this)}" size="10" onkeyup="addYearAndSetField(this.value, 1, document.getElementById('terminoVigencia'));"/>
		  		</td>
		  		<td class="TextBox_ContentCell" width="15px">à</td>
		  		<td class="TextBox_ContentCell">
				  	<label class="LabelText" for="terminoVigencia">Término Vigência</label><br/>
				  	<s:if test="proposta.statusOperacional > 4">
						<s:textfield theme="simple" id="terminoVigencia" name="orcamentoSeguro.terminoVigencia" style="display:none"/>
						<s:textfield theme="simple" disabled="true" cssClass="TextBox_OneCells_width requiredField" id="terminoVigenciaRO" name="orcamentoSeguro.terminoVigencia" size="10"/>
				  	</s:if>
				  	<s:else>
						<s:textfield theme="simple" cssClass="TextBox_OneCells_width requiredField" id="terminoVigencia" name="orcamentoSeguro.terminoVigencia" onblur="isValidDate(this)" size="10"/>
				  	</s:else>
		  		</td>
			  </tr>
			</table>
			</fieldset>
		</td>
	  </tr>	  
	  <tr>
	  	<td>
	  	  <fieldset>
			<legend accesskey="R"><b>Dados da <u>R</u>enovação</b></legend>
			<table width="100%" border="0" cellpadding="0" cellspacing="0" id="formularioRenovacao">
			  <tr>
			  	<td colspan="2">
				  <label for="automovelSeguradoraId">Seguradora Anterior</label><br />
				  <s:select theme="simple" id="automovelSeguradoraId" headerKey="" headerValue="-- Selecione --" name="orcamentoSeguro.automovelOrcamentoCollection[0].seguradoraAnterior.id" list="dominioCiasSeguradora" listKey="id" listValue="valor" onchange="setAutomovelAlterado(true);" tabindex="20"/>
				</td>
			  	<td>
			  		<label for="dataFim">Data do fim da vigência da apólice</label><br />
			  		<s:textfield cssClass="clData " theme="simple" id="dataFim" name="orcamentoSeguro.automovelOrcamentoCollection[0].fimVigApoliceAnterior" size="15" maxlength="20" tabindex="21" />
			  	</td>
			  </tr>
			  <tr>
			  	<td>
				  <label for="nroApoliceAnterior">Nro da Apólice Anterior</label><br />
				  <s:textfield theme="simple" id="nroApoliceAnterior" name="orcamentoSeguro.automovelOrcamentoCollection[0].nroApoliceAnterior" size="15" maxlength="20" onchange="setAutomovelAlterado(true);" tabindex="22"/>
				</td>
				<td>
				  <label for="classeBonus">Classe Bônus</label><br />
				  <s:select theme="simple" cssClass="" name="orcamentoSeguro.automovelOrcamentoCollection[0].classeBonus" id="classeBonus" headerKey="" headerValue="-- Selecione --" list="{'1','2','3','4','5','6','7','8','9','10'}" style="width: 164px" tabindex="23" />
				</td>
				<td>
			  	  <label for="qtdSinistro">Qtd Sinistros</label><br />
				  <s:textfield theme="simple" id="qtdSinistro" size="5" maxlength="2" name="orcamentoSeguro.automovelOrcamentoCollection[0].qtdSinistro" tabindex="24"/>
			  	</td>
			  </tr>
			  <tr>
				<td>
				   <label for="ci">C.I.</label><br />
				   <s:textfield theme="simple" name="orcamentoSeguro.automovelOrcamentoCollection[0].codigoIdentificacaoAnterior" id="ci" size="15" maxlength="20" tabindex="25" />
				</td>
			  	<td>
			  	  <label for="apoliceCancel">Apólice Cancelada?</label><br />
				  <s:select theme="simple" name="orcamentoSeguro.automovelOrcamentoCollection[0].isApoliceCancelada" cssClass="" id="apoliceCancel" onchange="apoliceCancelada(this);" headerKey="" headerValue="-- Selecione --" list="#{false:'NAO',true:'SIM'}" style="width: 164px" tabindex="26" />
			  	</td>
			  	<td>
			  	  <label for="motivo">Motivo</label><br />
				  <s:textfield theme="simple" id="motivo" cssClass="alfanumerico" size="50" name="orcamentoSeguro.automovelOrcamentoCollection[0].motivo" tabindex="27"/>
			  	</td>
			  </tr>
			  <tr>
			  	<td colspan="3">
			  		<label for="obs">Observações</label><br />
			  		<s:textarea rows="3" style="width: 98%;" cssClass="alfanumerico" name="orcamentoSeguro.automovelOrcamentoCollection[0].observacao" tabindex="28"></s:textarea>
			  	</td>
			  </tr>
			</table>
			</fieldset>
	  	</td>
	  </tr>
	</table>
	</div>
	<div id="testOrcamento"></div>

<% } catch (Exception e) {e.printStackTrace();}%>