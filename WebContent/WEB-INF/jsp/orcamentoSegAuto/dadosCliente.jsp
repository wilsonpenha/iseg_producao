<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try {
%>
	<table width="100%" border="0" cellpadding="2" cellspacing="0">
	  <tr>
		<td>
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
					<s:textfield theme="simple" cssClass="requiredField" title="autocomplete" id="clienteCpf" name="pessoaFisica.cpfOuCnpj" size="18" maxlength="14" onblur="checarCpfCliente(this);" onchange="cpfClienteAlterado=true;setAlterado(true);" tabindex="1"/>
				  </td>
				  <td colspan="2" width="50%">
					<label for="clientePFNome">Nome do Segurado</label><br />
					<s:textfield theme="simple" cssClass="requiredField clTextoRestrito" id="clientePFNome" name="pessoaFisica.nome" size="50" maxlength="60" onchange="setAlterado(true);$('#clienteId').val('');" tabindex="2"/>
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
					<s:select theme="simple" id="sexo" headerKey="" headerValue="-- Selecione --" name="pessoaFisica.sexo" list="{'MASCULINO','FEMININO'}" onchange="setAlterado(true);" tabindex="4"/>
				  </td>
				  <td>
					<label for="pfEstadoCivil">Estado Civil</label><br />
					<s:select theme="simple" id="pfEstadoCivil" headerKey="" headerValue="-- Selecione --" name="pessoaFisica.estadoCivil" list="{'CASADO','DIVORCIADO','SOLTEIRO','UNIÃO ESTÁVEL','VIÚVO'}" tabindex="5"/>
				  </td>
				</tr>
				<tr>
				  <td>
					<label for="cnh">CNH</label><br />
					<s:textfield theme="simple" id="cnh" name="pessoaFisica.cnh" size="18" maxlength="15" onchange="setAlterado(true);" tabindex="6"/>
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
					<s:textfield theme="simple" cssClass=" clFone" id="telefonePreferencial" name="pessoaFisica.telefonePreferencial" size="18" maxlength="16" onchange="setAlterado(true);" tabindex="9"/>
				  </td>
				  <td>
					<label for="telefoneAlternativo">Telefone Alternativo</label><br />
					<s:textfield theme="simple" id="telefoneAlternativo" cssClass="clFone" name="pessoaFisica.telefoneAlternativo" size="16" maxlength="16" onchange="setAlterado(true);" tabindex="10"/>
				  </td>
				  <td colspan="2">
				    <label for="pfReferencia">Referência pessoal</label><br />
					<s:textfield theme="simple" id="pfReferencia" name="pessoaFisica.referenciaPessoal" cssClass="clTextoRestrito" size="52" maxlength="50" onchange="setAlterado(true);" tabindex="11"/>
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
						<s:textfield theme="simple" id="profissaoNome" cssClass="clTextoRestrito ac_input" style="background-color: #FFF;" title="autocomplete" name="pessoaFisica.profissao.descricao" size="30" maxlength="30" tabindex="13" onchange="setAlterado(true);" onkeydown="clearProfissao(event);"/>
					</td>
					<td valign="bottom">
						<label for="condutorProfissao">Outra Profissão</label><input type="checkbox" id="checkProfissao" onclick="ativarOutraProfissao(this)"><br />
						<s:textfield theme="simple" id="outraProfissaoNome" cssClass="clTextoRestrito readonly" disabled="true" style="background-color: #FFF;" title="autocomplete" name="pessoaFisica.profissaoNome" size="30" maxlength="30" tabindex="14"/>
					</td>
					<td valign="bottom">
<!--					<label for="pfGrupoDeVendaId">Grupo de Venda</label><br />-->
<!--						<s:select theme="simple" cssClass="" cssStyle="width:165px" id="pfGrupoDeVendaId" headerKey="" headerValue="-- Selecione --" name="pessoaFisica.grupoDeVenda.id" list="grupoDeVendaList" listKey="id" listValue="nomeDoGrupo" onchange="setAlterado(true);" tabindex="15"/>-->
				  	</td>
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
							<s:textfield theme="simple" cssClass="requiredField clTextoRestrito" id="clientePJNome" name="pessoaJuridica.nome" size="50" maxlength="60" onchange="setAlterado(true);" tabindex="2"/>
						  </td>
						</tr>
						<tr>
						  <td width="20%">
							<label for="pjGrupoDeVendaId">Grupo de Venda</label><br />
							<s:select theme="simple" cssClass="requiredField" cssStyle="width:165px" id="pjGrupoDeVendaId" headerKey="" headerValue="-- Selecione --" name="pessoaJuridica.grupoDeVenda.id" list="grupoDeVendaList" listKey="id" listValue="nomeDoGrupo" onchange="setAlterado(true);" tabindex="3"/>
						  </td>
						  <td colspan="2">
							<label for="email">E-mail</label><br />
							<s:textfield theme="simple" id="email" name="pessoaFisica.email" size="50" maxlength="80" onchange="setAlterado(true);" tabindex="4"/>
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
							<s:textfield theme="simple" id="pfReferencia" name="pessoaJuridica.referenciaPessoal" cssClass="clTextoRestrito" size="50" maxlength="50" onchange="setAlterado(true);" tabindex="8"/>
						  </td>
						</tr>
					  </table>
					</td>
				  </tr>
				</table>
			  </s:if>
			  </fieldset>
		</td>
	  </tr>
	</table>
<script>

// define a mascara padrão para telefone
$().ready(function() {
	// Mascara de telefone.
    $(".clData").setMask({mask : '39/19/9999', autoTab: false});
    $(".clFone").setMask({mask : '(99) 9999-9999', autoTab: false});
    $(".clFone").DefaultValue("(__) ____-____");
    // Converte para upper e elimina brancos no inicio e brancos duplos.
    $(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
    $(".clValor1").setMask({mask : '9,999.999.999.999', type : 'reverse',defaultValue:"00"});
    $(".clValor").setMask({mask : '99', defaultValue:"0"});
 	
 })

	if(isEmpty('#propostaId')){
		MaskInput($('#dataFundacao')[0], "99/99/9999");
		MaskInput($('#dataNascimento')[0], "99/99/9999");
		MaskInput($('#dataEmissao')[0], "99/99/9999");
		MaskInput($('#data1aHabilitacao')[0], "99/99/9999");

		$("#clientePFNome").autocomplete('<s:url value="/objlookup/getClientePFListByNome.action" includeParams="none" />', {idFieldsToUpdate:["#clienteId"],onItemSelect:carregaCliente, mustMatch:0, autoFill:false,width:400,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
		$("#clienteCpf").autocomplete('<s:url value="/objlookup/getClienteListByCpf.action" includeParams="none" />', {idFieldsToUpdate:["#clienteId"],onItemSelect:carregaCliente, mustMatch:0, autoFill:false,width:400,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
		$("#clientePJNome").autocomplete('<s:url value="/objlookup/getClientePJListByNome.action" includeParams="none" />', {idFieldsToUpdate:["#clienteId"],onItemSelect:carregaCliente, mustMatch:0, autoFill:false,width:400,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
		$("#clienteCnpj").autocomplete('<s:url value="/objlookup/getClienteListByCnpj.action" includeParams="none" />', {idFieldsToUpdate:["#clienteId"],onItemSelect:carregaCliente, mustMatch:0, autoFill:false,width:400,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
		$("#profissaoNome").autocomplete('<s:url value="/objlookup/getProfissaoByNome.action" includeParams="none" />', 
		{
			idFieldsToUpdate:["#profissaoId"],
			autoFill:false,
		});

		$("#cepRes").autocomplete('<s:url value="/objlookup/getCepList.action" includeParams="none" />', {idFieldsToUpdate:["#bairroRes", "#cidadeRes","#ufRes","#lograRes"],mustMatch:0,minChars:6,width:300,autoFill:false,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
		$("#cepCom").autocomplete('<s:url value="/objlookup/getCepList.action" includeParams="none" />', {idFieldsToUpdate:["#bairroCom", "#cidadeCom","#ufCom","#lograCom"],mustMatch:0,minChars:6,width:300,autoFill:false,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});

	}

	var tipoCliente = <s:property value="tipoCliente" />;
	if(tipoCliente == '0'){
		$('#grupoDeVendaId').val($('#pfGrupoDeVendaId').val());
	}else if(tipoCliente == '1'){
		$('#grupoDeVendaId').val($('#pjGrupoDeVendaId').val());
	}

	disableDadosClientes();

// 	setTimeout(function(){
// 		var tipoCliente = <s:property value="tipoCliente" />;
// 		if(tipoCliente == '0'){
// 			isEmpty('#clienteCpf') ? $("#clienteCpf").focus() : $("#isCondutor").focus();
// 		}else if(tipoCliente == '1'){
// 			isEmpty('#clienteCnpj') ? $("#clienteCnpj").focus() : $("#cepRes").focus();;
// 		}
// 	},600);

</script>
<% } catch (Exception e) {e.printStackTrace();}%>