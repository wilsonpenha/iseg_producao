<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	request.setAttribute("decorator", "none");
	response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.setHeader("Pragma","no-cache"); //HTTP 1.0
	response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
try {
%>

  <div id="trocarSeguradora" style="display:none; z-index: 1000;" >
	<form id="formSeguradora" name="formSeguradora">
	  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>
	
	  <table width="90%" border="0" cellspacing="0" cellpadding="0" class="Main_ContentPane_TabPane" id="tdtopTabs">
		<tr id="paramParentTabContainer">
		  <td class="tabBackGroundInit" style="background-color: #505050"></td>
		</tr>
		<tr id="paramMainTabContainer">
		  <td class="tabBackGroundInit" style="background-color: #505050">
			<span style="color:#FFFFFF; font-size:8pt; font-weight:bold; height:26px !important; padding:0 4px; text-align:center; white-space:nowrap;">
			  Trocar Seguradora
			</span>
		  </td>
		</tr>
	  </table>
	  <div align="center" style="border: solid 1px #505050; padding: 10px;" ><br />
		<table width="90%" border="0" cellpadding="0" cellspacing="0">
		  <tr>
			<td colspan="2">
			  <s:textfield theme="simple" cssStyle="display:none;" id="paramSegPropostaId" name="proposta.id" />
			  <input class="modalClose" id="closeDiv" style="display:none;" />
			</td>
		  </tr>
		  <tr>
			<td width="35%" class="TitleCell" style="text-align: left">
			  <label class="LabelText" for="paramCobDescricaoCobertura">Seguradora atual</label>
			</td>
			<td width="65%" >
				<s:textfield theme="simple" size="50" id="seguradoraAtualNome" name="proposta.seguradora.nome" cssClass="readonly" readonly="true" tabindex="-1" />
			</td>
		  </tr>
		  <tr>
			<td colspan="2" class="TitleCell" style="text-align: left">&nbsp;</td>
		  </tr>
		  <tr>
			<td width="35%" class="TitleCell" style="text-align: left">
			  <label class="LabelText" for="segSeguradoraNome">Nova Seguradora</label>
			</td>
			<td width="65%" >
				<s:select theme="simple" cssClass="Combo Combo_TwoCells_width" cssStyle="width: 100%" tabindex="0" id="paramSegSeguradoraId" name="seguradora.id" list="seguradoras" listKey="id" listValue="nome" headerKey="" headerValue="-- Selecione --"  />	
			</td>
		  </tr>
		  <tr>
			<td colspan="2" class="TitleCell" style="text-align: left">&nbsp;</td>
		  </tr>
		  <tr>
			<td colspan="2" align="center">
			  <table><tr>
				  <td>
					  <a href="#" class="button" onclick="fechaParamNovaProposta();alterarSeguradora();$('#closeDiv').click()" >
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
					  <a href="#" class="button" onclick="fechaParamNovaProposta();$('#closeDiv').click()" >
						<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
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
			</td>
		  </tr>
		</table>
	  </div>
	</form>
  </div>
  
<script>

function paramNovaProposta(){
	carregaSeguradoras();
	formNavigateAlterado = false;
	document.getElementById("paramSeguradoraId").focus();
	document.getElementById('btnf3').disabled=true;
	if (document.getElementById('btnf4'))
		document.getElementById('btnf4').disabled=true;
	document.getElementById('btnf5').disabled=true;
	document.getElementById('btnf6').disabled=true;
	if (document.getElementById('btnf7'))
		document.getElementById('btnf7').disabled=true;
	document.getElementById('btnf8').disabled=true;
	document.getElementById('btnf11').disabled=true;
	// F2
	keyActions [0] = {character:  113,	
	                  actionType: "code",
	                  param:      "executarBotao('btnf2');"};
}

function fechaParamNovaProposta(){
	document.getElementById('btnf3').disabled=false;
	if (document.getElementById('btnf4'))
		document.getElementById('btnf4').disabled=false;
	document.getElementById('btnf5').disabled=false;
	document.getElementById('btnf6').disabled=false;
	if (document.getElementById('btnf7'))
		document.getElementById('btnf7').disabled=false;
	document.getElementById('btnf8').disabled=false;
	document.getElementById('btnf11').disabled=false;
	// F2
	keyActions [0] = {character:  113,	
	                  actionType: "code",
	                  param:      "executarBotao('btnf14');"};
}

</script>
<% } catch (Exception e) {e.printStackTrace();}%>