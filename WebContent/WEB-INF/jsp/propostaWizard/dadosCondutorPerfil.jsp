<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try {
%>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" id="contudor_principal">
	<tr>
	  <td>
	  	<s:textfield theme="simple" cssClass="requiredField" id="condutorId" name="condutor.id" style="display:none;"/>
	  	
		<label for="clienteCpf2">CPF</label><br />
		<s:textfield theme="simple" cssClass="requiredField" id="clienteCondutorId" name="clienteCondutorId" style="display:none;"/>
		<s:textfield theme="simple" cssClass="requiredField" title="autocomplete" id="condutorCpf" name="condutor.cpf" size="18" maxlength="14" onblur="checarCpfCondutor(this);" onchange="setAlterado(true);"/>
  	  </td>
	  <td colspan="2" width="50%">
		<label for="clientePFNome2">Nome</label><br />
		<s:textfield theme="simple" cssClass="requiredField clTextoRestrito" id="condutorNome" name="condutor.nome" size="50" maxlength="60" onchange="setAlterado(true);"/>
	  </td>
	  <td width="25%">
		<label for="condutorSexo">Sexo</label><br />
		<s:select theme="simple" id="condutorSexo" cssClass="requiredField" headerKey="" headerValue="-- Selecione --" tabindex="4" name="condutor.sexo" list="{'MASCULINO','FEMININO'}"/>
	  </td>
	</tr>
	<tr>
	  <td>
		<label for="condutorDataNascimento">Dt. Nascimento</label><br />
		<s:textfield theme="simple" cssClass="clData " id="condutorDataNascimento" name="condutor.dataNascimento" onblur="isValidDate(this)" size="18" maxlength="10"/>
	  </td>
	  <td>
		<label for="condutorEstadoCivil">Estado Civil</label><br />
		<s:select theme="simple" id="condutorEstadoCivil" headerKey="" headerValue="-- Selecione --" name="condutor.estadoCivil" list="{'CASADO','DIVORCIADO','SOLTEIRO','UNIÃO ESTÁVEL','VIÚVO'}"/>
	  </td>
	  <td>
		<label for="condutorCNH">CNH</label><br />
		<s:textfield theme="simple" cssClass="" id="condutorCNH" name="condutor.cnh" size="18" maxlength="15"/>
	  </td>
	  <td>
		<label for="condutorData1aHabilitacao">Dt 1a. Habilitação</label><br />
		<s:textfield theme="simple" cssClass="clData " id="condutorData1aHabilitacao" name="condutor.data1aHabilitacao" onblur="isValidDate(this)" size="16" maxlength="10"/>
	  </td>
	</tr>
	<tr>
	  <td>
		<label for="condutorTelefones">Telefone Celular</label><br />
		<s:textfield theme="simple" id="condutorTelefones" cssClass="clFone" name="condutor.telefones" size="18" maxlength="30"/>
	  </td>
	  <td>
		<label for="telefonePreferencial">Telef. Preferencial</label><br />
		<s:textfield theme="simple" cssClass=" clFone" id="telefonePreferencial" name="condutor.telefonePreferencial" size="18" maxlength="16" onchange="setAlterado(true);"/>
	  </td>
	  <td>
		<label for="telefoneAlternativo">Telefone Alternativo</label><br />
		<s:textfield theme="simple" id="telefoneAlternativo" cssClass="clFone" name="condutor.telefoneAlternativo" size="16" maxlength="16" onchange="setAlterado(true);"/>
	  </td>
	  <td>
	  	<label for="relacaoCondutor">Relação Segurado</label><br />
	  	<s:select id="relacaoCondutorSegurado" list="relacaoSeguradoProprietario" listKey="id" listValue="valor" name="condutor.relacaoCondutorSegurado.id" headerValue="-- Selecione --" headerKey="" />
	  </td>
	 </tr>
	 <tr>
	 	<td colspan="2">
	 		<label>Escolaridade</label><br />
	 		<s:textfield theme="simple" name="condutor.escolaridade.id" style="display:none;" id="escolaridadeCondutorId"/>
	 		<s:textfield theme="simple" name="condutor.escolaridade.descricao" id="escolaridadeCondutor" size="41"/>
	 	</td>
	 	<td colspan="2">
			<label for="condutorProfissao">Profissão</label><br />
			<s:textfield id="condutorProfissaoId" name="condutor.profissao.id" style="display:none"/>
			<s:textfield theme="simple" id="condutorProfissao" cssClass="clTextoRestrito" name="condutor.profissao.descricao" size="42" maxlength="30"/>
	    </td>
	 </tr>
	 <tr>
	 	<td colspan="2">
	 		<label for="emailCondutor">E-mail</label><br />
	 		<s:textfield size="41" theme="simple" id="condutorEmail" name="condutor.email"/>
	 	</td>
	 	<td colspan="2">
	 		<label>Principal Condutor?</label><br/>
	 		<s:select theme="simple" cssClass="" headerKey="" id="isCondutorPrincipal"  list="#{false:'NÃO',true:'SIM'}" name="condutor.isCondutorPrincipal" style="width: 60px" onchange="setAlterado(true);"/>
	 	</td>
	 </tr>
  </table>
 </div>

<script>
// define a mascara padrão para telefone
$().ready(function() {
	// Mascara de telefone.
    $(".clData").setMask({mask : '39/19/9999', autoTab: false});
    $(".clCPF").setMask({mask : '999.999.999-99', autoTab: false});
    $(".clFone").setMask({mask : '(99) 9999-9999', autoTab: false});
    $(".clFone").DefaultValue("(__) ____-____");
    $(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
    $(".clValor1").setMask({mask : '9,999.999.999.999', type : 'reverse',defaultValue:"00"});
    $(".clValor").setMask({mask : '99',  type : 'reverse',defaultValue:"0"});
 	
 });
$("#condutorNome").autocomplete('<s:url value="/objlookup/getClientePFListByNome.action" includeParams="none" />', {idFieldsToUpdate:["#clienteCondutorId"],onItemSelect:carregaCliente, mustMatch:0, autoFill:false,width:400,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
$("#condutorCpf").autocomplete('<s:url value="/objlookup/getClienteListByCpf.action" includeParams="none" />', {idFieldsToUpdate:["#clienteCondutorId"],onItemSelect:carregaCliente, mustMatch:0, autoFill:false,width:400,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
$("#condutorProfissao").autocomplete('<s:url value="/objlookup/getProfissaoByNome.action" includeParams="none" />', {idFieldsToUpdate:["#condutorProfissaoId"]});
$("#escolaridadeCondutor").autocomplete('<s:url value="/objlookup/getEscolaridade.action" includeParams="none" />', {idFieldsToUpdate:["#escolaridadeCondutorId"]});
</script>
<% } catch (Exception e) {e.printStackTrace();}%>