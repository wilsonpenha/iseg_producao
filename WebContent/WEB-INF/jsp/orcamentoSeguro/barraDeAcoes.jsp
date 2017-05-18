<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try {
%>
    
	  <tr>
  <td height="*" valign="top"><div id="navegador" style="width:98%; height:30px; margin: 5px 0px 4px 4px; z-index:1;" >
    <table border="0" cellpadding="0" cellspacing="0">
	  <tr>
	  <s:if test="checarMenuAcaoPrivilegio(menuTrigger.id,'F2-Criar nova')">
		<td>
		  <input type="button" id="btnf14" style="display: none;" />
		  <a href="#" class="button" onclick="$('#btnf14').click();alterado=false;" >
		  <table onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" onclick="" >
			<tr>
			  <td class="wButton_left"></td>
			  <td class="wButton_text wButton_width">F2-Novo</td>
			  <td class="wButton_right"/>
			</tr>
		  </table>
		  </a>
		</td>
	  </s:if>
	  <s:if test="checarMenuAcaoPrivilegio(menuTrigger.id,'F4-Salvar')">
		<td>
		  <input type="button" id="btnf4" style="display: none;" onclick="if (ConfirmaSubmit(FORM_PROPOSTA_WIZARD,OP_INSERT_UPDATE,OP_COM_CONFIRMA)){salvarOrcamento();alterado=false;}"/>
		  <a href="#" class="button" onclick="$('#btnf4').click();">
		  <table onmouseout="this.className='wButton'; return true;" onmouseover="this.className='wButton_hover'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" onclick="">
			<tr>
			  <td class="wButton_left"></td>
			  <td class="wButton_text wButton_width">F4-Salvar</td>
			  <td class="wButton_right"/>
			</tr>
		  </table>
		  </a>
		</td>
		</s:if>
		<s:if test="(proposta.statusOperacional == 0 || proposta.statusOperacional == 5 || proposta.statusOperacional == 8) && proposta.situacaoOperacional == 0">
		  <s:if test="checarMenuAcaoPrivilegio(menuTrigger.id,'F7-Excluir')">
			<td>
			  <input type="button" id="btnf7" style="display: none;" onclick="if (confirma('Confirma exclusão?')){submitForm(document.formEdit, '<s:url action='excluir.action' includeParams="none"/>', false);}"/>
			  <a href="#" class="button" onclick="$('#btnf7').click();">
			  <table onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" onclick="">
				<tr>
				  <td class="wButton_left"></td>
				  <td class="wButton_text wButton_width">F7-Excluir</td>
				  <td class="wButton_right"/>
				</tr>
			  </table>
			  </a>
			</td>
		  </s:if>
		</s:if>
		<s:else>
		  <s:if test="checarMenuAcaoPrivilegio(menuTrigger.id,'F7-Editar')">
			<td>
			  <input type="button" id="btnf7" style="display: none;"/>
			  <a href="#" class="button" onclick="$('#btnf7').click();">
			  <table onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" onclick="">
				<tr>
				  <td class="wButton_left"></td>
				  <td class="wButton_text wButton_width">F7-Editar</td>
				  <td class="wButton_right"/>
				</tr>
			  </table>
			  </a>
			</td>
		  </s:if>
		</s:else>
		<td>
		  <input type="button" id="btnf4" style="display: none;" onclick="salvarOrcamento();"/>
		  <a href="#" class="button" onclick="$('#btnf4').click();">
		  <table onmouseout="this.className='wButton'; return true;" onmouseover="this.className='wButton_hover'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" onclick="">
			<tr>
			  <td class="wButton_left"></td>
			  <td class="wButton_text wButton_width">F4-Salvar</td>
			  <td class="wButton_right"/>
			</tr>
		  </table>
		  </a>
		</td>
		<td>
		  <input type="button" id="btnf5" style="display: none;" onclick="return navigate('anterior');"/>
		  <a href="#" class="button" onclick="$('#btnf5').click();">
		  <table onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" onclick="">
			<tr>
			  <td class="wButton_left"></td>
			  <td class="wButton_text wButton_width">F5-Anterior</td>
			  <td class="wButton_right"/>
			</tr>
		  </table>
		  </a>
		</td>
		<td>
		  <input type="button" id="btnf6" style="display: none;" onclick="return navigate('proximo');"/>
		  <a href="#" class="button" onclick="$('#btnf6').click();">
		  <table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" onclick="">
			<tr>
			  <td class="wButton_left"></td>
			  <td class="wButton_text wButton_width">F6-Próximo</td>
			  <td class="wButton_right"/>
			</tr>
		  </table>
		  </a>
		</td>
		<td>
		  <input type="button" id="btnf8" style="display: none;" onclick="if (confirma('Confirma?')){listaPropostas();alterado=false;}"/>
		  <a href="#" class="button" onclick="$('#btnf8').click();">
		  <table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" onclick="">
			<tr>
			  <td class="wButton_left"></td>
			  <td class="wButton_text wButton_width">F8-Fechar</td>
			  <td class="wButton_right"/>
			</tr>
		  </table>
		  </a>
		</td>
		<td>
		  <input type="reset" id="btnf3" style="display: none;" onclick="alterado=false;"/>
		  <a href="#" class="button" onclick="$('#btnf3').click();">
		  <table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" onclick="">
			<tr>
			  <td class="wButton_left"></td>
			  <td class="wButton_text wButton_width">F3-Restaurar</td>
			  <td class="wButton_right"/>
			</tr>
		  </table>
		  </a>
		</td>
		<s:if test="%{orcamentoSeguro.situacao.id == 1}">
			<td>
			  <input type="button" id="btnf10" style="display: none;" onclick="enviarParaCalculo();"/>
			  <a href="#" class="button" onclick="$('#btnf10').click();">
			  <table onmouseout="this.className='wButton'; return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton">
				<tr>
				  <td class="wButton_left"></td>
				  <td class="wButton_text wButton_width" id="buttonCalculando">F10-Enviar para Cálculo</td>
				  <td class="wButton_right"/>
				</tr>
			  </table>
			  </a>
			</td>
		</s:if>
		<s:elseif test="%{orcamentoSeguro.situacao.id == 2}">
			<td>
			  <input type="button" id="btnf10" style="display: none;" onclick="finalizarCalculo();"/>
			  <a href="#" class="button" onclick="$('#btnf10').click();">
			  <table onmouseout="this.className='wButton'; return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton">
				<tr>
				  <td class="wButton_left"></td>
				  <td class="wButton_text wButton_width">F10-Finalizar Cálculo</td>
				  <td class="wButton_right"/>
				</tr>
			  </table>
			  </a>
			</td>
		</s:elseif>
		<td>
		  <input type="button" id="btnf11" style="display: none;" onclick="gerarOrcamento();"/>
		  <a href="#" class="button" onclick="$('#btnf11').click();">
		  <table onmouseout="this.className='wButton'; return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton">
			<tr>
			  <td class="wButton_left"></td>
			  <td class="wButton_text wButton_width">F11-Gerar Orcamento</td>
			  <td class="wButton_right"/>
			</tr>
		  </table>
		  </a>
		</td>
	  </tr>
	</table>
	</div>
	</td>
	</tr>
	  
<% } catch (Exception e) {e.printStackTrace();}%>