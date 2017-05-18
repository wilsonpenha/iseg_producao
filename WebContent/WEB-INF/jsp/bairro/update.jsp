<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>

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
				  <td class="FieldGroupTitle_MaxSize">Bairro</td>
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
		  <table cellpadding="4" cellspacing="0" align="center">
			<tr>
			  <td width="10%" class="TitleCell"><label class="LabelText" for="bairroUfId">Sigla Uf: </label></td>
			  <td width="8%" class="Textbox_ContentCell">
				<s:url var="urlUfList" value="/objlookup/ufList.action"/>
				<sx:autocompleter name="bairro.cidade.uf.uf"
							keyName="bairro.cidade.uf.id"
							id="bairroUfId"
           					href="%{#urlUfList}"
         					cssClass="ComboKeyNoUpdatable requiredField Combo_TwoCells_width"
        					cssStyle="width: 60%"
        					notifyTopics="/Changed"
        					forceValidOption="true"
        					requiredField="true"/>
			  </td>
			  <td width="8%" class="TitleCell"><label class="LabelText" for="bairroCidadeId"><a class="LabelLink" onclick="openWindowCidade();"  href="#">Cidade:</a> </label></td>
			  <td width="15%" class="Textbox_ContentCell">
				<s:url var="urlCidadesUfList" value="/objlookup/cidadesUfList.action"/>
				<sx:autocompleter name="bairro.cidade.nome"
							keyName="bairro.cidade.id" 
							id="bairroCidadeId"
							href="%{#urlCidadesUfList}"
				 			formId="formEdit"
				 			cssClass="ComboKeyNoUpdatable requiredField Combo_TwoCells_width"
				 			cssStyle="width: 95%"
				 			listenTopics="/Changed"
				 			forceValidOption="true"
				 			requiredField="true"/>
			  </td>
			  <td width="8%" class="TitleCell"><label class="LabelText" for="bairroNome">Nome: </label></td>
			  <td width="20%" class="TextBox_ContentCell">
			    <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width requiredField" id="bairroNome" name="bairro.nome" maxlength="30"/>
			  </td>
			  <td>
				<s:textfield id="formEdit_Bairro.id" name="bairro.id" cssStyle="display:none"/>
			  </td>
			</tr>
		  </table>
		</table>
	  </tr>
	</td>
  </tr>
</table>
</div>
<script type="text/javascript">	
function openWindowCidade(){
	url ='<s:url value="/cidade/novoPopup.action" includeParams="none"/>?cidade.id=';

	openWin(url, 'cidadeEdicao', '750', '500', 'resizable=yes');
}
</script>