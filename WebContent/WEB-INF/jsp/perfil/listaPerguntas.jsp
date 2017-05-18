<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try {
%>

	<table id="tablePerguntas" width="100%" class="listItens">
		  <tr class="listItensHeader">
			<td width="5%" nowrap="nowrap">Ações</td>
			<td width="8%">Ordem</td>
			<td width="*">Pergunta</td>
			<td width="15%">Tipo de Resposta</td>
			<td width="7%" align="center">Ativo</td>
		  </tr>
		  <s:iterator value="perguntasPerfils" status="stat">
			<tr>
			  <td nowrap="nowrap" class="small_image">
				<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/delete.gif" includeParams="none"/>" onclick="if(confirma('Confirma exclusão?')){removePergunta('<s:property value="id"/>');}"/>
				<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/edit.gif" includeParams="none"/>" onclick="if(confirma('Confirma edição?')){editarPergunta('<s:property value="id"/>');}"/>
			  </td>
			  <td nowrap="nowrap">
				<s:textfield theme="simple" id="perguntaPerfilId%{#stat.index}" name="perfil.perguntasPerfilCollection[%{#stat.index}].id" value="%{id}" cssStyle="display:none"/>
				<s:textfield theme="simple" id="perfilId%{#stat.index}" name="perfil.perguntasPerfilCollection[%{#stat.index}].perfil.id" value="%{perfil.id}" cssStyle="display:none"/>
				<s:textfield theme="simple" id="ordem%{#stat.index}" name="perfil.perguntasPerfilCollection[%{#stat.index}].ordem" value="%{ordem}" cssStyle="display:none"/>
				<s:property value="ordem"/>
			  </td>
			  <td>
				<s:textfield theme="simple" id="pergunta%{#stat.index}" name="perfil.perguntasPerfilCollection[%{#stat.index}].pergunta" value="%{pergunta}" cssStyle="display:none"/>
				<s:property value="pergunta"/>
			  </td>
			  <td>
				<s:if test="%{tipoResposta == 0}">
					SIM ou NAO
				</s:if>
				<s:else>
					Texto ou Valor
				</s:else>
				<s:textfield theme="simple" id="tipoResposta%{#stat.index}" name="perfil.perguntasPerfilCollection[%{#stat.index}].tipoResposta" value="%{tipoResposta}" cssStyle="display:none"/>
			  </td>
			  <td align="center">
				<s:if test="%{ativa == null || not ativa}">
					&nbsp;
				</s:if>
				<s:else>
					S
				</s:else>
			  </td>			  
			</tr>
		  </s:iterator>
		</table>

<% } catch (Exception e) {e.printStackTrace();}%>