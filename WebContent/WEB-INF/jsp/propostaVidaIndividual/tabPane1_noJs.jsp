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

	<div id="divForm2" style="width:100%">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	  <tr><td>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	    <tr>
		  <td colspan="4">
			<s:textfield theme="simple" id="itemCorrente" name="itemCorrente" cssStyle="display:none;" />
			<s:textfield theme="simple" id="itens" name="itens" cssStyle="display:none;" />
		  </td>
	    </tr>
	</table>
	  </td></tr>
	  <tr>
		<td>
	<table>
	    <tr>
		  <td colspan="4">
		    <div id="divMessagesTab2" class="divMessages" style="padding-bottom: 1px;">
		  	  <s:actionerror/>
			  <s:actionmessage/>
			  <s:fielderror/>
		    </div>
		  </td>
	    </tr>
	</table>
	  </td></tr>
	  <tr>
		<td colspan="2">
		  <div id="divDadosSegurado">
		  <table width="100%" border="0" cellpadding="0" cellspacing="0">
		  <tr>
			<td>
			  <fieldset>
			  <legend accesskey="C"><b>Dados do <u>C</u>ônjuge</b></legend>
			  <table width="100%" border="0" cellpadding="2" cellspacing="0">
				<tr>
				  <td width="15%" colspan="3">
					<s:textfield theme="simple" id="seguradoId" name="proposta.seguradoIndividualCollection[%{itemCorrente}].id" cssStyle="display:none;" />
					<s:textfield theme="simple" id="seguradoAlterado" name="seguradoAlterado" cssStyle="display:none;" />
					<s:textfield theme="simple" id="seguradoLinhaVazia" name="proposta.seguradoIndividualCollection[%{itemCorrente}].linhaVazia" cssStyle="display:none;" />
					<s:textfield theme="simple" id="seguradoPropostaId" name="proposta.seguradoIndividualCollection[%{itemCorrente}].proposta.id" cssStyle="display:none;" />
					<label for="conjuge">Nome do Cônjuge</label><br />
					<s:textfield theme="simple" id="seguradoConjuge" name="proposta.seguradoIndividualCollection[%{itemCorrente}].conjuge" size="40" maxlength="60" onchange="setSeguradoAlterado(true);"/>
				  </td>
				  <td width="15%">
					<label for="dataNascimentoConjuge">Dt. Nascimento</label><br />
					<s:textfield theme="simple" cssClass="clData" id="seguradoDataNascimentoConj" name="proposta.seguradoIndividualCollection[%{itemCorrente}].dataNascimentoConj" onblur="isValidDate(this)" size="12" maxlength="10" onchange="setSeguradoAlterado(true);"/>
				  </td>
				  <td width="15%">
					<label for="sexoConjuge">Sexo</label><br />
					<s:select theme="simple" id="seguradoSexoConjuge" headerKey="" headerValue="-- Selecione --" name="proposta.seguradoIndividualCollection[%{itemCorrente}].sexoConjuge" list="{'MASCULINO','FEMININO'}" onchange="setSeguradoAlterado(true);"/>
				  </td>
				</tr>
			  </table>
			  </fieldset>
			</td>
		  </tr>
		</table>
		</div>
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
		<td>
		  <fieldset>
		  <legend accesskey="C"><b>Dados dos <u>B</u>eneficiários</b></legend>
		  <div id="divDadosBeneficiario">
		  <table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
			  <td colspan="2">
				<label for="beneficiarioNome">Beneficiários</label><br />
				<s:textfield theme="simple" id="beneficiarioIndividualId" name="beneficiarioIndividual.id" cssStyle="display:none"/>
				<s:textfield theme="simple" cssClass="requiredField clTextoRestrito" id="beneficiarioNome" name="beneficiarioIndividual.nome" size="50" maxlength="60" />
			  </td>
			  <td width="15%">
				<label for="beneficiarioDataNasc">Dt. Nascimento</label><br />
				<s:textfield theme="simple" cssClass="requiredField clData" id="beneficiarioDataNasc" name="beneficiarioIndividual.dataNascimento" onblur="isValidDate(this)" size="12" maxlength="10"/>
			  </td>
			  <td width="15%">
				<label for="beneficiarioSexo">Sexo</label><br />
				<s:select theme="simple" id="beneficiarioSexo" headerKey="" headerValue="-- Selecione --" name="beneficiarioIndividual.sexo" list="{'MASCULINO','FEMININO'}"/>
			  </td>
			  <td width="15%">
				<label for="beneficiarioParentesco">Parentesco</label><br />
				<s:select theme="simple" id="beneficiarioParentesco" headerKey="" headerValue="-- Selecione --" name="beneficiarioIndividual.parentesco" list="{'CÔNJUGE','FILHO','ENTEADO','MÃE','PAI','IRMÃO'}"/>
			  </td>
			  <td width="15%">
				<label for="beneficiarioPercentual">Percentual</label><br />
				<s:textfield theme="simple" id="beneficiarioPercentual" cssClass="clValor2 currency" name="beneficiarioIndividual.percentual" size="15" maxlength="10"/>
			  </td>
			</tr>
		  </table>
		  </div>
		  <br/>
		  <hr/>
		  <table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
			  <td style="width:105px;">
				<table border="0" cellpadding="0" cellspacing="0"><tr><td><label id="labelCover">
			    <a href="#" class="button" onclick="apagarDadosBeneficiario();" tabindex="-1">
				<table onmouseout="this.className='wButton'; return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton">
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">Apagar Dados</td>
					<td class="wButton_right"/>
				  </tr>
				</table>
			    </a></label></td></tr>
			    </table>
			  </td>
			  <td>
				<table border="0" cellpadding="0" cellspacing="0"><tr><td><label id="labelCover">
			    <a href="#" class="button" onclick="inserirBeneficiario()" >
				<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">Adicionar</td>
					<td class="wButton_right"/>
				  </tr>
				</table>
			    </a></label></td></tr>
			    </table>
			  </td>
			</tr>
		  </table>
		  </fieldset>
		</td>
	  </tr>
	  <tr>
		<td>
		  <div id="divListaBeneficiarios" style="border: 1px;overflow:auto;">
			<table id="tableBeneficiarios" class="listItens">
			  <tr class="listItensHeader">
				<td width="8%" nowrap="nowrap">Ações</td>
				<td width="47%" nowrap="nowrap">Nome</td>
				<td width="10%" nowrap="nowrap">Dt Nasc.</td>
				<td width="10%" nowrap="nowrap">Sexo</td>
				<td width="10%" nowrap="nowrap">Parentesco</td>
				<td width="15%" nowrap="nowrap">Percentual</td>
			  </tr>
			  <s:iterator value="beneficiarioList" status="stat">
				<tr>
				  <td nowrap="nowrap" class="small_image"  id="labelCover">
					<s:textfield theme="simple" id="beneficiarioSeguradoId%{#stat.index}" name="proposta.seguradoIndividualCollection[%{itemCorrente}].beneficiarioIndividualCollection[%{#stat.index}].seguradoIndividual.id" value="%{seguradoIndividual.id}" cssStyle="display:none"/>
					<s:textfield theme="simple" id="beneficiarioIndividualId%{#stat.index}" name="proposta.seguradoIndividualCollection[%{itemCorrente}].beneficiarioIndividualCollection[%{#stat.index}].id" value="%{id}" cssStyle="display:none"/>
					<s:textfield theme="simple" id="beneficiarioNome%{#stat.index}" name="proposta.seguradoIndividualCollection[%{itemCorrente}].beneficiarioIndividualCollection[%{#stat.index}].nome" value="%{nome}" cssStyle="display:none"/>
					<s:textfield theme="simple" id="beneficiarioDataNasc%{#stat.index}" name="proposta.seguradoIndividualCollection[%{itemCorrente}].beneficiarioIndividualCollection[%{#stat.index}].dataNascimento" value="%{dataNascimento}" cssStyle="display:none"/>
					<s:textfield theme="simple" id="beneficiarioSexo%{#stat.index}" name="proposta.seguradoIndividualCollection[%{itemCorrente}].beneficiarioIndividualCollection[%{#stat.index}].sexo" value="%{sexo}" cssStyle="display:none"/>
					<s:textfield theme="simple" id="beneficiarioParentesco%{#stat.index}" name="proposta.seguradoIndividualCollection[%{itemCorrente}].beneficiarioIndividualCollection[%{#stat.index}].parentesco" value="%{parentesco}" cssStyle="display:none"/>
					<s:textfield theme="simple" id="beneficiarioPercentual%{#stat.index}" name="proposta.seguradoIndividualCollection[%{itemCorrente}].beneficiarioIndividualCollection[%{#stat.index}].percentual" value="%{percentual}" cssStyle="display:none"/>
					<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/delete.gif" includeParams="none"/>" onclick="if(confirma('Confirma exclusão?')){removeBeneficiario('<s:property value="id"/>');}"/>
					<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/edit.gif" includeParams="none"/>" onclick="if(confirma('Confirma edição?')){editarBeneficiario('<s:property value="id"/>');}"/>
				  </td>
				  <td nowrap="nowrap"><s:property value="nome"/>&nbsp;</td>
				  <td nowrap="nowrap"><s:property value="dataNascimento"/>&nbsp;</td>
				  <td nowrap="nowrap"><s:property value="sexo"/>&nbsp;</td>
				  <td nowrap="nowrap"><s:property value="parentesco"/>&nbsp;</td>
				  <td nowrap="nowrap"><fmt:formatNumber value="${percentual}" type="currency" currencySymbol=""/>&nbsp;</td>
				</tr>
			  </s:iterator>
			</table>
		  </div>
		</td>
	  </tr>
	  </table>
		  <table width="100%" border="0" cellpadding="0" cellspacing="0">
		  <tr>
			<td colspan="2">
				<fieldset>
				<legend accesskey="o">Coberturas Contratadas</legend>
				<div id="divListaCoberturas">
				<table id="tableCoberturas" width="100%" border="0" cellpadding="2" cellspacing="1" >
				<tbody>
				  <tr>
					<td width="40%">&nbsp;</td>
					<td width="15%">LMI</td>
					<td width="15%">Franquia</td>
					<td width="15%">Observação Franquia</td>
					<td width="15%">Prêmio Líquido por Cobertura</td>
				  </tr>
				  <s:iterator value="segIndividualCoberturasList" status="stat">
				  <s:if test="coberturas.id != null">
				  <s:if test="%{coberturas.ramo.id == ramoVidaIndividual}">
					<tr>
					  <td nowrap="nowrap">
						<s:textfield theme="simple" id="segIndividualCoberturasId%{#stat.index}" name="proposta.seguradoIndividualCollection[%{itemCorrente}].segIndividualCoberturasCollection[%{#stat.index}].id" value="%{id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaId%{#stat.index}" name="proposta.seguradoIndividualCollection[%{itemCorrente}].segIndividualCoberturasCollection[%{#stat.index}].coberturas.id" value="%{coberturas.id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaSeguradoId%{#stat.index}" name="proposta.seguradoIndividualCollection[%{itemCorrente}].segIndividualCoberturasCollection[%{#stat.index}].seguradoIndividual.id" value="%{seguradoIndividual.id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaSequencia%{#stat.index}" name="proposta.seguradoIndividualCollection[%{itemCorrente}].segIndividualCoberturasCollection[%{#stat.index}].sequencia" value="%{sequencia}" cssStyle="display:none"/>
					    <s:property value="coberturas.descricao"/>:
					  </td>
					  <td><s:textfield theme="simple" id="coberturaLmi%{#stat.index}" cssClass="clValor2 currency" name="proposta.seguradoIndividualCollection[%{itemCorrente}].segIndividualCoberturasCollection[%{#stat.index}].lmi" value="%{lmi}" onkeyup="enableDisableDadosCobertura('%{#stat.index}');" onchange="setSeguradoAlterado(true);" cssStyle="width:80%" /></td>
					  <s:if test="coberturas.blnInformaFranquia">
					    <td><s:textfield theme="simple" id="coberturaFranquia%{#stat.index}" cssClass="clValor2 currency" name="proposta.seguradoIndividualCollection[%{itemCorrente}].segIndividualCoberturasCollection[%{#stat.index}].franquia" value="%{franquia}" cssStyle="width:80%" onchange="setSeguradoAlterado(true);"/></td>
					    <td><s:textfield theme="simple" id="coberturaTextoFranquia%{#stat.index}" name="proposta.seguradoIndividualCollection[%{itemCorrente}].segIndividualCoberturasCollection[%{#stat.index}].textoFranquia" value="%{textoFranquia}" maxlength="100" cssStyle="width:96%" onchange="setSeguradoAlterado(true);"/></td>
					  </s:if>
					  <s:else>
					    <td></td><td></td>
					  </s:else>
					  <td><s:textfield theme="simple" id="coberturaPremio%{#stat.index}" cssClass="clValor2 currency" name="proposta.seguradoIndividualCollection[%{itemCorrente}].segIndividualCoberturasCollection[%{#stat.index}].premio" value="%{premio}" cssStyle="width:80%" onchange="setSeguradoAlterado(true);"/></td>
					</tr>
				  </s:if>
				  </s:if>
				  <s:else>
					<tr>
					  <td nowrap="nowrap">
						<s:textfield theme="simple" id="segIndividualCoberturasId%{#stat.index}" name="proposta.seguradoIndividualCollection[%{itemCorrente}].segIndividualCoberturasCollection[%{#stat.index}].id" value="%{id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaSeguradoId%{#stat.index}" name="proposta.seguradoIndividualCollection[%{itemCorrente}].segIndividualCoberturasCollection[%{#stat.index}].seguradoIndividual.id" value="%{seguradoIndividual.id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaBlnFranquia%{#stat.index}" name="proposta.seguradoIndividualCollection[%{itemCorrente}].segIndividualCoberturasCollection[%{#stat.index}].blnInformaFranquia" value="%{blnInformaFranquia}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaSequencia%{#stat.index}" name="proposta.seguradoIndividualCollection[%{itemCorrente}].segIndividualCoberturasCollection[%{#stat.index}].sequencia" value="%{sequencia}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaDescricao%{#stat.index}" name="proposta.seguradoIndividualCollection[%{itemCorrente}].segIndividualCoberturasCollection[%{#stat.index}].descricao" value="%{descricao}" size="30" onchange="setSeguradoAlterado(true);" />
					  </td>
					  <td><s:textfield theme="simple" id="coberturaLmi%{#stat.index}" cssClass="clValor2 currency" name="proposta.seguradoIndividualCollection[%{itemCorrente}].segIndividualCoberturasCollection[%{#stat.index}].lmi" value="%{lmi}" onkeyup="enableDisableDadosCobertura('%{#stat.index}');"  onchange="setSeguradoAlterado(true);" cssStyle="width:80%" /></td>
					  <s:if test="blnInformaFranquia">
					    <td><s:textfield theme="simple" id="coberturaFranquia%{#stat.index}" cssClass="clValor2 currency" name="proposta.seguradoIndividualCollection[%{itemCorrente}].segIndividualCoberturasCollection[%{#stat.index}].franquia" value="%{franquia}" cssStyle="width:80%" onchange="setSeguradoAlterado(true);"/></td>
					    <td><s:textfield theme="simple" id="coberturaTextoFranquia%{#stat.index}" name="proposta.seguradoIndividualCollection[%{itemCorrente}].segIndividualCoberturasCollection[%{#stat.index}].textoFranquia" value="%{textoFranquia}" maxlength="100" cssStyle="width:96%" onchange="setSeguradoAlterado(true);"/></td>
					  </s:if>
					  <s:else>
					    <td></td><td></td>
					  </s:else>
					  <td><s:textfield theme="simple" id="coberturaPremio%{#stat.index}" cssClass="clValor2 currency" name="proposta.seguradoIndividualCollection[%{itemCorrente}].segIndividualCoberturasCollection[%{#stat.index}].premio" value="%{premio}" cssStyle="width:80%" onchange="setSeguradoAlterado(true);"/></td>
					</tr>
				  </s:else>
				  </s:iterator>
				  </tbody>
				</table>
				</div>
				<table>
				  <tr>
				  	<td>
					<table border="0" cellpadding="0" cellspacing="0"><tr><td><label id="labelCover">
				      <a href="#" class="button" onclick="abrirDivNovaCobertura();" >
					  <table onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
					    <tr>
						  <td class="wButton_left"></td>
						  <td class="wButton_text wButton_width">Adicionar Cobertura</td>
						  <td class="wButton_right"/>
					    </tr>
					  </table>
				    </a></label></td></tr>
				    </table>
				    </td>
				  </tr>
				</table>
				</fieldset>
	    	  </td>
	        </tr>
	      </table>
		</td>
	  </tr>
	</table>
  </div>
  	
<% } catch (Exception e) {e.printStackTrace();}%>