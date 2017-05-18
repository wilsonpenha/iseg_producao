<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page language="java" import="java.util.*" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

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
					<td class="FieldGroupTitle_MaxSize">Gerenciar Corretora</td>
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
			<td width="18%" class="TitleCell"><label class="LabelText" for="corretoraAtual">Corretora Atual: </label></td>
			<td width="32%" class="TextBox_ContentCell">
			  <s:textfield theme="simple" id="corretoraEmUsoId" name="corretoraEmUso.id" cssStyle="display:none;"/>
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width" id="corretoraAtual" name="corretoraEmUso.nome" readonly="true"/>
			</td>
		  </tr>
		  <tr>
			<td width="18%" class="TitleCell"><label class="LabelText" for="privilegio">Selecione outra Corretora: </label></td>
			<td width="32%" class="TextBox_ContentCell">
 	  		  <s:textfield theme="simple" id="corretoraId" name="corretora.id" cssStyle="display:none;"/>
			  <s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width requiredField" id="novaCorretora" name="corretora.nome"/>
			</td>
		  </tr>
		</table>
	  </td>
	</tr>
  </table>
</div>

<script>
jQuery(document).ready(function(){

	$("#novaCorretora").autocomplete('<s:url value="/objlookup/getClienteListByNome.action" includeParams="none" />', {idFieldsToUpdate:["#corretoraId"],mustMatch:0,autoFill:false, width:400,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});

});


</script>