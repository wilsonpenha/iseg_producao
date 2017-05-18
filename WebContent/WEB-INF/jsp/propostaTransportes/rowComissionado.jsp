<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try {
%>

					<tr style="height: 20px;" id="row<s:property value="comissionadoPropostaCount-1"/>">
					  <td nowrap="nowrap" class="small_image">
						<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/delete.gif" includeParams="none"/>" onclick="if(confirma('Está operação poderá gerar estornos de repasse caso haja baixa de comissão, Confirma exclusão?')){setAlterado(true);$('#row<s:property value="comissionadoPropostaCount-1"/>').remove();}"/>
					  </td>
					  <td>
						<s:textfield theme="simple" name="comissionadoPropostaList[%{comissionadoPropostaCount-1}].id" id="comissionadoPropostaId%{0}" value="%{comissionadoProposta.id}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="comissionadoPropostaList[%{comissionadoPropostaCount-1}].pessoa.id" id="comissionadoPropostaPessoaId%{0}" value="%{comissionadoProposta.pessoa.id}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="comissionadoPropostaList[%{comissionadoPropostaCount-1}].proposta.id" id="comissionadoPropostaPropostaId%{0}" value="%{comissionadoProposta.proposta.id}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="comissionadoPropostaList[%{comissionadoPropostaCount-1}].comissao" id="comissionadoPropostaComissao%{0}" value="%{comissionadoProposta.comissao}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="comissionadoPropostaList[%{comissionadoPropostaCount-1}].valorComissao" id="comissionadoPropostaComissao%{0}" value="%{comissionadoProposta.valorComissao}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="comissionadoPropostaList[%{comissionadoPropostaCount-1}].tipoComissao" id="comissionadoPropostaTipoComissao%{0}" value="%{comissionadoProposta.tipoComissao}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="comissionadoPropostaList[%{comissionadoPropostaCount-1}].parcelasProposta.id" id="comissionadoPropostaParcelaId%{0}" value="%{comissionadoProposta.parcelasProposta.id}" cssStyle="display: none;"/>
					    <s:property value="comissionadoProposta.pessoa.nome"/>&nbsp;
					  </td>
					  <td><s:property value="getTipoComissaoDescricao(comissionadoProposta.tipoComissao)" />&nbsp;</td>
					  <td align="right"><s:property value="comissionadoProposta.comissao"/>&nbsp;</td>
					  <td align="right"><s:property value="comissionadoProposta.valorComissao"/>&nbsp;</td>
					</tr>
				
<script>
$().ready(function() {
    $(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
    $("#comissionadoPropostaCount").val(converte_numero($("#comissionadoPropostaCount").val())+1);
    //alert($("#comissionadoPropostaCount").val());
 })
</script>
<% } catch (Exception e) {e.printStackTrace();}%>