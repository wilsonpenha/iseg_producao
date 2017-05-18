<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try {
%>



	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
		  <td colspan="3">
			<label for="terceiroNome">Nome</label><br />
			<s:textfield theme="simple" id="terceiroId" name="terceiroEnvolvido.id" cssStyle="display:none"/>
			<s:textfield theme="simple" cssClass="requiredField" id="terceiroNome" name="terceiroEnvolvido.nome" maxlength="60" cssStyle="width:98%;" />
		  </td>
		  <td colspan="2">
			<label for="terceiroCpfCnpj">CPF/CNPJ</label><br />
			<s:textfield theme="simple" id="terceiroCpfCnpj" name="terceiroEnvolvido.cpfOuCnpj" size="18" maxlength="18" />
		  </td>
		  <td colspan="1">
			<label for="terceiroDataNascimento">Dt. Nascimento</label><br />
			<s:textfield theme="simple" cssClass="requiredField" id="terceiroDataNascimento" name="terceiroEnvolvido.dataNascimento" onblur="isValidDate(this)" size="10" maxlength="10"/>
		  </td>
		</tr>
		<tr>
		  <td width="15%">
			<label for="cepTer"><a href="#" class="LabelLink" onclick="openWin('${pageContext.request.contextPath}/endereco/buscaCep.action','BuscaCep','1024','600','resizable=yes,scrollbars=yes');" tabindex="-1" title="Acessar o site dos Correrios!">CEP</a></label><br />
			<s:textfield theme="simple" cssClass="requiredField" id="terceiroTipoEndereco" name="terceiroEnvolvido.tipoEndereco" value="R" cssStyle="display:none;" />
			<s:textfield theme="simple" cssClass="clCep" id="cepTer" name="terceiroEnvolvido.cep" size="11" maxlength="9" onchange="setAlterado(true);"/>
		  </td>
		  <td colspan="2">
			<label for="lograTer">Logradouro</label><br />
			<s:textfield theme="simple" cssClass="requiredField" id="lograTer" name="terceiroEnvolvido.logradouro" cssStyle="width:98%" maxlength="60" onchange="setAlterado(true);"/>
		  </td>
		  <td width="20%">
			<label for="compTer">Complemento</label><br />
			<s:textfield theme="simple" id="compTer" name="terceiroEnvolvido.complemento" cssStyle="width:98%" maxlength="60" onchange="setAlterado(true);"/>
		  </td>
		  <td width="15%">
			<label for="numeroTer">Número</label><br />
			<s:textfield theme="simple" id="numeroTer" name="terceiroEnvolvido.numero" maxlength="6" size="8"/>
		  </td>
		  <td width="15%">
			<label for="foneTer">Fone Residencial</label><br />
			<s:textfield theme="simple" id="foneTer" name="terceiroEnvolvido.telefonePreferencial" size="16" maxlength="20" onchange="setAlterado(true);"/>
		  </td>
		</tr>
		<tr>
		  <td colspan="2">
			<label for="bairroTer">Bairro</label><br />
			<s:textfield theme="simple" cssClass="requiredField" id="bairroTer" name="terceiroEnvolvido.bairro" cssStyle="width:98%" maxlength="50" onchange="setAlterado(true);"/>
		  </td>
		  <td colspan="2">
			<label for="cidadeTer">Cidade</label><br />
			<s:textfield theme="simple" cssClass="requiredField" id="cidadeTer" name="terceiroEnvolvido.cidade" cssStyle="width:98%" maxlength="35" onchange="setAlterado(true);"/>
		  </td>
		  <td width="15%">
			<label for="ufTer">UF</label><br />
			<s:select theme="simple" cssClass="requiredField" id="ufTer" headerKey="" headerValue="-- Selecione --" name="terceiroEnvolvido.uf" list="ufList" listKey="uf" listValue="nome" onchange="setAlterado(true);"/>
		  </td>
		  <td width="15%">
			<label for="celTer">Telefone Celular</label><br />
			<s:textfield theme="simple" id="celTer" name="terceiroEnvolvido.telefoneCelular" size="16" maxlength="20" onchange="setAlterado(true);"/>
		  </td>
		</tr>
		<tr>
		  <td colspan="2">
			<label for="terceiroCondutorNome">Condutor Nome</label><br />
			<s:textfield theme="simple" id="terceiroCondutorNome" name="terceiroEnvolvido.condutor" maxlength="60" cssStyle="width:98%;" />
		  </td>
		  <td width="20%">
			<label for="terceiroCondutorCpf">Condutor CPF</label><br />
			<s:textfield theme="simple" id="terceiroCondutorCpf" name="terceiroEnvolvido.condutorCpf" size="18" maxlength="18" />
		  </td>
		  <td width="15%">
			<label for="terceiroCondutorCNH">CNH</label><br />
			<s:textfield theme="simple" id="terceiroCondutorCNH" name="terceiroEnvolvido.cnh" maxlength="15" size="15" />
		  </td>
		  <td colspan="2">
			<label for="terceiroVeiculoEnvolvido">Veículo Envolvido</label><br />
			<s:textfield theme="simple" id="terceiroVeiculoEnvolvido" name="terceiroEnvolvido.veiculoEnvolvido" maxlength="60" cssStyle="width:98%;" />
		  </td>
		</tr>
		<tr>
	      <td width="15%">
		    <label for="terceiroCor">Cor</label><br />
		    <s:textfield theme="simple" id="terceiroCor" name="terceiroEnvolvido.cor" size="20" maxlength="20" onchange="setAlterado(true);"/>
		  </td>
		  <td width="20%">
		    <label for="terceiroAnoFabricacao">Ano</label><br />
		    <s:textfield theme="simple" id="terceiroAnoFabricacao" name="terceiroEnvolvido.anoFabricacao" size="10" maxlength="4" onchange="setAlterado(true);"/>
		  </td>
		  <td width="20%">
		    <label for="terceiroAnoModelo">Modelo</label><br />
		    <s:textfield theme="simple" id="terceiroAnoModelo" name="terceiroEnvolvido.anoModelo" size="10" maxlength="4" onchange="setAlterado(true);"/>
		  </td>
		  <td width="15%">
		    <label for="terceiroNroPlaca">Placa</label><br />
		    <s:textfield theme="simple" id="terceiroNroPlaca" name="terceiroEnvolvido.placa" size="10" maxlength="7" onchange="setAlterado(true);"/>
		  </td>
		  <td width="15%"></td>
		  <td width="15%"></td>
	    </tr>
	  </table>



 
<script>
$(document).ready(function(){
	MaskInput($('#terceiroDataNascimento')[0], "99/99/9999");
	setTimeout(function(){
		$('#terceiroNome').focus()
	},300);
});
</script>
<% } catch (Exception e) {e.printStackTrace();}%>