<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try {
%>

<!-- Load Queue widget CSS and jQuery -->
<link rel="stylesheet" type="text/css" href="<s:url value="/common/upload.ui/jquery.plupload.queue/css/jquery.plupload.queue.css" includeParams="none"/>" />

<!-- Third party script for BrowserPlus runtime (Google Gears included in Gears runtime now) -->
<script language="javascript" charset="UTF-8" src="<s:url value="/common/browserplus-min.js?v=0" includeParams="none"/>"></script>

<!-- Load plupload and all it's runtimes and finally the jQuery UI queue widget -->
<script language="javascript" charset="UTF-8" src="<s:url value="/common/plupload.full.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.ui.plupload.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/upload.ui/jquery.plupload.queue/jquery.plupload.queue.js?v=0" includeParams="none"/>"></script>

<script type="text/javascript"><!--
// Convert divs to queue widgets when the DOM is ready

function log() {
	var str = "";

	plupload.each(arguments, function(arg) {
		var row = "";

		if (typeof(arg) != "string") {
			plupload.each(arg, function(value, key) {
				// Convert items in File objects to human readable form
				if (arg instanceof plupload.File) {
					// Convert status to human readable
					switch (value) {
						case plupload.QUEUED:
							value = 'QUEUED';
							break;

						case plupload.UPLOADING:
							value = 'UPLOADING';
							break;

						case plupload.FAILED:
							value = 'FAILED';
							break;

						case plupload.DONE:
							value = 'DONE';
							break;
					}
				}

				if (typeof(value) != "function") {
					row += (row ? ', ' : '') + key + '=' + value;
				}
			});

			str += row + " ";
		} else { 
			str += arg + " ";
		}
	});

	$('#log').append(str + "\n");
}

function openUploader(){
	var context = getContextApp();
	
	$(function() {
	
		$("#flash_uploader").pluploadQueue({
			runtimes : 'flash,silverlight,html5',
			browse_button : 'pickfiles',
			max_file_size : '5mb',
			url : context+'/proposta/inserirAnexo.action?proposta.id='+$('#propostaId').val(),
	        flash_swf_url : context+'/common/plupload.flash.swf',
	        // Silverlight settings
	        silverlight_xap_url : context+'/common/plupload.silverlight.xap',
			filters : [
				{title : "Imagens", extensions : "jpg,jpeg"},
				{title : "Docs.", extensions : "pdf,txt,doc,docx,xsl"}
			],
			resize : {width : 1024, height : 1024, quality : 90},
	
	// Post init events, bound after the internal events
			init : {
				UploadComplete: function(up, files) {
					// Called when a file has finished uploading
					carregarPropostaAnexos();
					openUploader();
				},
	
				Error: function(up, args) {
					// Called when a error has occured
					log('[error] ', args);
				}
			}
		});
		
	});
}
--></script>

		<div id="divUplaoder" style="display:none; z-index: 1000; height: 360px;" >
			<table width="620" border="0" cellpadding="0" cellspacing="0">
			  <tr><td>
				    <input class="modalClose" id="uploaderCloseDiv" style="display:none;" />
					<div id="flash_uploader" style="height: 330px;">You browser doesn't have Adobe Flash installed.</div>
			  </td></tr>
			  <tr><td align="center">
				<table onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" onclick="fechaUploaderModal();$('#uploaderCloseDiv').click();">
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">Fechar</td>
					<td class="wButton_right"/>
				  </tr>
				</table>
			  </td></tr>
			</table>
		</div>

<script type="text/javascript">

function abrirDivUploaderModal(){
	$('#divUplaoder').modal({onOpen: openUploaderModal, close: false});
}

function openUploaderModal (dialog) {
	dialog.overlay.fadeIn('slow', function () {
		dialog.container.fadeIn('slow', function () {
			dialog.data.slideDown('slow');
		});
	});
	setTimeout(function(){
	  abreUploaderModal();
	  openUploader();}
	,500);
}

function abreUploaderModal(){
	document.getElementById('btnf3').disabled=true;
	if (document.getElementById('btnf4'))
		document.getElementById('btnf4').disabled=true;
	document.getElementById('btnf5').disabled=true;
	document.getElementById('btnf6').disabled=true;
	if (document.getElementById('btnf7'))
		document.getElementById('btnf7').disabled=true;
	document.getElementById('btnf8').disabled=true;
	document.getElementById('btnf11').disabled=true;
}

function fechaUploaderModal(){
	document.getElementById('btnf3').disabled=false;
	if (document.getElementById('btnf4'))
		document.getElementById('btnf4').disabled=false;
	document.getElementById('btnf5').disabled=false;
	document.getElementById('btnf6').disabled=false;
	if (document.getElementById('btnf7'))
		document.getElementById('btnf7').disabled=false;
	document.getElementById('btnf8').disabled=false;
	document.getElementById('btnf11').disabled=false;
}
</script>

<% } catch (Exception e) {e.printStackTrace();}%>