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

	<div id="divForm1" style="width:100%; overflow: auto;">
	  <s:textfield theme="simple" id="propostaId" name="proposta.id" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="isFatura" name="proposta.isFatura" value="false" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="tipoCliente" name="tipoCliente" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="smsEncaminhado" name="proposta.smsEncaminhado" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="blnPossuiPerfil" name="proposta.blnPossuiPerfil" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="tipoLancamento" name="proposta.tipoLancamento" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="statusOperacional" name="proposta.statusOperacional" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="situacaoOperacional" name="proposta.situacaoOperacional" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="propostaEndossadaId" name="proposta.propostaEndossada.id" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="propostaRenovadaId" name="proposta.propostaRenovada.id" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="propostaOriginalId" name="proposta.propostaOriginal.id" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="propostaInicialId" name="proposta.propostaInicial.id" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="tipoProposta" name="proposta.tipoProposta" cssStyle="display:none"/>
	  <s:if test="%{proposta.tipoProposta == 4 || proposta.tipoProposta == 6}">
	  	<s:textfield theme="simple" id="propostaVersao" name="proposta.versao" value="2" cssStyle="display:none"/>
	  </s:if>
	  <s:else>
	  	<s:textfield theme="simple" id="propostaVersao" name="proposta.versao" cssStyle="display:none"/>
	  </s:else>
	  <s:textfield theme="simple" id="propostaNumero" name="proposta.numero" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="operacao" name="operacao" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="tipoEndossoId" name="proposta.tipoEndosso.id" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="tipoEndosso" name="tipoEndosso" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="blnReloaded" name="blnReloaded" value="true" cssStyle="display:none"/>
	  <s:textfield theme="simple" id="propostaOriginalOrcamentoSeguro" name="proposta.orcamentoSeguro.id" cssStyle="display:none"/>

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
			  <td>
				<label for="dataProposta">Data</label>
				<s:textfield theme="simple" id="dataProposta" name="proposta.dataProposta" cssStyle="display:none;" />
				<s:textfield theme="simple" cssClass="requiredField" id="dataProposta" disabled="true" name="proposta.dataProposta" onblur="isValidDate(this)" size="10" onchange="setAlterado(true);" />
			  </td>
			  <td >
			    <s:if test="proposta.numero != null">
			      <b><span style="font-size:16px;color:red;">Localizador: <fmt:formatNumber value="${proposta.numero}" pattern="00000" /></span></b>
			    </s:if>
			  </td>
			  <td>
			    <label for="situacaoOperacionalId">Situação</label>
			    <s:select theme="simple" cssClass="Combo" id="situacaoOperacionalId" disabled="true" emptyOption="false" name="proposta.situacaoOperacional" list="situacaoOperacionalList" />
			  </td>
			</tr>
			<tr>
			  <td width="40%">
			    <div id="divSeguradora">
				<label for="seguradoraId">Seguradora</label><br />
				<s:textfield theme="simple" id="seguradoraId" name="proposta.seguradora.id" cssStyle="display:none;" />
				<s:textfield theme="simple" size="50" id="seguradoraNome" name="proposta.seguradora.nome" cssClass="readonly" readonly="true" tabindex="-1" />
				</div>
			  </td>
			  <td width="20%">
				<label for="ramoNome">Ramo</label><br />
				<s:textfield theme="simple" id="ramoId" name="proposta.ramo.id" cssStyle="display:none;" />
				<s:textfield theme="simple" size="30" id="ramoNome" name="proposta.ramo.nome" cssClass="readonly" readonly="true" tabindex="-1" />	
			  </td>
			  <td>
				<label id="labelCover" for="cidadeCom">Frota</label><br />
				<s:select theme="simple" cssClass="dojoValidateValid" id="isFrota" list="#{'false':'NAO','true':'SIM'}" name="proposta.isFrota" onchange="setAlterado(true);" />
			  </td>
			  <td width="20%">
			    <label for="statusOperacionalId">Fase</label><br />
			    <s:select theme="simple" cssClass="Combo" id="statusOperacionalId" disabled="true" emptyOption="false" name="proposta.statusOperacional" list="statusOperacionalList" />
			  </td>
			</tr>
			<tr>
			  <td width="40%" valign="bottom">
			  <table border="0" cellpadding="1" cellspacing="0"><tr><td><label id="labelCover">
			    <a title="Trocar Seguradora" href="#" class="button" onclick="abrirDivTrocarSeguradora();" tabindex="-1">
				<table style="width: 130px" onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton">
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">Trocar Seguradora</td>
					<td class="wButton_right"/>
				  </tr>
				</table>
			    </a></label></td></tr></table>
			  </td>
			</tr>
		  </table>
		  </fieldset>
	    </td>
	  </tr>
	  <tr>
		<td>
		  <fieldset>
		  <legend accesskey="V"><b>Dados da <u>V</u>istoria</b></legend>
		  <table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
			  <td colspan="3" nowrap="nowrap">
				<label>Vistoriadora</label>
				<div id="divVistoriadora">
				  <s:select theme="simple" id="comboVistoriadora" name="proposta.vistoriadora.id" headerKey="" headerValue="-- Selecione --" list="vistoriadorasList" listKey="id" listValue="nome" onchange="setAlterado(true);" tabindex="-1"/>		  
				  ou <s:textfield theme="simple" id="propostaNomeVistoriadora" name="proposta.nomeVistoriadora" size="40" maxlength="40" onchange="setAlterado(true);" />
				</div>
			  </td>
			</tr>
			<tr>
			  <td width="33%">
				<label for="NomeVistoriador">Atendente</label><br />
				<s:textfield theme="simple" id="NomeVistoriador" cssClass="clTextoRestrito" name="proposta.nomeVistoriador" maxlength="30" onchange="setAlterado(true);"/>
			  </td>
			  <td  width="33%" nowrap="nowrap">
				<label for="NroVistoria">Nro da Solicitação</label><br />
				<s:textfield theme="simple" id="NroVistoria" cssClass="clTextoRestrito" name="proposta.nroVistoria" maxlength="20" onchange="setAlterado(true);"/>
			  </td>
			  <td  width="33%" nowrap="nowrap">
				<label for="dataVistoria">Dt da Solicitação</label><br />
				<s:textfield theme="simple" id="dataVistoria" name="proposta.dataVistoria" onblur="isValidDate(this)" size="10" onchange="setAlterado(true);"/>
			  </td>
			</tr>
		  </table>
		  </fieldset>
		</td>
	  </tr>
	  <tr>
	  <td>
		<div id="divDadosCliente">
			<s:if test="tipoCliente == 0">
			<table width="100%" border="0" cellpadding="2" cellspacing="0">
			  <tr>
			    <td>
				  <s:textfield theme="simple" id="currentTabId" name="currentTab" cssStyle="display:none;" />
				  <s:textfield theme="simple" id="clienteId" name="proposta.cliente.id" cssStyle="display:none;" />
				  <s:textfield theme="simple" id="pessoaFisicaId" name="pessoaFisica.id" cssStyle="display:none;" />
			    </td>
			  </tr>
			  <tr>
				<td>
				  <fieldset>
				  <legend accesskey="C"><b>Dados do <u>S</u>egurado</b></legend>
				  <table id="tableDadosCliente" width="100%" border="0" cellpadding="2" cellspacing="0"> 
					<tr>
					  <td width="15%">
						<label id="labelCover" for="clienteCpf"><a href="#" class="LabelLink" onclick="editarCliente();" tabindex="-1" title="Alterar dados Cadastrais do Segurado.">CPF</a><br /></label>
						<s:textfield theme="simple" cssClass="requiredField" title="autocomplete" id="clienteCpf" name="pessoaFisica.cpfOuCnpj" size="18" maxlength="14" onblur="checarCpfCliente(this);" onchange="cpfClienteAlterado=true;setAlterado(true);"/>
						
					  </td>
					  <td colspan="2">
						<label for="clientePFNome">Nome do Segurado</label><br />
						<s:textfield theme="simple" cssClass="requiredField clTextoRestrito" id="clientePFNome" name="pessoaFisica.nome" size="50" maxlength="60" onchange="setAlterado(true);"/>
					  </td>
					  <td width="15%">
						<label for="pfGrupoDeVendaId">Grupo de Venda</label><br />
						<s:select theme="simple" cssClass="requiredField" cssStyle="width:165px" id="pfGrupoDeVendaId" headerKey="" headerValue="-- Selecione --" name="pessoaFisica.grupoDeVenda.id" list="grupoDeVendaList" listKey="id" listValue="nomeDoGrupo" onchange="setAlterado(true);"/>
					  </td>
					  <td width="15%">
						<label for="dataNascimento">Dt. Nascimento</label><br />
						<s:textfield theme="simple" cssClass="clData requiredField" id="dataNascimento" name="pessoaFisica.dataNascimento" onblur="isValidDate(this);validaData1aHabilitacao('#dataNascimento', '#data1aHabilitacao');" size="12" maxlength="10" onchange="setAlterado(true);"/>
					  </td>
					  <td width="15%">
						<label for="sexo">Sexo</label><br />
						<s:select theme="simple" id="sexo" headerKey="" headerValue="-- Selecione --" name="pessoaFisica.sexo" list="{'MASCULINO','FEMININO'}" onchange="setAlterado(true);"/>
					  </td>
					</tr>
					<tr>
					  <td width="15%">
						<label for="pfEstadoCivil">Estado Civil</label><br />
						<s:select theme="simple" id="pfEstadoCivil" headerKey="" headerValue="-- Selecione --" name="pessoaFisica.estadoCivil" list="{'CASADO','DIVORCIADO','SOLTEIRO','UNIÃO ESTÁVEL','VIÚVO'}"/>
					  </td>
					  <td width="15%">
						<label for="cnh">CNH</label><br />
						<s:textfield theme="simple" id="cnh" name="pessoaFisica.cnh" size="15" maxlength="15" onchange="setAlterado(true);"/>
					  </td>
					  <td width="20%">
						<label for="data1aHabilitacao">Dt 1a. Habilitação</label><br />
						<s:textfield theme="simple" cssClass="clData" id="data1aHabilitacao" name="pessoaFisica.data1aHabilitacao" onblur="isValidDate(this);validaData1aHabilitacao('#dataNascimento', '#data1aHabilitacao');" size="12" maxlength="10" onchange="setAlterado(true);"/>
					  </td>
					  <td width="20%">
						<label for="data1aHabilitacao">Dt Venc Habilitação</label><br />
						<s:textfield theme="simple" cssClass="clData" id="dataVencHabilitacao" name="pessoaFisica.dataVencHabilitacao" onblur="isValidDate(this);validaData1aHabilitacao('#dataNascimento', '#data1aHabilitacao');" size="12" maxlength="10" onchange="setAlterado(true);"/>
					  </td>
					  <td>
					    <label for="pfProfissao">Profissão</label><br />
					    <s:textfield style="display:none;" name="pessoaFisica.profissao.id" id="profissaoId"/>
						<s:textfield theme="simple" id="pfProfissao" name="pessoaFisica.profissao.descricao" cssClass="clTextoRestrito" maxlength="50" cssStyle="width:95%;" onchange="setAlterado(true);"/>
					  </td>
					</tr>
					<tr>
					  <td width="20%">
						<label for="rg">Identidade</label><br />
						<s:textfield theme="simple" id="rg" cssClass="clTextoRestrito" name="pessoaFisica.rg" size="15" maxlength="15" onchange="setAlterado(true);"/>
					  </td>
					  <td width="15%">
						<label for="orgaoEmissor">Emissor</label><br />
						<s:textfield theme="simple" id="orgaoEmissor" name="pessoaFisica.orgaoEmissor" size="15" maxlength="15" onchange="setAlterado(true);"/>
					  </td>
					  <td width="15%">
						<label for="dataEmissao">Dt de Expedição</label><br />
						<s:textfield theme="simple" id="dataEmissao" cssClass="clData" name="pessoaFisica.dataEmissao" onblur="isValidDate(this)" size="12" maxlength="10" onchange="setAlterado(true);"/>
					  </td>
					  <td>
						<label for="telefonePreferencial">Telef. Preferencial</label><br />
						<s:textfield theme="simple" cssClass="requiredField clFone" id="telefonePreferencial" name="pessoaFisica.telefonePreferencial" size="16" maxlength="16" onchange="setAlterado(true);"/>
					  </td>
					  <td>
						<label for="telefoneAlternativo">Telefone Alternativo</label><br />
						<s:textfield theme="simple" id="telefoneAlternativo" cssClass="clFone" name="pessoaFisica.telefoneAlternativo" size="16" maxlength="16" onchange="setAlterado(true);"/>
					  </td>
					  <td>
						<label for="telefoneCelular">Telefone Celular</label><br />
						<s:textfield theme="simple" id="telefoneCelular" cssClass="clFone" name="pessoaFisica.telefoneCelular" size="16" maxlength="16" onchange="setAlterado(true);"/>
					  </td>
					</tr>
					<tr>
					  <td colspan="2">
						<label for="email">E-mail</label><br />
						<s:textfield theme="simple" id="email" name="pessoaFisica.email" size="40" maxlength="80" onchange="setAlterado(true);"/>
					  </td>
					  <td colspan="2">
					    <label for="pfReferencia">Referência pessoal</label><br />
						<s:textfield theme="simple" id="pfReferencia" name="pessoaFisica.referenciaPessoal" cssClass="clTextoRestrito" size="40" maxlength="50" onchange="setAlterado(true);"/>
					  </td>
					  <s:if test="proposta.id == null || proposta.statusOperacional == 0">
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
				  </table>
				  </fieldset>
				</td>
			  </tr>
			  <tr>
				<td>
				  <fieldset>
				  <legend accesskey="E"><b><u>E</u>ndereço Residencial</b></legend>
				  <table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
					  <td width="10%">
						<label id="labelCover" for="cepRes"><a href="#" class="LabelLink" onclick="openWin('${pageContext.request.contextPath}/endereco/buscaCep.action','BuscaCep','1024','600','resizable=yes,scrollbars=yes');" tabindex="-1" title="Acessar o site dos Correrios!">CEP</a><br /></label>
						<s:textfield theme="simple" cssClass="requiredField" id="end0TipoEndereco" name="proposta.propostaEnderecoCollection[0].tipoEndereco" value="R" cssStyle="display:none;" />
						<s:textfield theme="simple" cssClass="requiredField" id="end0PessoaFisicaId" name="proposta.propostaEnderecoCollection[0].id" cssStyle="display:none;" />
						<s:textfield theme="simple" cssClass="clCep" id="cepRes" name="proposta.propostaEnderecoCollection[0].cep" size="11" maxlength="9" onchange="setAlterado(true);"/>
						
					  </td>
					  <td width="25%">
						<label for="lograRes">Logradouro</label><br />
						<s:textfield theme="simple" cssClass="requiredField clTextoRestrito" id="lograRes" name="proposta.propostaEnderecoCollection[0].logradouro" cssStyle="width:98%" maxlength="60" onchange="setAlterado(true);"/>
					  </td>
					  <td colspan="2">
						<label for="compRes">Complemento</label><br />
						<s:textfield theme="simple" id="compRes" cssClass="clTextoRestrito" name="proposta.propostaEnderecoCollection[0].complemento" cssStyle="width:98%" maxlength="60" onchange="setAlterado(true);"/>
					  </td>
					  <td width="15%">
						<label for="numeroRes">Número</label><br />
						<s:textfield theme="simple" id="numeroRes" name="proposta.propostaEnderecoCollection[0].numero" maxlength="6" size="8"/>
					  </td>
					  <td width="15%">
						<label for="foneRes">Fone Residencial</label><br />
						<s:textfield theme="simple" id="foneRes" cssClass="clFone" name="proposta.propostaEnderecoCollection[0].telefone" size="16" maxlength="20" onchange="setAlterado(true);"/>
					  </td>
					</tr>
					<tr>
					  <td colspan="2">
						<label for="bairroRes">Bairro</label><br />
						<s:textfield theme="simple" cssClass="requiredField clTextoRestrito" id="bairroRes" name="proposta.propostaEnderecoCollection[0].bairro" cssStyle="width:98%" maxlength="50" onchange="setAlterado(true);"/>
					  </td>
					  <td>
						<label for="cidadeRes">Cidade</label><br />
						<s:textfield theme="simple" cssClass="requiredField clTextoRestrito" id="cidadeRes" name="proposta.propostaEnderecoCollection[0].cidade" cssStyle="width:98%" maxlength="35" onchange="setAlterado(true);"/>
					  </td>
					  <td>
						<label for="ufRes">UF</label><br />
						<s:select theme="simple" cssClass="requiredField" id="ufRes" headerKey="" headerValue="-- Selecione --" name="proposta.propostaEnderecoCollection[0].uf" list="ufList" listKey="uf" listValue="nome" onchange="setAlterado(true);"/>
					  </td>
					  <td>
						<label id="labelCover" for="correspondenciaRes">Correspondência</label><br />
					    <s:select theme="simple" cssClass="Combo Combo_OneCells_width" id="correspondenciaRes" name="proposta.propostaEnderecoCollection[0].correspondencia" list="#{'SIM':'SIM','NAO':'NÃO'}" onchange="setAlterado(true);"/>
					  </td>
					  <td>
						<label for="faxRes">Fax</label><br />
						<s:textfield theme="simple" id="faxRes" cssClass="clFone" name="proposta.propostaEnderecoCollection[0].fax" size="16" maxlength="20" onchange="setAlterado(true);"/>
					  </td>
					</tr>
				  </table>
				  </fieldset>
				</td>
			  </tr>
			  <tr>
				<td>
				  <fieldset>
				  <legend accesskey="L"><b>Endereço Comercia<u>L</u></b></legend>
				  <table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
					  <td width="10%">
						<label id="labelCover" for="cepCom"><a href="#" class="LabelLink" onclick="openWin('${pageContext.request.contextPath}/endereco/buscaCep.action','BuscaCep','1024','600','resizable=yes,scrollbars=yes');" tabindex="-1" title="Acessar o site dos Correrios!">CEP</a><br /></label>
						<s:textfield theme="simple" id="end1TipoEndereco" name="proposta.propostaEnderecoCollection[1].tipoEndereco" value="C" cssStyle="display:none;" />
						<s:textfield theme="simple" id="end1PessoaFisicaId" name="proposta.propostaEnderecoCollection[1].id" cssStyle="display:none;" onchange="setAlterado(true);"/>
						<s:textfield theme="simple" cssClass="clCep" id="cepCom" name="proposta.propostaEnderecoCollection[1].cep" size="11" maxlength="9"/>
						
					  </td>
					  <td width="25%">
						<label for="lograCom">Logradouro</label><br />
						<s:textfield theme="simple" id="lograCom" cssClass="clTextoRestrito" name="proposta.propostaEnderecoCollection[1].logradouro" cssStyle="width:98%" maxlength="60" onchange="setAlterado(true);"/>
					  </td>
					  <td colspan="2">
						<label for="compCom">Complemento</label><br />
						<s:textfield theme="simple" id="compCom" cssClass="clTextoRestrito" name="proposta.propostaEnderecoCollection[1].complemento" cssStyle="width:98%" maxlength="60" onchange="setAlterado(true);"/>
					  </td>
					  <td width="15%">
						<label for="numeroCom">Número</label><br />
						<s:textfield theme="simple" id="numeroCom" name="proposta.propostaEnderecoCollection[1].numero" maxlength="6" size="8" onchange="setAlterado(true);"/>
					  </td>
					  <td width="15%">
						<label for="foneCom">Fone Comercial</label><br />
						<s:textfield theme="simple" id="foneCom" cssClass="clFone" name="proposta.propostaEnderecoCollection[1].telefone" size="16" maxlength="20" onchange="setAlterado(true);"/>
					  </td>
					</tr>
					<tr>
					  <td colspan="2">
						<label for="bairroCom">Bairro</label><br />
						<s:textfield theme="simple" id="bairroCom" cssClass="clTextoRestrito" name="proposta.propostaEnderecoCollection[1].bairro" cssStyle="width:98%" maxlength="50" onchange="setAlterado(true);"/>
					  </td>
					  <td>
						<label for="cidadeCom">Cidade</label><br />
						<s:textfield theme="simple" id="cidadeCom" cssClass="clTextoRestrito" name="proposta.propostaEnderecoCollection[1].cidade" cssStyle="width:98%" maxlength="30" onchange="setAlterado(true);"/>
					  </td>
					  <td>
						<label for="ufCom">UF</label><br />
						<s:select theme="simple" id="ufCom" headerKey="" headerValue="-- Selecione --" name="proposta.propostaEnderecoCollection[1].uf" list="ufList" listKey="uf" listValue="nome" onchange="setAlterado(true);"/>
					  </td>
					  <td>
						<label id="labelCover" for="correspondenciaCom">Correspondência</label><br />
					    <s:select theme="simple" cssClass="Combo Combo_OneCells_width" id="correspondenciaCom" name="proposta.propostaEnderecoCollection[1].correspondencia" list="#{'SIM':'SIM','NAO':'NÃO'}" onchange="setAlterado(true);"/>
					  </td>
					  <td>
						<label for="faxCom">Fax</label><br />
						<s:textfield theme="simple" id="faxCom" cssClass="clFone" name="proposta.propostaEnderecoCollection[1].fax" size="16" maxlength="20" onchange="setAlterado(true);" />
						<input id="lastfield1" name="lastfield1" onkeyup="nextTab(event);" class="invisible" />
					  </td>
					</tr>
					<tr>
					  <td align="left" colspan="2">
						<table border="0" cellpadding="0" cellspacing="0"><tr><td><label id="labelCover">
						    <a href="#" class="button" onclick="copiarEnderecoResidencialParaEnderecoComercial();" tabindex="-1">
							<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton">
							  <tr>
								<td class="wButton_left"></td>
								<td class="wButton_text wButton_width">Copiar Dados End. Residencial</td>
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
			</s:if>
			<s:if test="tipoCliente == 1">
			<table width="100%" border="0" cellpadding="2" cellspacing="0">
			  <tr>
				<td>
				  <s:textfield theme="simple" id="currentTabId" name="currentTab" cssStyle="display:none;" />
				  <s:textfield theme="simple" id="clienteId" name="proposta.cliente.id" cssStyle="display:none;" />
				  <s:textfield theme="simple" id="pessoaJuridicaId" name="pessoaJuridica.id" cssStyle="display:none;" />
				</td>
			  </tr>
			  <tr>
				<td>
				  <fieldset>
				  <legend accesskey="C"><b>Dados do <u>S</u>egurado</b></legend>
				  <table id="tableDadosCliente" width="100%" border="0" cellpadding="2" cellspacing="0">
					<tr>
					  <td >
					    <label for="clienteCnpj"><a href="#" class="LabelLink" onclick="editarCliente();" tabindex="-1" title="Alterar dados Cadastrais do Segurado.">CNPJ</a></label><br />
						<s:textfield theme="simple" cssClass="requiredField" id="clienteCnpj" name="pessoaJuridica.cpfOuCnpj" size="23" maxlength="21" onblur="checarCnpjCliente(this);" onchange="cnpjClienteAlterado=true;setAlterado(true);" onkeypress="cnpjClienteAlterado=true;setAlterado(true);"/>
					  </td>
					  <td colspan="2">
						<label for="clienteNome">Nome do Segurado</label><br />
						<s:textfield theme="simple" cssClass="requiredField clTextoRestrito" id="clientePJNome" name="pessoaJuridica.nome" size="50" maxlength="60" onchange="setAlterado(true);"/>
					  </td>
					  <td colspan="2">
						<label for="pjGrupoDeVendaId">Grupo de Venda</label><br />
						<s:select theme="simple" cssClass="requiredField" id="pjGrupoDeVendaId" headerKey="" headerValue="-- Selecione --" name="pessoaJuridica.grupoDeVenda.id" list="grupoDeVendaList" listKey="id" listValue="nomeDoGrupo" onchange="setAlterado(true);"/>
					  </td>
					  <td >
						<label for="inscricaoEstadual">Inscrição Estadual</label><br />
						<s:textfield theme="simple" style="width:100%;" id="inscricaoEstadual" name="pessoaJuridica.inscrEstadual" maxlength="14" onchange="setAlterado(true);"/>
					  </td>
					</tr>
					<tr>
					  <td >
						<label for="dataFundacao">Data Fundação</label><br />
						<s:textfield theme="simple" id="dataFundacao" name="pessoaJuridica.dataFundacao" onblur="isValidDate(this)" size="12" maxlength="10" onchange="setAlterado(true);"/>
					  </td>
					  <td >
						<label for="valorPatrimonio">Valor Patrimônio</label><br />
						<s:textfield theme="simple" cssClass="clValor2" id="valorPatrimonio" name="pessoaJuridica.valorPatrimonio" size="16" onchange="setAlterado(true);"/>
					  </td>
					  <td >
						<label for="telefonePreferencial">Telef. Preferencial</label><br />
						<s:textfield theme="simple" cssClass="requiredField clFone" id="telefonePreferencial" name="pessoaJuridica.telefonePreferencial" size="16" maxlength="16" onchange="setAlterado(true);"/>
					  </td>
					  <td >
						<label for="telefoneAlternativo">Telefone Alternativo</label><br />
						<s:textfield theme="simple" id="telefoneAlternativo" cssClass="clFone" name="pessoaJuridica.telefoneAlternativo" size="16" maxlength="16" onchange="setAlterado(true);"/>
					  </td>
					  <td >
						<label for="telefoneCelular">Telefone Celular</label><br />
						<s:textfield theme="simple" id="telefoneCelular" cssClass="clFone" name="pessoaJuridica.telefoneCelular" size="16" maxlength="16" onchange="setAlterado(true);"/>
					  </td>
					  <td>
						<label for="atividadeComercial">Atividade Comercial</label><br />
						<s:select theme="simple" style="width:100%;" id="atividadeComercial" headerKey="" headerValue="-- Selecione --" name="pessoaJuridica.atividadeComercial.id" list="atividadeComercialList" listKey="id" listValue="valor" onchange="setAlterado(true);"/>
					  </td>
					</tr>
					<tr>
					  <td colspan="2">
						<label for="email">E-mail</label><br />
						<s:textfield theme="simple" id="email" name="pessoaJuridica.email" size="40" maxlength="80" onchange="setAlterado(true);"/>
					  </td>
					  <td colspan="2">
						<label for="homePage">Site</label><br />
						<s:textfield theme="simple" id="homePage" name="pessoaJuridica.siteHomePage" size="40" maxlength="100" onchange="setAlterado(true);"/>
					  </td>
					  <td colspan="2">
					    <label for="pfReferencia">Pessoa de referência</label><br />
						<s:textfield theme="simple" style="width:100%;" id="pfReferencia" name="pessoaJuridica.referenciaPessoal" cssClass="clTextoRestrito" size="50" maxlength="50" onchange="setAlterado(true);"/>
					  </td>
					  <s:if test="proposta.id == null || proposta.statusOperacional == 0">
					  </tr>
					  <tr>
					  <td align="right" colspan="6">
					  	<a href="#" class="button" onclick="apagarDadosCliente();">
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
				  </fieldset>
				</td>
			  </tr>
			  <tr>
				<td>
				  <fieldset>
				  <legend accesskey="E"><b><u>E</u>ndereço</b></legend>
				  <table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
					  <td width="10%">
						<label for="cepRes"><a href="#" class="LabelLink" onclick="openWin('${pageContext.request.contextPath}/endereco/buscaCep.action','BuscaCep','1024','600','resizable=yes,scrollbars=yes');" tabindex="-1" title="Acessar o site dos Correrios!">CEP</a></label><br />
						<s:textfield theme="simple" id="end0TipoEndereco" name="proposta.propostaEnderecoCollection[0].tipoEndereco" value="C" cssStyle="display:none;" />
						<s:textfield theme="simple" id="end0PessoaFisicaId" name="proposta.propostaEnderecoCollection[0].id" cssStyle="display:none;" />
						<s:textfield theme="simple" cssClass="clCep" id="cepRes" name="proposta.propostaEnderecoCollection[0].cep" size="11" maxlength="9" onchange="setAlterado(true);"/>
					  </td>
					  <td width="30%">
						<label for="lograRes">Logradouro</label><br />
						<s:textfield theme="simple" cssClass="requiredField clTextoRestrito" id="lograRes" name="proposta.propostaEnderecoCollection[0].logradouro" cssStyle="width:98%" maxlength="60" onchange="setAlterado(true);"/>
					  </td>
					  <td colspan="2">
						<label for="compRes">Complemento</label><br />
						<s:textfield theme="simple" id="compRes" cssClass="" name="proposta.propostaEnderecoCollection[0].complemento" cssStyle="width:98%" maxlength="60" onchange="setAlterado(true);"/>
					  </td>
					  <td width="15%">
						<label for="numeroRes">Número</label><br />
						<s:textfield theme="simple" id="numeroRes" name="proposta.propostaEnderecoCollection[0].numero" maxlength="6" size="8" onchange="setAlterado(true);"/>
					  </td>
					  <td width="15%">&nbsp;
					  </td>
					</tr>
					<tr>
					  <td colspan="2">
						<label for="bairroCom">Bairro</label><br />
						<s:textfield theme="simple" id="bairroRes" cssClass="clTextoRestrito" name="proposta.propostaEnderecoCollection[0].bairro" cssStyle="width:98%" maxlength="50" onchange="setAlterado(true);"/>
					  </td>
					  <td>
						<label for="cidadeCom">Cidade</label><br />
						<s:textfield theme="simple" id="cidadeRes" cssClass="clTextoRestrito" name="proposta.propostaEnderecoCollection[0].cidade" cssStyle="width:98%" maxlength="30" onchange="setAlterado(true);"/>
					  </td>
					  <td>
						<label for="ufCom">UF</label><br />
						<s:select theme="simple" id="ufRes" headerKey="" headerValue="-- Selecione --" name="proposta.propostaEnderecoCollection[0].uf" list="ufList" listKey="uf" listValue="nome" onchange="setAlterado(true);"/>
					  </td>
					  <td>
						<label for="cidadeCom">Correspondência</label><br />
					    <s:select theme="simple" cssClass="Combo Combo_OneCells_width requiredField" id="correspondencia" name="proposta.propostaEnderecoCollection[0].correspondencia" list="#{'SIM':'SIM','NAO':'NÃO'}" />
					  </td>
					  <td>
						<label for="faxCom">Fax</label><br />
						<s:textfield theme="simple" id="faxRes" cssClass="clFone" name="proposta.propostaEnderecoCollection[0].fax" size="16" maxlength="20" onchange="setAlterado(true);" />
						<input id="lastfield1" name="lastfield1" onkeyup="nextTab(event);" class="invisible" />
					  </td>
					</tr>
				  </table>
				  </fieldset>
				</td>
			  </tr>
			</table>
			</s:if>
			</div>
		  </td>
	  </tr>
	</table>
	
	</div>

<% } catch (Exception e) {e.printStackTrace();}%>