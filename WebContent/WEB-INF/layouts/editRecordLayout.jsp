<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<tiles:insertAttribute name="content-header" />

<script language="javascript" charset="UTF-8" src="${pageContext.request.contextPath}/js<tiles:getAsString name='package.namespace'/>/script.js?v=0"></script>
<sx:head cache="true"/>
<style>
input{
	text-transform:uppercase;   
}
</style>
</head>

<body onunload="atualizaGrupoDeVendaProposta();" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="resizeArea(true);updateMenuIcon('buttonMenu');focusFirst();" onresize="resizeArea(true);" id="paramMessageAlert">

<s:form id="formEdit" name="formEdit" method="post" validate="true"  onsubmit="invalidateEnterKey(event)">
  <script language="javascript" src="<s:url value="/template/xhtml/validation.js?v=0" includeParams="none" />"></script> 
  <input type="hidden" name="page" value="${page}" />
  <input type="hidden" name="listCount" value="${listCount}" />

  <s:textfield theme="simple" id="associadoId" name="associadoId" cssStyle="display:none;"/>

  <s:submit id="submitButton" cssStyle="display:none" theme="simple"/>
  <table height="100%" border="0" cellpadding="0" cellspacing="0" id="main"/>
	<tr> 
	  <td valign="top" id="tdleftTabs">
		<table cellpadding="0" cellspacing="0" class="Main_ContentPane_LeftTabsBar" id="tdLeftTabsBars">
		  <tr>
			<td class="Main_LeftTabsBar_bg_body">
			  <table cellpadding="0" cellspacing="0" class="Main_LeftTabsBar">
				<tr>
				  <td class="Main_LeftTabsBar_bg_top"></td>
				</tr>
				<tr> 
				  <td>
					<a class="Main_LeftTabsBar_ButtonLeft" href="#" onclick="mostrarMenu('buttonMenu');resizeArea(true);return false;">
					  <img class="Main_LeftTabsBar_ButtonLeft_Icon Main_LeftTabsBar_ButtonLeft_Icon_arrow_hide" src="<s:url value="/common/web/images/blank.gif" />" border="0" id="buttonMenu"></IMG>
					</a>
				  </td>
				</tr>
				<tr>
				  <td class="Main_LeftTabsBar_bg_separator_cell"></td>
				</tr>
				<tr>
				  <td>
					<div class="Main_LeftTabsBar_ButtonRight_selected">
					  <img class="Main_LeftTabsBar_ButtonRight_Icon Main_LeftTabsBar_ButtonRight_Icon_edition_selected" src="<s:url value="/common/web/images/blank.gif" />" border="0"></IMG>
					</div>
				  </td>
				</tr>
				<tr>
				  <td>
					<a class="Main_LeftTabsBar_ButtonRight" href="#" onClick="submitForm(document.formEdit, getContextApp()+'<tiles:getAsString name="package.namespace" />/displayList.action', false);">
					  <img class="Main_LeftTabsBar_ButtonRight_Icon Main_LeftTabsBar_ButtonRight_Icon_relation" src="<s:url value="/common/web/images/blank.gif" />" border="0"></IMG>
					</a>
				  </td>
				</tr>
				<tr>
				  <td class="Main_LeftTabsBar_bg_empty_cell"></td>
				</tr>
			  </table>
			</td>
		  </tr>
		  <tr class="Main_LeftTabsBar_bg_empty_cell">
			<td class="Main_LeftTabsBar_bg_empty_cell"></td>
		  </tr>
		</table>
	  </td>
	  <td valign="top">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="Main_ContentPane_Left">
		  <tr>
			<td class="Main_NavBar_bg_left" id="tdleftSeparator"></td>
		  </tr>
		  <tr>
			<td class="Main_ToolBar_bg_left" valign="top"></td>
		  </tr>
		  <tr>
			<td class="Main_Client_bg_left"></td>
		  </tr>
		  <tr>
			<td class="Main_Bottom_bg_left"></td>
		  </tr>
		</table>
	  </td>
	  <td valign="top">
		<div class="Main_ContentPane_NavBar" id="tdtopButtons">
		  <table class="Main_ContentPane_NavBar" id="tdtopNavButtons">
			<tr class="Main_NavBar_bg">
			  <td></td>
			  <td class="Main_NavBar_LeftButton_cell"></td>
			  <td class="Main_NavBar_separator_cell"></td>
			  <td class="Main_NavBar_LeftButton_cell">
				<a class="Main_NavBar_LeftButton" href="#" onClick="" border="0" onmouseover="window.status='Reload Current Page';return true;" onmouseout="window.status='';return true;"><img src="<s:url value="/common/web/images/blank.gif" />" class="Main_NavBar_LeftButton_Icon Main_NavBar_LeftButton_Icon_refresh" border="0" alt="Reload Current Page" title="Reload Current Page"></a>
			  </td>
			  <td class="Main_NavBar_Breadcrumb_cell">
			  	<span class="Main_NavBar_Breadcrumb" id="paramBreadcrumb"><tiles:insertAttribute name="navigation" /></span>
			  </td>
			  <td></td>
			  <td class="Main_NavBar_RightButton_cell">
				<a class="Main_NavBar_RightButton" href="http://www.iseg.net.br/manuais/guia_rapido/index.html" target="new" border="0" onmouseover="window.status='Help';return true;" onmouseout="window.status='';return true;"><img src="<s:url value="/common/web/images/blank.gif" />" class="Main_NavBar_RightButton_Icon Main_NavBar_RightButton_Icon_help" border="0" alt="Guia rápido" title="Guia rápido"></a>
			  </td>
			  <td class="Main_NavBar_separator_cell"></td>
			  <td class="Main_NavBar_RightButton_cell">
				<a class="Main_NavBar_RightButton" href="http://www.iseg.net.br" target="new" border="0" onmouseover="window.status='About';return true;" onmouseout="window.status='';return true;"><img src="<s:url value="/common/web/images/blank.gif" />" class="Main_NavBar_RightButton_Icon Main_NavBar_RightButton_Icon_about" border="0" alt="Sobre o iSeg" title="Sobre o iSeg"></a>
			  </td>
			  <td></td>
			</tr>
		  </table>
		</div>
		<div class="Main_ContentPane_ToolBar" id="paramToolBar">
		  <table class="Main_ContentPane_ToolBar Main_ToolBar_bg" id="tdToolBar">
			<tr>
			  <tiles:insertAttribute name="tool-bar" />
			</tr>
		  </table>
		</div>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="Main_ContentPane_TabPane" id="tdtopTabs">
			<tr id="paramParentTabContainer">
				<td class="tabBackGroundInit"></td>
			</tr>
			<tr id="paramMainTabContainer">
			  <td class="tabBackGroundInit">
				<div>
				  <span class="tabTitle">
					<div>
					  <span><tiles:insertAttribute name="title" /></span>
					</div>
				  </span>
				</div>
			  </td>
			</tr>
			<tiles:insertAttribute name="content-tabs" />
		</table>
		<div class="Main_ContentPane_Client" style="overflow:auto;display:none;" id="client">
		  <table width="100%" summary="" id="sectionDetail">
			<tr>
			  <td>
				<table cellpadding="0" cellspacing="0" id="messageBoxID" class="MessageBoxHIDDEN">
				  <tbody>   
					<tr class="MessageBox_TopMargin">
					  <td class="MessageBox_LeftMargin"></td>
					  <td></td>
					  <td class="MessageBox_RightMargin"></td>
					</tr>
					<tr>
					  <td class="MessageBox_LeftMargin"></td>
					  <td>
						<table cellpadding="0" cellspacing="0" style="width: 100%;">
						  <tbody>
							<tr>
							  <td>
								<div class="MessageBox_TopLeft"></div>
								<div class="MessageBox_Left"></div>
							  </td>
							  <td class="MessageBox_bg">
								<table class="MessageBox_Top">
								  <tbody>
									<tr>
									  <td>
										<span>
										  <table cellpadding="0" cellspacing="0" class="MessageBox_Body_ContentCell">
											<tbody>
											  <tr>
												<td class="MessageBox_Icon_ContentCell">
												  <div class="MessageBox_Icon"></div>
												</td>
												<td style="vertical-align: top;" id="messageBoxIDContent">
												  <span>
													<div class="MessageBox_TextTitle" id="messageBoxIDTitle"></div>
													<div class="MessageBox_TextDescription" id="messageBoxIDMessage"></div>
													<div class="MessageBox_TextSeparator"></div>
												  </span>
												</td>
											  </tr>
											</tbody>
										  </table>
										</span>
									  </td>
									</tr>
								  </tbody>
								</table>
							  </td>
							  <td class="MessageBox_RightTrans">
								<div class="MessageBox_TopRight"></div>
								<div class="MessageBox_Right"></div>
							  </td>
							</tr>
							<tr>
							  <td rowspan="2" class="MessageBox_BottomLeft">
							  <td class="MessageBox_BottomTrans MessageBox_bg"></td>
							  <td rowspan="2" class="MessageBox_BottomRight"></td>
							</tr>
							<tr>
							  <td class="MessageBox_Bottom"></td>
							</tr>
						  </tbody>
						</table>
					  </td>
					  <td class="MessageBox_RightMargin"></td>
					</tr>
					<tr class="MessageBox_BottomMargin">
					  <td class="MessageBox_LeftMargin"></td>
					  <td></td>
					  <td class="MessageBox_RightMargin"></td>
					</tr>
				  </tbody>
				</table>
				<table width="97%" cellspacing="0" cellpadding="0" border="0" class="Main_Client_TableRelation">
				  <tr>
					<td><tiles:insertAttribute name="content-main" /></td>
				  </tr>
				</table>
			  </td>
			</tr>
		  </table>
		</div>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="Menu_ContentPane_Bottom" id="tdbottomSeparator">
		  <tr>
			<td class="Main_Bottom_bg"><img src="<s:url value="/common/web/images/blank.gif" includeParams="none" />" border="0"></IMG></td>
		  </tr>
		</table>
	  </td>
	  <td valign="top">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="Main_ContentPane_Right" id="tdrightSeparator">
		  <tr><td class="Main_NavBar_bg_right"></td></tr>
		  <tr><td class="Main_ToolBar_bg_right" valign="top"></td></tr>
		  <tr><td class="Main_Client_bg_right"></td></tr>
		  <tr><td class="Main_Bottom_bg_right"></td></tr>
		</table>
	  </td>
	</tr>
  </table>
</s:form>
<script type="text/javascript">

function atualizaGrupoDeVendaProposta(){
	if (opener && opener.parent.FrameAplicacao.document.formEdit.tipoCliente){
		var tipoCliente = opener.parent.FrameAplicacao.document.formEdit.tipoCliente.value;
		if(opener.parent.FrameAplicacao.formOrcamento){
			if (tipoCliente==0){
				opener.parent.FrameAplicacao.document.formEdit.pfGrupoDeVendaId.value = $('#grupoDeVendaId').val();
				opener.parent.FrameAplicacao.document.formEdit.clienteCpf.value = $('#cpfOuCnpjId').val();
				opener.parent.FrameAplicacao.document.formEdit.clientePFNome.value = $('#nomeId').val();
				opener.parent.FrameAplicacao.document.formEdit.dataNascimento.value = $('#dataNascimentoId').val();
				opener.parent.FrameAplicacao.document.formEdit.sexo.value = $('#pessoaSexoId').val();
				opener.parent.FrameAplicacao.document.formEdit.pfEstadoCivil.value =  $('#pfEstadoCivil').val();
				opener.parent.FrameAplicacao.document.formEdit.cnh.value =  $('#CnhId').val();
				opener.parent.FrameAplicacao.document.formEdit.data1aHabilitacao.value =  $('#data1aHabilitacao').val();
				opener.parent.FrameAplicacao.document.formEdit.email.value = $('#emailId').val();
				opener.parent.FrameAplicacao.document.formEdit.telefonePreferencial.value = $('#telefoneRecadosId').val();
				opener.parent.FrameAplicacao.document.formEdit.telefoneAlternativo.value = $('#telefoneAlternativoId').val();
				opener.parent.FrameAplicacao.document.formEdit.pfReferencia.value = $('#referenciaPessoal').val();
				opener.parent.FrameAplicacao.document.formEdit.telefoneCelular.value = $('#telefoneCelularId').val();
				opener.parent.FrameAplicacao.document.formEdit.outraProfissaoNome.value = $('#formEdit_pessoaFisica.profissao').val();
			}
			else 
				opener.parent.FrameAplicacao.document.formEdit.pjGrupoDeVendaId.value = $('#grupoDeVendaId').val();
		}
		if (tipoCliente==0)
			opener.parent.FrameAplicacao.document.formEdit.pfGrupoDeVendaId.value = $('#grupoDeVendaId').val();
		else 
			opener.parent.FrameAplicacao.document.formEdit.pjGrupoDeVendaId.value = $('#grupoDeVendaId').val();
	}
}
function invalidateEnterKey(event){
	//alert(key(event)==13);
}
</script>

<tiles:insertAttribute name="content-footer" />