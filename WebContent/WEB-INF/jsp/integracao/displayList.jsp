<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<link rel="stylesheet" type="text/css" href="<s:url value="/common/jquery.autocomplete.css" includeParams="none"/>"></link>
<link rel="stylesheet" type="text/css" href="<s:url value="/common/jquery.readonly.css" includeParams="none"/>"></link>
<link rel="stylesheet" type="text/css" href="<s:url value="/common/web/skins/Default/Main/Main_Edition.css" includeParams="none" />" id="paramCSS"></link>
<link rel="stylesheet" type="text/css" href="<s:url value="/common/styles/loader/loader.css" includeParams="none"/>"></link>
<link rel="stylesheet" type="text/css" href="<s:url value="/common/ui.all.css" includeParams="none"/>"></link>
<link rel="stylesheet" type="text/css" href="<s:url value="/common/web/skins/Default/Main/Client/DataGrid/DataGrid.css" includeParams="none" />" id="paramCSS"></link>
<link rel="stylesheet" type="text/css" href="<s:url value="/common/lightbox/jquery.lightbox-0.5.css" includeParams="none"/>" />
<link rel="stylesheet" type="text/css" href="<s:url value="/common/jcarousel/jquery.jcarousel.css" includeParams="none"/>" />
<link rel="stylesheet" type="text/css" href="<s:url value="/common/jcarousel/skins/tango/skin.css" includeParams="none"/>" />


<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery-1.3.2-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/ui.core-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/ui.accordion-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/ui.dialog.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.bestupper-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.meiomask-pack.js?v=1" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.bestupper-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.meiomask-pack.js?v=1" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery-form.js" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.form-new-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.readonly.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.simplemodal-1.1.1-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.autocomplete-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/common.js" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/is-date-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/event-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/masked-input-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/xbLibrary-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/xbDebug-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/xbDOM-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/xbStyle-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/xbStyle-css-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/lightbox/jquery.lightbox-0.5.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.carousel.min.js?v=1" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/js/processarIntegracao/script.js?v=0" includeParams="none"/>"></script>

<form id="formEdit" name="formEdit" method="post" enctype="multipart/form-data">
	<table width="100%" border="0" cellpadding="2" cellspacing="0">
		<tr>
			<td>
				<fieldset>
					<legend>Importar Arquivo</legend>
					<table width="100%" border="0" cellpadding="2" cellspacing="0">
			  			<tr>
			  				<td>
			  					<label>Seguradora</label><br />
			  					<s:select theme="simple" cssClass="" id="seguradoras" cssStyle="width:300px" headerKey="" headerValue="-- Selecione --" list="seguradorasByImportacaoEdiConfigList" listKey="id" listValue="seguradora.nome" name="importacaoEdiConfig.id"/>
			  				</td>
			  			</tr>
						<tr>
							<td>
								<label for="dataDoProposta">Anexo arquivo comissão</label><br />
								<s:file theme="simple" id="arquivoAnexo" name="fileUpload" size="44"/>
							</td>
						</tr>
						<tr>
							<td>
								<label for="dataDoProposta">Anexo arquivo emissão de apólice</label><br />
							  	<s:file theme="simple" id="arquivoAnexo2" name="fileUpload" size="44"/>
							</td>
						</tr>
						<tr>
							<td id="tipoArquivoId" style="display: none;"></td>
						</tr>
			  		</table>
			  		<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td style="width:105px;">
								<a href="#" class="button" onclick="imporarEdiImportacaoAnexo();" tabindex="-1">
									<table onmouseout="this.className='wButton'; return true;" onmouseover="this.className='wButton_hover';return true;"
										onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton">
										<tr>
											<td class="wButton_left"></td>
											<td class="wButton_text wButton_width">Importar</td>
											<td class="wButton_right" />
										</tr>
									</table> 
								</a>
							</td>
							<td>&nbsp;</td>
						</tr>
					</table>
			  	</fieldset>
			</td>
		</tr>
	</table>
	<jsp:include page="lotesImportacaoList.jsp" flush="false"></jsp:include>
</form>
<div id="contador">
	Processar Arquivos em:
	<span id="minutos"></span> minutos,
	<span id="segundos"></span> segundos.
</div>
<script type="text/javascript">
	a=createCounter(0,5,0,"contador",atualizarGrids);
	setInterval(a.counter,1000);
</script>