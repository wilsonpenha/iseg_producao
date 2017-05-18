<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try {
%>

	  <table>
	    <tr>
		  <td colspan="4">
		    <div class="divMessages" id="divMessagesTab6" style="padding-bottom: 10px;">
		  	  <s:actionerror/>
			  <s:actionmessage/>
			  <s:fielderror/>
		    </div>
		  </td>
	    </tr>
	  </table>
	  <div id="divForm6" style="overflow:auto; height:98%; width:100%">
		<fieldset>
		<legend accesskey="R"><b>P<u>r</u>oposta</b></legend>
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
		  <tr>
			<td width="25%">
			  <label for="nroPropostaSeg">Nro da Proposta na Seguradora</label><br />
			  <s:textfield theme="simple" id="nroPropostaSeg" name="proposta.nroPropostaSeg" size="25" maxlength="25" onchange="setAlterado(true);"/>
			  <s:textfield theme="simple" id="usuarioLanctoApolice" name="proposta.usuarioLanctoApolice.id" cssStyle="display:none"/>
			  <s:textfield theme="simple" id="usuarioBaixaApolice" name="proposta.usuarioBaixaApolice.id" cssStyle="display:none"/>
			  <s:textfield theme="simple" id="usuarioRecebApolice" name="proposta.usuarioRecebApolice.id" cssStyle="display:none"/>
			  <s:textfield theme="simple" id="usuarioLanctoEndosso" name="proposta.usuarioLanctoEndosso.id" cssStyle="display:none"/>
			  <s:textfield theme="simple" id="usuarioBaixaEndosso" name="proposta.usuarioBaixaEndosso.id" cssStyle="display:none"/>
			  <s:textfield theme="simple" id="usuarioRecebEndosso" name="proposta.usuarioRecebEndosso.id" cssStyle="display:none"/>
			</td>
			<td width="25%">
			  <label for="dataTransmissao">Data da Transmissão</label><br />
			  <s:textfield theme="simple" cssClass="clData" id="dataTransmissao" name="proposta.dataTransmissao" onblur="isValidDate(this)" size="10" maxlength="10" onchange="setAlterado(true);"/>
			</td>
			<td width="25%"> 
			  <label for="dataGeracao">Data da Geração</label><br />
			  <s:textfield theme="simple" cssClass="clData" id="dataGeracao" name="proposta.dataGeracao" onblur="isValidDate(this)" size="10" maxlength="10" onchange="setAlterado(true);"/>
			</td>
			<td width="25%">
			  <label for="autorGeracaoNome" style="display:none;">Autor da geração</label><br />
			  <s:textfield theme="simple" id="autorGeracaoId" name="proposta.autorGeracao.id" onchange="setAlterado(true);" cssStyle="display:none;" />
			  <s:textfield theme="simple" id="autorGeracaoNome" name="proposta.autorGeracao.nome" onchange="setAlterado(true);" cssStyle="display:none;" />
			</td>
		  </tr>
		</table>
		</fieldset>
	    <s:if test="proposta.statusOperacional > 0">
	    <s:if test="proposta.statusOperacional > 4">
	    <table width="100%" border="0" cellpadding="0" cellspacing="0">
	    <tr><td width="50%">
		<fieldset>
		<legend accesskey="A"><b><u>B</u>aixa da Apólice</b></legend>
		<table id="dadosApolice" width="100%" border="0" cellpadding="0" cellspacing="0">
		  <tr>
			<td width="25%">
			  <label for="nroApolice">Nro da Apólice</label><br />
			  <s:textfield theme="simple" id="nroApolice" name="proposta.nroApolice" value="%{proposta.propostaOriginal.nroApolice}" size="20" maxlength="20" onblur="checarNroApoliceVazio(this.value)" onchange="setAlterado(true);"/>
			</td>
			<td width="25%">
			  <label for="dataEmissaoApolice">Dt Emissão Apólice</label><br />
			  <s:textfield theme="simple" id="dataEmissaoApolice" cssClass="clData" name="proposta.dataEmissaoApolice" value="%{proposta.propostaOriginal.dataEmissaoApolice}" onblur="isValidDate(this)" size="10" maxlength="10" onchange="setAlterado(true);"/>
			</td>
			<td width="25%">
			  <label for="dataEmissaoApolice">Dt Baixa da Apólice</label><br />
			  <s:textfield theme="simple" id="dataBaixaApolice" cssClass="clData" readonly="true" name="proposta.dataBaixaApolice" value="%{proposta.propostaOriginal.dataBaixaApolice}" onblur="isValidDate(this)" size="10" maxlength="10" onchange="setAlterado(true);"/>
			</td>
		  </tr>
		  <tr>
			<td width="25%">
			  <label for="dataEmissaoApolice">Dt Lançamento da Apólice</label><br />
			  <s:textfield theme="simple" id="dataLanctoApolice" cssClass="clData" readonly="true" name="proposta.dataLanctoApolice" value="%{proposta.propostaOriginal.dataLanctoApolice}" onblur="isValidDate(this)" size="10" maxlength="10" onchange="setAlterado(true);"/>
			</td>
			<td width="25%">
			</td>
			<td width="25%">
			</td>
		  </tr>
		</table>
		</fieldset>
		</td>
		<td valign="top" width="50%">
		<fieldset>
		<legend accesskey="A"><b><u>R</u>ecebimento da Apólice</b></legend>
		<table id="dadosApolice" width="100%" border="0" cellpadding="0" cellspacing="0" height="68px">
		  <tr height="34">
			<td>
			  <label for="dataApoliceProvisoria">Dt Recebimento da Apólice</label><br />
			  <s:textfield theme="simple" id="dataRecebApolice" cssClass="clData" name="proposta.dataRecebApolice" value="%{proposta.propostaOriginal.dataRecebApolice}" onblur="isValidDate(this)" size="10" maxlength="10" onchange="setAlterado(true);"/>
			</td>
			<s:if test="proposta.ramo.id == ramoAutomovel">
			<td>
			  <label for="codigoIdentificacao">Nro do C.I.</label><br />
			  <s:textfield theme="simple" id="propostaCodigoIdentificacao" name="proposta.codigoIdentificacao" value="%{proposta.propostaOriginal.codigoIdentificacao}" size="20" maxlength="20" onchange="setAlterado(true);"/>
			</td>
			</s:if>
			<s:else>
			<td></td>
			</s:else>
			<td></td>
		  </tr>
		  <tr><td colspan="3">
		  </td></tr>
		</table>
		</fieldset>
		</td></tr></table>
		</s:if>
		<s:else>
	    <table width="100%" border="0" cellpadding="0" cellspacing="0">
	    <tr><td width="50%">
		<fieldset>
		<legend accesskey="A"><b><u>B</u>aixa da Apólice</b></legend>
		<table id="dadosApolice" width="100%" border="0" cellpadding="0" cellspacing="0">
		  <tr>
			<td width="25%">
			  <label for="nroApolice">Nro da Apólice</label><br />
			  <s:textfield theme="simple" id="nroApolice" name="proposta.nroApolice" size="20" maxlength="20" onchange="setAlterado(true);" onblur="checarNroApoliceVazio(this.value)"/>
			</td>
			<td width="25%">
			  <label for="dataEmissaoApolice">Dt Emissão Apólice</label><br />
			  <s:textfield theme="simple" id="dataEmissaoApolice" cssClass="clData" name="proposta.dataEmissaoApolice" onblur="isValidDate(this)" size="10" maxlength="10" onchange="setAlterado(true);"/>
			</td>
			<td width="25%">
			  <label for="dataEmissaoApolice">Dt Baixa da Apólice</label><br />
			  <s:textfield theme="simple" id="dataBaixaApolice" cssClass="clData" readonly="true" name="proposta.dataBaixaApolice" onblur="isValidDate(this)" size="10" maxlength="10" onchange="setAlterado(true);"/>
			</td>
		  </tr>
		  <tr>
			<td width="25%">
			  <label for="dataEmissaoApolice">Dt Lançamento da Apólice</label><br />
			  <s:textfield theme="simple" id="dataLanctoApolice" cssClass="clData" readonly="true" name="proposta.dataLanctoApolice" onblur="isValidDate(this)" size="10" maxlength="10" onchange="setAlterado(true);"/>
			</td>
			<td width="25%">
			</td>
			<td width="25%">
			</td>
		  </tr>
		</table>
		</fieldset>
		</td>
		<td valign="top" width="50%">
		<fieldset>
		<legend accesskey="A"><b><u>R</u>ecebimento da Apólice</b></legend>
		<table id="dadosApolice" width="100%" border="0" cellpadding="0" cellspacing="0" height="68px">
		  <tr height="34">
			<td>
			  <label for="dataRecebApolice">Dt Recebimento da Apólice</label><br />
			  <s:textfield theme="simple" id="dataRecebApolice" cssClass="clData" name="proposta.dataRecebApolice" onblur="isValidDate(this)" size="10" maxlength="10" onchange="setAlterado(true);"/>
			</td>
			<s:if test="proposta.ramo.id == ramoAutomovel">
			<td>
			  <label for="codigoIdentificacao">Nro do C.I.</label><br />
			  <s:textfield theme="simple" id="propostaCodigoIdentificacao" name="proposta.codigoIdentificacao" size="20" maxlength="20" onchange="setAlterado(true);"/>
			</td>
			</s:if>
			<s:else>
			<td></td>
			</s:else>
			<td></td>
		  </tr>
		  <tr><td colspan="3">
		  </td></tr>
		</table>
		</fieldset>
		</td></tr></table>
	    </s:else>
		</s:if>
		<fieldset>
		<legend accesskey="o"><b><u>O</u>bservações</b></legend>
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
		  <tr>
			<td>
			  <label for="clausulaSeguro">Observaçõe de Apólices:</label><br/>
			  <s:textarea theme="simple" cssClass="dojoValidateValid requiredField TextArea_FourCells_width TextArea_Medium_height" rows="3" id="clausulaSeguro" name="proposta.clausulaSeguro" cssStyle="width:97%;" onkeyup="return checkMaxLength(this, 1000);" onchange="setAlterado(true);" />
			</td>
		  </tr>
		  <tr>
			<td>
			  <label for="clausulaSeguro">Observações Gerais:</label><br/>
			  <s:textarea theme="simple" cssClass="dojoValidateValid requiredField TextArea_FourCells_width TextArea_Medium_height" rows="3" id="observacoes" name="proposta.observacoes" cssStyle="width:97%;" onkeyup="return checkMaxLength(this, 1000);" onchange="setAlterado(true);" />
			</td>
		  </tr>
		</table>
    	</fieldset> 
		<s:if test="proposta.statusOperacional > 4">
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
	    <tr><td width="50%">
		<fieldset>
		<legend accesskey="A"><b><u>B</u>aixa do Endosso</b></legend>
		<table id="dadosEndosso" width="100%" border="0" cellpadding="0" cellspacing="0">
		  <tr>
			<td width="25%">
			  <label for="nroEndosso">Nro do Endosso</label><br />
			  <s:textfield theme="simple" id="nroEndosso" name="proposta.nroEndosso" size="20" maxlength="20" onchange="setAlterado(true);"  onblur="checarNroEndossoVazio(this.value)"/>
			</td>
			<td width="25%">
			  <label for="dataEndosso">Dt Emissão Endosso</label><br />
			  <s:textfield theme="simple" id="dataEndosso" cssClass="clData" name="proposta.dataEndosso" onblur="isValidDate(this)" size="10" maxlength="10" onchange="setAlterado(true);"/>
			</td>
			<td width="25%">
			  <label for="dataBaixaEndosso">Dt Baixa do Endosso</label><br />
			  <s:textfield theme="simple" id="dataBaixaEndosso" cssClass="clData" readonly="true" name="proposta.dataBaixaEndosso" onblur="isValidDate(this)" size="10" maxlength="10" onchange="setAlterado(true);"/>
			</td>
		  </tr>
		  <tr>
			<td width="25%">
			  <label for="dataLanctoEndosso">Dt Lançamento do Endosso</label><br />
			  <s:textfield theme="simple" id="dataLanctoEndosso" cssClass="clData" readonly="true" name="proposta.dataLanctoEndosso" onblur="isValidDate(this)" size="10" maxlength="10" onchange="setAlterado(true);"/>
			</td>
			<td width="25%">
			</td>
			<td width="25%">
			</td>
		  </tr>
		</table>
		</fieldset>
		</td>
		<td valign="top" width="50%">
		<fieldset>
		<legend accesskey="A"><b><u>R</u>ecebimento da Endosso</b></legend>
		<table id="dadosEndosso" width="100%" border="0" cellpadding="0" cellspacing="0" height="68px">
		  <tr height="34">
			<td>
			  <label for="dataApoliceProvisoria">Dt Recebimento do Endosso</label><br />
			  <s:textfield theme="simple" id="dataRecebEndosso" cssClass="clData" name="proposta.dataRecebEndosso" onblur="isValidDate(this)" size="10" maxlength="10" onchange="setAlterado(true);"/>
			</td>
			<td>
		      <label for="tipoEndosso">Tipo de Endosso</label><br />
	    	  <s:select theme="simple" tabindex="0" disabled="true" id="tipoEndosso" name="proposta.tipoEndosso.id" list="endossoList" listKey="id" listValue="nome" headerKey="" headerValue="-- Selecione --" onchange=""/>
			</td>
			<td></td>
		  </tr>
		  <tr><td colspan="3">
		  </td></tr>
		</table>
		</fieldset>
		</td></tr>
	    <tr><td colspan="2">
		<fieldset>
		<legend accesskey="o"><b><u>O</u>bservações de Endosso</b></legend>
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
		  <tr>
			<td colspan="4">
			  <label for="obsEndosso">Motivos de Endosso:</label><br/>
			  <s:textarea theme="simple" cssClass="dojoValidateValid requiredField clTextoRestrito TextArea_FourCells_width TextArea_Medium_height" rows="3" id="obsEndosso" name="proposta.obsEndosso" cssStyle="width:97%;" onkeyup="return checkMaxLength(this, 600);" onchange="setAlterado(true);" />
			</td>
		  </tr>
		</table>
		</fieldset>
		</td></tr>
		</table>
		</s:if>
		<table border="0" cellpadding="0" cellspacing="0">
		  <tr>
			<td height="23" valign="top">
			  <div>
				<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" onclick="openWinReportEnvelope()">
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">Imprimir Envelope</td>
					<td class="wButton_right"/>
				  </tr>
				</table>
			  </div>
			</td>
			<s:if test="(proposta.statusOperacional == 0 || proposta.statusOperacional == 5 || proposta.statusOperacional == 8) && proposta.situacaoOperacional == 0">
			<td height="23" valign="top">
			  <div>
				<table onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" onclick="if(validacaoGerarProposta() && confirma('Confirma efetivação do pedido?')){gerarProposta();}">
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">Efetivar Pedido</td>
					<td class="wButton_right"/>
				  </tr>
				</table>
			  </div>
			</td>
			</s:if>
			<s:elseif test="(proposta.statusOperacional == 4 || proposta.statusOperacional == 6 || proposta.statusOperacional == 9)">
			<td height="23" valign="top">
			  <div>
				<table onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" onclick="if(validacaoGerarApolice() && confirma('Baixar apólice?')){gerarApolice();}">
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">Baixar Apólice</td>
					<td class="wButton_right"/>
				  </tr>
				</table>
			  </div>
			</td>
			</s:elseif>
		  </tr>
		</table>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	  <tr>
		<td colspan="2">
		  <fieldset>
			<legend accesskey=""><b>Anexo</b></legend>
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
			  <tr>
				<td>
<!-- 				  <label for="dataDoProposta">Arquivo p/ upload (Não pode ser maior que 2048000 bytes / 2MB)</label><br /> -->
<%-- 				  <s:file theme="simple" id="arquivoAnexo" name="fileUpload" size="100" /> --%>
				</td>
			  </tr>
			</table>
			<br/>
			<hr/>
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
				  <td style="width:105px;">
				    <a href="#" class="button" onclick="apagarDadosPropostaAnexo();" tabindex="-1"> 
					<table onmouseout="this.className='wButton'; return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton">
					  <tr>
						<td class="wButton_left"></td>
						<td class="wButton_text wButton_width">Apagar Dados</td>
						<td class="wButton_right"/>
					  </tr>
					</table>
				    </a>
				  </td>
				  <td style="width:80px;">
				    <a href="#" class="button" onclick="inserirPropostaAnexo();" >
					<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
					  <tr>
						<td class="wButton_left"></td>
						<td class="wButton_text wButton_width">Adicionar</td>
						<td class="wButton_right"/>
					  </tr>
					</table>
					</a>
				  </td>
				  <td>&nbsp;</td>
				</tr>
			</table>
		  </fieldset>
		</td>
	  </tr>
	</table>
<div id="divListaAnexo" style="border: 1px;overflow:auto;">
		</div>
	</div>

<script>

function openWinReportEnvelope(){
	openWin('', 'report', '800', '600', 'resizable=yes');
	submitForm($('#formEdit').get(0), getContextApp()+'/report/gerarEnvelopeReport.action', false, "report");
}
</script>
	
<% } catch (Exception e) {e.printStackTrace();}%>