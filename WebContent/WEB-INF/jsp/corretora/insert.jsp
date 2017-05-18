<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<h3 align="left"><b><font face="Arial, Verdana" color="#663300"></font></b></h3>
<div align="left">
<table width="100%" border="0">
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
				  <td class="FieldGroupTitle_MaxSize">Corretora</td>
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
		  <td width="18%" class="TitleCell"><label class="LabelText" for="razaoSocial">Razão Social: </label></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:textfield theme="simple" id="usarCoberturasAssessoria" name="corretora.usarCoberturasAssessoria" value="true" cssStyle="display:none" />
			<s:textfield theme="simple" id="id" name="corretora.id" cssStyle="display:none" />
			<s:textfield theme="simple" id="smsPropostaEfetivada" name="corretora.smsPropostaEfetivada" cssStyle="display:none" />
			<s:textfield theme="simple" id="assessoriaId" name="corretora.assessoria.id" value="%{corretoraEmUso.id}" cssStyle="display:none" />
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width requiredField" id="razaoSocial" name="corretora.razaoSocial" maxlength="60" />
		  </td>
		  <td width="18%" class="TitleCell"><label class="LabelText" for="cpfOuCnpj">CNPJ: </label></td>
		  <td width="32%" class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width requiredField" id="cpfOuCnpj" name="corretora.cpfOuCnpj" />
		  </td>
		</tr>
		<tr>
		  <td class="TitleCell"><label class="LabelText" for="nomeId">Nome: </label></td>
		  <td class="TextBox_ContentCell">
			<s:textfield theme="simple"	cssClass="dojoValidateValid TextBox_TwoCells_width requiredField" id="nomeId" name="corretora.nome" maxlength="60" />
		  </td>
		  <td class="TitleCell"><span class="LabelText">Inscrição Municipal: </span></td>
		  <td class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width" id="inscricaoMunicipal" name="corretora.inscricaoMunicipal"	maxlength="15" />
		  </td>
		</tr>
		<tr>
		  <td class="TitleCell"><label class="LabelText" for="dataFundacao">Data de Fundação: </label></td>
		  <td class="TextBox_ContentCell">
		    <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width" id="dataFundacao" name="corretora.dataFundacao"	onblur="isValidDate(this)" />
		  </td>
		  <td class="TitleCell"><label class="LabelText" for="atividadeComercialId">Atividade Comercial: </label></td>
		  <td class="Combo_ContentCell">
			<s:select theme="simple" cssClass="ComboKeyNoUpdatable Combo_TwoCells_width requiredField" id="atividadeComercialId" name="corretora.atividadeComercial.id" list="atividadeComercialList" listKey="id" listValue="valor" headerKey="" headerValue="-- Selecione --" />
		  </td>
		</tr>
		<tr>
		  <td class="TitleCell"><label class="LabelText" for="inscricaoSusepId">Inscrição SUSEP: </label></td>
		  <td class="TextBox_ContentCell">
			<s:textfield theme="simple"	cssClass="dojoValidateValid TextBox_TwoCells_width requiredField" id="inscricaoSusepId" name="corretora.inscricaoSusep"	maxlength="25" />
		  </td>
		  <td class="TitleCell"><span class="LabelText">Pessoa de Contato: </span></td>
		  <td class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width" id="pessoaContato" name="corretora.pessoaContato" maxlength="60" />
		  </td>
		</tr>
		<tr>
		  <td class="TitleCell"><span class="LabelText">Site: </span></td>
		  <td class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width"	id="siteHomePage" name="corretora.siteHomePage" maxlength="100" />
		  </td>
		  <td class="TitleCell"><span class="LabelText">Inscrição Estadual: </span></td>
		  <td class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width"	id="inscrEstadual" name="corretora.inscrEstadual" maxlength="14" />
		  </td>
		</tr>
		<tr>
		  <td class="TitleCell"><span class="LabelText">Telefone: </span></td>
		  <td class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width" id="telefones" name="corretora.telefones" maxlength="40" />
		  </td>
		  <td class="TitleCell"><label class="LabelText" for="responsavelId">Responsável: </label></td>
		  <td class="Combo_ContentCell">
			<s:select theme="simple" cssClass="ComboKeyNoUpdatable Combo_TwoCells_width requiredField" id="responsavelId" name="corretora.pessoaFisica.id" list="responsavelList" listKey="id" listValue="nome" headerKey="" headerValue="-- Selecione --" />
		  </td>
		</tr>
		<tr>
		  <td class="TitleCell"><span class="LabelText">E-mail: </span></td>
		  <td class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width" id="email" name="corretora.email" maxlength="40" />
		  </td>
		  <td class="TitleCell"><span class="LabelText">Arquivo Logo Marca (nome.jpg): </span></td>
		  <td class="TextBox_ContentCell">
			<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width requiredField" id="imagemLogo" name="corretora.imagemLogo" maxlength="60" />
		  </td>
		</tr>
		<tr>
		  <td class="TitleCell"><span class="LabelText">% Repasse de Comissão Padrão: </span></td>
		  <td class="TextBox_ContentCell">
            <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width requiredField clValor2 currency" size="15" name="corretora.percentualRepasse" id="percentualRepasse" />
		  </td>
		  <td class="TitleCell"><span class="LabelText">% Repasse de Agenciamento Padrão: </span></td>
		  <td class="TextBox_ContentCell">
            <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width requiredField clValor2 currency" size="15" name="corretora.agenciamentoRepasse" id="agenciamentoRepasse" />
		  </td>
		</tr>
		<tr>
 		  <td width="18%" class="TitleCell"><label class="LabelText" for="isAssessarada">Vinculada a Assessoria?: </label></td>
		  <td width="32%" class="Combo_ContentCell">
		    <s:select theme="simple" cssClass="ComboKeyNoUpdatable 100percent_width requiredField" id="isAssessarada" name="corretora.isAssessorada" list="#{'true':'SIM','false':'NÃO'}" headerKey="" headerValue="-- Selecione --" maxlength="15"/>
		  </td>
 		  <td width="18%" class="TitleCell"><label class="LabelText" for="usarPosVenda">Ativar Pós-Venda?: </label></td>
		  <td width="32%" class="Combo_ContentCell">
		    <s:select theme="simple" cssClass="ComboKeyNoUpdatable 100percent_width requiredField" id="usarPosVenda" name="corretora.usarPosVenda" list="#{'true':'SIM','false':'NÃO'}" emptyOption="false" />
		  </td>
		</tr>
		<tr>
 		  <td width="18%" class="TitleCell"><label class="LabelText" for="smsTextoInforma">Texto SMS Informa: </label></td>
		  <td width="32%" class="Combo_ContentCell">
            <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width requiredField" size="15" name="corretora.smsTextoInforma" id="smsTextoInforma" maxlength="15" />
		  </td>
 		  <td width="18%" class="TitleCell"><label class="LabelText" for="smsPropostaEfetivada">SMS ao efetivar proposta?: </label></td>
		  <td width="32%" class="Combo_ContentCell">
		    <s:select theme="simple" cssClass="ComboKeyNoUpdatable 100percent_width requiredField" id="smsPropostaEfetivada" name="corretora.smsPropostaEfetivada" list="#{'true':'SIM','false':'NÃO'}" emptyOption="false" />
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
			  <s:textfield theme="simple" id="enderecoId" name="corretora.enderecoCollection[0].id" cssStyle="display:none;" />
			  <s:textfield theme="simple" cssClass="dojoValidateValid requiredField" id="enderecoCep" name="corretora.enderecoCollection[0].cep.valor" maxlength="9"/>
			</td>
			<td width="12%" class="TitleCell"><span class="LabelText">Logradouro: </span></td>
			<td width="38%" class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_100percent_width" id="enderecoLogradouro" name="corretora.enderecoCollection[0].logradouro" maxlength="60"/>
			</td>
		  </tr>
		  <tr>
			<td class="TitleCell"><label class="LabelText" for="enderecoNumero">Número: </label></td>
			<td class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="dojoValidateValid requiredField TextBox_100percent_width" id="enderecoNumero" name="corretora.enderecoCollection[0].numero" maxlength="6" size="11"/>
			</td>
			<td class="TitleCell"><label class="LabelText" for="complementoId">Complemento: </label></td>
			<td class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_100percent_width" id="complementoId" name="corretora.enderecoCollection[0].complemento" maxlength="60"/>
			</td>		  
		  </tr>
		  <tr>
			<td class="TitleCell"><label class="LabelText" for="enderecoBairroId">Bairro:</label></td>
			<td class="Textbox_ContentCell">
			  <s:textfield theme="simple" cssClass="dojoValidateValid requiredField TextBox_100percent_width" id="enderecoBairroId" name="corretora.enderecoCollection[0].bairro" maxlength="50"/>
			</td>
			<td class="TitleCell" align="left"><label class="LabelText" for="enderecoCidadeId">Cidade:</label></td>
			<td class="Textbox_ContentCell">
			  <s:textfield theme="simple" cssClass="dojoValidateValid requiredField TextBox_100percent_width" id="enderecoCidadeId" name="corretora.enderecoCollection[0].cidade" maxlength="35"/>		  			
			</td>
		  </tr>
		  <tr>
			<td class="TitleCell" align="left"><label class="LabelText" for="estadoSigla">Uf: </label></td>
			<td class="Textbox_ContentCell">
			  <s:select theme="simple" cssClass="requiredField" id="estadoSigla" headerKey="" headerValue="-- Selecione --" name="corretora.enderecoCollection[0].uf" list="ufs" listKey="uf" listValue="nome" onchange="setAlterado(true);"/>
			</td>
			<td class="TitleCell" align="left"><label class="LabelText" for="enderecoTipoBairro">Tipo Endereço : </label></td>
			<td class="TextBox_ContentCell">
			  <s:select theme="simple" cssClass="ComboKeyNoUpdatable Combo_OneCell_width requiredField" id="enderecoTipoBairro" name="corretora.enderecoCollection[0].tipoEndereco" list="#{'C':'COMERCIAL','R':'RESIDENCIAL'}" headerKey="" headerValue="-- Selecione --" />
			</td>
		  </tr>
		  <tr>
			<td class="TitleCell" align="left"><span class="LabelText">Telefone: </span></td>
			<td class="Textbox_ContentCell">
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_100percent_width" id="foneId" name="corretora.enderecoCollection[0].telefone" maxlength="30"/>
			</td>
			<td class="TitleCell"><span class="LabelText">Fax: </span></td>
			<td class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_100percent_width" id="faxId" name="corretora.enderecoCollection[0].fax" maxlength="30"/>
			</td>
		  </tr>
		<s:if test="usuarioEmUso.nomeLogin=='ADMIN'">	
		<tr>
		  <td colspan="4">
			<table class="FieldGroup" border="0" cellpadding="0" cellspacing="0">
			  <tbody>
				<tr class="FieldGroup_TopMargin"></tr>
				<tr>
				  <td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" />" border="0"></td>
				  <td class="FieldGroupTitle_MaxSize">SMS Manager</td>
				  <td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" />" border="0"></td>
				</tr>
				<tr class="FieldGroup_BottomMargin"></tr>
			  </tbody>
			</table>
		  </td>
		</tr>
		<tr>
 		  <td width="18%" class="TitleCell"><label class="LabelText" for="smsIsAtivo">Ativar Serviço SMS?: </label></td>
		  <td width="32%" class="Combo_ContentCell">
		    <s:select theme="simple" cssClass="ComboKeyNoUpdatable 100percent_width requiredField" id="smsIsAtivo" name="corretora.smsIsAtivo" list="#{'true':'SIM','false':'NÃO'}" headerKey="" headerValue="-- Selecione --" />
		  </td>
 		  <td width="18%" class="TitleCell"><label class="LabelText" for="smsPropostaEfetivada">SMS ao efetivar proposta?: </label></td>
		  <td width="32%" class="Combo_ContentCell">
		    <s:select theme="simple" cssClass="ComboKeyNoUpdatable 100percent_width requiredField" id="smsPropostaEfetivada" name="corretora.smsPropostaEfetivada" list="#{'true':'SIM','false':'NÃO'}" emptyOption="false" />
		  </td>
		</tr>
		<tr>
		  <td class="TitleCell"><span class="LabelText">Franquia de envios: </span></td>
		  <td class="TextBox_ContentCell">
            <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width requiredField clValor5 currency" size="15" name="corretora.smsFranquiaBasica" id="smsFranquiaBasica" />
		  </td>
		  <td class="TitleCell"><span class="LabelText">Reserva p/ consultas: </span></td>
		  <td class="TextBox_ContentCell">
            <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width requiredField clValor5 currency" size="15" name="corretora.smsReservaConsulta" id="smsReservaConsulta" onblur="if (this.value % 2 != 0){alert('Informe um numero par!'); this.value=0;setTimeout(function(){this.focus();},50);}" />
		  </td>
		</tr>
		</s:if>
		<s:else>
		  <s:textfield theme="simple" name="corretora.smsIsAtivo" id="smsIsAtivo" cssStyle="display:none;"/>
		  <s:textfield theme="simple" name="corretora.smsPropostaEfetivada" id="smsPropostaEfetivada" cssStyle="display:none;"/>
		  <s:textfield theme="simple" name="corretora.smsFranquiaBasica" id="smsFranquiaBasica" cssStyle="display:none;"/>
		  <s:textfield theme="simple" name="corretora.smsReservaConsulta" id="smsReservaConsulta" cssStyle="display:none;"/>
		</s:else>
		  <s:textfield theme="simple" name="corretora.smsCreditosTotal" id="smsCreditosTotal" cssStyle="display:none;"/>
		  <s:textfield theme="simple" name="corretora.smsEnviadosTotal" id="smsEnviadosTotal" cssStyle="display:none;"/>
	  </table>
	</td>
  </tr>
</table>
</div>
	
<script type="text/javascript">

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
    $(".clValor").setMask({mask : '99', defaultValue:"0"});
 	
 })

function openWindowCidade(){
	url ='<s:url value="/cidade/novoPopup.action" includeParams="none"/>?cidade.id=';
	openWin(url, 'cidadeEdicao', '750', '500', 'resizable=yes');
}
function openWindowBairro(){
	url ='<s:url value="/bairro/novoPopup.action" includeParams="none"/>?bairro.id=';
	openWin(url, 'bairroEdicao', '750', '500', 'resizable=yes');
}

$(document).ready(function(){
	MaskInput(document.getElementById('cpfOuCnpj'),"99.999.999/9999-99");
	MaskInput(document.getElementById('dataFundacao'),"99/99/9999");


	$("#enderecoCep").autocomplete('<s:url value="/objlookup/getEnderecoCepAC.action" includeParams="none" />',{name:"endereco.cep",idFieldsToUpdate:["#enderecoBairroId", "#enderecoCidadeId","#estadoSigla","#enderecoLogradouro"],mustMatch:0,minChars:6,width:300,autoFill:false,formatItemOnSelect:splitResultGetFirst});

});
</script>