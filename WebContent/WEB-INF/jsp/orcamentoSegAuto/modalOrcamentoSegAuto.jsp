<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../jqueryCalculadora.jsp" flush="false"></jsp:include>
<div id="novoCalculo" style="display:none; z-index: 1000;height: 560px; width:745px;">
	 <table width="100%" border="0" cellspacing="0" cellpadding="0" class="Main_ContentPane_TabPane" id="tdtopTabs">
		<tr id="paramParentTabContainer" style="padding: 3px">
		  <td class="tabBackGroundInit" style="background-color: #505050"></td>
		</tr>
		<tr id="paramMainTabContainer" style="padding: 3px">
		  <td class="tabBackGroundInit" style="background-color: #505050">
			<span style="color:#FFFFFF; font-size:8pt; font-weight:bold; height:26px !important; padding:0 4px; text-align:center; white-space:nowrap;" id="titleCalculo">
			  Novo Cálculo
			</span>
		  </td>
		</tr>
	</table>
	<form id="formOrcamentoSeguradoraModal" name="formOrcamentoSeguradoraModal">
	<s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>
	<s:textfield theme="simple" id="tipoCliente" name="tipoCliente" cssStyle="display:none"/>
	<table style="height:100%" width="100%" border="0" cellpadding="0" cellspacing="0">
	  <tr>
		<td>
		  <div id="corpo" style="width:100%; z-index:1; overflow: hidden; height: autopx;" >
			<table style="height:100%" width="100%" border="0" cellpadding="0" cellspacing="0">
			  <tr>
				<td height="*" valign="top" id="tdDivCentral">
				  <div id="central" style="width:100%; z-index:1; overflow: hidden; height: autopx;" > 
					<div id="tabFrameModal" class="main_page" style="background-color:#E8E8E8;"></div>
				  </div>   
				</td>
			  </tr>  
			</table>
		  </div>
		</td>
	  </tr>
	</table>
	  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>
	</form>
	<form name="formParcelas" id="formParcelas">
		<s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>
		<s:textfield theme="simple" id="paramPremioTotal" name="premioTotal" cssStyle="display:none;"/>
		<s:textfield theme="simple" id="paramQtdeParcelas" name="qtdeParcelas" cssStyle="display:none;"/>
		<s:textfield theme="simple" id="paramQtdeParDeb" name="qtdeParDeb" cssStyle="display:none;"/>
		<s:textfield theme="simple" id="paramQtdeParCarne" name="qtdeParCarne" cssStyle="display:none;"/>
		<s:textfield theme="simple" id="paramQtdeParCred" name="qtdeParCred" cssStyle="display:none;"/>
		<s:textfield theme="simple" id="paramQtdeParCheq" name="qtdeParCheq" cssStyle="display:none;"/>
		<s:textfield theme="simple" id="paramOrcamentoFranquias" name="orcamentoFranquias.id" cssStyle="display:none;"/>
		<s:textfield theme="simple" id="paramOrcamentoFranquiasPosicao" name="itemCorrente" cssStyle="display:none;"/>
	</form>
	<table align="center" style="bottom: 0px; background-color: #E8E8E8; position: absolute; z-index: 100;">
		<tr>
			<td>
			  <a href="#" class="button" onclick="calcularOnline();" >
				<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">Calcular On-Line</td>
					<td class="wButton_right"/>
				  </tr>
				</table>
			  </a>
			</td>
			<td>
			  <a href="#" class="button" onclick="salvarCalculoOrcamentoSegAuto();" >
				<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">Salvar</td>
					<td class="wButton_right"/>
				  </tr>
				</table>
			  </a>
			</td>
			<td>
			  <a href="#" class="button" onclick="closeModalCalculo();" >
				<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">fechar</td>
					<td class="wButton_right"/>
				  </tr>
				</table>
			  </a>
			</td>
		</tr>
	</table>
	<input class="modalClose" id="closeDiv" style="display:none;" />
	<div id="saveProgressModal" class="pageloader" style="display:none;z-index:4050;">Salvando...<br/></div>
    <div id="loadProgressModal" class="pageloader" style="display:none;z-index:4050;">Carregando...<br/></div>
	<div id="calculoProgressModal" class="pageloader" style="display:none;z-index:4050;">Calculando...<br/></div>
  </div>
<script type="text/javascript">
	var abaAnt = null;
	var divAnt = null;
	var calculoAlterado = false;
  	function abrirAba(abaAtual){
  		modalAbaAtual = abaAtual.id;
  		tabPaneModal = "tabPaneModal"+abaAtual.id.replace("tabModal","");
  		if(abaAnt == null && divAnt == null || document.getElementById(abaAnt.id).getAttribute("class") != "active"){
  			abaAnt = document.getElementById("tabModal0");
  			divAnt = document.getElementById("tabPaneModal0");
  			divAnt.style.display = "";
  		}
  		abaAnt.setAttribute("class","inactive");
		abaAtual.setAttribute("class","active");
		abaAnt = abaAtual;
  		if(divAnt != null && document.getElementById(divAnt.id).style.display != "none"){
  			div = document.getElementById("tabPaneModal"+abaAtual.id.replace("tabModal",""));
  			divAnt.style.display = "none";
  			div.style.display = "";
  			divAnt = div;
  		}
  		if(calculoAlterado == true){
  			salvarCalculoOrcamentoSegAuto();
  		}
  	}
</script>
<script language="javascript">
	$('#gallery a.galleryLink').lightBox({fixedNavigation:true});
	$(document).ready(function() {
		$('#mycarousel').jcarousel();
	});
</script>
