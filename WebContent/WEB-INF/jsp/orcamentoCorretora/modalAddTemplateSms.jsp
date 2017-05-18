<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	#modalContainer {max-height:560px; overflow:hidden; width:400px; height: auto; left: 0; background-color: #E8E8E8; border: outset 4px; padding: 3px;}
</style>
<div id="divNovoTemplateSms" style="display:none; z-index: 1000; width:400px;" >
	<form id="formTemplateSms" name="formTemplateSms">
	  <s:textfield theme="simple" id="paramTemplateMensagemSmsCorretoraId" name="templateMensagem.corretora.id" cssStyle="display:none;"/>
	  <s:textfield theme="simple" id="templateSmsId" name="templateMensagem.id" cssStyle="display:none;"/>
	
	  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="Main_ContentPane_TabPane" id="tdtopTabs">
		<tr id="paramParentTabContainer">
		  <td class="tabBackGroundInit" style="background-color: #505050"></td>
		</tr>
		<tr id="paramMainTabContainer">
		  <td class="tabBackGroundInit" style="background-color: #505050">
			<span style="color:#FFFFFF; font-size:8pt; font-weight:bold; height:26px !important; padding:0 4px; text-align:center; white-space:nowrap;">
			  Novo template sms
			</span>
		  </td>
		</tr>
	  </table>
	  <div align="center" style="border: solid 1px #505050; padding: 10px;" >
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
		  <tr>
			<td>
			  <input class="modalClose" id="closeDiv" style="display:none;" />
			</td>
		  </tr>
		  <tr>
			<td width="50%" class="TitleCell" style="text-align: left">
			  <label class="LabelText" for="paramCobDescricaoCobertura">Tipo Sms:</label><br/>
			  <s:select theme="simple" style="width: 160px" emptyOption="false" listKey="id" listValue="descricao" list="tipoMensagemList" name="templateMensagem.tipoMensagem.id"/>
			</td>
		  </tr>
		  <tr>
			<td>
				<label>Descrição</label><br/>
				<s:textfield theme="simple" style="width:97%" name="templateMensagem.assunto"/>
			</td>
		  </tr>
	 	  <tr>
			<td>
				<label>Mensagem:</label>
				<s:textfield style="display:none;" name="templateMensagem.inmidia" value="2"/>
				<s:textarea style="width: 370px; height: 100px" name="templateMensagem.corpoTexto" onkeyup="$('#cont').html($(this).val().length.toString()); return checkMaxLength(this, 140);"/><br>
				<label id="cont">0</label> de 140
			</td>
		  </tr>
		  <tr>
			<td colspan="2" class="TitleCell" style="text-align: left">&nbsp;</td>
		  </tr>
		  </table>
		  <table width="100%">
		  <tr>
			<td>
				<div style="width: 74px;">
				  <a href="#" class="button" onclick="inserirTemplateSms();" >
					<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
					  <tr>
						<td class="wButton_left"></td>
						<td class="wButton_text wButton_width">Adicionar</td>
						<td class="wButton_right"/>
					  </tr>
					</table>
				  </a>
			  	</div>
			</td>
			<td>
				<div style="width: 70px;">
				  <a href="#" class="button" onclick="closeModalModelo();" >
					<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
					  <tr>
						<td class="wButton_left"></td>
						<td class="wButton_text wButton_width">Cancelar</td>
						<td class="wButton_right"/>
					  </tr>
					</table>
				  </a>
			  	</div>
			</td>
		  </tr>
		</table>
	  </div>
	</form>
  </div>