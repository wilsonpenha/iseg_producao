<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<div id="divServicoSeguradora" title="Adicionar Servicos" style="display:none;">
		<form id="formServicoSeguradora" name="formServicoSeguradora">
			<fieldset>
			  <div align="center" style="border: solid 1px #505050; padding: 10px;" >
			  	<div id="formularioServicoSeguradora"></div>
			  </div>
			</fieldset>
			<table width="98%" border="0" cellpadding="0" cellspacing="0" style="bottom: 2px; background-color: #E8E8E8; position: absolute; z-index: 102; left:2px;">
				  <tr>
					<td align="right">
					  <a href="#" class="button" onclick="inserirServicoSeguradora();" >
						<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton">
						  <tr>
							<td class="wButton_left"></td>
							<td class="wButton_text wButton_width">Adicionar</td>
							<td class="wButton_right"/>
						  </tr>
						</table>
					  </a>
					</td>
					<td align="left">
					  <a href="#" class="button" onclick="$('#divServicoSeguradora').dialog('close');" >
						<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" align="left">
						  <tr>
							<td class="wButton_left"></td>
							<td class="wButton_text wButton_width">Cancelar</td>
							<td class="wButton_right"/>
						  </tr>
						</table>
					  </a>
					</td>
				  </tr>
				</table>
		</form>
	</div>
</div>