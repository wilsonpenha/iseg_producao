<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try {
%>

				<table id="tableCondutorItens" class="listItens" style="width: 100%" cellspacing="0" cellpadding="0" border="0">
				  <tr class="listItensHeader">
					<td width="10%" nowrap="nowrap">Ações</td>
					<td width="10%" nowrap="nowrap">CEP</td>
					<td width="35%" nowrap="nowrap">Logradouro</td>
					<td width="20%" nowrap="nowrap">Bairro</td>
					<td width="20%" nowrap="nowrap">Cidade</td>
					<td width="5%" nowrap="nowrap">UF</td>
				  </tr>
				  <s:iterator value="imovelList" status="stat">
					<tr>
					  <td nowrap="nowrap" class="small_image">
						<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/delete.gif" includeParams="none"/>" onclick="if(confirma('Confirma exclusão?')){removeImovel('${stat.index}');}"/>
						<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/edit.gif" includeParams="none"/>" onclick="if(confirma('Confirma edição?')){editarImovel('${stat.index}');}"/>
					  </td>
					  <td nowrap="nowrap"><s:property value="cep"/>&nbsp;</td>
					  <td nowrap="nowrap"><s:property value="logradouro"/>&nbsp;</td>
					  <td nowrap="nowrap"><s:property value="bairro"/>&nbsp;</td>
					  <td nowrap="nowrap"><s:property value="cidade"/>&nbsp;</td>
					  <td nowrap="nowrap"><s:property value="uf"/>&nbsp;</td>
					</tr>
				  </s:iterator>
				</table>

<% } catch (Exception e) {e.printStackTrace();}%>