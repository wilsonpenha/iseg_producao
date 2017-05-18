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
							<td width="30%" nowrap="nowrap">Lote</td>
							<td width="40%" nowrap="nowrap">Descrição do Arquivo</td>
							<td width="6%" nowrap="nowrap">Data de Importação</td>
							<td width="8%" nowrap="nowrap">Situação</td>
							<td width="8%" nowrap="nowrap">Tipo</td>
							<td colspan="2" width="8%" nowrap="nowrap">Ações</td>
					 	</tr>
					 	<s:iterator value="ediImportacaoAnexoList" status="i">
					 	<tr>
					 		<td><s:property value="%{loteImportacao.descricao}"/></td>
					 		<td><s:property value="%{nomeArquivo}"/></td>
					 		<td><s:property value="%{loteImportacao.dtInicioProcessamento}"/></td>
					 		<td><s:property value="%{loteImportacao.situacaoDescricao}"/></td>
					 		<td><s:property value="tipoArquivoDescricao"/></td>
					 		<td></td>
					 		<td></td>
					 	</tr>
					 	</s:iterator>
					</table>
				</fieldset>
			</td>
		</tr>
	</table>
</div>