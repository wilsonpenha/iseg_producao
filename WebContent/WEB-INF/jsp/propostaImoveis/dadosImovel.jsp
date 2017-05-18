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
	  <td colspan="2">
		<label for="condutorNome">Condutor</label><br />
		<s:textfield theme="simple" id="condutorId" name="condutor.id" cssStyle="display:none"/>
		<s:textfield theme="simple" cssClass="requiredField" id="condutorNome" name="condutor.nome" size="50" maxlength="60" />
	  </td>
	  <td width="15%">
		<label for="condutorEstadoCivil">Estado civil</label><br />
		<s:select theme="simple" id="condutorEstadoCivil" headerKey="" headerValue="-- Selecione --" name="condutor.estadoCivil" list="{'CASADO','DIVORCIADO','SOLTEIRO','UNIÃO ESTÁVEL','VIÚVO'}"/>
	  </td>
	  <td width="15%">
		<label for="condutorDataNascimento">Dt. Nascimento</label><br />
		<s:textfield theme="simple" cssClass="requiredField" id="condutorDataNascimento" name="condutor.dataNascimento" onblur="isValidDate(this)" size="10" maxlength="10"/>
	  </td>
	  <td width="15%">
		<label for="condutorSexo">Sexo</label><br />
		<s:select theme="simple" id="condutorSexo" headerKey="" headerValue="-- Selecione --" name="condutor.sexo" list="{'MASCULINO','FEMININO'}"/>
	  </td>
	  <td width="15%">
		<label for="condutorTelefones">Telefone</label><br />
		<s:textfield theme="simple" id="condutorTelefones" name="condutor.telefones" size="16" maxlength="30"/>
	  </td>
	</tr>
	<tr>
	  <td width="20%">
		<label for="condutorTipoCondutor">Condutor principal</label><br />
		<s:select theme="simple" cssClass="requiredField" id="condutorTipoCondutor" headerKey="" headerValue="-- Selecione --" name="condutor.tipoCondutor" list="{'NAO','SIM'}"/>
	  </td>
	  <td width="20%">
		<label for="condutorProfissao">Profissão</label><br />
		<s:textfield theme="simple" id="condutorProfissao" name="condutor.profissao" size="25" maxlength="30"/>
	  </td>
	  <td>
		<label for="condutorCNH">CNH</label><br />
		<s:textfield theme="simple" cssClass="requiredField" id="condutorCNH" name="condutor.cnh" size="15" maxlength="15"/>
	  </td>
	  <td>
		<label for="condutorData1aHabilitacao">Dt 1a. Habilitação</label><br />
		<s:textfield theme="simple" cssClass="requiredField" id="condutorData1aHabilitacao" name="condutor.data1aHabilitacao" onblur="isValidDate(this)" size="10" maxlength="10"/>
	  </td>
	  <td>
		<label for="condutorCPF">CPF</label><br />
		<s:textfield theme="simple" cssClass="requiredField" id="condutorCPF" name="condutor.cpf" size="14" maxlength="14" />
	  </td>
	</tr>
  </table>




 
<script>
$(document).ready(function(){
	MaskInput($('#condutorDataNascimento')[0], "99/99/9999");
	MaskInput($('#condutorData1aHabilitacao')[0], "99/99/9999");
	setTimeout(function(){
		$('#condutorNome').focus()
		$("#condutorNome").keydown(function(){return handleFocusNomeCondutor(event, this.value, '#tablePerfil');});
	},300);
});
</script>
<% } catch (Exception e) {e.printStackTrace();}%>