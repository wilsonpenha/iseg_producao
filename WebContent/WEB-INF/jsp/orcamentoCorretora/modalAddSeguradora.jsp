<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	#modalContainer {max-height:560px; overflow:hidden; width:400px; height: auto; left: 0; background-color: #E8E8E8; border: outset 4px; padding: 3px;}
</style>
<div id="divNovaSeguradora" style="display:none; z-index: 1000; width:400px;" >
	<form id="formSeguradora" name="formSeguradora" >
	  <s:textfield theme="simple" id="paramSeguradoraCorretoraId" name="seguradorasPreferenciais.corretora.id" cssStyle="display:none;"/>
	  <s:textfield theme="simple" id="seguradorasPreferenciaisId" name="seguradorasPreferenciais.id" cssStyle="display:none;"/>
	
	  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="Main_ContentPane_TabPane" id="tdtopTabs">
		<tr id="paramParentTabContainer">
		  <td class="tabBackGroundInit" style="background-color: #505050"></td>
		</tr>
		<tr id="paramMainTabContainer">
		  <td class="tabBackGroundInit" style="background-color: #505050">
			<span style="color:#FFFFFF; font-size:8pt; font-weight:bold; height:26px !important; padding:0 4px; text-align:center; white-space:nowrap;">
			  Adicionar Seguradora
			</span>
		  </td>
		</tr>
	  </table>
	  <div align="center" style="border: solid 1px #505050; padding: 10px;" >
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
		  <tr>
			<td colspan="3">
			  <input class="modalClose" id="closeDiv" style="display:none;" />
			</td>
		  </tr>
		  <tr>
			<td width="100%" class="TitleCell" style="text-align: left" colspan="3">
			  <label class="LabelText" for="paramCobDescricaoCobertura">Seguradoras:</label><br/>
			  <s:textfield theme="simple" id="seguradoraId" name="seguradorasPreferenciais.seguradora.id" style="display:none;"/>
			  <s:textfield theme="simple" cssStyle="width: 100%"  cssClass="clTextoRestritoModal" id="seguradoraNome" name="seguradorasPreferenciais.seguradora.nome"/>
			</td>
		  </tr>
		  <tr>
		  	<td width="10%">
		  		<label class="LabelText">Franquias</label><br />
		  		<s:select id="select-from" theme="simple" cssClass="Combo" emptyOption="false" listKey="id" listValue="valor" list="tipoFranquias" name="teste" multiple="true" style="width:130px;"/>
		  	</td>
		  	<td align="center" width="10%">
		  		<button type="button" id="btn-add">></button><br/>
		  		<button type="button" id="btn-remove"><</button><br/>
		  	<td width="80%">
		  		<label class="LabelText">Franquias Adicionadas</label><br />
		  		<s:select id="select-to" theme="simple" cssClass="Combo" emptyOption="false" listKey="id" listValue="valor" name="franquias" list="franquiasList" multiple="true" style="width:130px;"/>
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
				  <a href="#" class="button" onclick="inserirSeguradoras();" >
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
  <script language="javascript">
	$(document).ready(function() {
		$("#seguradoraNome").autocomplete('<s:url value="/objlookup/getSeguradoraByNome.action" includeParams="none" />', {idFieldsToUpdate:["#seguradoraId"]});
		$('#btn-add').click(function(){
	        $('#select-from option:selected').each( function() {
		                $('#select-to').append("<option value='"+$(this).val()+"' selected>"+$(this).text()+"</option>");
		            $(this).remove();
		    });
	    });
	    $('#btn-remove').click(function(){
	        $('#select-to option:selected').each( function() {
	            $('#select-from').append("<option value='"+$(this).val()+"'>"+$(this).text()+"</option>");
	            $(this).remove();
	        });
	    });
	});
</script>