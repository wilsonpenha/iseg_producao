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
				<label for="beneficiarioNome">Beneficiários</label><br />
				<s:textfield theme="simple" id="beneficiarioEmpresarialId" name="beneficiarioEmpresarial.id" cssStyle="display:none"/>
				<s:textfield theme="simple" cssClass="requiredField clTextoRestrito" id="beneficiarioNome" name="beneficiarioEmpresarial.nome" size="50" maxlength="60" />
			  </td>
			  <td width="15%">
				<label for="beneficiarioDataNasc">Dt. Nascimento</label><br />
				<s:textfield theme="simple" cssClass="requiredField clData" id="beneficiarioDataNasc" name="beneficiarioEmpresarial.dataNascimento" onblur="isValidDate(this)" size="10" maxlength="10"/>
			  </td>
			  <td width="15%">
				<label for="beneficiarioSexo">Sexo</label><br />
				<s:select theme="simple" id="beneficiarioSexo" headerKey="" headerValue="-- Selecione --" name="beneficiarioEmpresarial.sexo" list="{'MASCULINO','FEMININO'}"/>
			  </td>
			  <td width="15%">
				<label for="beneficiarioParentesco">Parentesco</label><br />
				<s:select theme="simple" id="beneficiarioParentesco" headerKey="" headerValue="-- Selecione --" name="beneficiarioEmpresarial.parentesco" list="{'CÔNJUGE','FILHO','ENTEADO','MÃE','PAI','IRMÃO'}"/>
			  </td>
			  <td width="15%">
				<label for="beneficiarioPercentual">Percentual</label><br />
				<s:textfield theme="simple" id="beneficiarioPercentual" cssClass="clValor2 currency" name="beneficiarioEmpresarial.percentual" size="15" maxlength="10"/>
			  </td>
			</tr>
		  </table>
 
<script>
$(document).ready(function(){
	setTimeout(function(){
		$('#beneficiarioNome').focus()
		//$("#beneficiarioNome").keydown(function(){return handleFocusNomeCondutor(event, this.value, '#tablePerfil');});
	},300);
});

$().ready(function() {
	// Mascara de telefone.
    $(".clCep").setMask({mask : '99999-999', autoTab: false});
    $(".clData").setMask({mask : '39/19/9999', autoTab: false});
    $(".clFone").setMask({mask : '(99) 9999-9999', autoTab: false});
    $(".clFone").DefaultValue("(__) ____-____");
    // Converte para upper e elimina brancos no inicio e brancos duplos.
 	//$('.clTextoRestrito').bestupper({semPontuacao : true});
    $(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
    $(".clValor1").setMask({mask : '9,999.999.999.999', type : 'reverse',defaultValue:"00"});
    $(".clValor").setMask({mask : '99', defaultValue:"0"});
 	
 })

</script>
<% } catch (Exception e) {e.printStackTrace();}%>