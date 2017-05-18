<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try {
%>

<table id="tableAcompanhamentoItens" class="listItens">
  <tr class="listItensHeader">
	<td width="8%" nowrap="nowrap">Ações</td>
	<td width="22%" nowrap="nowrap">Data</td>
	<td width="70%">Descrição</td>
  </tr>
  <s:iterator value="acompanhamentoList" status="stat">
	<tr>
	  <td nowrap="nowrap" class="small_image">
		<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/delete.gif" includeParams="none"/>" onclick="if(confirma('Confirma exclusão?')){removeAcompanhamento('<s:property value="id"/>');}"/>
		<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/edit.gif" includeParams="none"/>" onclick="if(confirma('Confirma edição?')){editarAcompanhamento('<s:property value="id"/>');}"/>
	  </td>
	  <td nowrap="nowrap"><s:property value="dataLancamento"/>&nbsp;</td>
	  <td><s:property value="detalhamento"/>&nbsp;</td>
	</tr>
  </s:iterator>
  <s:if test="acompanhamentoList.isEmpty()"><tr><td colspan="4" style="text-align: center;"><i>Vazio</i></td></tr></s:if>
</table>

<script language="javascript">

</script>
<% } catch (Exception e) {e.printStackTrace();}%>