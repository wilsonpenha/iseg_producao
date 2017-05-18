<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try {
%>






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
				<label for="clienteCpf"><a href="#" class="LabelLink" onclick="editarCliente();" tabindex="-1" title="Alterar dados Cadastrais do Segurado.">CPF</a></label><br />
				<s:textfield theme="simple" cssClass="requiredField" id="clienteCpf" name="pessoaFisica.cpfOuCnpj" size="18" maxlength="14" onblur="if (validaCPF(this)){carregaCliente();}" onchange="setAlterado(true);"/>
			  </td>
			  <td colspan="2">
				<label for="clientePFNome">Nome do Segurado</label><br />
				<s:textfield theme="simple" cssClass="requiredField" id="clientePFNome" name="pessoaFisica.nome" size="50" maxlength="60" onchange="setAlterado(true);"/>
			  </td>
			  <td width="15%">
				<label for="dataNascimento">Dt. Nascimento</label><br />
				<s:textfield theme="simple" cssClass="requiredField" id="dataNascimento" name="pessoaFisica.dataNascimento" onblur="isValidDate(this);validaData1aHabilitacao(this, '#data1aHabilitacao');" size="12" maxlength="10" onchange="setAlterado(true);"/>
			  </td>
			  <td width="15%">
				<label for="sexo">Sexo</label><br />
				<s:select theme="simple" id="sexo" headerKey="" headerValue="-- Selecione --" name="pessoaFisica.sexo" list="{'MASCULINO','FEMININO'}" onchange="setAlterado(true);"/>
			  </td>
			  <td width="15%">
				<label for="pfEstadoCivil">Estado Civil</label><br />
				<s:select theme="simple" id="pfEstadoCivil" headerKey="" headerValue="-- Selecione --" name="pessoaFisica.estadoCivil" list="{'CASADO','DIVORCIADO','SOLTEIRO','UNIÃO ESTÁVEL','VIÚVO'}"/>
			  </td>
			</tr>
			<tr>
			  <td width="15%">
				<label for="pfGrupoDeVendaId">Grupo de Venda</label><br />
				<s:select theme="simple" cssClass="requiredField" id="pfGrupoDeVendaId" headerKey="" headerValue="-- Selecione --" name="pessoaFisica.grupoDeVenda.id" list="grupoDeVendaList" listKey="id" listValue="nomeDoGrupo" onchange="setAlterado(true);"/>
			  </td>
			  <td width="15%">
				<label for="cnh">CNH</label><br />
				<s:textfield theme="simple" id="cnh" name="pessoaFisica.cnh" size="15" maxlength="15" onchange="setAlterado(true);"/>
			  </td>
			  <td width="20%">
				<label for="data1aHabilitacao">Dt 1a. Habilitação</label><br />
				<s:textfield theme="simple" id="data1aHabilitacao" name="pessoaFisica.data1aHabilitacao" onblur="isValidDate(this);validaData1aHabilitacao('#dataNascimento', this);" size="12" maxlength="10" onchange="setAlterado(true);"/>
			  </td>
			  <td width="20%">
				<label for="rg">Identidade</label><br />
				<s:textfield theme="simple" id="rg" name="pessoaFisica.rg" size="15" maxlength="15" onchange="setAlterado(true);"/>
			  </td>
			  <td width="15%">
				<label for="orgaoEmissor">Emissor</label><br />
				<s:textfield theme="simple" id="orgaoEmissor" name="pessoaFisica.orgaoEmissor" size="15" maxlength="15" onchange="setAlterado(true);"/>
			  </td>
			  <td width="15%">
				<label for="dataEmissao">Dt de Expedição</label><br />
				<s:textfield theme="simple" id="dataEmissao" name="pessoaFisica.dataEmissao" onblur="isValidDate(this)" size="12" maxlength="10" onchange="setAlterado(true);"/>
			  </td>
			</tr>
			<tr>
			  <td>
			    <label for="pfProfissao">Profissão</label><br />
				<s:textfield theme="simple" id="pfProfissao" name="pessoaFisica.profissao.descricao" maxlength="50" cssStyle="width:95%;" onchange="setAlterado(true);"/>
			  </td>
			  <td>
				<label for="telefonePreferencial">Telef. Preferencial</label><br />
				<s:textfield theme="simple" cssClass="requiredField" id="telefonePreferencial" name="pessoaFisica.telefonePreferencial" size="16" maxlength="16" onchange="setAlterado(true);"/>
			  </td>
			  <td>
				<label for="telefoneAlternativo">Telefone Alternativo</label><br />
				<s:textfield theme="simple" id="telefoneAlternativo" name="pessoaFisica.telefoneAlternativo" size="16" maxlength="16" onchange="setAlterado(true);"/>
			  </td>
			  <td>
				<label for="telefoneCelular">Telefone Celular</label><br />
				<s:textfield theme="simple" id="telefoneCelular" name="pessoaFisica.telefoneCelular" size="16" maxlength="16" onchange="setAlterado(true);"/>
			  </td>
			  <td colspan="2">
				<label for="email">E-mail</label><br />
				<s:textfield theme="simple" id="email" name="pessoaFisica.email" size="60" maxlength="80" onchange="setAlterado(true);"/>
			  </td>
			</tr>
			<tr>
			  <s:if test="proposta.id == null">
			  <td align="right" colspan="6">
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
				<label for="cepRes"><a href="#" class="LabelLink" onclick="openWin('${pageContext.request.contextPath}/endereco/buscaCep.action','BuscaCep','1024','600','resizable=yes,scrollbars=yes');" tabindex="-1" title="Acessar o site dos Correrios!">CEP</a></label><br />
				<s:textfield theme="simple" cssClass="requiredField" id="end0TipoEndereco" name="proposta.propostaEnderecoCollection[0].tipoEndereco" value="R" cssStyle="display:none;" />
				<s:textfield theme="simple" cssClass="requiredField" id="end0PessoaFisicaId" name="proposta.propostaEnderecoCollection[0].id" cssStyle="display:none;" />
				<s:textfield theme="simple" cssClass="clCep" id="cepRes" name="proposta.propostaEnderecoCollection[0].cep" size="11" maxlength="9" onchange="setAlterado(true);"/>
			  </td>
			  <td width="30%">
				<label for="lograRes">Logradouro</label><br />
				<s:textfield theme="simple" cssClass="requiredField" id="lograRes" name="proposta.propostaEnderecoCollection[0].logradouro" cssStyle="width:98%" maxlength="60" onchange="setAlterado(true);"/>
			  </td>
			  <td width="30%">
				<label for="compRes">Complemento</label><br />
				<s:textfield theme="simple" id="compRes" name="proposta.propostaEnderecoCollection[0].complemento" cssStyle="width:98%" maxlength="60" onchange="setAlterado(true);"/>
			  </td>
			  <td width="15%">
				<label for="numeroRes">Número</label><br />
				<s:textfield theme="simple" id="numeroRes" name="proposta.propostaEnderecoCollection[0].numero" maxlength="6" size="8"/>
			  </td>
			  <td width="15%">
				<label for="foneRes">Fone Residencial</label><br />
				<s:textfield theme="simple" id="foneRes" name="proposta.propostaEnderecoCollection[0].telefone" size="16" maxlength="20" onchange="setAlterado(true);"/>
			  </td>
			</tr>
			<tr>
			  <td colspan="2">
				<label for="bairroRes">Bairro</label><br />
				<s:textfield theme="simple" cssClass="requiredField" id="bairroRes" name="proposta.propostaEnderecoCollection[0].bairro" cssStyle="width:98%" maxlength="50" onchange="setAlterado(true);"/>
			  </td>
			  <td>
				<label for="cidadeRes">Cidade</label><br />
				<s:textfield theme="simple" cssClass="requiredField" id="cidadeRes" name="proposta.propostaEnderecoCollection[0].cidade" cssStyle="width:98%" maxlength="35" onchange="setAlterado(true);"/>
			  </td>
			  <td>
				<label for="ufRes">UF</label><br />
				<s:select theme="simple" cssClass="requiredField" id="ufRes" headerKey="" headerValue="-- Selecione --" name="proposta.propostaEnderecoCollection[0].uf" list="ufList" listKey="uf" listValue="nome" onchange="setAlterado(true);"/>
			  </td>
			  <td>
				<label for="faxRes">Fax</label><br />
				<s:textfield theme="simple" id="faxRes" name="proposta.propostaEnderecoCollection[0].fax" size="16" maxlength="20" onchange="setAlterado(true);"/>
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
				<label for="cepCom"><a href="#" class="LabelLink" onclick="openWin('${pageContext.request.contextPath}/endereco/buscaCep.action','BuscaCep','1024','600','resizable=yes,scrollbars=yes');" tabindex="-1" title="Acessar o site dos Correrios!">CEP</a></label><br />
				<s:textfield theme="simple" id="end1TipoEndereco" name="proposta.propostaEnderecoCollection[1].tipoEndereco" value="C" cssStyle="display:none;" />
				<s:textfield theme="simple" id="end1PessoaFisicaId" name="proposta.propostaEnderecoCollection[1].id" cssStyle="display:none;" onchange="setAlterado(true);"/>
				<s:textfield theme="simple" cssClass="clCep" id="cepCom" name="proposta.propostaEnderecoCollection[1].cep" size="11" maxlength="9"/>
			  </td>
			  <td width="30%">
				<label for="lograCom">Logradouro</label><br />
				<s:textfield theme="simple" id="lograCom" name="proposta.propostaEnderecoCollection[1].logradouro" cssStyle="width:98%" maxlength="60" onchange="setAlterado(true);"/>
			  </td>
			  <td width="30%">
				<label for="compCom">Complemento</label><br />
				<s:textfield theme="simple" id="compCom" name="proposta.propostaEnderecoCollection[1].complemento" cssStyle="width:98%" maxlength="60" onchange="setAlterado(true);"/>
			  </td>
			  <td width="15%">
				<label for="numeroCom">Número</label><br />
				<s:textfield theme="simple" id="numeroCom" name="proposta.propostaEnderecoCollection[1].numero" maxlength="6" size="8" onchange="setAlterado(true);"/>
			  </td>
			  <td width="15%">
				<label for="foneCom">Fone Comercial</label><br />
				<s:textfield theme="simple" id="foneCom" name="proposta.propostaEnderecoCollection[1].telefone" size="16" maxlength="20" onchange="setAlterado(true);"/>
			  </td>
			</tr>
			<tr>
			  <td colspan="2">
				<label for="bairroCom">Bairro</label><br />
				<s:textfield theme="simple" id="bairroCom" name="proposta.propostaEnderecoCollection[1].bairro" cssStyle="width:98%" maxlength="50" onchange="setAlterado(true);"/>
			  </td>
			  <td>
				<label for="cidadeCom">Cidade</label><br />
				<s:textfield theme="simple" id="cidadeCom" name="proposta.propostaEnderecoCollection[1].cidade" cssStyle="width:98%" maxlength="30" onchange="setAlterado(true);"/>
			  </td>
			  <td>
				<label for="ufCom">UF</label><br />
				<s:select theme="simple" id="ufCom" headerKey="" headerValue="-- Selecione --" name="proposta.propostaEnderecoCollection[1].uf" list="ufList" listKey="uf" listValue="nome" onchange="setAlterado(true);"/>
			  </td>
			  <td>
				<label for="faxCom">Fax</label><br />
				<s:textfield theme="simple" id="faxCom" name="proposta.propostaEnderecoCollection[1].fax" size="16" maxlength="20" onchange="setAlterado(true);" />
				<input id="lastfield1" name="lastfield1" onkeyup="nextTab(event);" class="invisible" />
			  </td>
			</tr>
			<tr>
			  <td align="left" colspan="5">
			    <a href="#" class="button" onclick="copiarEnderecoResidencialParaEnderecoComercial();" tabindex="-1">
				<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton">
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">Copiar Dados End. Residencial</td>
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
			  <td width="20%">
			    <label for="clienteCnpj"><a href="#" class="LabelLink" onclick="editarCliente();" tabindex="-1" title="Alterar dados Cadastrais do Segurado.">CNPJ</a></label><br />
				<s:textfield theme="simple" cssClass="requiredField" id="clienteCnpj" name="pessoaJuridica.cpfOuCnpj" size="23" maxlength="21" onblur="if (validaCnpj(this)){carregaCliente();}" onchange="setAlterado(true);"/>
			  </td>
			  <td colspan="2">
				<label for="clienteNome">Nome do Segurado</label><br />
				<s:textfield theme="simple" cssClass="requiredField" id="clientePJNome" name="pessoaJuridica.nome" size="50" maxlength="60" onchange="setAlterado(true);"/>
			  </td>
			  <td width="20%">
				<label for="pjGrupoDeVendaId">Grupo de Venda</label><br />
				<s:select theme="simple" cssClass="requiredField" id="pjGrupoDeVendaId" headerKey="" headerValue="-- Selecione --" name="pessoaJuridica.grupoDeVenda.id" list="grupoDeVendaList" listKey="id" listValue="nomeDoGrupo" onchange="setAlterado(true);"/>
			  </td>
			  <td width="20%">
				<label for="inscricaoEstadual">Inscrição Estadual</label><br />
				<s:textfield theme="simple" id="inscricaoEstadual" name="pessoaJuridica.inscrEstadual" maxlength="14" onchange="setAlterado(true);"/>
			  </td>
			  <td width="20%">
				<label for="inscricaoMunicipal">Inscrição Municipal</label><br />
				<s:textfield theme="simple" id="inscricaoMunicipal" name="pessoaJuridica.inscricaoMunicipal" onchange="setAlterado(true);"/>
			  </td>
			</tr>
			<tr>
			  <td width="20%">
				<label for="dataFundacao">Data Fundação</label><br />
				<s:textfield theme="simple" id="dataFundacao" name="pessoaJuridica.dataFundacao" onblur="isValidDate(this)" size="12" maxlength="10" onchange="setAlterado(true);"/>
			  </td>
			  <td width="20%">
				<label for="valorPatrimonio">Valor Patrimônio</label><br />
				<s:textfield theme="simple" id="valorPatrimonio" name="pessoaJuridica.valorPatrimonio" size="16" onchange="setAlterado(true);"/>
			  </td>
			  <td width="20%">
				<label for="telefonePreferencial">Telef. Preferencial</label><br />
				<s:textfield theme="simple" cssClass="requiredField" id="telefonePreferencial" name="pessoaJuridica.telefonePreferencial" size="16" maxlength="16" onchange="setAlterado(true);"/>
			  </td>
			  <td width="20%">
				<label for="telefoneAlternativo">Telefone Alternativo</label><br />
				<s:textfield theme="simple" id="telefoneAlternativo" name="pessoaJuridica.telefoneAlternativo" size="16" maxlength="16" onchange="setAlterado(true);"/>
			  </td>
			  <td width="20%">
				<label for="telefoneCelular">Telefone Celular</label><br />
				<s:textfield theme="simple" id="telefoneCelular" name="pessoaJuridica.telefoneCelular" size="16" maxlength="16" onchange="setAlterado(true);"/>
			  </td>
			  <td>
				<label for="atividadeComercial">Atividade Comercial</label><br />
				<s:select theme="simple" id="atividadeComercial" headerKey="" headerValue="-- Selecione --" name="pessoaJuridica.atividadeComercial" list="atividadeComercialList" listKey="id" listValue="valor" onchange="setAlterado(true);"/>
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
			  <s:if test="%{proposta.id == null}">
			  <td align="right" colspan="2">
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
				<s:textfield theme="simple" cssClass="requiredField" id="lograRes" name="proposta.propostaEnderecoCollection[0].logradouro" cssStyle="width:98%" maxlength="60" onchange="setAlterado(true);"/>
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
				<s:textfield theme="simple" id="bairroCom" cssClass="clTextoRestrito" name="proposta.propostaEnderecoCollection[0].bairro" cssStyle="width:98%" maxlength="50" onchange="setAlterado(true);"/>
			  </td>
			  <td>
				<label for="cidadeCom">Cidade</label><br />
				<s:textfield theme="simple" id="cidadeCom" cssClass="clTextoRestrito" name="proposta.propostaEnderecoCollection[0].cidade" cssStyle="width:98%" maxlength="30" onchange="setAlterado(true);"/>
			  </td>
			  <td>
				<label for="ufCom">UF</label><br />
				<s:select theme="simple" id="ufCom" headerKey="" headerValue="-- Selecione --" name="proposta.propostaEnderecoCollection[0].uf" list="ufList" listKey="uf" listValue="nome" onchange="setAlterado(true);"/>
			  </td>
			  <td>
				<label for="cidadeCom">Correspondência</label><br />
			    <s:radio theme="simple" id="correspondenciaCom" name="proposta.propostaEnderecoCollection[0].correspondencia" list='{"SIM","NAO"}' />
			  </td>
			  <td>
				<label for="faxCom">Fax</label><br />
				<s:textfield theme="simple" id="faxCom" name="proposta.propostaEnderecoCollection[0].fax" size="16" maxlength="20" onchange="setAlterado(true);" />
				<input id="lastfield1" name="lastfield1" onkeyup="nextTab(event);" class="invisible" />
			  </td>
			</tr>
		  </table>
		  </fieldset>
		</td>
	  </tr>
	</table>
	</s:if>
	
	
	
	


<script>

	if(isEmpty('#propostaId')){
		MaskInput($('#dataFundacao')[0], "99/99/9999");
		MaskInput($('#dataNascimento')[0], "99/99/9999");
		MaskInput($('#dataEmissao')[0], "99/99/9999");
		MaskInput($('#data1aHabilitacao')[0], "99/99/9999");

		$("#clientePFNome").autocomplete('<s:url value="/objlookup/getClientePFListByNome.action" includeParams="none" />', {idFieldsToUpdate:["#clienteId"],onItemSelect:carregaCliente, mustMatch:0, autoFill:false,width:400,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
		$("#clienteCpf").autocomplete('<s:url value="/objlookup/getClienteListByCpf.action" includeParams="none" />', {idFieldsToUpdate:["#clienteId"],onItemSelect:carregaCliente, mustMatch:0, autoFill:false,width:400,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
		$("#clientePJNome").autocomplete('<s:url value="/objlookup/getClientePJListByNome.action" includeParams="none" />', {idFieldsToUpdate:["#clienteId"],onItemSelect:carregaCliente, mustMatch:0, autoFill:false,width:400,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
		$("#clienteCnpj").autocomplete('<s:url value="/objlookup/getClienteListByCnpj.action" includeParams="none" />', {idFieldsToUpdate:["#clienteId"],onItemSelect:carregaCliente, mustMatch:0, autoFill:false,width:400,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});

		$("#cepRes").autocomplete('<s:url value="/objlookup/getCepList.action" includeParams="none" />', {idFieldsToUpdate:["#bairroRes", "#cidadeRes","#ufRes","#lograRes"],mustMatch:0,minChars:6,width:300,autoFill:false,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
		$("#cepCom").autocomplete('<s:url value="/objlookup/getCepList.action" includeParams="none" />', {idFieldsToUpdate:["#bairroCom", "#cidadeCom","#ufCom","#lograCom"],mustMatch:0,minChars:6,width:300,autoFill:false,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});

	}

	disableDadosClientes();

	setTimeout(function(){
		var tipoCliente = <s:property value="tipoCliente" />;
		if(tipoCliente == '0'){
			isEmpty('#clienteCpf') ? $("#clienteCpf").focus() : $("#isCondutor").focus();
		}else if(tipoCliente == '1'){
			isEmpty('#clienteCnpj') ? $("#clienteCnpj").focus() : $("#cepRes").focus();;
		}
	},1200);

</script>
<% } catch (Exception e) {e.printStackTrace();}%>