<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

		  <table cellspacing="3" cellpadding="0" width="100%" align="center">
			<tr>
				<td width="8%" class="TitleCell"><label class="LabelText" for="pergunta">Pergunta: </label></td>
				<td width="*" class="TextBox_ContentCell">
					<s:textfield theme="simple" id="perfilId" name="perguntasPerfil.perfil.id" cssStyle="display:none"/>
					<s:textfield theme="simple" id="perguntasPerfilId" name="perguntasPerfil.id" cssStyle="display:none"/>
					<s:textfield theme="simple" cssClass="dojoValidateValid TextBox_TwoCells_width requiredField" id="pergunta" name="perguntasPerfil.pergunta" maxlength="100"/>
				</td>
				<td width="20%" class="TitleCell"><label class="LabelText" for="tipoResposta">Tipo de Resposta: </label></td>
				<td width="15%" class="TextBox_ContentCell">
					<s:select theme="simple" cssClass="requiredField" id="tipoResposta" name="perguntasPerfil.tipoResposta" list="#{'0':'SIM ou NAO', '1':'Texto ou Valor'}"/>
				</td>
				<td width="8%" class="TitleCell"><label class="LabelText" for="ordem">Ordem: </label></td>
				<td width="5%" class="TextBox_ContentCell">
					<s:textfield theme="simple" cssClass="dojoValidateValid requiredField" id="ordem" name="perguntasPerfil.ordem" size="3" maxlength="3"/>
				</td>
				<td width="8%" class="TitleCell"><label class="LabelText" for="ordem">Ativo: </label></td>
				<td width="12%" class="TextBox_ContentCell">
					<s:select theme="simple" cssClass="requiredField" id="ativa" name="perguntasPerfil.ativa" list="#{'true':' SIM ', 'false':' NÃO '}"/>
				</td>
			</tr>
			<tr>
			    <td colspan="6" align="right">
			      <a href="#" class="button" onclick="inserirPergunta();" >
				  <table onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
				    <tr>
					  <td class="wButton_left"></td>
					  <td class="wButton_text wButton_width">Adicionar</td>
					  <td class="wButton_right"/>
				    </tr>
				  </table>
				  </a>
			    </td>
			  </tr>
			  </table>