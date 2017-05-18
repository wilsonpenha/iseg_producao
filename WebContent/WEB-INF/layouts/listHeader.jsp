<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<html xmlns:="http://www.w3.org/1999/xhtml">

<head> 

<title>iSeg - Gestão Inteligente</title>
<LINK rel="SHORTCUT ICON" href="${pageContext.request.contextPath}/common/web/images/iseg.ico"></LINK> 

<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta http-equiv="Expires" content="-1">
<meta http-equiv="Pragma" content="no-cache"> 
<meta http-equiv="Cache-Control" content="no-cache">        

<link rel="stylesheet" type="text/css" href="<s:url value="/common/web/skins/Default/Main/Main_Relation.css" includeParams="none"/>" id="paramCSS"></link>
<link rel="stylesheet" type="text/css" href="<s:url value="/common/web/skins/Default/Main/Main_Edition.css" />" id="paramCSS"></link>
<link rel="stylesheet" type="text/css" href="<s:url value="/common/jquery.autocomplete.css" includeParams="none"/>"></link>
<link rel="stylesheet" type="text/css" href="<s:url value="/common/jquery.readonly.0.7.0.css" includeParams="none"/>"></link>
<link rel="stylesheet" type="text/css" href="<s:url value="/common/styles/loader/loader.css" includeParams="none"/>"></link>
<link rel="stylesheet" type="text/css" href="<s:url value="/common/esquema.css" includeParams="none"/>" />

<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery-1.5.1.min.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/ui.core-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/ui.accordion-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.bestupper-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.meiomask-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery-form-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.form-new-pack.js?v=0" includeParams="none"/>"></script>
<script charset="UTF-8" src="<s:url value="/common/jquery.simplemodal-1.1.1-pack.js?v=0" includeParams="none"/>" type='text/javascript'></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.autocomplete-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery.readonly.0.7.0.js?v=0" includeParams="none"/>"></script>
<script language="javascript" src="<s:url value="/common/common-pack.js?v=3" includeParams="none"/>"></script>
<script language="javascript" src="<s:url value="/common/is-date.js?v=0" includeParams="none"/>"></script>
<script language="javascript" src="<s:url value="/common/event.js?v=0" includeParams="none"/>"></script>
<script language="javascript" src="<s:url value="/common/masked-input.js?v=0" includeParams="none"/>"></script>
<script language="javascript" src="<s:url value="/common/xbLibrary.js?v=0" includeParams="none"/>"></script>
<script language="javascript" src="<s:url value="/common/xbDebug.js?v=0" includeParams="none"/>"></script>
<script language="javascript" src="<s:url value="/common/xbDOM.js?v=0" includeParams="none"/>"></script>
<script language="javascript" src="<s:url value="/common/xbStyle.js?v=0" includeParams="none"/>"></script>
<script language="javascript" src="<s:url value="/common/xbStyle-css.js?v=0" includeParams="none"/>"></script>
<script language="javascript" src="<s:url value="/common/web/js/utils-pack.js?v=0" includeParams="none"/>"></script>
<script language="javascript" src="<s:url value="/common/TableSort-pack.js?v=0" includeParams="none"/>"></script>
<script type="text/javascript">defineContext('<s:url value="/" includeParams="none"/>');</script>