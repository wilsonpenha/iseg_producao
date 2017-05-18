<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try { 
%>
<style>
	#jquery-lightbox{
		z-index: 4001;	
	}
	#jquery-overlay{
		z-index: 4000;
	}
</style>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr>
   <div id="divMessages1" style="padding-bottom: 10px;">
  	 <s:actionerror/>
     <s:actionmessage/>
     <s:fielderror/>
   </div>
  </tr>
<s:if test="not propostaAnexoList.isEmpty()">
  <tr>
	<td>
  	  <div id="gallery">
          <ul id="mycarousel" class="jcarousel-skin-tango">
  	          <s:iterator value="propostaAnexoList" status="stat">
              <li>
                 <div align="center">
			  		<a class="galleryLink" href="${pageContext.request.contextPath}/orcamentoSegAuto/mostrarGalleryAnexo.action?propostaAnexo.id=<s:property value="id"/>" title="<s:property value="nome"/>">
  	    				<img align="middle" src='${pageContext.request.contextPath}/orcamentoSegAuto/mostrarMiniaturaAnexo.action?propostaAnexo.id=<s:property value="id"/>'  border="0" />
                 	</a>
                 </div>
                 <div align="center">
                 	<img alt="Excluir Anexo" style="cursor:pointer;border-top: #F0F6F9;border-top: 1px;" src="<s:url value="/common/images/excluir.png" includeParams="none"/>" onclick="if(confirma('Confirma exclusão de <s:property value="nome"/> ?')){removerOrcamentoAnexo('<s:property value="id"/>');}" title="Excluir Anexo"/>
			  		<a href="${pageContext.request.contextPath}/orcamentoSegAuto/mostrarAnexo.action?propostaAnexo.id=<s:property value="id"/>" target="_new" title="Baixar Anexo" >
						<img alt="Baixar Anexo" style="cursor:pointer;" src="<s:url value="/common/images/download.png" includeParams="none"/>" border="0" />
                 	</a>
                 </div>
               </li>
  	      </s:iterator>
		</ul>
	  </div>
	</td>
  </tr>
</s:if>
</table>
<script language="javascript">
	$('#gallery a.galleryLink').lightBox({fixedNavigation:true});
	$(document).ready(function() {
		$('#mycarousel').jcarousel();
	});
</script>
<% } catch (Exception e) {e.printStackTrace();}%>