<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<link rel="stylesheet" href="<s:url value="/common/wizardFinal/esquema.css" includeParams="none"/>" type="text/css" />
<link rel="stylesheet" type="text/css" href="<s:url value="/common/jquery.autocomplete.css" includeParams="none"/>"></link>           
<link rel="stylesheet" type="text/css" href="<s:url value="/common/styles/loader/loader.css" includeParams="none"/>"></link>
<link rel="stylesheet" type="text/css" href="<s:url value="/common/web/skins/Default/Main/Main_Edition.css" includeParams="none" />" id="paramCSS"></link>

<h3 align="left"><b><font face="Arial, Verdana" color="#663300"></font></b></h3>
<div align="left">
  <input type="button" id="btnf3" style="display: none"/>
  <input type="button" id="btnf4" style="display: none"/>
  <table width="100%" border="0" hight="100%">
	<tr>
	  <td>
		<table cellspacing="3" cellpadding="0" align="center" class="Main_Client_TableEdition">
		  <tr>
			<td colspan="4">
			  <table class="FieldGroup" border="0" cellpadding="0" cellspacing="0">
				<tbody>
				  <tr class="FieldGroup_TopMargin"></tr>
				  <tr>
					<td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" />" border="0"></td>
					<td class="FieldGroupTitle_MaxSize">Produtor</td>
					<td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" />" border="0"></td>
				  </tr>
				  <tr class="FieldGroup_BottomMargin"></tr>
				</tbody>
			  </table>
			</td>
		  </tr>
		  <tr>
			<td colspan="4">
			  <div id="divMessages" style="padding-bottom: 10px;">
				<s:actionerror/>
				<s:actionmessage/>
				<s:fielderror/>
			  </div>
			</td>
		  </tr>
		  <tr>
			<td width="18%" class="TitleCell"><label class="LabelText" for="nomeId">Nome: </label></td>
			<td width="32%" class="TextBox_ContentCell">
	      <s:textfield theme="simple" id="tipoCliente" name="tipoCliente" cssStyle="display:none;" />
	      <s:textfield theme="simple" id="tipoClienteSN" name="tipoClienteSN" cssStyle="display:none;" />
              <s:textfield theme="simple" id="id" name="produtor.id" cssStyle="display:none"/>
              <s:textfield theme="simple" id="id" name="pessoaFisica.id" cssStyle="display:none"/>
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width requiredField" id="nomeId" name="pessoaFisica.nome" maxlength="60"/></td>	
			<td width="18%" class="TitleCell"><span class="LabelText">CPF: </span></td>
			<td width="32%" class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width" id="cpfOuCnpjId" name="pessoaFisica.cpfOuCnpj" />
			</td>
		  </tr>
		  <tr>
		  <td width="18%" class="TitleCell"><span class="LabelText">Data de Nascimento:</span></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid clData Combo_OneCell_width" id="dataNascimentoId" name="pessoaFisica.dataNascimento" onblur="isValidDate(this)"/>
		  </td>	
		  <td width="18%" class="TitleCell"><label class="LabelText" for="pessoaSexoId">Sexo: </label></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:select theme="simple" cssClass="ComboKeyNoUpdatable Combo_OneCell_width requiredField" id="pessoaSexoId" name="pessoaFisica.sexo" list="#{'MASCULINO':'MASCULINO','FEMININO':'FEMININO'}" headerKey="" headerValue="-- Selecione --" />
		  </td>
		  
		</tr>		
		<tr>
		  <td width="18%" class="TitleCell"><span class="LabelText">CNH: </span></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid Combo_OneCell_width" id="CnhId" name="pessoaFisica.cnh" maxlength="15"/>
		  </td>				
		  <td width="18%" class="TitleCell"><span class="LabelText" >Data 1º Habilitação: </span></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid clData TextBox_100percent_width" id="primeiraCnhId" name="pessoaFisica.data1aHabilitacao" onblur="isValidDate(this)"/>
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
			  <s:textfield id="corretoraId" name="produtor.corretora.id" cssStyle="display:none" theme="simple" />
			  <s:select theme="simple" cssClass="ComboKeyNoUpdatable TextBox_TwoCells_width requiredField" disabled="true" id="corretoraId" name="produtor.corretora.id" list="corretoraList" listKey="id" listValue="razaoSocial" headerKey="" headerValue="-- Selecione --" />
			</td>
			<td class="TitleCell"><span class="LabelText">Comissao %: </span></td>
			<td class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="dojoValidateValid clValor2 TextBox_TwoCells_width currency" id="formEdit_produtor.comissao" name="produtor.comissao" maxlength="12"/>
			</td>
		  </tr>
		  <tr>
			<td class="TitleCell"><label class="LabelText" for="situacaoId">Situação: </label></td>
			<td class="Combo_ContentCell">
			  <s:select theme="simple" cssClass="ComboKeyNoUpdatable 100percent_width requiredField" id="situacaoId" name="produtor.situacao" list="#{'0':'Ativo','1':'Inativo'}" emptyOption="false" />
			</td>
			<td class="TitleCell"><label class="LabelText" for="grupoDeVendaId">Grupo de Venda: </label></td>
			<td class="TextBox_ContentCell">
				<s:select theme="simple" cssClass="dojoValidateValid TextBox_100percent_width requiredField" id="grupoDeVendaId" name="pessoaFisica.grupoDeVenda.id" list="grupoDeVendaList" listKey="id" listValue="nomeDoGrupo" headerKey="" headerValue="-- Selecione --" onchange="alert('Esta alteração não tem efeito sobre proposta existentes!\n');"/>
			</td>
		  </tr>
		</table>
	  </td>
	</tr>
  </table>
</div>
</form>

<div id="paramProdutor" style="display:none" >
  <form id="paramFormProdutor" name="paramFormProdutor">
    <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>
  
	<input type="hidden" name="produtor.id">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="Main_ContentPane_TabPane" id="tdtopTabs">
		<tr id="paramParentTabContainer">
			<td class="tabBackGroundInit" style="background-color: #505050"></td>
		</tr>
		<tr id="paramMainTabContainer">
		  <td class="tabBackGroundInit" style="background-color: #505050">
			  <span style="color:#FFFFFF; font-size:8pt; font-weight:bold; height:26px !important; padding:0 4px; text-align:center; white-space:nowrap;">
				  Novo Produtor
			  </span>
		  </td>
		</tr>
	</table>
  <div align="center" style="border: solid 1px #505050; padding: 10px;" >
  <div id="pessoaFisica">
  <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2" class="TitleCell" style="text-align: left">
      <input type="radio" id="pf" name="tipoClienteSN" value="0" checked="checked"  />
      <label class="LabelText" style="cursor:pointer;" for="pf">Pessoa Física</label>
    </td>
  </tr>
  </table>
  </div>
  <div id="pessoaJuridicaComPerfil">
  <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2" class="TitleCell" style="text-align: left">
      <input type="radio" id="pjComPerfil" name="tipoClienteSN" value="1"/>
      <label class="LabelText" style="cursor:pointer;" for="pjComPerfil">Pessoa Jurídica</label>
    </td>
  </tr>
  </table>
  </div>
  <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2" class="TitleCell" style="text-align: left">&nbsp;</td>
  </tr>
  <tr>
  	<td><div align="center">
		<input type="button" id="btnf2" style="display: none;" onclick="submitForm(document.paramFormProdutor, '<s:url action="novo.action" includeParams="none" />', false);"/>
  		<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton"
		onclick="document.getElementById('btnf2').click()">
		<tr>
            <td class="wButton_left"></td>
            <td class="wButton_text wButton_width" > OK </td>
            <td class="wButton_right"/>
        </tr>
    </table></div>
    </td>
  	<td><div align="center">
		<input type="button" class="modalClose" id="btnf9" style="display: none;"/>
  		<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton"
		onclick="document.getElementById('btnf9').click()">
		<tr>
            <td class="wButton_left"></td>
            <td class="wButton_text wButton_width">Cancelar</td>
            <td class="wButton_right"/>
        </tr>
    </table></div>
    <input type="button" id="btnf11" style="display: none;" onclick="mostrarMenu('buttonMenu');setTimeout('init()',300);return false;"/>
    </td>
    </tr>
  </table>
  </div>
  </form>
  </div>

<div id="paramProdutorSalvarNovo" style="display:none" >
  <form id="paramFormProdutorSN" name="paramFormProdutorSN">
    <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>
  
	<input type="hidden" name="produtor.id">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="Main_ContentPane_TabPane" id="tdtopTabs">
		<tr id="paramParentTabContainer">
			<td class="tabBackGroundInit" style="background-color: #505050"></td>
		</tr>
		<tr id="paramMainTabContainer">
		  <td class="tabBackGroundInit" style="background-color: #505050">
			  <span style="color:#FFFFFF; font-size:8pt; font-weight:bold; height:26px !important; padding:0 4px; text-align:center; white-space:nowrap;">
				  Novo Produtor
			  </span>
		  </td>
		</tr>
	</table>
  <div align="center" style="border: solid 1px #505050; padding: 10px;" >
  <div id="pessoaFisica">
  <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2" class="TitleCell" style="text-align: left">
      <input type="radio" id="pfSN" name="tipoCliente" value="0" checked="checked" onClick="$('#tipoClienteSN').val(0);" />
      <label class="LabelText" style="cursor:pointer;" for="pfSN">Pessoa Física</label>
    </td>
  </tr>
  </table>
  </div>
  <div id="pessoaJuridicaComPerfil">
  <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2" class="TitleCell" style="text-align: left">
      <input type="radio" id="pjSN" name="tipoCliente" value="1" onClick="$('#tipoClienteSN').val(1)" />
      <label class="LabelText" style="cursor:pointer;" for="pjSN">Pessoa Jurídica</label>
    </td>
  </tr>
  </table>
  </div>
  <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2" class="TitleCell" style="text-align: left">&nbsp;</td>
  </tr>
  <tr>
  	<td><div align="center">
		<input type="button" id="btnf5" style="display: none;" onclick="submitForm(document.formEdit, '<s:url action="salvarNovo.action" includeParams="none" />', true);"/>
  		<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton"
		onclick="document.getElementById('btnf5').click()">
		<tr>
            <td class="wButton_left"></td>
            <td class="wButton_text wButton_width" > OK </td>
            <td class="wButton_right"/>
        </tr>
    </table></div>
    </td>
  	<td><div align="center">
		<input type="button" class="modalClose" id="btnf9" style="display: none;"/>
  		<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton"
		onclick="document.getElementById('btnf9').click()">
		<tr>
            <td class="wButton_left"></td>
            <td class="wButton_text wButton_width">Cancelar</td>
            <td class="wButton_right"/>
        </tr>
    </table></div>
    <input type="button" id="btnf11" style="display: none;" onclick="mostrarMenu('buttonMenu');setTimeout('init()',300);return false;"/>
    </td>
    </tr>
  </table>
  </div>
  </form>
  </div>
  
<form name="formProdutorTabs">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

<input type="hidden" name="endereco.pessoa.id" value="<s:property value="produtor.id"/>"/>
<input type="hidden" name="contaCorrente.pessoa.id" value="<s:property value="produtor.id"/>"/>
<input type="hidden" name="smsTelefonesProdutor.produtor.id" value="<s:property value="produtor.id"/>"/>
	
	
<script type="text/javascript">

$(document).ready(function(){

	MaskInput(document.getElementById('cpfOuCnpjId'),"999.999.999-99");

});	


$(document).ready(function () {
	$('#btnf3').click(function (e) {
		e.preventDefault();
		$('#paramProdutor').modal({onShow: modalShow, close: false});
	});

});

$(document).ready(function () {
	$('#btnf4').click(function (e) {
		e.preventDefault();
		$('#paramProdutorSalvarNovo').modal({onShow: modalShow, close: false});
	});

});

function modalShow (dialog) {
//	setTimeout(function(){paramNovaProposta();},2000);
}

</script>