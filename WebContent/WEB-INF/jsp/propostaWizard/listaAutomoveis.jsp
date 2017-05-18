<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try {
%>

		    <table id="tableAutomovelItens" style="padding-top: 1px;" class="listItens" style="width: 100%" cellspacing="0" cellpadding="0" border="0">
				  <tr class="listItensHeader">
					<td width="10%" nowrap="nowrap">Ações</td>
					<td width="5%" nowrap="nowrap">Item</td>
					<td width="5%" nowrap="nowrap">Placa</td>
					<td width="13%" nowrap="nowrap">Marca</td>
					<td width="27%" nowrap="nowrap">Modelo</td>
					<td width="20%" nowrap="nowrap">Chassis</td>
					<td width="10%" nowrap="nowrap">Cor</td>
					<td width="5%" nowrap="nowrap">Ano Fab</td>
					<td width="5%" nowrap="nowrap">Ano Mod</td>
				  </tr>
				  <s:iterator value="automovelList" status="stat">
				  <s:if test="!linhaVazia">
					<tr>
					  <td nowrap="nowrap" class="small_image">
						<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/delete.gif" includeParams="none"/>" onclick="if(confirma('Confirma exclusão?')){removerItem('${stat.index}');}"/>
						<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/edit.gif" includeParams="none"/>" onclick="editarImovel('${stat.index}')"/>
					  </td>
					  <td nowrap="nowrap"><s:property value="numeroItem"/>&nbsp;</td>
					  <td nowrap="nowrap"><s:property value="nroPlaca"/>&nbsp;</td>
					  <td nowrap="nowrap"><s:property value="%{modeloVeiculo != null ? modeloVeiculo.fabricante.nome : fabricante.nome}"/>&nbsp;</td>
					  <td nowrap="nowrap"><s:property value="%{modeloVeiculo != null ? modeloVeiculo.descricao : modeloNome}"/>&nbsp;</td>
					  <td nowrap="nowrap"><s:property value="nroChassis"/>&nbsp;</td>
					  <td nowrap="nowrap"><s:property value="corPredominante"/>&nbsp;</td>
					  <td nowrap="nowrap"><s:property value="anoFabricacao"/>&nbsp;</td>
					  <td nowrap="nowrap"><s:property value="anoModelo"/>&nbsp;</td>
					</tr>
				  </s:if>
				  </s:iterator>
				</table>
			  	<table style="margin-left:10px; -moz-border-radius: 4px;">
				  <tr>
				  	<td>
				      <a href="#" class="button" onclick="$('#itensSegurados').click();" >
					  <table cellpadding="0" cellspacing="0" onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
					    <tr>
						  <td class="wButton_left"></td>
						  <td class="wButton_text wButton_width">Fechar</td>
						  <td class="wButton_right"/>
					    </tr>
					  </table>
					  </a>
				    </td>
				  	<td>
				      <a href="#" class="button" onclick="novoItem();" >
					  <table cellpadding="0" cellspacing="0" onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
					    <tr>
						  <td class="wButton_left"></td>
						  <td class="wButton_text wButton_width">Novo item</td>
						  <td class="wButton_right"/>
					    </tr>
					  </table>
					  </a>
				    </td>
				  </tr>
				</table>

<% } catch (Exception e) {e.printStackTrace();}%>