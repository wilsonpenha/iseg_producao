<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try {
%>

					<tr style="height: 20px;" id="row_<s:property value="comissionadoAgenciamentoCount-1"/>">
					  <td nowrap="nowrap" class="small_image">
						<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/delete.gif" includeParams="none"/>" onclick="if(confirma('Está operação poderá gerar estornos de repasse caso haja baixa de comissão, Confirma exclusão?')){setAlterado(true);$('#row<s:property value="comissionadoAgenciamentoCount-1"/>').remove();}"/>
					  </td>
					  <td>
						<s:textfield theme="simple" name="comissionadoAgenciamentoList[%{comissionadoAgenciamentoCount-1}].id" id="comissionadoAgenciamentoId%{0}" value="%{comissionadoAgenciamento.id}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="comissionadoAgenciamentoList[%{comissionadoAgenciamentoCount-1}].pessoa.id" id="comissionadoAgenciamentoPessoaId%{0}" value="%{comissionadoAgenciamento.pessoa.id}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="comissionadoAgenciamentoList[%{comissionadoAgenciamentoCount-1}].proposta.id" id="comissionadoAgenciamentoPropostaId%{0}" value="%{comissionadoAgenciamento.proposta.id}" cssStyle="display: none;"/>
  						<s:textfield theme="simple" name="comissionadoAgenciamentoList[%{comissionadoAgenciamentoCount-1}].agenciamento.id" id="comissionadoAgenciamentoAgenciamentoId%{0}" value="%{comissionadoAgenciamento.agenciamento.id}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="comissionadoAgenciamentoList[%{comissionadoAgenciamentoCount-1}].comissao" id="comissionadoAgenciamentoComissao%{0}" value="%{comissionadoAgenciamento.comissao}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="comissionadoAgenciamentoList[%{comissionadoAgenciamentoCount-1}].valorComissao" id="comissionadoAgenciamentoComissao%{0}" value="%{comissionadoAgenciamento.valorComissao}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="comissionadoAgenciamentoList[%{comissionadoAgenciamentoCount-1}].tipoComissao" id="comissionadoAgenciamentoTipoComissao%{0}" value="%{comissionadoAgenciamento.tipoComissao}" cssStyle="display: none;"/>
						<s:textfield theme="simple" name="comissionadoAgenciamentoList[%{comissionadoAgenciamentoCount-1}].parcelasProposta.id" id="comissionadoAgenciamentoParcelaId%{0}" value="%{comissionadoAgenciamento.parcelasProposta.id}" cssStyle="display: none;"/>
					    <s:property value="comissionadoAgenciamento.pessoa.nome"/>&nbsp;
					  </td>
					  <td><s:property value="getTipoComissaoDescricao(comissionadoAgenciamento.tipoComissao)" />&nbsp;</td>
					  <td align="right"><s:property value="comissionadoAgenciamento.comissao"/>&nbsp;</td>
					  <td align="right"><s:property value="comissionadoAgenciamento.valorComissao"/>&nbsp;</td>
					</tr>
				
<script>
$().ready(function() {
    $(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
    $("#comissionadoAgenciamentoCount").val(converte_numero($("#comissionadoAgenciamentoCount").val())+1);
    //alert($("#comissionadoAgenciamentoCount").val());
 })
</script>
<% } catch (Exception e) {e.printStackTrace();}%>