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
			<td>
			  <fieldset>
			  <legend accesskey="C"><b>Dados do <u>S</u>egurado</b></legend>
			  <table width="100%" border="0" cellpadding="2" cellspacing="0">
				<tr>
				  <td width="15%">
					<s:textfield theme="simple" id="seguradoId" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].id" cssStyle="display:none;" />
					<s:textfield theme="simple" id="seguradoAlterado" name="seguradoAlterado" cssStyle="display:none;" />
					<s:textfield theme="simple" id="seguradoLinhaVazia" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].linhaVazia" cssStyle="display:none;" />
					<s:textfield theme="simple" id="seguradoPropostaId" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].proposta.id" cssStyle="display:none;" />
					<label for="seguradoCpf"><a href="#" class="LabelLink" onclick="editarCliente();" tabindex="-1" title="Alterar dados Cadastrais do Segurado.">CPF</a></label><br />
		  		    <s:textfield theme="simple" id="seguradoClienteId" name="seguradoId" cssStyle="display:none;" />
					<s:textfield theme="simple" cssClass="requiredField" id="seguradoCpf" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].cpf" size="18" maxlength="14" onblur="checarCpfSegurado(this);" onchange="cpfSeguradoAlterado=true;setSeguradoAlterado(true);"/>
				  </td>
				  <td colspan="2">
					<label for="seguradoNome">Nome do Cliente</label><br />
					<s:textfield theme="simple" cssClass="requiredField" id="seguradoNome" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].nome" size="50" maxlength="60" onchange="setSeguradoAlterado(true);"/>
				  </td>
				  <td width="15%">
					<label for="dataNascimento">Dt. Nascimento</label><br />
					<s:textfield theme="simple" cssClass="requiredField clData" id="seguradoDataNascimento" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].dataNascimento" onblur="isValidDate(this)" size="12" maxlength="10" onchange="setSeguradoAlterado(true);"/>
				  </td>
				  <td width="15%">
					<label for="sexo">Sexo</label><br />
					<s:select theme="simple" id="seguradoSexo" headerKey="" headerValue="-- Selecione --" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].sexo" list="{'MASCULINO','FEMININO'}" onchange="setSeguradoAlterado(true);"/>
				  </td>
				  <td width="15%">
				<label for="pfEstadoCivil">Estado Civil</label><br />
				<s:select theme="simple" id="pfEstadoCivil" headerKey="" headerValue="-- Selecione --" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].estadoCivil" list="{'CASADO','DIVORCIADO','SOLTEIRO','UNIÃO ESTÁVEL','VIÚVO'}" onchange="setSeguradoAlterado(true);"/>
				  </td>
				</tr>
				<tr>
				  <td>
					<label for="rg">Identidade</label><br />
					<s:textfield theme="simple" id="seguradoRg" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].rg" size="15" maxlength="15" onchange="setSeguradoAlterado(true);"/>
				  </td>
				  <td width="20%">
					<label for="orgaoEmissor">Emissor</label><br />
					<s:textfield theme="simple" id="seguradoOrgaoEmissor" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].orgaoEmissor" size="15" maxlength="15" onchange="setSeguradoAlterado(true);"/>
				  </td>
				  <td width="15%">
					<label for="dataEmissao">Profissão</label><br />
					<s:textfield theme="simple" id="seguradoProfissao" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].profissao.descricao" size="30" maxlength="50" onchange="setSeguradoAlterado(true);"/>
				  </td>
				  <td>
					<label for="telefonePreferencial">Telef. Preferencial</label><br />
					<s:textfield theme="simple" cssClass="requiredField clFone" id="seguradoTelefonePreferencial" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].telefonePreferencial" size="16" maxlength="16" onchange="setSeguradoAlterado(true);"/>
				  </td>
				  <td>
					<label for="telefoneAlternativo">Telefone Alternativo</label><br />
					<s:textfield theme="simple" id="seguradoTelefoneAlternativo" cssClass="clFone" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].telefoneRecados" size="16" maxlength="16" onchange="setSeguradoAlterado(true);"/>
				  </td>
				  <td>
					<label for="telefoneCelular">Telefone Celular</label><br />
					<s:textfield theme="simple" id="seguradoTelefoneCelular" cssClass="clFone" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].telefoneCelular" size="16" maxlength="16" onchange="setSeguradoAlterado(true);"/>
				  </td>
				</tr>
				<tr>
				  <td colspan="2">
					<label for="email">E-mail</label><br />
					<s:textfield theme="simple" id="seguradoEmail" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].email" size="40" maxlength="80" onchange="setSeguradoAlterado(true);"/>
				  </td>
				  <td colspan="2">
					<label for="conjuge">Nome do Cônjuge</label><br />
					<s:textfield theme="simple" id="seguradoConjuge" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].conjuge" size="40" maxlength="60" onchange="setSeguradoAlterado(true);"/>
				  </td>
				  <td width="15%">
					<label for="dataNascimentoConjuge">Dt. Nascimento</label><br />
					<s:textfield theme="simple" cssClass="clData" id="seguradoDataNascimentoConj" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].dataNascimentoConj" onblur="isValidDate(this)" size="12" maxlength="10" onchange="setSeguradoAlterado(true);"/>
				  </td>
				  <td width="15%">
					<label for="sexoConjuge">Sexo</label><br />
					<s:select theme="simple" id="seguradoSexoConjuge" headerKey="" headerValue="-- Selecione --" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].sexoConjuge" list="{'MASCULINO','FEMININO'}" onchange="setSeguradoAlterado(true);"/>
				  </td>
				</tr>
				<tr>
				  <td>
					<label for="email">Prêmio Titular</label><br />
					<s:textfield theme="simple" id="premioTitular" cssClass="clValor2 currency" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].premioTitular" size="15" maxlength="15" onchange="setSeguradoAlterado(true);"/>
				  </td>
				  <td>
					<label for="conjuge">Prêmio Cônjuge</label><br />
					<s:textfield theme="simple" id="premioConjuge" cssClass="clValor2 currency" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].premioConjuge" size="15" maxlength="15" onchange="setSeguradoAlterado(true);"/>
				  </td>
				  <td>
					<label for="seguradoFormaPagamento">Forma de Pagamento</label><br />
					<s:select theme="simple" id="seguradoFormaPagamento" headerKey="" headerValue="-- Selecione --" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].formaPagamento" list="#{'0':'DEBITO EM CONTA','1':'DESCONTO EM FOLHA'}" onchange="setSeguradoAlterado(true);"/>
				  </td>
				</tr>
			  </table>
			  <s:if test="%{proposta.id == null}">
			    <table width="100%" border="0" cellpadding="2" cellspacing="0">
			      <tr>
				    <td align="right" colspan="5">
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
			      </tr>
			    </table>
			  </s:if>
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
					<s:textfield theme="simple" id="seguradoCepRes" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].cep" size="11" maxlength="9" onchange="setSeguradoAlterado(true);"/>
				  </td>
				  <td width="30%">
					<label for="lograRes">Logradouro</label><br />
					<s:textfield theme="simple" cssClass="requiredField" id="seguradoLograRes" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].logradouro" cssStyle="width:98%" maxlength="60" onchange="setSeguradoAlterado(true);"/>
				  </td>
				  <td width="30%">
					<label for="compRes">Complemento</label><br />
					<s:textfield theme="simple" id="seguradoCompRes" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].complemento" cssStyle="width:98%" maxlength="60" onchange="setSeguradoAlterado(true);"/>
				  </td>
				  <td width="15%">
					<label for="numeroRes">Numero</label><br />
					<s:textfield theme="simple" id="seguradoNumeroRes" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].numero" maxlength="6" size="8" onchange="setSeguradoAlterado(true);"/>
				  </td>
				  <td width="15%">&nbsp;
				  </td>
				</tr>
				<tr>
				  <td colspan="2">
					<label for="bairroRes">Bairro</label><br />
					<s:textfield theme="simple" cssClass="requiredField" id="seguradoBairroRes" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].bairro" cssStyle="width:98%" maxlength="50" onchange="setSeguradoAlterado(true);"/>
				  </td>
				  <td>
					<label for="cidadeRes">Cidade</label><br />
					<s:textfield theme="simple" cssClass="requiredField" id="seguradoCidadeRes" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].cidade" cssStyle="width:98%" maxlength="35" onchange="setSeguradoAlterado(true);"/>
				  </td>
				  <td>
					<label for="ufRes">UF</label><br />
					<s:select theme="simple" cssClass="requiredField" id="seguradoUfRes" headerKey="" headerValue="-- Selecione --" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].uf" list="ufList" listKey="uf" listValue="nome" onchange="setSeguradoAlterado(true);"/>
				  </td>
				  <td>
					<label for="faxRes">Fax</label><br />
					<s:textfield theme="simple" id="seguradoFaxRes" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].fax" size="16" maxlength="20" onchange="setSeguradoAlterado(true);"/>
				  </td>
				</tr>
			  </table>
			  </fieldset>
			</td>
		  </tr>
		</table>
		


<script>

$(document).ready(function(){

	$("#seguradoCepRes").autocomplete('<s:url value="/objlookup/getCepList.action" includeParams="none" />', {idFieldsToUpdate:["#seguradoBairroRes", "#seguradoCidadeRes","#seguradoUfRes","#seguradoLograRes"],mustMatch:0,minChars:6,width:300,autoFill:false,formatItemOnSelect:splitResultGetFirst});
	$("#seguradoNome").autocomplete('<s:url value="/objlookup/getClientePFListByNome.action" includeParams="none" />', {idFieldsToUpdate:["#seguradoClienteId"],onItemSelect:carregaSegurado, mustMatch:0, autoFill:false,  width:400,formatItemOnSelect:splitResultGetFirst});
	$("#seguradoCpf").autocomplete('<s:url value="/objlookup/getClienteListByCpf.action" includeParams="none" />', {idFieldsToUpdate:["#seguradoClienteId"],onItemSelect:carregaSegurado, mustMatch:0, autoFill:false,  width:400,formatItemOnSelect:splitResultGetFirst,onblur:function(){validaCPF('#seguradoCpf')}});

	$('#seguradoDataNascimento').focus();
});

// define a mascara padrão para telefone
$().ready(function() {
	// Mascara de telefone.
    $(".clCep").setMask({mask : '99999-999', autoTab: false});
    $(".clData").setMask({mask : '39/19/9999', autoTab: false});
    $(".clFone").setMask({mask : '(99) 9999-9999', autoTab: false});
    $(".clFone").DefaultValue("(__) ____-____");
    // Converte para upper e elimina brancos no inicio e brancos duplos.
    $(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
    $(".clValor1").setMask({mask : '9,999.999.999.999', type : 'reverse',defaultValue:"00"});
    $(".clValor").setMask({mask : '99',  type : 'reverse',defaultValue:"0"});
 	
 })

</script>
<% } catch (Exception e) {e.printStackTrace();}%>