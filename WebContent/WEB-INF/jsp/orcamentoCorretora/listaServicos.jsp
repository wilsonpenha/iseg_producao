<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try { 
%>
<table id="tableServicosCorretora" class="listItens">
  <tr class="listItensHeader">
	<td width="90%" nowrap="nowrap">Descrição</td>
	<td width="10%" nowrap="nowrap">Ações</td>
  </tr>
  <s:iterator value="corretoraServicosIsegList" status="stat">
	<tr>
	  <td nowrap="nowrap"><s:property value="%{servicosIseg.descricao}"/>&nbsp;</td>
	  <td nowrap="nowrap" class="small_image" align="center">
	    <a href="#" onclick="if(confirma('Confirma exclusão?')){excluirServicos('<s:property value="id"/>');}" class="Main_ToolBar_Button " onMouseOver="window.status='Excluir Registro';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonDelete">
		       <img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Delete" id="buttonDelete" title="Excluir Condutor">
	    </a>
	  </td>
	</tr>
  </s:iterator>
</table>
<% } catch (Exception e) {e.printStackTrace();}%>