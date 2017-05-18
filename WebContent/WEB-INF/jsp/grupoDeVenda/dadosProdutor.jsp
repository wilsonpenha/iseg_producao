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
				    	<td>
	 					    <label for="clienteCpf"><a href="#" class="LabelLink" onclick="editarProdutor($('#produtorId').val());" tabindex="-1" title="Alterar dados do Produtor">Produtor</a></label><br />
				    	</td>
				    </tr>
					<tr>
 					  <td width="42%"><span class="LabelText">Produtor:</span></td>
					  <td width="25%"><span class="LabelText"> % / Valor do Repasse:</span></td>
					  <td width="25%"><span class="LabelText">Tipo Repasse:</span></td>
					  <td width="8%">&nbsp;</td>
					</tr>
					<tr>
					  <td class="TextBox_ContentCell"> 
						<s:textfield theme="simple" id="produtorId" name="grupoProdutor.produtor.id" cssStyle="display:none;"/>
						<s:textfield theme="simple" id="produtorNome" cssClass="dojoValidateValid TextBox_100percent_width" name="grupoProdutor.produtor.pessoa.nome" />
					  </td>
					  <td class="TextBox_ContentCell">
						<s:textfield theme="simple" cssClass="TextBox_OneCells_width requiredField clValor2 currency" id="comissao" name="grupoProdutor.comissao" />
					  </td>
					  <td class="TextBox_ContentCell">
					    <s:select theme="simple" cssClass="requiredField" id="tipoComissao" cssStyle="width:95%" emptyOption="false" list="tipoComissaoList" name="grupoProdutor.tipoComissao"/>
					  </td>
					  <td>
					  	<a href="#" class="button" onclick="if(!usuarioAlreadyAdd($('#produtorNome').val())){inserirProdutor();}" title="Adicionar Comissionado">
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
    $(".clCep").setMask({mask : '99999-999', autoTab: false});
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