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
				<s:textfield theme="simple" id="produtorId" name="condutor.proposta.id" cssStyle="display:none"/>
				<s:textfield theme="simple" cssClass="requiredField clTextoRestrito" id="condutorNome" name="condutor.nome" size="50" maxlength="60" />
			  </td>
			  <td width="15%">
				<label for="condutorEstadoCivil">Estado civil</label><br />
				<s:select theme="simple" id="condutorEstadoCivil" headerKey="" headerValue="-- Selecione --" name="condutor.estadoCivil" list="{'CASADO','DIVORCIADO','SOLTEIRO','UNIÃO ESTÁVEL','VIÚVO'}"/>
			  </td>
			  <td width="15%">
				<label for="condutorDataNascimento">Dt. Nascimento</label><br />
				<s:textfield theme="simple" cssClass="clData requiredField" id="condutorDataNascimento" name="condutor.dataNascimento" onblur="isValidDate(this)" size="10" maxlength="10"/>
			  </td>
			  <td width="15%">
				<label for="condutorSexo">Sexo</label><br />
				<s:select theme="simple" id="condutorSexo" headerKey="" headerValue="-- Selecione --" name="condutor.sexo" list="{'MASCULINO','FEMININO'}"/>
			  </td>
			  <td width="15%">
				<label for="condutorTelefones">Telefone</label><br />
				<s:textfield theme="simple" id="condutorTelefones" cssClass="clFone" name="condutor.telefones" size="16" maxlength="30"/>
			  </td>
			</tr>
			<tr>
			  <td width="20%">
				<label for="condutorTipoCondutor">Condutor principal</label><br />
				<s:select theme="simple" cssClass="requiredField" id="condutorTipoCondutor" headerKey="" headerValue="-- Selecione --" name="condutor.tipoCondutor" list="{'NAO','SIM'}"/>
			  </td>
			  <td width="20%">
				<label for="condutorProfissao">Profissão</label><br />
				<s:textfield theme="simple" id="condutorProfissao" cssClass="clTextoRestrito" name="condutor.profissao.descricao" size="25" maxlength="30"/>
			  </td>
			  <td>
				<label for="condutorCNH">CNH</label><br />
				<s:textfield theme="simple" cssClass="requiredField" id="condutorCNH" name="condutor.cnh" size="15" maxlength="15"/>
			  </td>
			  <td>
				<label for="condutorData1aHabilitacao">Dt 1a. Habilitação</label><br />
				<s:textfield theme="simple" cssClass="clData requiredField" id="condutorData1aHabilitacao" name="condutor.data1aHabilitacao" onblur="isValidDate(this)" size="10" maxlength="10"/>
			  </td>
			  <td>
				<label for="condutorDataVencHabilitacao">Dt Venc. Habilitação</label><br />
				<s:textfield theme="simple" cssClass="clData requiredField" id="condutorDataVencHabilitacao" name="condutor.dataVencHabilitacao" onblur="isValidDate(this)" size="10" maxlength="10"/>
			  </td>
			  <td>
				<label for="condutorCPF">CPF</label><br />
				<s:textfield theme="simple" cssClass="clCPF requiredField" id="condutorCPF" name="condutor.cpf" size="14" maxlength="14" />
			  </td>
			</tr>
		  </table>

<script>
// define a mascara padrão para telefone
$().ready(function() {
	// Mascara de telefone.
   // $(".clData").setMask({mask : '39/19/9999', autoTab: false});
    $(".clCPF").setMask({mask : '999.999.999-99', autoTab: false});
    $(".clFone").setMask({mask : '(99) 9999-9999', autoTab: false});
    $(".clFone").DefaultValue("(__) ____-____");
    $(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
    $(".clValor1").setMask({mask : '9,999.999.999.999', type : 'reverse',defaultValue:"00"});
    $(".clValor").setMask({mask : '99',  type : 'reverse',defaultValue:"0"});
 	
 })

</script>
<% } catch (Exception e) {e.printStackTrace();}%>