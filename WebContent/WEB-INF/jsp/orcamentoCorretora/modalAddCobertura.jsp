<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	#modalContainer {max-height:560px; overflow:hidden; width:480px; height: auto; left: 0; background-color: #E8E8E8; border: outset 4px; padding: 3px;}
</style>
<div id="divNovaCobertura" style="display:none; z-index: 1000; width:480px;" >
	<form id="formCobertura" name="formCobertura">
	  <s:textfield theme="simple" id="paramCoberturaCorretoraId" name="corretoraCoberturasIseg.corretora.id" cssStyle="display:none;"/>
	  <s:textfield theme="simple" id="corretoraCoberturasIsegId" name="corretoraCoberturasIseg.id" cssStyle="display:none;"/>
	
	  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="Main_ContentPane_TabPane" id="tdtopTabs">
		<tr id="paramParentTabContainer">
		  <td class="tabBackGroundInit" style="background-color: #505050"></td>
		</tr>
		<tr id="paramMainTabContainer">
		  <td class="tabBackGroundInit" style="background-color: #505050">
			<span style="color:#FFFFFF; font-size:8pt; font-weight:bold; height:26px !important; padding:0 4px; text-align:center; white-space:nowrap;">
			  Nova Cobertura
			</span>
		  </td>
		</tr>
	  </table>
	  <div align="center" style="border: solid 1px #505050; padding: 10px;" >
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
		  <tr>
			<td colspan="2">
			  <input class="modalClose" id="closeDiv" style="display:none;" />
			</td>
		  </tr>
		  <tr>
			<td width="50%" class="TitleCell" style="text-align: left">
			  <label class="LabelText" for="paramCobDescricaoCobertura">Cobertura:</label><br/>
			  <s:select theme="simple" style="width: 350px" id="paramCoberturaIseg" emptyOption="false" listKey="id" listValue="descricao" list="coberturasIseg" name="corretoraCoberturasIseg.coberturasIseg.id"/>
			</td>
			<td width="50%" class="TitleCell" style="text-align: left">
				<label class="LabelText" for="paramCobDescricaoCobertura">Lmi:</label><br/>
			  	<s:textfield theme="simple" cssStyle="width: 100px" cssClass="clTextoRestritoModal clValor2" id="paramCobLmi" name="corretoraCoberturasIseg.lmi" />
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
				  <a href="#" class="button" onclick="inserirCoberturas();" >
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
				  <a href="#" class="button" onclick="closeModal();" >
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