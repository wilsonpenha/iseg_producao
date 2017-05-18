<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try { 
%>
<table id="tableCoberturasCorretora" class="listItens">
  <tr class="listItensHeader">
	<td width="70%" nowrap="nowrap">Descrição</td>
	<td width="10%" nowrap="nowrap">Lmi</td>
	<td colspan="2" width="20%" nowrap="nowrap">Ações</td>
  </tr>
  <s:iterator value="corretoraCoberturasIsegList" status="stat">
	<tr>
	  <td nowrap="nowrap"><s:property value="%{coberturasIseg.descricao}"/>&nbsp;</td>
	  <td nowrap="nowrap"><s:property value="%{lmi}"/>&nbsp;</td>
	  <td nowrap="nowrap" class="small_image" align="center">
	    <a href="#" onclick="if(confirma('Confirma exclusão?')){excluirCoberturas('<s:property value="id"/>');}" class="Main_ToolBar_Button " onMouseOver="window.status='Excluir Registro';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonDelete">
		       <img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Delete" id="buttonDelete" title="Excluir Condutor">
	    </a>
	  </td>
	  <td nowrap="nowrap" class="small_image" align="center">
	    <a href="#" onclick="if(confirma('Confirma edição?')){editarCoberturas('<s:property value="id"/>');}" class="Main_ToolBar_Button " onMouseOver="window.status='Editar Registro';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonEditar">
		       <img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Edit" id="buttonEditar" title="Editar Condutor">
	    </a>
	  </td>
	</tr>
  </s:iterator>
</table>
<% } catch (Exception e) {e.printStackTrace();}%>