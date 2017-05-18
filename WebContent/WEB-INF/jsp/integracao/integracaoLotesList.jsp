<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
<div id="loteImportacaoList">
	<table width="100%" border="0" cellpadding="2" cellspacing="0">
		<tr>
			<td>
				<fieldset>
					<legend>Lotes Importados</legend>
					<table class="listItens">
						<tr class="listItensHeader">
							<td colspan="2" width="8%" nowrap="nowrap">Ações</td>
							<td width="50%" nowrap="nowrap">Lote</td>
							<td width="12%" nowrap="nowrap">Data de Importação</td>
							<td width="15%" nowrap="nowrap">Situação</td>
							<td width="15%" nowrap="nowrap">Tipo</td>
					 	</tr>
					 	<s:iterator value="ediImportacaoAnexoList" status="i">
					 	<tr>
					 		<td>
					 			<s:if test="%{tipoArquivo == 1}">
						 			<s:a href="#" onclick="setaAbaModalCalculo(%{id},%{seguradora.id});abrirDivNovoCalculo();$('#modalContainer');">
										<img class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Search" src="<s:url value="/common/web/images/blank.gif" />" title="Detalhar" border="0" id="buttonFirst">
									</s:a>
								</s:if>
					 		</td>
					 		<td>
					 			<s:if test="%{tipoArquivo == 1}">
						 			<s:a href="#" onclick="setaAbaModalCalculo(%{id},%{seguradora.id});abrirDivNovoCalculo();$('#modalContainer');">
										<img width="26px" src="<s:url value="/common/web/images/blank.gif" />" title="Detalhar" border="0" id="buttonFirst">
									</s:a>
								</s:if>
					 		</td>
					 		<td><s:property value="%{loteImportacao.descricao}"/></td>
					 		<td><s:property value="%{loteImportacao.dtInicioProcessamento}"/></td>
					 		<td><s:property value="%{loteImportacao.situacaoDescricao}"/></td>
					 		<td><s:property value="%{tipoArquivo}"/></td>
					 	</tr>
					 	</s:iterator>
					</table>
				</fieldset>
			</td>
		</tr>
	</table>
</div>