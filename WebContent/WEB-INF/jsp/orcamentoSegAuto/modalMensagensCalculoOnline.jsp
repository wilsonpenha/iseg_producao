<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	.ui-dialog-content ui-widget-content{
		background:#E8E8E8;
	}
</style>
<div>
	<div id="divMensagensCalculoOnline" title="Mensagens Calculo Online" style="display:none;">
	    <div id="listMensagensCalculoOnline" align="center" style="border: solid 1px #505050; padding: 10px;" >
		<fieldset>
		 	<table width="98%" border="0" cellpadding="0" cellspacing="0">
		    <s:iterator value="listOfCalculoVo" status="i">
			   <s:iterator value="listaAlertas.mensagemAlertaVo" status="j">
				  <tr>
					<td>
				   		<s:property value="cdAlerta"/>&nbsp;-&nbsp;
					</td>
					<td>
				   		<s:property value="dsAlerta"/>
					</td>
				  </tr>
			   </s:iterator>
		    </s:iterator>
			</table>
		</fieldset>
	    </div>
	  	<table width="98%" border="0" cellpadding="0" cellspacing="0" style="bottom: 2px; background-color: #E8E8E8; position: absolute; z-index: 102; left:2px;">
		  <tr>
			<td align="center">
			  <a href="#" class="button" onclick="$('#divMensagensCalculoOnline').dialog('close');" >
				<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" align="left">
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">Fechar</td>
					<td class="wButton_right"/>
				  </tr>
				</table>
			  </a>
			</td>
		  </tr>
		</table>
	</div>
</div>