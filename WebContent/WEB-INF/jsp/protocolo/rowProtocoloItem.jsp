<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try {
%>

<table width="100%" id="tablePendencias" class="listItens">
  <tr class="listItensHeader">
	<td id="" width="2%" nowrap="nowrap"><b>Ações</b></td>
	<td width="5%">Item</td>
	<td width="5%">Localizador</td>
	<td width="15%">Ramo</td>
	<td width="20%">Segurado</td>
	<td width="10%">Vigência</td>
	<td width="20%">Seguradora</td>
	<td width="15%">Produtor</td>
	<td width="10%">Usuario</td>
  </tr>
  <s:iterator value="protocoloItensList" status="stat">
	<tr>
	  <td nowrap="nowrap" class="small_image" align="center">
	    <a href="#" onclick="if(confirma('Confirma exclusão?')){removerItem('<s:property value="id"/>');}" class="Main_ToolBar_Button " onMouseOver="window.status='Excluir Registro';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonDelete">
		    <img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Delete" id="buttonDelete" title="Excluir Item">
	    </a>
	  </td>
	  <td>
		${stat.index+1}
	  </td>
	  <td nowrap="nowrap">
		<s:property value="proposta.numero"/>
	  </td>
	  <td nowrap="nowrap">
		<s:property value="proposta.ramo.nome"/>
	  </td>
	  <td nowrap="nowrap">
		<s:property value="proposta.cliente.nomeCurto"/>
	  </td>
	  <td nowrap="nowrap">
		<s:property value="proposta.inicioVigencia"/>
	  </td>
	  <td nowrap="nowrap">
		<s:property value="proposta.seguradora.nomeCurto"/>
	  </td>
	  <td nowrap="nowrap">
		<s:property value="proposta.produtor.apelido"/>
	  </td>
	  <td>
		<s:property value="usuario.nomeLogin"/>
	  </td>
	</tr>
  </s:iterator>
</table>
<% } catch (Exception e) {e.printStackTrace();}%>