<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<style>
fieldset {
	padding: 5px;
	margin-bottom: 8px;
}

div {background-color: #E8E8E8;}

a.button:link {text-decoration: none}
a.button:visited {text-decoration: none}
a.button:hover {text-decoration: none;}
a.button:active {text-decoration: none}

label{
	color:#404040;
	font-family:Verdana,Arial,Helvetica,sans-serif;
	font-size:11px;
	font-weight:normal;
}

select{
	background-color:#E8E8E8;
	border:1px solid #888888;
	color:#606060;
	font-family:Verdana,Arial,Helvetica,sans-serif;
	font-size:11px;
	font-weight:bold;
}  

input{ 
	background-color:#FFFFFF;          
	border:1px solid #888888;
	color:#303030;
	font-family:Verdana,Arial,Helvetica,sans-serif;
	font-size:11px;
	font-weight:normal;
	height:18px;
	text-transform: none;
}

.transparent
{
   filter:alpha(opacity=60); 
   -moz-opacity: 0.6; 
   opacity: 0.6; 
}
</style>

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
					<td class="FieldGroupTitle_MaxSize">Menus</td>
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
		<s:if test="%{menu.pai.id != null}">
		  <tr>
			<td width="18%" class="TitleCell"></td>
			<td>
			  <s:a onClick="javascript:$('#menuId').val($('#paiId').val());document.formEdit.action='editar.action';document.formEdit.submit();" >
			  <table onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
			    <tr>
				  <td class="wButton_left"></td>
				  <td class="wButton_text wButton_width"><s:property value="pai.nome"/></td>
				  <td class="wButton_right"/>
			    </tr>
			  </table>
			  </s:a>
			</td>
			<td width="18%" class="TitleCell"></td>
			<td width="18%" class="TitleCell"></td>
		  </tr>
		</s:if>
		  <tr>
			<td width="18%" class="TitleCell"><label class="LabelText" for="ordem">Ordem: </label></td>
			<td width="32%" class="Combo_ContentCell">
 			  <s:textfield theme="simple" id="menuId" name="menu.id" cssStyle="display:none" />
 			  <s:textfield theme="simple" id="paiId" name="menu.pai.id" cssStyle="display:none" />
			  <s:textfield theme="simple" cssClass="dojoValidateValid requiredField clValor" id="ordem" name="menu.ordem" size="3" maxlength="2"/>
			</td>
			<td width="32%" class="TextBox_ContentCell"></td>
		  </tr>
			</td>
			</td>
		  </tr>
		  <tr>
			<td width="18%" class="TitleCell"><label class="LabelText" for="acao">Action: </label></td>
			<td width="32%" class="TextBox_ContentCell" colspan="3">
			  <s:textfield theme="simple" cssClass="TextBox_100percent_width" id="acao" name="menu.acao" maxlength="500"/>
			</td>
		  </tr>
		</table>
	  </td>
	</tr>
  </table>
</div>

<script>
$().ready(function() {
	// Mascara de telefone.
    $(".clValor").setMask({mask : '99',  type : 'reverse',defaultValue:"0"});
 	
 })
</script>