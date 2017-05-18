<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	#modalContainer {max-height:560px; overflow:hidden; width:671px; height: auto; left: 0; background-color: #E8E8E8; border: outset 4px; padding: 3px;}
</style>
<div id="divNovaFranquiaSeguradora" style="display:none; z-index: 1000; width:671px;">
	<form id="formFranquiaSeguradora" name="formFranquiaSeguradora">
	  <s:textfield theme="simple" id="paramFranquiaSeguradoraOrcamentoSeguroId" name="orcamentoSeguro.id" cssStyle="display:none;"/>
	  <s:textfield style="display:none;" name="orcamentoSeguradora.id" id="paramOrcamentoSegSeguradoraFranquiaId"/>
	  <s:textfield style="display:none;" name="itemCorrente" id="paramItemCorrente"/>
	  
	  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="Main_ContentPane_TabPane" id="tdtopTabs">
		<tr id="paramParentTabContainer">
		  <td class="tabBackGroundInit" style="background-color: #505050"></td>
		</tr>
		<tr id="paramMainTabContainer">
		  <td class="tabBackGroundInit" style="background-color: #505050">
			<span style="color:#FFFFFF; font-size:8pt; font-weight:bold; height:26px !important; padding:0 4px; text-align:center; white-space:nowrap;">
			  Inserir Franquia na Seguradora
			</span>
		  </td>
		</tr>
	  </table>
	  <div align="center" style="border: solid 1px #505050; padding: 10px;">
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
		  <tr>
			<td colspan="2">
			  <input class="modalClose" id="closeDiv" style="display:none;"/>
			</td>
		  </tr>
		  <tr>
			<td width="50%" class="TitleCell" style="text-align: left" colspan="2">
			  <label class="LabelText" for="paramCobDescricaoCobertura">Seguradora:</label><br />
			  <s:textfield theme="simple" cssStyle="width: 100%" cssClass="clTextoRestritoModal readonly" readonly="true" id="paramFranquiaSeguradoraNome" name="orcamentoSeguradora.seguradora.nome" />
			</td>
			<td width="50%" class="TitleCell" style="text-align: left" colspan="2">
			  <label class="LabelText" for="paramCobInformaFranquia">Rótulo</label><br />
			  <s:textfield theme="simple" cssStyle="width: 100%" cssClass="clTextoRestritoModal readonly" readonly="true" id="paramFranquiaSeguradoraRotulo" name="orcamentoSeguradora.rotulo" />
			</td>
		  </tr>
		  <tr>
		  	<td class="TitleCell" style="text-align: left">
		  	  <label class="LabelText" for="paramCobInformaFranquia">Descrição Franquia</label><br />
			  <s:select headerKey="" headerValue="-- Selecione --" list="tipoFranquias" id="tpFranquiaModal" name="orcamentoFranquias.tipoFranquia.id" listKey="id" listValue="valor" cssClass="Combo_OneCell_width" />
		  	</td>
		  	<td>
		  	  <label class="LabelText" for="paramCobInformaFranquia">Prêmio</label><br />
			  <s:textfield theme="simple" cssStyle="width: 98%" cssClass="TextBox_OneCells_width clValor2 currency " id="paramFrSeguradoraPremio" name="orcamentoFranquias.premioTotal" maxlength="12" onkeypress="Mascara('numero3',event,this,12);"/>
		  	</td>
		  	<td colspan="2">
		  	  <label class="LabelText" for="paramCobInformaFranquia">Franquia</label><br />
			  <s:textfield theme="simple" cssStyle="width: 98%" cssClass="TextBox_OneCells_width clValor2 currency" id="paramOFrSeguradoraFranquia" name="orcamentoFranquias.valorFranquia" maxlength="12" onkeypress="Mascara('numero3',event,this,12);" />
		  	</td>
		  </tr>
		  <tr>
			<td colspan="3" class="TitleCell" style="text-align: left">&nbsp;</td>
		  </tr>
		  <tr>
			<td>
			  <a href="#" class="button" onclick="inserirFranquiaOrcamentoSeguradora($('#paramOrcamentoSegSeguradoraFranquiaId').val());">
				<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton">
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">Adicionar</td>
					<td class="wButton_right"/>
				  </tr>
				</table>
			  </a>
			</td>
			<td>
			  <a href="#" class="button" onclick="closeModal();">
				<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton">
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">Cancelar</td>
					<td class="wButton_right"/>
				  </tr>
				</table>
			  </a>
			</td>
		  </tr>
		</table>
	  </div>
	</form>
  </div>
   <script>
  	 $().ready(function() {
  	 	$(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
  	 	$(".clData").setMask({mask : '39/19/9999', autoTab: false});
  	 });
  </script>