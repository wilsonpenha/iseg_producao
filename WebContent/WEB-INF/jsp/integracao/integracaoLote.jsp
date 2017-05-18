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
					<legend></legend>
					<table width="100%" border="0" cellpadding="2" cellspacing="0">
			  			<tr>
			  				<td width="30%">
			  					<label>Seguradora</label><br />
			  					<s:select theme="simple" cssClass="" id="seguradoras" cssStyle="width:300px" headerKey="" headerValue="-- Selecione --" list="seguradorasByImportacaoEdiConfigList" listKey="seguradora.id" listValue="seguradora.nome" name="seguradora.id"/>
			  				</td>
			  				<td width="13%">
			  					<label>Tipo</label><br />
			  					<s:select theme="simple" cssClass="" id="seguradoras" headerKey="" headerValue="-- Selecione --" list="#{1:'Comissão', 2:'Emissão Seguro'}" name="tipo"/>
			  				</td>
			  				<td width="30%">
			  					<label>Período importação</label><br />
			  					<label>A partir de </label><s:textfield theme="simple" size="10" name="dataInicial" cssClass="clData"/>
			  					<label>Até </label><s:textfield theme="simple" size="10" name="dataFinal" cssClass="clData"/>
			  				</td>
			  				<td style="width:105px;">
								<a href="#" class="button" onclick="pesquisarLotes();" tabindex="-1">
									<table onmouseout="this.className='wButton'; return true;" onmouseover="this.className='wButton_hover';return true;"
										onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton">
										<tr>
											<td class="wButton_left"></td>
											<td class="wButton_text wButton_width">Pesquisar</td>
											<td class="wButton_right" />
										</tr>
									</table> 
								</a>
							</td>
			  			</tr>
			  			<tr>
			  				<td>&nbsp;</td>
			  			</tr>
			  		</table>
			  	</fieldset>
			</td>
		</tr>
	</table>
	<jsp:include page="integracaoLotesList.jsp" flush="false"></jsp:include>
</form>
<jsp:include page="modalListaLotesItem.jsp" flush="false"></jsp:include>
<script>
	$(function() {
		$( "#accordion" ).accordion();
	});
</script>
