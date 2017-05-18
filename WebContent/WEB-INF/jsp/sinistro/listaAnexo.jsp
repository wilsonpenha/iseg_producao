<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try {
%>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr>
   <div id="divMessages1" style="padding-bottom: 10px;">
  	 <s:actionerror/>
     <s:actionmessage/>
     <s:fielderror/>
   </div>
  </tr>
<s:if test="not sinistroAnexoList.isEmpty()">
  <tr>
	<td>
  	  <div id="gallery">
          <ul id="mycarousel" class="jcarousel-skin-tango">
  	          <s:iterator value="sinistroAnexoList" status="stat">
              <li>
                 <div align="center">
			        <a class="galleryLink" href="${pageContext.request.contextPath}/sinistro/mostrarGalleryAnexo.action?sinistroAnexo.id=<s:property value="id"/>" title="<s:property value="nome"/>">
  	    		        <img align="middle" src='${pageContext.request.contextPath}/sinistro/mostrarMiniaturaAnexo.action?sinistroAnexo.id=<s:property value="id"/>'  border="0" />
                    </a>
                 </div>
                 <div align="center">
                    <img alt="Excluir Anexo" style="cursor:pointer;border-top: #F0F6F9;border-top: 1px;" src="<s:url value="/common/images/excluir.png" includeParams="none"/>" onclick="if(confirma('Confirma exclusão de <s:property value="nome"/> ?')){removerAnexo('<s:property value="id"/>');}" title="Excluir Anexo"/>
			        <a href="${pageContext.request.contextPath}/sinistro/mostrarAnexo.action?sinistroAnexo.id=<s:property value="id"/>" target="_new" title="Baixar Anexo" >
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