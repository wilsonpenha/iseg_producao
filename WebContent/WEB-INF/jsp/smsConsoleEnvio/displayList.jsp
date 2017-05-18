<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page language="java" import="java.util.*" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

 <table width="100%" cellspacing="0" cellpadding="0" align="center" class="Main_Client_TableEdition">
  <tr>
	<td colspan="4">
	  <table class="FieldGroup" border="0" cellpadding="0" cellspacing="0">
		<tbody>
		  <tr class="FieldGroup_TopMargin"></tr>
		  <tr>
			<td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" />" border="0"></td>
			<td class="FieldGroupTitle_MaxSize">Envio de SMS</td>
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
	  <div id="divResult" style="padding-bottom: 10px;" style="color: red"></div>
	</td>
  </tr>
	<tr>
	  <td width="30%" class="TitleCell"><label class="LabelText" for="clienteNome">Pessoa Física/Jurídica</label></td>
	  <td width="32%" class="TextBox_ContentCell">
		<s:textfield theme="simple" id="pessoaId" name="pessoa.id" cssStyle="display:none;"/>
		<s:textfield theme="simple" id="nome" cssClass="TextBox_100percent_width" name="pessoa.nome" />
	  </td>
	  <td width="38%">&nbsp;</td>
	</tr>
	<tr>
	  <td width="30%" class="TitleCell"><label class="LabelText" for="clienteCpfCnpj">CPF/CNPJ</label></td>
	  <td width="32%" class="TextBox_ContentCell">
		<s:textfield theme="simple" id="cpfOuCnpj" cssClass="dojoValidateValid TextBox_100percent_width" name="pessoa.cpfOuCnpj" />
	  </td>
	  <td width="38%">&nbsp;</td>
	</tr>
	<tr>
	  <td class="TitleCell"><label class="LabelText" for="mensagem">Mensagem (Máximo 145 caract.): </label></td>
	  <td class="TextBox_ContentCell">
	     <s:textarea theme="simple" cssClass="dojoValidateValid requiredField TextArea_TwoCells_width TextArea_Medium_height" rows="3" id="mensagem" name="mensagem" onkeyup="return checkMaxLength(this, 145);" />
	  </td>
	</tr>
	<tr>
	  <td class="TitleCell"><span class="LabelText">Telefone Celular: </span></td>
	  <td class="TextBox_ContentCell">
		<s:textfield theme="simple" cssClass="dojoValidateValid clFone TextBox_OneCells_width" id="telefoneCelular" name="pessoa.telefoneCelular" readonly="true"/>
	  </td>
	</tr>
	<tr>
	  <td>&nbsp;</td>
	</tr>
    <tr>
  	<td colspan="2"><div align="center">
  	  <table>
  	    <tr>
	      <td width="20">&nbsp;</td>
  	      <td>
  		    <table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton"
		       onclick="enviarMensagem();">
		      <tr>
                <td class="wButton_left"></td>
                <td class="wButton_text wButton_width" >Enviar</td>
                <td class="wButton_right"/>
              </tr>
            </table>
          </td>
	      <td width="10"></td>
		  <td>
		    <table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton"
				   onclick="clearForm('#formLista');">
		      <tr>
			     <td class="wButton_left"></td>
			     <td class="wButton_text wButton_width">Limpar Campos</td>
			     <td class="wButton_right"/>
		      </tr>
		    </table>
		  </td>
		</tr>
	  </table>
	  </div>
	</td>
    </tr>
	
</table>

<script>
$(document).ready(function(){

	$("#nome").autocomplete('<s:url value="/objlookup/getPessoaSmsList.action" includeParams="none" />', {idFieldsToUpdate:["#pessoaId","#cpfOuCnpj","#telefoneCelular"],mustMatch:0,autoFill:false,  width:400,formatItemOnSelect:splitResultGetFirst});
	$("#cpfOuCnpj").autocomplete('<s:url value="/objlookup/getPessoaSmsByCpfOuCnpj.action" includeParams="none" />', {idFieldsToUpdate:["#pessoaId","#nome","#telefoneCelular"],mustMatch:0,autoFill:false,  width:400,formatItemOnSelect:splitResultGetFirst});

});

function enviarMensagem(){
	if ($('#pessoaId').val()==''){
		alert('É obrigatório selecionar uma pessoa cadastrada no sistema!');
		$('#nome').focus();
		return;
	} 
	
	if ($('#telefoneCelular').val()=='(__) ____-____'){
		alert('A pessoa selecionada deve conter um telefone celular válido!');
		$('#nome').focus();
		return;
	}

	if ($('#mensagem').val()==''){
		alert('A mensagem não pode estar em branco!');
		$('#mensagem').focus();
		return;
	}

	if (confirm("Confirma o envio da mensagem p/ : "+$("#nome").val()+" ?")){
		var form = $('#formLista');
		var target = $('#divResult');
		
		$.extend( jQuery.ajaxSettings, {contentType: "application/x-www-form-urlencoded; charset=UTF-8"} );
	
		if(!!form){
			$(form).ajaxSubmit({
				type: "POST",
				url: getContextApp()+'/smsConsoleEnvio/enviar.action',
				messageTarget: "#divMessages",
				target: target,
				error: function(response){
					$("#divMessages").html(response.responseText);
				},
				complete: function(responseText){
					alert('Mensagem enviada com sucesso!');
					clearForm('#formLista');
					document.getElementById('mensagem').value=""; 
				}
			});
		}
	}
}

</script>