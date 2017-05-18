<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" type="text/css" href="<s:url value="/common/web/skins/Default/Main/Client/DataGrid/DataGrid.css" includeParams="none" />" id="paramCSS"></link>
<link rel="stylesheet" type="text/css" href="<s:url value="/common/esquema.css" includeParams="none"/>" />

<table width="100%" border="0">
  <tr>
	<td>
	  <table class="FieldGroup" border="0" cellpadding="0" cellspacing="0">
		<tbody>
		  <tr class="FieldGroup_TopMargin"></tr>
			<tr>
			  <td class="FieldGroupTitle_Left"><img class="FieldGroupTitle_Left_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></td>
			  <td class="FieldGroupTitle">Resultado</td>
			  <td class="FieldGroupTitle_Right"><img class="FieldGroupTitle_Right_bg" src="<s:url value="/common/web/images/blank.gif" includeParams="none"/>" border="0"></td>
			  <td width="200px">&nbsp;</td>
			<td valign="bottom">
		      <a href="#" class="button" onclick="marcarTodas();" >
			  <table onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
			    <tr>
				  <td class="wButton_left"></td>
				  <td class="wButton_text wButton_width" nowrap="nowrap">Marcar/Desmarcar todos</td>
				  <td class="wButton_right"/>
			    </tr>
			  </table>
			  </a>
		    </td>
			</tr>
			<tr class="FieldGroup_BottomMargin"></tr>
		  </tbody>
		</table>
	  </td>
	</tr>
</table>
<input type="hidden" name="page" value="${page}">
<input type="hidden" name="listCount" value="${listCount}">
<input id="totalRegistros" type="text" value="<s:property value="firstPosition"/>-<s:property value="lastPosition"/>/<s:property value="listCount"/>" style="display:none;"/>
<table class="tableTag" id="DivTable" width="100%" align="center" border="0" cellpadding="0" cellspacing="0">
	<tr height="20px" bgcolor="#A0CC84">
	<td width="2%" nowrap="nowrap"><b> </b></td>
	<td width="6%" nowrap="nowrap"><b>Data </b></td>
	<td width="4%" nowrap="nowrap"><b>Apólice</b></td>
	<td width="15%" nowrap="nowrap"><b>Segurado</b></td>
	<td width="6%" nowrap="nowrap"><b>In. Vigência</b></td>
	<td width="13%" nowrap="nowrap"><b>Ramo</b></td>
	<td width="13%" nowrap="nowrap"><b>Seguradora</b></td>
	<td width="3%" nowrap="nowrap" align="center"><b>Parc</b></td>
	<td width="8%" nowrap="nowrap" align="center"><b>Vlr Base</b></td>
	<td width="8%" nowrap="nowrap" align="center"><b>%</b></td>
	<td width="8%" nowrap="nowrap" align="center"><b>Repasse</b></td>
	</tr>
	<s:if test="repasseComissaoList.size > 0">
	
    <s:set var="totalPercentualComissao" value="0" />
	<s:iterator value="repasseComissaoList" status="rowstatus">
		<s:if test="#rowstatus.odd == true">
			<tr class="tableTag_row" id="linha<s:property value="id"/>" style="{cursor:pointer;}" onMouseover="setColorOn('linha<s:property value="id"/>');" onMouseout="setColorOff('linha<s:property value="id"/>');" bgcolor="#EBF3E4">
		</s:if>
		<s:else>
			<tr class="tableTag_row" id="linha<s:property value="id"/>" style="{cursor:pointer;}" onMouseover="setColorOn('linha<s:property value="id"/>');" onMouseout="setColorOff('linha<s:property value="id"/>');" bgcolor="#CBE3BB">
		</s:else>
		  	<c:set var="totalValorComissao" value="${valorPago+totalValorComissao}" />
		  	<c:set var="nroApolice" value="${comissionado.proposta.nroApolice}"/>
		  	<c:set var="iniVigencia" value="${comissionado.proposta.inicioVigencia}"/>
		  	<c:set var="string" value="${comissionado.proposta.seguradora.nome}"/>
		  	<c:set var="string1" value="${comissionado.proposta.cliente.nome}"/>
		  	<c:set var="string2" value="${comissionado.proposta.ramo.nome}"/>
		  	
		  	<s:if test="comissionado==null">
		  	   <c:set var="nroApolice" value="${agenciado.proposta.nroApolice}"/>
		  	   <c:set var="iniVigencia" value="${agenciado.proposta.inicioVigencia}"/>
		  	   <c:set var="string" value="${agenciado.proposta.seguradora.nome}"/>
		  	   <c:set var="string1" value="${agenciado.proposta.cliente.nome}"/>
		  	   <c:set var="string2" value="${agenciado.proposta.ramo.nome}"/>
		  	</s:if>
			<td class="tableTag_cell" id="<s:property value="id"/>" >
			  <input onclick="somarValor('<s:property value="id"/>');" id="check_<s:property value="id"/>" type="checkbox" name="repasseIds" value="<s:property value="id"/>">
			  <input type="hidden" id="valor_<s:property value="id"/>" name="valor" value="${valorPago}">
			</td>
			<td onclick="$('#check_<s:property value="id"/>').click();" class="tableTag_cell" id="<s:property value="id"/>" ><s:property value="dataLancamento"/>&nbsp;</td>
		  	<s:if test="origemLancamento==1">
				<td onclick="$('#check_<s:property value="id"/>').click();" class="tableTag_cell" id="<s:property value="id"/>" colspan="2"><s:property value="descricao"/></td>
		  	</s:if>
		  	<s:else>
				<td onclick="$('#check_<s:property value="id"/>').click();" class="tableTag_cell" id="<s:property value="id"/>" ><c:out value="${nroApolice}"/></td>
				<td onclick="$('#check_<s:property value="id"/>').click();" class="tableTag_cell" id="<s:property value="id"/>" ><c:out value="${fn:substring(string1,0,15)}"/></td>
		  	</s:else>
			<td onclick="$('#check_<s:property value="id"/>').click();" class="tableTag_cell" id="<s:property value="id"/>" ><fmt:formatDate pattern="dd/MM/yyyy" value="${iniVigencia}"/></td>
			<td onclick="$('#check_<s:property value="id"/>').click();" class="tableTag_cell" id="<s:property value="id"/>" ><c:out value="${fn:substring(string2,0,15)}"/></td>
			<td onclick="$('#check_<s:property value="id"/>').click();" class="tableTag_cell" id="<s:property value="id"/>" ><c:out value="${fn:substring(string,0,15)}"/></td>
		  	<s:if test="nroDaParcela==null">
				<td onclick="$('#check_<s:property value="id"/>').click();" class="tableTag_cell" id="<s:property value="id"/>" ><fmt:formatDate pattern="MM/yyyy" value="${referenciaParcela}"/></td>
		  	</s:if>
		  	<s:else>
			    <td onclick="$('#check_<s:property value="id"/>').click();" class="tableTag_cell" id="<s:property value="id"/>" align="center"><s:property value="nroDaParcela"/></td>
		  	</s:else>
			<td onclick="$('#check_<s:property value="id"/>').click();" class="tableTag_cell" id="<s:property value="id"/>" align="right"><div align="right"><fmt:formatNumber value="${valorBase}" type="currency" currencySymbol=""/>&nbsp;</div></td>
			<td onclick="$('#check_<s:property value="id"/>').click();" class="tableTag_cell" id="<s:property value="id"/>" align="right"><div align="right"><fmt:formatNumber value="${percentualRepasse}" type="currency" currencySymbol=""/>&nbsp;</div></td>
			<td onclick="$('#check_<s:property value="id"/>').click();" class="tableTag_cell" id="<s:property value="id"/>" align="right"><div align="right"><fmt:formatNumber value="${valorPago}" type="currency" currencySymbol=""/>&nbsp;</div></td>
		</tr>
	</s:iterator>
	<tr height="20px" bgcolor="#A0CC84">
	  <td colspan="9" class="tableTag_cell" >&nbsp;</td>
	  <td><b>Total:</b></td>
	  <td id="totalRepasse" align="right">&nbsp;</td>
	</tr>
		<script>
			$('#botaoQuitar').show();
			$('#dataQuitacao').val('<s:property value="dataQuitacao"/>');
			$('#trDataPagamento').show();
			$('#dataQuitacao').focus();
		</script>
	</s:if>
	<s:else>
	  <tr height="20" bgcolor="#CBE3BB"><td colspan="11" style="text-align:center;font-style:italic;">Nenhum Lançamento</td></tr>
		<script>
			$('#botaoQuitar').hide();
			$('#dataQuitacao').val('');
			$('#trDataPagamento').hide();
		</script>
	</s:else>
</table>
<script type="text/javascript">
	showCount();
	
</script>