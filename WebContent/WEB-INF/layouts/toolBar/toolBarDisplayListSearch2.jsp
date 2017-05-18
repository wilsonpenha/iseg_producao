<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

	<!--------------------------------------------------------------------->
	<!-- Tool Bar para Display List Search, sem os botões Novo e Excluir -->
	<!--------------------------------------------------------------------->

	<td class="Main_ToolBar_Separator_cell" ><IMG src="<s:url value="/common/web/images/blank.gif" />" class="Main_ToolBar_Separator"></td>
	<td width="2%"><a href="#" onClick="listaFirst();" onmouseup="setTimeout('showCount()',500);" class="Main_ToolBar_Button" onMouseOver="window.status='xxxxxxxxxxxxxxxx';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonFirst"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_First" id="buttonFirst" title="Primeira Página"></a></td>
	<td width="2%" ><a href="#" onClick="listaPrevious();" onmouseup="setTimeout('showCount()',500);" class="Main_ToolBar_Button" onMouseOver="window.status='Página Anterior';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonPrevious"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Previous" id="buttonPrevious" title="Página Anterior"></a></td>
	<td width="2%" ><a href="#" onClick="listaNext();" onmouseup="setTimeout('showCount()',500);" class="Main_ToolBar_Button" onMouseOver="window.status='Próxima Página';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonNext"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Next" id="buttonNext" title="Próxima Página"></a></td>
	<td width="2%" ><a href="#" onClick="listaLast();" onmouseup="setTimeout('showCount()',500);" class="Main_ToolBar_Button" onMouseOver="window.status='Última Página';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonLast"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Last" id="buttonLast" title="Última Página"></a></td>
	<td width="1"><IMG src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_textlabel_bg_left"></td>
	<td class="Main_ToolBar_textlabel_bg_body"><nobr id="bookmark" class="Main_ToolBar_text_bookmark"><s:property value="firstPosition"/>-<s:property value="lastPosition"/>/<s:property value="listCount"/></nobr></td>
	<td width="1"><IMG src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_textlabel_bg_right"></td>
	<td class="Main_ToolBar_Separator_cell" ><IMG src="<s:url value="/common/web/images/blank.gif" />" class="Main_ToolBar_Separator"></td>
	<td class="Main_ToolBar_Space"></td>
	<!-- 
	<td width="1"><IMG src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_textlabel_bg_left"></td>
	<td class="Main_ToolBar_textlabel_bg_body"><a class="Main_ToolBar_text_relatedinfo" href="#" onclick="">Linked Items</a></td>
	<td class="Main_ToolBar_textlabel_bg_right" width="2%" ><a href="#" onClick="" class="Main_ToolBar_Button" onMouseOver="window.status='Linked Items';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonRelatedInfo"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_RelatedInfo" id="buttonRelatedInfo" title="Linked Items"></a></td>
	-->