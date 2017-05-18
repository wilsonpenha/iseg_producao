<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

	<td width="2%" ><a href="#" onClick="submitForm(document.formEdit, '<s:url action="salvarLista.action" includeParams="none" />', true);" class="Main_ToolBar_Button" onblur="this.hideFocus=false" id="linkButtonSave_Relation"><img class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Save_Relation" src="<s:url value="/common/web/images/blank.gif" />" title="Salva e volta para lista" border="0" id="buttonSave_Relation"></a></td>
	<td width="2%" ><a href="#" onClick="submitForm(document.formEdit, '<s:url action="salvarEditar.action" includeParams="none" />', true);" class="Main_ToolBar_Button" onblur="this.hideFocus=false" id="linkButtonSave"><img class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Save" src="<s:url value="/common/web/images/blank.gif" />" title="Salva e edita" border="0" id="buttonSave"></a></td>
	<td class="Main_ToolBar_Separator_cell" ><img src="<s:url value="/common/web/images/blank.gif" />" class="Main_ToolBar_Separator"></td>
	<td width="2%" ><a href="#" class="Main_ToolBar_Button" onclick="document.formEdit.reset();this.hideFocus=true;" onblur="this.hideFocus=false" id="linkButtonUndo"><img class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Undo" src="<s:url value="/common/web/images/blank.gif" />" title="Undo" border="0" id="buttonUndo"></a></td>
	<td class="Main_ToolBar_Separator_cell" ><img src="<s:url value="/common/web/images/blank.gif" />" class="Main_ToolBar_Separator"></td>
	<td class="Main_ToolBar_Space"></td>
	<!--  
	<td width="1"><img src="<s:url value="/common/web/images/blank.gif" />" class="Main_ToolBar_textlabel_bg_left" border="0"></td>
	<td class="Main_ToolBar_textlabel_bg_body"><a class="Main_ToolBar_text_relatedinfo" href="#" onclick="">Linked Items</a></td>
	<td class="Main_ToolBar_textlabel_bg_right" width="2%" ><a href="#" onClick="" class="Main_ToolBar_Button" onMouseOver="window.status='Linked Items';return true;" onMouseOut="window.status='';return true;" onclick="this.hideFocus=true" onblur="this.hideFocus=false" id="linkButtonRelatedInfo"><img class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_RelatedInfo" src="<s:url value="/common/web/images/blank.gif" />" title="Linked Items" border="0" id="buttonRelatedInfo"></a></td>
	-->