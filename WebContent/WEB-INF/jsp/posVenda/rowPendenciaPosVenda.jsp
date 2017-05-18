<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try {
%>

<tr>
  <td>
	<s:property value="pendenciaPosVenda.dataAbertura"/>
  </td>
  <td nowrap="nowrap">
	<s:textfield theme="simple" id="pendenciaId%{pendenciaPosVendaList.size()}" name="posVenda.pendenciaPosVendaCollection[%{pendenciaPosVendaList.size()-1}].id" value="%{pendenciaPosVenda.id}" cssStyle="display:none"/>
	<s:textfield theme="simple" id="posVendaId%{pendenciaPosVendaList.size()}" name="posVenda.pendenciaPosVendaCollection[%{pendenciaPosVendaList.size()-1}].posVenda.id" value="%{pendenciaPosVenda.posVenda.id}" cssStyle="display:none"/>
	<s:textfield theme="simple" id="posVendaId%{pendenciaPosVendaList.size()}" name="posVenda.pendenciaPosVendaCollection[%{pendenciaPosVendaList.size()-1}].usuario.id" value="%{pendenciaPosVenda.usuario.id}" cssStyle="display:none"/>
	<s:textfield theme="simple" id="servicoId%{pendenciaPosVendaList.size()}" name="posVenda.pendenciaPosVendaCollection[%{pendenciaPosVendaList.size()-1}].descricao" value="%{pendenciaPosVenda.descricao}" cssStyle="display:none"/>
	<s:textfield theme="simple" id="servicoSequencia%{pendenciaPosVendaList.size()}" name="posVenda.pendenciaPosVendaCollection[%{pendenciaPosVendaList.size()-1}].dataAbertura" value="%{pendenciaPosVenda.dataAbertura}" cssStyle="display:none"/>
	<s:textfield theme="simple" id="servicoSequencia%{pendenciaPosVendaList.size()}" name="posVenda.pendenciaPosVendaCollection[%{pendenciaPosVendaList.size()-1}].dataBaixa" value="%{pendenciaPosVenda.dataBaixa}" cssStyle="display:none"/>
	<s:property value="pendenciaPosVenda.descricao"/>
  </td>
  <td>
	  <s:textfield theme="simple" cssClass="requiredField" id="acao%{pendenciaPosVendaList.size()}" name="posVenda.pendenciaPosVendaCollection[%{pendenciaPosVendaList.size()-1}].acao" cssStyle="height:14px;width:220px;"/>
  </td>
  <td>
	<s:property value="pendenciaPosVenda.dataBaixa"/>
  </td>
  <td>
	<s:property value="pendenciaPosVenda.usuario.nome"/>
  </td>
</tr>

<% } catch (Exception e) {e.printStackTrace();}%>