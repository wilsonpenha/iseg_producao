<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	#modalContainer {max-height:560px; overflow:hidden; width:671px; height: auto; left: 0; background-color: #E8E8E8; border: outset 4px; padding: 3px;}
</style>
<div id="divNovaSeguradora" style="display:none; z-index: 1000; width:671px;">
	<form id="formSeguradora" name="formSeguradora">
	  <s:textfield theme="simple" id="paramSeguradoraOrcamentoSeguroId" name="orcamentoSeguro.id" cssStyle="display:none;"/>
	  <input class="modalClose" id="seguradoraCloseDiv" style="display:none;" />
	  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="Main_ContentPane_TabPane" id="tdtopTabs">
		<tr id="paramParentTabContainer">
		  <td class="tabBackGroundInit" style="background-color: #505050"></td>
		</tr>
		<tr id="paramMainTabContainer">
		  <td class="tabBackGroundInit" style="background-color: #505050">
			<span style="color:#FFFFFF; font-size:8pt; font-weight:bold; height:26px !important; padding:0 4px; text-align:center; white-space:nowrap;">
			  Inserir Seguradora
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
			<td width="50%" class="TitleCell" style="text-align: left">
			  <label class="LabelText" for="paramCobDescricaoCobertura">Seguradora:</label><br />
			  <s:textfield style="display:none;" name="orcamentoSeguradora.seguradora.id" id="paramOrcamentoSegSeguradoraId"/>
			  <s:textfield theme="simple" cssStyle="width: 100%" cssClass="clTextoRestritoModal readonly" readonly="true" id="paramSeguradoraNome" name="orcamentoSeguradora.seguradora.nome" />
			</td>
			<td width="50%" class="TitleCell" style="text-align: left" colspan="2">
			  <label class="LabelText" for="paramCobInformaFranquia">Rótulo</label><br />
			  <s:textfield theme="simple" cssStyle="width: 100%" cssClass="clTextoRestritoModal readonly" readonly="true" id="paramOrcamentoSeguradoraRotulo" name="orcamentoSeguradora.rotulo" />
			</td>
		  </tr>
		  <tr>
		  	<td>
		  	  <label class="LabelText" for="paramCobInformaFranquia">Prêmio</label><br />
			  <s:textfield theme="simple" cssStyle="width: 98%" cssClass="TextBox_OneCells_width clValor2 currency" id="paramOrcamentoSeguradoraPremio" name="orcamentoSeguradora.orcamentoFranquiasCollection[0].premioTotal"/>
		  	</td>
		  	<td colspan="2">
		  	  <label class="LabelText" for="paramCobInformaFranquia">Franquia</label><br />
			  <s:textfield theme="simple" cssStyle="width: 98%" cssClass="TextBox_OneCells_width clValor2 currency" id="paramOrcamentoSeguradoraFranquia" name="orcamentoSeguradora.orcamentoFranquiasCollection[0].valorFranquia"/>
		  	</td>
		  </tr>
		  <tr>
		  	<td class="TitleCell" style="text-align: left">
			  <label class="LabelText" for="paramCobInformaFranquia">Data Cálculo</label><br />
			  <s:textfield theme="simple" cssClass="clTextoRestritoModal clData" id="paramOrcamentoSeguradoraData" name="orcamentoSeguradora.DataCalculo" />
			</td>
			<td class="TitleCell" style="text-align: left">
			  <label class="LabelText" for="paramCobInformaFranquia">Fator%</label><br />
			  <s:textfield theme="simple" cssStyle="width: 90%" cssClass="TextBox_OneCells_width clValor2 currency" id="paramOrcamentoSeguradoraFator" name="orcamentoSeguradora.fator" maxlength="8"/>
			</td>
			<td class="TitleCell" style="text-align: left">
		  	  <label class="LabelText" for="paramCobInformaFranquia">Descrição Franquia</label><br />
		  	  <s:select id="tipoFranquiasModalSeguradoras" headerKey="" headerValue="-- Selecione --" list="tipoFranquias" name="orcamentoSeguradora.orcamentoFranquiasCollection[0].tipoFranquia.id" listKey="id" listValue="valor" cssClass="Combo_OneCell_width requiredField" />
<%-- 			  <s:textfield theme="simple" cssStyle="width: 90%" cssClass="TextBox_OneCells_width currency" id="paramOrcamentoSeguradoraPercentualFranquia" name="orcamentoSeguradora.orcamentoFranquiasCollection[0].descricao" onkeypress="Mascara('numero3',event,this,14);"/> --%>
		  	</td>
		  </tr>
		  <tr>
			<td colspan="3" class="TitleCell" style="text-align: left">&nbsp;</td>
		  </tr>
		  <tr>
			<td>
			  <a href="#" class="button" onclick="inserirOrcamentoSeguradora();">
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
			  <a href="#" class="button" onclick="fechaParamNovaOrcamento();$('#seguradoraCloseDiv').click();">
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
