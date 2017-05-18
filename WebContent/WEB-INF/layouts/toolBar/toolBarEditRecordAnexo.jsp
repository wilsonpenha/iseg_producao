<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

	<td width="2%" ><a href="#" class="Main_ToolBar_Button" onMouseOver="window.status='Pagina anterior';return true;" onMouseOut="window.status='';return true;" onclick="this.hideFocus=true" onblur="this.hideFocus=false" id="linkButtonPrevious"><img class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Previous" src="<s:url value="/common/web/images/blank.gif" />" title="Go Back One Record" border="0" id="buttonPrevious"></a></td>
	<td width="2%" ><a href="#" class="Main_ToolBar_Button" onMouseOver="window.status='Prosima pagina';return true;" onMouseOut="window.status='';return true;" onclick="this.hideFocus=true" onblur="this.hideFocus=false" id="linkButtonNext"><img class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Next" src="<s:url value="/common/web/images/blank.gif" />" title="Go Forward One Record" border="0" id="buttonNext"></a></td>
	<td width="96%" ></td>
