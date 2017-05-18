<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try {
%>




				  <table id="tableProdutor" width="100%" cellspacing="3" cellpadding="0" align="center" class="Main_Client_TableEdition">
					<tr>
 					  <td width="50%"><span class="LabelText">Usuario Operador:</span></td>
					  <td width="42%">&nbsp;</td>
					  <td width="8%">&nbsp;</td>
					</tr>
					<tr>
					  <td class="TextBox_ContentCell"> 
						<s:textfield theme="simple" id="usuarioId" name="usuario.id" cssStyle="display:none;"/>
						<s:textfield theme="simple" id="operadorNome" cssClass="dojoValidateValid TextBox_100percent_width" name="usuario.nomeLogin" />
					  </td>
					  <td width="42%">&nbsp;</td>
					  <td >
						<a href="#" class="button" onclick="if(!operadorAlreadyAdd()){addOperador();}" title="Adicionar Operador">
						<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
						  <tr>
							<td class="wButton_left"></td>
							<td class="wButton_text wButton_width">Inserir</td>
							<td class="wButton_right"/>
						  </tr>
						</table>
						</a>
					  </td>
					</tr>
				  </table>

<script>
// define a mascara padrão para telefone
$().ready(function() {
	// Mascara de telefone.
    $(".clData").setMask({mask : '39/19/9999', autoTab: false});
    $(".clCPF").setMask({mask : '999.999.999-99', autoTab: false});
    $(".clFone").setMask({mask : '(99) 9999-9999', autoTab: false});
    $(".clFone").DefaultValue("(__) ____-____");
    // Converte para upper e elimina brancos no inicio e brancos duplos.
    $(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
    $(".clValor1").setMask({mask : '9,999.999.999.999', type : 'reverse',defaultValue:"00"});
    $(".clValor").setMask({mask : '99',  type : 'reverse',defaultValue:"0"});
 	
 })

</script>
<% } catch (Exception e) {e.printStackTrace();}%>