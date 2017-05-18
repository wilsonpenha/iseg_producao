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
		  <fieldset>
		  <legend accesskey="C"><b>Dados do <u>S</u>egurado</b></legend>
		  <table id="tableDadosCliente" width="100%" border="0" cellpadding="2" cellspacing="0">
			<tr>
			  <td width="15%">
				<label for="clienteCpf">CPF</label><br />
				<s:textfield theme="simple" cssClass="requiredField" id="clienteCpf" name="pessoaFisica.cpfOuCnpj" size="18" maxlength="14" onblur="if (validaCPF(this)){carregaCliente();}" onchange="setAlterado(true);"/>
			  </td>
			  <td colspan="2">
				<label for="clienteNome">Nome do Segurado</label><br />
				<s:textfield theme="simple" id="currentTabId" name="currentTab" cssStyle="display:none;" />
				<s:textfield theme="simple" id="clienteId" name="proposta.cliente.id" cssStyle="display:none;" />
				<s:textfield theme="simple" id="pessoaFisicaId" name="pessoaFisica.id" cssStyle="display:none;" />
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
				<label for="pfGrupoDeVendaId">Grupo de Venda</label><br />
				<s:select theme="simple" cssClass="requiredField" id="pfGrupoDeVendaId" headerKey="" headerValue="-- Selecione --" name="pessoaFisica.grupoDeVenda.id" list="grupoDeVendaList" listKey="id" listValue="nomeDoGrupo" onchange="setAlterado(true);"/>
			  </td>
			</tr>
			<tr>
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
			  <td width="15%">&nbsp;</td>
			</tr>
			<tr>
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
		  </table>
		  </fieldset>
		</s:if>
		<s:if test="tipoCliente == 1">
		  <fieldset>
		  <legend accesskey="C"><b>Dados do <u>S</u>egurado</b></legend>
		  <table id="tableDadosCliente" width="100%" border="0" cellpadding="2" cellspacing="0">
			<tr>
			  <td width="20%">
			    <label for="clienteCnpj">CNPJ</label><br />
				<s:textfield theme="simple" cssClass="requiredField" id="clienteCnpj" name="pessoaJuridica.cpfOuCnpj" size="23" maxlength="21" onblur="if (validaCnpj(this)){carregaCliente();}" onchange="setAlterado(true);"/>
			  </td>
			  <td colspan="2">
				<label for="clienteNome">Nome do Segurado</label><br />
				<s:textfield theme="simple" id="currentTabId" name="currentTab" cssStyle="display:none;" />
				<s:textfield theme="simple" id="clienteId" name="proposta.cliente.id" cssStyle="display:none;" />
				<s:textfield theme="simple" id="pessoaJuridicaId" name="pessoaJuridica.id" cssStyle="display:none;" />
				<s:textfield theme="simple" cssClass="requiredField" id="clientePJNome" name="pessoaJuridica.nome" size="50" maxlength="60" onchange="setAlterado(true);"/>
			  </td>
			  <td colspan="2">
				<label for="razaoSocial">Razao Social</label><br />
				<s:textfield theme="simple" cssClass="requiredField" id="razaoSocial" size="50" maxlength="60" name="pessoaJuridica.razaoSocial" onchange="setAlterado(true);"/>
			  </td>
			</tr>
			<tr>
			  <td width="20%">
				<label for="pjGrupoDeVendaId">Grupo de Venda</label><br />
				<s:select theme="simple" cssClass="requiredField" id="pjGrupoDeVendaId" headerKey="" headerValue="-- Selecione --" name="pessoaJuridica.grupoDeVenda.id" list="grupoDeVendaList" listKey="id" listValue="nomeDoGrupo" onchange="setAlterado(true);"/>
			  </td>
			  <td width="20%">
				<label for="inscricaoEstadual">Inscricao Estadual</label><br />
				<s:textfield theme="simple" id="inscricaoEstadual" name="pessoaJuridica.inscrEstadual" maxlength="14" onchange="setAlterado(true);"/>
			  </td>
			  <td width="20%">
				<label for="inscricaoMunicipal">Inscricao Municipal</label><br />
				<s:textfield theme="simple" id="inscricaoMunicipal" name="pessoaJuridica.inscricaoMunicipal" onchange="setAlterado(true);"/>
			  </td>
			  <td colspan="2">
				<label for="atividadeComercial">Atividade Comercial</label><br />
				<s:select theme="simple" id="atividadeComercial" headerKey="" headerValue="-- Selecione --" name="pessoaJuridica.atividadeComercial" list="atividadeComercialList" listKey="id" listValue="valor" onchange="setAlterado(true);"/>
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
			</tr>
		  </table>
		  </fieldset>
		</s:if>
		  <fieldset>
		  <legend accesskey="C"><b>Bem Sinistrado</b></legend>
		  <table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
			  <td><s:select theme="simple" id="itemSegurado" headerKey="" headerValue="-- Selecione --" name="sinistro.itemSegurado" list="itensSeguradosList" listKey="id" listValue="modeloVeiculo.fabricante.nome+' - '+modeloVeiculo.descricao+', Ano/Modelo: '+anoFabricacao+'/'+anoModelo+', Cor: '+corPredominante+', Placa: '+nroPlaca+', Chassis: '+nroChassis" onchange="setAlterado(true);"/></td>
			</tr>
		  </table>
		  </fieldset>

<script>


	MaskInput($('#dataFundacao')[0], "99/99/9999");
	MaskInput($('#dataNascimento')[0], "99/99/9999");
	MaskInput($('#dataEmissao')[0], "99/99/9999");
	MaskInput($('#data1aHabilitacao')[0], "99/99/9999");
	MaskInput($('#emissao')[0], "99/99/9999");
	MaskInput($('#inicioVigencia')[0], "99/99/9999");
	MaskInput($('#terminoVigencia')[0], "99/99/9999");

	handleReadonly();
	
</script>
<% } catch (Exception e) {e.printStackTrace();}%>