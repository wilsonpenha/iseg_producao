<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
    
try {
%>


				  <table id="tableParcelasAgenciamento" class="listItens"> 
						<tr class="listItensHeader">
							<td width="10%">Parc Originária</td>
							<td width="15%">Prêmio Base</td>
							<td width="15%">% Agenciamento</td>
							<td width="15%">Valor Agenciamento</td>
							<td width="15%">Qtde Parcelas</td>
							<td width="15%">Parcela Agenciamento</td>
							<td width="15%">Valor Parcela</td>
						</tr>
						<s:iterator value="agenciamentoList" status="stat">
							<s:iterator value="parcelasAgenciamentoCollection" status="parcs">
							<tr>
								<td>
									<s:property value="parcelaOriginaria"/>
								</td>
								<td align="right" style="padding-right: 2px;">
									<s:property value="agenciamento.valorInclusoes"/>
								</td>
								<td align="right" style="padding-right: 2px;">
									<s:property value="agenciamento.percentualAgenciamento"/>
								</td>
								<td align="right" style="padding-right: 2px;">
									<s:property value="agenciamento.valorAgenciamento"/>
								</td>
								<td align="right" style="padding-right: 2px;">
									<s:property value="agenciamento.qtdeParcelas"/>
								</td>
								<td align="right" style="padding-right: 2px;">
									<s:property value="nroParcela"/>
								</td>
								<td align="right" style="padding-right: 2px;">
									<s:property value="valorParcela"/>
								</td>
							</tr>
							</s:iterator>
						</s:iterator>
						<s:if test="agenciamentoList.isEmpty()"><tr class="emptyRow"><td colspan="10">Vazio</td></tr></s:if>
					  </table>

<script>
// define a mascara padrão para telefone
$().ready(function() {
	// Mascara de telefone.
    $(".clCep").setMask({mask : '99999-999', autoTab: false});
    $(".clData").setMask({mask : '39/19/9999', autoTab: false});
    $(".clFone").setMask({mask : '(99) 9999-9999', autoTab: false});
    $(".clFone").DefaultValue("(__) ____-____");
    // Converte para upper e elimina brancos no inicio e brancos duplos.
 	//$('.clTextoRestrito').bestupper({semPontuacao : true});
    $(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
    $(".clValor1").setMask({mask : '9,999.999.999.999', type : 'reverse',defaultValue:"00"});
    $(".clValor").setMask({mask : '99',defaultValue:"0"});
 	
 })

</script>
	
<% } catch (Exception e) {e.printStackTrace();}%>