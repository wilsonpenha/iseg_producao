<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="<s:url value="/common/web/skins/Default/Menu/Menu.css" />" title="StyleGrid" id="paramCSS"></link>
	<script language="javascript" charset="UTF-8" src="<s:url value="/common/jquery-1.5.1.min.js?v=0" includeParams="none"/>"></script>
	<script language="javascript" src="<s:url value="/common/common-pack.js" />"></script>
	<script language="javaScript" src="<s:url value="/common/web/js/utils-pack.js?v=0" />" type="text/javascript"></script>
	<script language="javaScript" src="<s:url value="/common/web/js/menuWindows.js?v=0" />" type="text/javascript"></script>
	<script type="text/javascript">defineContext('<s:url value="/" includeParams="none"/>');</script>

	<script language="JavaScript" type="text/javascript">

		function resizeMenu() {
			var mnu = document.getElementById("Menu_Client");
			var mleft = document.getElementById("MenuLeft");
			var mright = document.getElementById("MenuRight");
			var mtop = document.getElementById("MenuTop");
			var mtop2 = document.getElementById("MenuTop2");
			var mbottom = document.getElementById("MenuBottom");
			var body = document.getElementsByTagName("BODY");
			var h = body[0].clientHeight;
			var w = body[0].clientWidth;
			var name = window.navigator.appName;
			mnu.style.height = h -(mtop.clientHeight + mtop2.clientHeight + mbottom.clientHeight) - ((name.indexOf("Microsoft")==-1)?2:0);
			mnu.style.width = w - (mleft.clientWidth + mright.clientWidth) - ((name.indexOf("Microsoft")==-1)?2:0);
			mnu.style.display = "";
		}
	</script>
	
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="resizeMenu(); inicializeMenu();">
  <table border="0" cellspacing="0" cellpadding="0" summary="" width="100%">
	<tr>
	  <td rowspan="3" valign="top">
		<table class="Menu_ContentPane_Left" id="MenuLeft">
		  <tr>
			<td class="Menu_NavBar_bg_left"></td>
		  </tr>
		  <tr>
			<td class="Menu_ToolBar_bg_left"></td>
		  </tr>
		  <tr>
			<td class="Menu_Client_bg_left"></td>
		  </tr>
		  <tr>
			<td class="Menu_Bottom_bg_left">
		  </tr>
		</table>
	  </td>
	  <td valign="top" >
		<table class="Menu_ContentPane_NavBar" cellspacing="0" cellpadding="0" id="MenuTop">
			<tr class="Main_NavBar_bg">
			<td class="Menu_NavBar_bg"> </td>
			<td class="Menu_NavBar_bg_logo_left"></td>
            <td class="Main_NavBar_bg_logo" width="1" onclick="window.open('http://www.atlasinfo.com.br','','width=800,height=600,resizable=yes');return false;"><img src="<s:url value="/common/images/iseg.png" />" alt="AtlasInfo" title="AtlasInfo" border="0" id="openbravoLogo" width="32"></td>
			<td class="Menu_NavBar_bg_logo_right"></td>
			<td class="Menu_NavBar_bg"> </td>
		  </tr>
		</table>
		<table class="Menu_ContentPane_ToolBar Menu_ToolBar_bg" id="MenuTop2" style="height:46px;">
		  <tr>
            <td>
			<div style="padding-bottom: 10px;">
				<fieldset>
					<legend style="padding:5px;font-weight:bold;font-size: 10pt;color:#C8C8C8;">Usuário</legend>
					<table cellpadding="4" width="100%" style="font-size: 8pt;color: white;line-height: 16px;">
						<tr>
							<td width="20%" style="font-weight:bold;">Nome:</td>
							<td width="70%">${usuarioEmUso.nomeLogin}</td>
						</tr>
						<tr>
							<td style="font-weight:bold;">Empresa:</td>
							<td>${usuarioEmUso.corretora.nome}</td>
						</tr>
						<s:if test="isUsuarioDeAssessoria()">
						<tr>
							<td><label for="corretoraId" style="font-weight:bold;">Assessorada:</label></td>
							<td>
								<s:textfield theme="simple" id="corretoraEmUsoId" name="corretoraEmUso.id" cssStyle="display:none"/>
								<s:select id="corretoraId" name="corretoraEmUso.id" list="corretorasAssessoradas" listKey="id" listValue="razaoSocial" cssStyle="border:1px solid black;background-color:#D4D4D4;width:100%;font-size: 8pt;" onchange="alterarCorretoraEmUso();" />
							</td>
						</tr>
						</s:if>
						<tr>
							<td colspan="2">
								<table>
								  <tr>
									<td class="Menu_ToolBar_Space"></td>
						            <td colspan="2"><nobr><a class="Menu_ToolBar_text_username" href="#" onclick="logout();"><span><u>Sair do sistema</u></span></a></nobr></td>
								  </tr>
								</table>
							</td>
						</tr>
					</table>
				</fieldset>
			</div>
            </td>
		  </tr>
		</table>
	  </td>
	  <td rowspan="3" valign="top">
		<table class="Menu_ContentPane_Right" id="MenuRight">
		  <tr>
			<td class="Menu_NavBar_bg_right"></td>
		  </tr>
		  </tr>
			<td class="Menu_ToolBar_bg_right"></td>
		  </tr>
		  </tr>
			<td class="Menu_Client_bg_right"></td>
		  </tr>
		  </tr>
			<td class="Menu_Bottom_bg_right"></td>
		  </tr>
		</table>
	  </td>
	</tr>
	<tr>
		<td valign="top">
		</td>
	</tr>
	<tr>
	  <td valign="top">
		<div id="Menu_Client" class="Menu_ContentPane_Client" style="overflow: auto;">
			<ul id="nav">
			<s:iterator value="menuPaiList" status="level0">
			  	<li id="nav<s:property value="#level0.index+1"/>" onClick="setClick(event);"  style="<s:property value="#attr.direito" />">
					<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_BigIcon_folder" id="<s:property value="id"/>" />
					&nbsp;<s:property value="nome.valor"/>

			  		<s:if test="menuCollection.size>0">
						<ul id="nav<s:property value="#level0.index+1"/>Sub">
						<s:iterator value="getMenuFilhosList(id)" status="level1">
							<s:if test="%{acao == null || acao == ''}">
							<li id="nav<s:property value="#level0.index+1"/>Sub<s:property value="#level1.index+1"/>"  style="<s:property value="#attr.direito" />">
							</s:if>
							<s:else>
							<li id="nav<s:property value="#level0.index+1"/>Sub<s:property value="#level1.index+1"/>"  style="<s:property value="#attr.direito" />" onclick="submitForm(document.formAplicacao, '<s:url value="/" includeParams="none"/>${acao}?menuTrigger.id=${id}', false);">
							</s:else>

						  		<s:if test="menuCollection.size>0">
									<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_BigIcon_folder" id="<s:property value="id"/>" />
									&nbsp;<s:property value="nome.valor"/>

									<ul id="nav<s:property value="#level0.index+1"/>Sub<s:property value="#level1.index+1"/>Sub">
										<s:iterator value="getMenuFilhosList(id)" status="level2">
										<s:if test="%{acao == null || acao == ''}">
											<li id="nav<s:property value="#level0.index+1"/>Sub<s:property value="#level1.index+1"/>Sub<s:property value="#level2.index+1"/>"  style="<s:property value="#attr.direito" />">
										</s:if>
										<s:else>
											<li id="nav<s:property value="#level0.index+1"/>Sub<s:property value="#level1.index+1"/>Sub<s:property value="#level2.index+1"/>"  style="<s:property value="#attr.direito" />" onclick="submitForm(document.formAplicacao, '<s:url value="/" includeParams="none"/>${acao}?menuTrigger.id=${id}', false);">
										</s:else>

								  		<s:if test="menuCollection.size>0">
											<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_BigIcon_folder" id="<s:property value="id"/>" />
											&nbsp;<s:property value="nome.valor"/>

											<ul id="nav<s:property value="#level0.index+1"/>Sub<s:property value="#level1.index+1"/>Sub<s:property value="#level2.index+1"/>Sub">
											<s:iterator value="getMenuFilhosList(id)" status="level3">
												<s:if test="%{acao == null || acao == ''}">
													<li id="nav<s:property value="#level0.index+1"/>Sub<s:property value="#level1.index+1"/>Sub<s:property value="#level2.index+1"/>Sub<s:property value="#level3.index+1"/>" style="<s:property value="#attr.direito" />">
												</s:if>
												<s:else>
													<li id="nav<s:property value="#level0.index+1"/>Sub<s:property value="#level1.index+1"/>Sub<s:property value="#level2.index+1"/>Sub<s:property value="#level3.index+1"/>" style="<s:property value="#attr.direito" />" onclick="submitForm(document.formAplicacao, '<s:url value="/" includeParams="none"/>${acao}?menuTrigger.id=${id}', false);">
												</s:else>
													<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_Icon_childWindows" id="<s:property value="id"/>" />
													&nbsp;<s:property value="nome.valor"/>
												</li>
											</s:iterator>
											</ul>
										</s:if>
										<s:else>
											<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_Icon_childWindows" id="<s:property value="id"/>" />
											&nbsp;<s:property value="nome.valor"/>
										</s:else>
										</li>
									</s:iterator>
									</ul>
								</s:if>
								<s:else>
									<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_Icon_childWindows" id="<s:property value="id"/>" />
									&nbsp;<s:property value="nome.valor"/>
								</s:else>
							</li>
						</s:iterator>
						</ul>
					</s:if>
				</li>
			</s:iterator>
			</ul>
		</div>
	  </td>
	  </tr>
	  <tr>
		<td valign="top">
		  <table class="Menu_ContentPane_Bottom" id="MenuBottom">
			<tr>
			  <td class="Menu_Bottom_bg"></td>
			</tr>
		  </table>
		</td>
	  </tr>
	</table>
	<form name="formMenu" method="POST" target="_top">
	  <input type="hidden" name="associadoId" value="<%=request.getAttribute("home") %>"></input> 
	  <input type="hidden" name="Command"></input> 
	  <input type="hidden" name="inpSelected" value=""></input>
	</form>
	<form name="formAplicacao" method="POST" target="FrameAplicacao">
	  <input type="hidden" id="associadoId" name="associadoId" value="<%=request.getAttribute("associadoId") %>"></input> 
	</form>
</body></html>

<script language="JavaScript">
<!--

function alterarCorretoraEmUso(){
   	if(parent.FrameAplicacao.formNavigateAlterado){
   		if (confirm('Você alterou informações neste formulário que ainda não foram salvas. Se você navegar para outra página antes de salvá-las, suas informações serão perdidas!\n\n Deseja continuar editando?')){
	   		$('#corretoraId').val($('#corretoraEmUsoId').val());
	   		if (parent.FrameAplicacao.lastFocusField!=undefined)
	   			parent.FrameAplicacao.lastFocusField.focus();
	   		return false;
	   	}else{
	   		parent.FrameAplicacao.formNavigateAlterado = false;
	   	}
   	} 
	var corretoraId = $('#corretoraId').val();
	var associadoId = $('#associadoId').val();
	$('#corretoraEmUsoId').val($('#corretoraId').val());
	$.ajax({
		url      : '<s:url action="alterarCorretoraEmUso" namespace="/corretora" includeParams="none"/>',
		dataType : 'json',
		data     : {
			'corretora.id' : corretoraId,
			'associadoId' : associadoId
		},
		corretoraEl : $('#corretoraId'),
		success  : function(data, status){
			if(data.success){
				$('#paramBreadcrumb').val(data.descricaoCorretora);
				alert('Corretora alterada com sucesso.');
				parent.FrameAplicacao.location = getContextApp()+'/login/showHome.action?associadoId='+$('#corretoraId').val();
				$('#associadoId').val($('#corretoraId').val());
			}else{
				this.failure(data.idDaCorretoraAntiga);
			}
		},
		failure  : function(idDaCorretoraAntiga){
			alert('Ocorreu uma falha ao solicitar a alteração da corretora.');
			$(this.corretoraEl).val(idDaCorretoraAntiga);
		},
		error    : function(xhr, status, e){
			this.failure();
		}
	});
}

function logout(){
   	document.formMenu.action="../logout/showLogin.action";
 	document.formMenu.target="_top";
   	document.formMenu.submit();
}

function chamaFuncao(funcao){
   	document.formAplicacao.action=funcao;
   	document.formAplicacao.submit();
}

//inicializeMenu();

window.onresize = function(){resizeMenu();}

</script>