<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	request.setAttribute("decorator", "none");
	response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.setHeader("Pragma","no-cache"); //HTTP 1.0
	response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
try {
%>

  <table cellspacing="3" cellpadding="0" align="center" class="Main_Client_TableEdition">
	  <tr>
		<td width="18%" class="TitleCell"><span class="LabelText" for="nomeId">Nome: </span></td>
		<td width="32%" class="TextBox_ContentCell">
		  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width requiredField" id="nomeId" name="pessoaFisica.nome" maxlength="60"/></td>	
		<td width="18%" class="TitleCell"><span class="LabelText">CPF: </span></td>
		<td width="32%" class="TextBox_ContentCell">
		  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width" id="cpfOuCnpjId" name="pessoaFisica.cpfOuCnpj" />
		</td>
	  </tr>
	  <tr>
		 <td width="18%" class="TitleCell"><span class="LabelText">Data de Nascimento:</span></td>
		 <td width="32%" class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid clData TextBox_TwoCells_width" id="dataNascimentoId" name="pessoaFisica.dataNascimento" onblur="isValidDate(this)"/>
		 </td>	
		 <td width="18%" class="TitleCell"><span class="LabelText" for="pessoaSexoId">Sexo: </span></td>
		 <td width="32%" class="TextBox_ContentCell">
			<s:select theme="simple" cssClass="ComboKeyNoUpdatable TextBox_TwoCells_width requiredField" id="pessoaSexoId" name="pessoaFisica.sexo" list="#{'MASCULINO':'MASCULINO','FEMININO':'FEMININO'}" headerKey="" headerValue="-- Selecione --" />
		 </td> 
	  </tr>		
	  <tr>
		  <td width="18%" class="TitleCell"><span class="LabelText">CNH: </span></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width" id="CnhId" name="pessoaFisica.cnh" maxlength="15"/>
		  </td>				
		  <td width="18%" class="TitleCell"><span class="LabelText" >Data 1º Habilitação: </span></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid clData TextBox_TwoCells_width" id="primeiraCnhId" name="pessoaFisica.data1aHabilitacao" onblur="isValidDate(this)"/>
		  </td>
	  </tr>
	  <tr>
		<td class="TitleCell"><span class="LabelText">Registro Geral: </span></td>
		<td class="TextBox_ContentCell">
		  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width" id="formEdit_produtor.matricula" name="pessoaFisica.rg" maxlength="15"/>
		</td>
		<td class="TitleCell"><span class="LabelText">Orgão Emissor: </span></td>
		<td class="TextBox_ContentCell">
		  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width" id="formEdit_produtor.orgaoEmissorId" name="pessoaFisica.orgaoEmissor" maxlength="15"/>
		</td>
	  </tr>     
	  <tr>
		<td class="TitleCell"><span class="LabelText">Data de Emissão: </span></td>
		<td class="TextBox_ContentCell">
		  <s:textfield theme="simple" cssClass="dojoValidateValid clData TextBox_TwoCells_width" id="dataEmissaoId" name="pessoaFisica.dataEmissao" onblur="isValidDate(this)"/>
		</td>
		<td class="TitleCell"><span class="LabelText">E-mail: </span></td>
		<td class="TextBox_ContentCell">
		  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width" id="emailId" name="pessoaFisica.email" onblur="isValidEmail(this)" maxlength="100"/>
		</td>
	  </tr>
	  <tr>
	    <td class="TitleCell"><span class="LabelText">Telefone Preferencial: </span></td>
	    <td class="TextBox_ContentCell">
		  <s:textfield theme="simple" cssClass="dojoValidateValid clFone TextBox_OneCells_width" id="telefoneRecadosId" name="pessoaFisica.telefonePreferencial" maxlength="30"/>
	    </td>
	  </tr>
	  <tr>
	    <td class="TitleCell"><span class="LabelText">Telefone Alternativo: </span></td>
	    <td class="TextBox_ContentCell">
	  	  <s:textfield theme="simple" cssClass="dojoValidateValid clFone TextBox_OneCells_width" id="telefoneAlternativoId" name="pessoaFisica.telefoneAlternativo" maxlength="30"/>
	    </td>
	    <td class="TitleCell"><span class="LabelText">Telefone Celular: </span></td>
	    <td class="TextBox_ContentCell">
		  <s:textfield theme="simple" cssClass="dojoValidateValid clFone TextBox_OneCells_width" id="telefoneCelularId" name="pessoaFisica.telefoneCelular" maxlength="30"/>
	    </td>
	  </tr>
	  <tr>
		<td class="TitleCell"><span class="LabelText">Apelido: </span></td>
		<td class="TextBox_ContentCell">
		  <s:textfield theme="simple" id="formEdit_produtor.id" name="produtor.id" cssStyle="display:none"/>
		  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width" id="formEdit_produtor.apelido" name="produtor.apelido" maxlength="15"/>
		</td>
		<td class="TitleCell"><span class="LabelText">Matrícula: </span></td>
		<td class="TextBox_ContentCell">
		  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width" id="formEdit_produtor.matricula" name="produtor.matricula" maxlength="10"/>
		</td>
	  </tr>
	  <tr>
		<td class="TitleCell"><label class="LabelText" for="corretoraId">Corretora: </label></td>
		<td class="Combo_ContentCell">
		  <s:textfield id="corretoraId" name="produtor.corretora.id" value="%{corretoraEmUso.id}" cssStyle="display:none" theme="simple" />
		  <s:select theme="simple" cssClass="ComboKeyNoUpdatable TextBox_TwoCells_width requiredField" value="%{corretoraEmUso.id}" disabled="true" id="corretoraId" name="produtor.corretora.id" list="corretoraList" listKey="id" listValue="razaoSocial" headerKey="" headerValue="-- Selecione --" />
		</td>
		<td class="TitleCell"><span class="LabelText">Comissao %: </span></td>
		<td class="TextBox_ContentCell">
		  <s:textfield theme="simple" cssClass="dojoValidateValid clValor2 TextBox_TwoCells_width currency" id="formEdit_produtor.comissao" name="produtor.comissao" maxlength="12"/>
		</td>
	  </tr>
	  <tr>
		<td class="TitleCell"><label class="LabelText" for="situacaoId">Situação: </label></td>
		<td class="Combo_ContentCell">
		  <s:select theme="simple" cssClass="ComboKeyNoUpdatable TextBox_TwoCells_width requiredField" id="situacaoId" name="produtor.situacao" list="#{'0':'Ativo','1':'Inativo'}" emptyOption="false" />
		</td>
		<td class="TitleCell"><label class="LabelText" for="grupoDeVendaId">Grupo de Venda: </label></td>
		<td class="TextBox_ContentCell">
			<s:select theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width requiredField" id="grupoDeVendaId" name="pessoaFisica.grupoDeVenda.id" list="grupoDeVendaList" listKey="id" listValue="nomeDoGrupo" headerKey="" headerValue="-- Selecione --" />
		</td>
	  </tr>
	  <tr>
	    <td colspan="4">
		  <table class="FieldGroup" border="0" cellpadding="0" cellspacing="0">
			<tbody>
			  <tr class="FieldGroup_TopMargin"></tr>
			  <tr>
				<td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></td>
				<td class="FieldGroupTitle">Endereço Principal</td>
				<td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></td>
				<td class="FieldGroupContent"></td>
			  </tr>
			  <tr class="FieldGroup_BottomMargin"></tr>
			</tbody>
		  </table>
	    </td>
	  </tr>
	  <tr>
		<td width="12%" class="TitleCell"><label class="LabelText" for=enderecoCep>CEP: </label></td>
		<td width="38%" class="TextBox_ContentCell">
		  <s:textfield theme="simple" id="enderecoId" name="produtor.enderecoCollection[0].id" cssStyle="display:none;" />
		  <s:textfield theme="simple" cssClass="dojoValidateValid requiredField" id="enderecoCep" name="pessoaFisica.enderecoCollection[0].cep.valor" maxlength="9"/>
		</td>
		<td class="TitleCell"><span class="LabelText">Logradouro: </span></td>
		<td class="TextBox_ContentCell">
		  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width" id="enderecoLogradouro" name="pessoaFisica.enderecoCollection[0].logradouro" maxlength="60"/>
		</td>
	  </tr>
	  <tr>
		<td class="TitleCell"><label class="LabelText" for="enderecoNumero">Número: </label></td>
		<td class="TextBox_ContentCell">
		  <s:textfield theme="simple" cssClass="dojoValidateValid requiredField TextBox_TwoCells_width" id="enderecoNumero" name="pessoaFisica.enderecoCollection[0].numero" maxlength="6" size="11"/>
		</td>
		<td class="TitleCell"><label class="LabelText" for="complementoId">Complemento: </label></td>
		<td class="TextBox_ContentCell">
		  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width" id="complementoId" name="pessoaFisica.enderecoCollection[0].complemento" maxlength="60"/>
		</td>
	  </tr>
	  <tr>
		<td class="TitleCell"><label class="LabelText" for="enderecoBairroId">Bairro:</label></td>
		<td class="Textbox_ContentCell">
		  <s:textfield theme="simple" cssClass="dojoValidateValid requiredField TextBox_TwoCells_width" id="enderecoBairroId" name="pessoaFisica.enderecoCollection[0].bairro" maxlength="50"/>
		</td>
		<td class="TitleCell" align="left"><label class="LabelText" for="enderecoCidadeId">Cidade:</label></td>
		<td class="Textbox_ContentCell">
		  <s:textfield theme="simple" cssClass="dojoValidateValid requiredField TextBox_TwoCells_width" id="enderecoCidadeId" name="pessoaFisica.enderecoCollection[0].cidade" maxlength="35"/>		  			
		</td>
	  </tr>
	  <tr>
		<td class="TitleCell" align="left"><label class="LabelText" for="estadoSigla">UF: </label></td>
		<td class="Textbox_ContentCell">
		  <s:select theme="simple" cssClass="requiredField TextBox_TwoCells_width" id="estadoSigla" headerKey="" headerValue="-- Selecione --" name="pessoaFisica.enderecoCollection[0].uf" list="ufs" listKey="uf" listValue="nome" onchange="setAlterado(true);"/>
		</td>
		<td class="TitleCell" align="left"><label class="LabelText" for="enderecoTipoBairro">Tipo Endereço: </label></td>
		<td class="TextBox_ContentCell">
		  <s:select theme="simple" cssClass="ComboKeyNoUpdatable TextBox_TwoCells_width requiredField" id="enderecoTipoBairro" name="pessoaFisica.enderecoCollection[0].tipoEndereco" list="#{'C':'COMERCIAL','R':'RESIDENCIAL'}" headerKey="" headerValue="-- Selecione --" />
		</td>
	  </tr>
	  <tr>
		<td class="TitleCell" align="left"><span class="LabelText">Telefone: </span></td>
		<td class="Textbox_ContentCell">
		  <s:textfield theme="simple" cssClass="dojoValidateValid clFone TextBox_TwoCells_width" id="foneId" name="pessoaFisica.enderecoCollection[0].telefone" maxlength="16"/>
		</td>
		<td class="TitleCell"><span class="LabelText">Fax: </span></td>
		<td class="TextBox_ContentCell">
		  <s:textfield theme="simple" cssClass="dojoValidateValid clFone TextBox_TwoCells_width" id="faxId" name="pessoaFisica.enderecoCollection[0].fax" maxlength="16"/>
		</td>
	  </tr>
   </table>
   
   <script>

$().ready(function() {
	// Mascara de telefone.
    $(".clCep").setMask({mask : '99999-999', autoTab: false});
    $(".clData").setMask({mask : '39/19/9999', autoTab: false});
    $(".clSusep").setMask({mask : '9999999'});
    $(".clFone").setMask({mask : '(99) 9999-9999', autoTab: false});
    $(".clFone").DefaultValue("(__) ____-____");
    $(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
    $(".clValor1").setMask({mask : '9,999.999.999.999', type : 'reverse',defaultValue:"00"});
    $(".clValor51").setMask({mask : '9,999', type : 'reverse',defaultValue:"00"});
    $(".clValor").setMask({mask : '99',  type : 'reverse',defaultValue:"0"});
 	
 })

   </script>
<% } catch (Exception e) {e.printStackTrace();}%>