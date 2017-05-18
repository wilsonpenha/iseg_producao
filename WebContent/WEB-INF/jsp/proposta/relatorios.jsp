<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8"%>
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
					<td class="FieldGroupTitle_MaxSize"><s:text name="titulo"/></td>
					<td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" />" border="0"></td>
				  </tr>
				  <tr class="FieldGroup_BottomMargin"></tr>
				</tbody>
			  </table>
			</td>
		  </tr>
		  <tr>
			<td colspan="4">
			</td>
		  </tr>
		  
		  <tr>
				<td width="30%" class="TitleCell"><label class="LabelText" for="inicioPId">Data	Início: </label></td>
				<td width="10%" class="TextBox_ContentCell">
					<s:textfield theme="simple" cssClass="dojoValidateValid requiredField" id="dataInicio" name="dataInicio" maxlength="20" onblur="isValidDate(this)"/></td>
				<td width="18%" class="TitleCell"><label class="LabelText" for="terminoPId">Data Final: </label></td>
				<td width="32%" class="TextBox_ContentCell">
				    <s:textfield theme="simple" cssClass="dojoValidateValid requiredField" id="dataTermino" name="dataTermino" maxlength="20" onblur="isValidDate(this)"/></td>
		  </tr>
		  <tr>
			<td width="10%" class="TitleCell"><span class="LabelText">Data Proposta Início: </span></td>
			<td width="10%" class="TextBox_ContentCell">
			   <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_OneCells_width" id="dataPropostaInicio" name="dataPropostaInicio" maxlength="15" disabled="false" onblur="isValidDate(this)"/>
			</td>
			<td width="10%" class="TitleCell"><span class="LabelText">Data Proposta Término: </span></td>
			<td width="30%" class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_OneCells_width" id="dataPropostaTermino" name="dataPropostaTermino" maxlength="15" disabled="false" onblur="isValidDate(this)"/>
			</td>
		  </tr>
		  <tr>
			<td width="10%" class="TitleCell"><span class="LabelText">Início Vigência: </span></td>
			<td width="10%" class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_OneCells_width" id="inicioVigencia" name="inicioVigencia" maxlength="15" disabled="false" onblur="isValidDate(this)"/>
			</td>
			<td width="10%" class="TitleCell"><span class="LabelText">Término Vigência: </span></td>
			<td width="30%" class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_OneCells_width" id="terminoVigencia" name="terminoVigencia" maxlength="15" disabled="false" onblur="isValidDate(this)"/>
			</td>
		  </tr>
		  <tr>
			<td width="10%" class="TitleCell"><span class="LabelText">Ramo: </span></td>
			<td width="10%" class="TextBox_ContentCell">

			  <s:select theme="simple" cssClass="ComboKeyNoUpdatable Combo_TwoCells_width" id="ramoId" name="ramoId" list="ramoSubRamoList" listKey="id" listValue="nomeRamoSubRamo" headerKey="" headerValue="-- Selecione --" />
			</td>
			<td width="10%" class="TitleCell"><span class="LabelText">Código Seguradora: </span></td>
			<td width="30%" class="TextBox_ContentCell">
			  <s:select theme="simple" cssClass="ComboKeyNoUpdatable Combo_TwoCells_width" id="seguradoraId" name="seguradoraId" list="seguradoraList" listKey="id" listValue="nome" headerKey="" headerValue="-- Selecione --" />
			</td>
		  </tr>
		  <tr>
			<td width="10%" class="TitleCell"><span class="LabelText">Grupo de Venda: </span></td>
			<td width="10%" class="TextBox_ContentCell">
			  <s:select theme="simple" cssClass="ComboKeyNoUpdatable Combo_TwoCells_width" id="grupoVendaId" name="grupoVendaId" list="grupoVendaList" listKey="id" listValue="nomeDoGrupo" headerKey="" headerValue="-- Selecione --" />
			</td>
			<td width="10%" class="TitleCell"><span class="LabelText">Produtor: </span></td>
			<td width="30%" class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_OneCells_width" id="produtorId" name="produtorId" maxlength="15" />
			</td>
		  </tr>
  
		  <tr>
		  	<td width="10%" class="TitleCell"><span class="LabelText">Cliente: </span></td>
			<td width="10%" class="TextBox_ContentCell">
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_OneCells_width" id="clienteId" name="clienteId" maxlength="15" />
			</td>
			<td width="10%" class="TitleCell" align="left"><span class="LabelText"></span></td>
		  	<td width="30%" class="TextBox_ContentCell">
		  	    <s:textfield theme="simple" id="relatorioId" name="idRelatorio" cssStyle="display:none"/>
		  	</td>
		  </tr>
		</tr>
		</table>
	  </td>
	</tr>
	<tr>
	
	<table width="100%" cellspacing="0" cellpadding="0" align="center" >
	<tr>
	   <td class="Button_RightAlign_ContentCell">
		<div align="center">
		  <a class="ButtonLink" href="#" onclick="openWinReport();">

			<table class="Button" onmousedown="this.className='Button_active'; return true;" onmouseup="this.className='Button'; return true;" onmouseover="this.className='Button_hover'; return true;" onmouseout="this.className='Button'; return true;">
			  <tr>
				<td class="Button_left"><img src="<s:url value="/common/web/images/blank.gif" includeParams="none" />" alt="Pesquisar" width="1" height="1" border="0" class="Button_Icon Button_Icon_search" title="Pesquisar"></img></td>
				<td class="Button_text Button_width">Gerar</td>
				<td class="Button_right"></td>
			  </tr>
			</table>
		  </a>
		</div>
	  </td>
	</tr>
  </table>
  </tr>
  </table>
</div>

</form>

<script type="text/javascript">
$(document).ready(function(){

	MaskInput(document.getElementById('dataInicio'),"99/99/9999");
	MaskInput(document.getElementById('dataTermino'),"99/99/9999");
	MaskInput(document.getElementById('dataPropostaInicio'),"99/99/9999");
	MaskInput(document.getElementById('dataPropostaTermino'),"99/99/9999");
	MaskInput(document.getElementById('inicioVigencia'),"99/99/9999");
	MaskInput(document.getElementById('terminoVigencia'),"99/99/9999");
	MaskInput(document.getElementById('produtorId'),"999999");
	MaskInput(document.getElementById('clienteId'),"999999");	
});
function openWinReport(){

		if(($('#dataInicio').val() != "") && ($('#dataTermino').val() != "")){
			url ='<s:url value="/propostas.do" includeParams="none"/>?codigo='+$('#relatorioId').val()+
																	 '&dataInicio='+$('#dataInicio').val()+
																	 '&dataTermino='+$('#dataTermino').val()+
																	 '&dataPropostaInicio='+$('#dataPropostaInicio').val()+
																	 '&dataPropostaTermino='+$('#dataPropostaTermino').val()+
																	 '&inicioVigencia='+$('#inicioVigencia').val()+
																	 '&terminoVigencia='+$('#terminoVigencia').val()+
																	 '&seguradoraId='+$('#seguradoraId').val()+
																	 '&ramoId='+$('#ramoId').val()+
																	 '&grupoVendaId='+$('#grupoVendaId').val()+
																	 '&clienteId='+$('#clienteId').val()+
																	 '&produtorId='+$('#produtorId').val();
			openWin(url, 'report', '750', '500', 'resizable=yes');
		}else{
			alert('Favor, informar a data de inicio e final para geração do relatório.');
		}
}

</script>
