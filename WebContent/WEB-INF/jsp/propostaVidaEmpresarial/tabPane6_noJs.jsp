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
		    <div class="divMessages"id="divMessagesTab5" style="padding-bottom: 10px;">
		  	  <s:actionerror/>
			  <s:actionmessage/>
			  <s:fielderror/>
		    </div>
		  </td>
	    </tr>
	  </table>
	  <fieldset>
		<legend><b>Agenciamento</b></legend>
		<table id="tableComissao" width="100%" cellspacing="0" cellpadding="0" align="center" class="Main_Client_TableEdition">
		  <tr>
			<td>
			  <label for="grupoDeVendaId">Valor Inclusões:</label><br/>
			  <s:textfield theme="simple" id="premioLiquidoComTab" name="proposta.valorInclusoes" cssClass="dojoValidateValid clValor2 currency" readonly="true" disabled="true" />
			</td>
			<td>
			  <label for="produtorGerenteNome">Percentual Agenciamento:</label><br/>
			  <s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" id="percentualAgenciamento" name="proposta.percentualAgenciamento" readonly="true" disabled="true" />
			</td>
			<td>
			  <label for="totalComissao">Valor Agenciamento:</label><br/>
			  <s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" id="valorAgenciamento" name="proposta.valorAgenciamento" readonly="true" disabled="true" />
			</td>
			<td>
			  <label for="totalComissao">Qtde de Parcelas:</label><br/>
			  <s:textfield theme="simple" cssClass="TextBox_OneCells_width clParcelaAtual currency" id="parcelasAgenciamento" name="proposta.qtdeParcelasAgenciamento" readonly="true" disabled="true" />
			</td>
		  </tr>
		</table>
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		  <tr>
			<td colspan="5">
			  <table class="FieldGroup" border="0" cellpadding="0" cellspacing="0">
				<tbody>
				  <tr class="FieldGroup_TopMargin"></tr>
				  <tr>
					<td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></img></td>
					<td class="FieldGroupTitle">Resumo Parcelas</td>
					<td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></img></td>
					<td class="FieldGroupContent"></td>
				  </tr>
				  <tr class="FieldGroup_BottomMargin"></tr>
				</tbody>
			  </table>
			</td>
		  </tr>
		  <tr>
			<td><jsp:include page="parcelasAgenciamento.jsp"></jsp:include>
			</td>
		  </tr>
		</table>
		
	  </fieldset>
	  <fieldset>
		  <legend><b>Comissão a Pagar</b></legend>
		  <div id="divAgenciamentoPagar">
		  <table width="100%" cellspacing="0" cellpadding="0" class="Main_Client_TableEdition">
			<tr>
			  <td width="34%">
				<label for="grupoDeVendaId">Produtor/Grupo:</label><br/>
				<s:textfield theme="simple" id="grupoVendaQE" name="proposta.grupoDeVenda.quebraExclusividade" cssStyle="display:none;"/>
				<s:select theme="simple" disabled="true" id="grupoDeVendaId" name="proposta.grupoDeVenda.id" cssClass="dojoValidateValid" list="grupoDeVendaList" listKey="id" listValue="nomeDoGrupo"/>
			  </td>
			  <td width="33%">
				<label for="produtorGerenteNome">Supervisor</label><br/>
				<s:textfield theme="simple" cssClass="dojoValidateValid readonly" cssStyle="width:95%" id="produtorGerenteNome" name="proposta.grupoDeVenda.produtorGerente.nome" readonly="true"/>
			  </td>
			</tr>
		  </table>
		  <table width="100%" cellspacing="0" cellpadding="0" class="Main_Client_TableEdition">
		    <tr>
			  <td>
				<table class="FieldGroup" border="0" cellpadding="0" cellspacing="0">
				  <tbody>
					<tr class="FieldGroup_TopMargin"></tr>
					<tr>
					  <td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></img></td>
					  <td class="FieldGroupTitle">Comissionados do Agenciamento</td>
					  <td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></img></td>
					  <td class="FieldGroupContent"></td>
					</tr>
					<tr class="FieldGroup_BottomMargin"></tr>
				  </tbody>
				</table>
			  </td>
			</tr>
			<tr>
			  <td>
				<div class="divMessages" id="divMessagesComissionados"></div>
			  </td>
			</tr>
			<tr>
			  <td>
				<div id="divDadosComissionadosAgenciamento">
				  <jsp:include page="dadosComissionadosAgenciamento.jsp"></jsp:include>
				</div>
				<div id="divListaComissionadosAgenciamento">
				  <jsp:include page="listaComissionadosAgenciamento.jsp"></jsp:include>
				</div>
			  </td>
			</tr>
		  </table>
		  </div>
	  </fieldset>
  	
<% } catch (Exception e) {e.printStackTrace();}%>