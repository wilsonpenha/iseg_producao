<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try {
%>

		   		 <table id="tableOperadores" class="listItens">
					<tr class="listItensHeader">
					  <td width="50%">Usuario Operador</td>
					  <td width="2%">Excluir</td>
					</tr>
					<s:iterator value="operadoresPosVenda" status="stat">
					  <tr height="20px">
						<td>
						  <s:property value="usuario.nomeLogin"/>
						</td>
						<td nowrap="nowrap" class="small_image" width="2%"><a href="#" onClick="if (confirm('Confirma a exclusão do operador?')) {removerOperador('<s:property value="id"/>');}" class="Main_ToolBar_Button " onMouseOver="window.status='Excluir Registro';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonDelete"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Delete" id="buttonDelete" title="Excluir Operador"></a></td>				            	
					  </tr>
					</s:iterator>
				  </table>

<% } catch (Exception e) {e.printStackTrace();}%>