<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
					<td class="FieldGroupTitle_MaxSize">Telefones SMS</td>
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
			<td width="18%" class="TitleCell"><label class="LabelText" for="privilegio">Telefone Celular: </label></td>
			<td width="32%" class="TextBox_ContentCell">
			  <s:textfield theme="simple" id="smsTelefonesProdutorId" name="smsTelefonesProdutor.id" cssStyle="display:none" />
			  <s:textfield theme="simple" id="produtorId" name="smsTelefonesProdutor.produtor.id" cssStyle="display:none" />
	            <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width requiredField clFone" name="smsTelefonesProdutor.telefoneCelular" id="telefoneCelular" />
			</td>
			<td width="18%" class="TitleCell"></td>
			<td width="32%" class="TextBox_ContentCell">
			  &nbsp;
			</td>
		  </tr>
		  <tr>
			 <td class="TitleCell"><label class="LabelText" for="nomeId">Denominação: </label></td>
			 <td class="TextBox_ContentCell">
	            <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width requiredField" name="smsTelefonesProdutor.descricao" id="descricao" />
			 </td>
		  </tr>
		  <tr>
			<td width="18%" class="TitleCell"><label class="LabelText" for="statusId">Situação: </label></td>
			<td width="32%" class="Combo_ContentCell">
			  <s:select theme="simple" cssClass="ComboKeyNoUpdatable 100percent_width requiredField" id="statusId" name="smsTelefonesProdutor.isAtivo" list="#{'true':'ATIVO','false':'INATIVO'}" emptyOption="false"/>
			</td>
		  </tr>
		</table>
	  </td>
	</tr>
  </table>
</div>

</form>

<form name="formSmsTelefonesTabs">
  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

	<input type="hidden" name="produtor.id" value="<s:property value="smsTelefonesProdutor.produtor.id"/>"/>
	<input type="hidden" name="contaCorrente.pessoa.id" value="<s:property value="smsTelefonesProdutor.produtor.id"/>"/>
	<input type="hidden" name="endereco.pessoa.id" value="<s:property value="smsTelefonesProdutor.produtor.id"/>"/>
