<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try {
%>

				  <table id="tableProdutorItens" class="listItens">
					<tr class="listItensHeader">
					  <td width="42%">Produtor</td>
					  <td width="25%">%/Valor do Repasse</td> 
					  <td width="25%">Tipo Repasse</td>
					  <td width="8%">Excluir</td>
					</tr>
					<s:iterator value="grupoProdutores" status="stat">
					  <tr height="20px">
						<td>
						  <s:property value="produtor.pessoa.nome"/>
						</td>
						<td align="right"><s:property value="comissao"/></td>
					    <td><s:property value="getTipoComissaoDescricao(tipoComissao)" />&nbsp;</td>
						<td nowrap="nowrap" class="small_image" width="2%"><a href="#" onClick="if (confirm('Confirma a exclusão do comissionado?')) {removerProdutor('<s:property value="id"/>');}" class="Main_ToolBar_Button " onMouseOver="window.status='Excluir Registro';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonDelete"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Delete" id="buttonDelete" title="Excluir Comissionado"></a></td>				            	
					  </tr>
					</s:iterator>
				  </table>

<% } catch (Exception e) {e.printStackTrace();}%>