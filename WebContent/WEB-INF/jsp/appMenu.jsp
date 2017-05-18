<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="<s:url value="/common/web/skins/Default/Menu/Menu.css" />" title="StyleGrid" id="paramCSS"></link>
	<script language="javascript" src="<s:url value="/common/common-pack.js?v=3" includeParams="none"/>" />"></script>
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
  <table border="0" cellspacing="0" cellpadding="0" summary="" width="100%" height="100%">
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
            <td class="Main_NavBar_bg_logo" width="1" onclick="window.open('http://www.atlasinfo.com.br','','width=800,height=600,resizable=yes');return false;"><img src="<s:url value="/common/images/atlasinfo.gif" />" alt="AtlasInfo" title="AtlasInfo" border="0" id="openbravoLogo"></td>
			<td class="Menu_NavBar_bg_logo_right"></td>
			<td class="Menu_NavBar_bg"> </td>
		  </tr>
		</table>
		<table class="Menu_ContentPane_ToolBar Menu_ToolBar_bg" id="MenuTop2">
		  <tr>
			<td width="1" class="Menu_ToolBar_textlabel_bg_left">
			  <a class="Menu_ToolBar_Button" href="#" onclick="" onmouseover="window.status='User info';return true;" onmouseout="window.status='';return true;"><img class="Menu_ToolBar_Button_Icon Menu_ToolBar_Button_Icon_user" src="<s:url value='/common/web/images/blank.gif'/>" border="0" alt="User info" title="User info"></img></a>
			</td>
            <td colspan="2" class="Menu_ToolBar_textlabel_bg_body"><nobr><a class="Menu_ToolBar_text_username" href="#" onclick="logout();"><span>Sair1</span></a><nobr></nobr></nobr></td>
			<td width="1" class="Menu_ToolBar_textlabel_bg_right">
              <a class="Menu_ToolBar_Button" href="#" onclick="logout();" onmouseover="window.status='Encerrar sessão';return true;" onmouseout="window.status='';return true;"><img class="Menu_ToolBar_Button_Icon Menu_ToolBar_Button_Icon_logout" src="../common/web/images/blank.gif" onclick="" border="0" alt="Encerrar sessão" title="Encerrar sessão"></img></a>
			</td>
			<td class="Menu_ToolBar_Space"></td>
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
		<div id="Menu_Client" class="Menu_ContentPane_Client" style="display:none;">
		
		<ul id="nav">
		  	<li id="nav1" onClick="setClick(event);" >
				<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_BigIcon_folder">
				&nbsp;Gerenciamento de Seguros
				<ul id="nav1Sub">
					<li id="proposta" onclick="submitForm(document.formAplicacao, '<s:url value='/proposta/displayList.action' includeParams="none"/>', false);">
						<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_Icon_childWindows">
						&nbsp;Proposta de Seguro
					</li>
					<li id="sinistro" onclick="submitForm(document.formAplicacao, '<s:url value='/sinistro/displayList.action' includeParams="none"/>', false);">
						<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_Icon_childWindows">
					</li>
					<li id="nav1Sub1">
						<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_BigIcon_folder">
						&nbsp;Relatórios
						<ul id="nav1Sub1Sub">
							<li id="vendaDetalhado" onclick="submitForm(document.formAplicacao, '<s:url value='/proposta/relatorios.action' includeParams="get"><s:param name="idRelatorio" value="%{'1'}"/><s:param name="titulo" value="%{'Relatório de Vendas Detalhado'}"/></s:url>', false);">
								<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_Icon_childWindows">
								&nbsp;Vendas Detalhado
							</li>
							<li id="vendaResumido" onclick="submitForm(document.formAplicacao, '<s:url value='/proposta/relatorios.action' includeParams="get"><s:param name="idRelatorio" value="%{'2'}"/><s:param name="titulo" value="%{'Relatório de Vendas Resumido'}"/></s:url>', false);">
								<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_Icon_childWindows">
								&nbsp;Vendas Resumido	
							</li>
							<li id="propostaSemApolice" onclick="submitForm(document.formAplicacao, '<s:url value='/proposta/relatorios.action' includeParams="get"><s:param name="idRelatorio" value="%{'3'}"/><s:param name="titulo" value="%{'Relatório Propostas sem Apólices'}"/></s:url>', false);">
								<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_Icon_childWindows">
								&nbsp;Propostas sem Apólices
							</li>
							<li id="propostaVigente" onclick="submitForm(document.formAplicacao, '<s:url value='/proposta/relatorios.action' includeParams="get"><s:param name="idRelatorio" value="%{'5'}"/><s:param name="titulo" value="%{'Relatório Clientes com Proposta Vigente'}"/></s:url>', false);">
								<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_Icon_childWindows">
								&nbsp;Clientes com Proposta Vigente
							</li>
							<li id="apoliceRenovacao" onclick="submitForm(document.formAplicacao, '<s:url value='/proposta/relatorios.action' includeParams="get"><s:param name="idRelatorio" value="%{'6'}"/><s:param name="titulo" value="%{'Relatório Apólice para Renovação'}"/></s:url>', false);">
								<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_Icon_childWindows">
								&nbsp;Apólice para Renovação
							</li>
						</ul>
					</li>	
				</ul>
			</li>
		  	<li id="nav2" onClick="setClick(event);" >
				<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_BigIcon_folder">
				&nbsp;Financeiro
				<ul id="nav2Sub">
					<li id="propostaComissaoInd" onclick="submitForm(document.formAplicacao, '<s:url value='/preBaixaComissao/displayList.action' includeParams="none"/>', false);">
						<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_Icon_childWindows">
						&nbsp;Baixa de Comissões Individual
					</li>
					<li id="propostaComissaoSel" onclick="submitForm(document.formAplicacao, '<s:url value='/borderoComissao/displayList.action' includeParams="none"/>', false);">
						<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_Icon_childWindows">
						&nbsp;Baixa de Comissões em Lote
					</li>
					<li id="repasseComissao" onclick="submitForm(document.formAplicacao, '<s:url value='/repasseComissao/displayList.action' includeParams="none"/>', false);">
						<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_Icon_childWindows">
						&nbsp;Baixa de Repasse de Comissões
					</li>
					<li id="nav2Sub1">
						<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_BigIcon_folder">
						&nbsp;Relatórios de Comissões e Repasse
						<ul id="nav2Sub1Sub">
							<!-- <li id="comissoesDetalhada" onclick="submitForm(document.formAplicacao, '<s:url value='/propostaComissao/relatorioComissoes.action' includeParams="get"><s:param name="idRelatorio" value="%{'1'}"/><s:param name="titulo" value="%{'Relátorio de Comissoes Detalhado'}"/></s:url>', false);">
								<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_Icon_childWindows">
								&nbsp;Listagem de Comissões Detalhada
							</li> -->
							<li id="comissoesDetalhada" onclick="submitForm(document.formAplicacao, '<s:url value='/propostaComissao/relatorioComissoes.action' includeParams="get"><s:param name="idRelatorio" value="%{'2'}"/><s:param name="titulo" value="%{'Relátorio de Comissoes Detalhado'}"/></s:url>', false);">
								<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_Icon_childWindows">
								&nbsp;Listagem de Comissões Recebidas
							</li>
							<li id="repasseDetalhado" onclick="submitForm(document.formAplicacao, '<s:url value='/repasseComissao/relatorioRepasse.action' includeParams="get"><s:param name="idRelatorio" value="%{'3'}"/><s:param name="titulo" value="%{'Relatório Repasse de Comissões'}"/></s:url>', false);">
								<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_Icon_childWindows">
								&nbsp;Repasse de Comissões
							</li>
						</ul>
					</li>	
				</ul>
			</li>
		  	<li id="nav3" onClick="setClick(event);">
				<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_BigIcon_folder">
				&nbsp;Cadastros
				<ul id="nav3Sub">
					<li id="ramo" onclick="submitForm(document.formAplicacao, '<s:url value='/ramo/displayList.action' includeParams="none"/>', false);">
						<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_Icon_childWindows">
						&nbsp;Ramo
					</li>
					<li id="corretora" onclick="submitForm(document.formAplicacao, '<s:url value='/corretora/displayList.action' includeParams="none"/>', false);">
						<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_Icon_childWindows">
						&nbsp;Corretora
					</li>
					<li id="seguradora" onclick="submitForm(document.formAplicacao, '<s:url value='/seguradora/displayList.action' includeParams="none"/>', false);">
						<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_Icon_childWindows">
						&nbsp;Seguradora
					</li>
					<li id="vistoriadora" onclick="submitForm(document.formAplicacao, '<s:url value='/vistoriadora/displayList.action' includeParams="none"/>', false);">
						<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_Icon_childWindows">
						&nbsp;Vistoriadora
					</li>
					<li id="grupoDeVenda" onclick="submitForm(document.formAplicacao, '<s:url value='/grupoDeVenda/displayList.action' includeParams="none"/>', false);">
						<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_Icon_childWindows">
						&nbsp;Grupo de Venda
					</li>
					<!--li id="banco" onclick="submitForm(document.formAplicacao, '<s:url value='/banco/displayList.action' includeParams="none"/>', false);">
						<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_Icon_childWindows">
						&nbsp;Bancos
					</li>
					<li id="contaCorrente" onclick="submitForm(document.formAplicacao, '<s:url value='/contaCorrente/displayList.action' includeParams="none"/>', false);">
						<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_Icon_childWindows">
						&nbsp;Conta Corrente
					</li>-->
					<li id="produtor" onclick="submitForm(document.formAplicacao, '<s:url value='/produtor/displayList.action' includeParams="none"/>', false);">
						<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_Icon_childWindows">
						&nbsp;Produtor
					</li>
					<li id="dominio" onclick="submitForm(document.formAplicacao, '<s:url value='/dominio/displayList.action' includeParams="none"/>', false);">
						<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_Icon_childWindows">
						&nbsp;Domínio
					</li>
					<li id="dominioEsp" onclick="submitForm(document.formAplicacao, '<s:url value='/dominioEsp/displayList.action' includeParams="none"/>', false);">
						<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_Icon_childWindows">
						&nbsp;Domínio Esp.
					</li>
					<li id="pessoaFisica" onclick="submitForm(document.formAplicacao, '<s:url value='/pessoa/displayList.action' includeParams="none"/>', false);">
						<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_Icon_childWindows">
						&nbsp;Pessoa
					</li>
					<li id="nav3Sub1">
						<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_BigIcon_folder">
						&nbsp;Outros Cadastros
						<ul id="nav3Sub1Sub">
							<li id="oficinas" onclick="submitForm(document.formAplicacao, '<s:url value='/oficina/displayList.action' includeParams="none"/>', false);">
								<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_Icon_childWindows">
								&nbsp;Oficina
							</li>
							<li id="cidade" onclick="submitForm(document.formAplicacao, '<s:url value='/cidade/displayList.action' includeParams="none"/>', false);">
								<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_Icon_childWindows">
								&nbsp;Cidade
							</li>
						</ul>
					</li>
				</ul>
			</li>
			<s:if test="usuario.nomeLogin=='LUIZ'">
			<li id="nav4" onClick="setClick(event);">
				<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_BigIcon_folder">
				&nbsp;Controle de Acesso
				<ul id="nav4Sub">
					<li id="privilegio" onclick="submitForm(document.formAplicacao, '<s:url value='/privilegio/displayList.action' includeParams="none"/>', false);">
						<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_Icon_childWindows">
						&nbsp;Privilégio
					</li>
					<li id="usuarios" onclick="submitForm(document.formAplicacao, '<s:url value='/usuario/displayList.action' includeParams="none"/>', false);">
						<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_Icon_childWindows">
						&nbsp;Usuário
					</li>
					<li id="menus" onclick="submitForm(document.formAplicacao, '<s:url value='/menu/displayList.action' includeParams="none"/>', false);">
						<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_Icon_childWindows">
						&nbsp;Menu
					</li>
				</ul>
			</li>
			</s:if>
			<li id="nav5" onClick="setClick(event);" >
				<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_BigIcon_folder">
				&nbsp;Tutorial Online
				<ul id="nav5Sub">
					<li id="proposta" onclick="submitForm(document.formAplicacao, '<s:url value='/tutorial/tutorialCriarProposta.html' includeParams="none"/>', false);">
						<img src="<s:url value='/common/web/images/blank.gif'/>" class="Menu_Client_Button_Icon_childWindows">
						&nbsp;Como Criar Proposta de Seguro
					</li>
				</ul>
			</li>
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
	  <input type="hidden" name="Command"></input> 
	  <input type="hidden" name="inpSelected" value=""></input>
	</form>
	<form name="formAplicacao" method="POST" target="FrameAplicacao">

	</form>
</body></html>

<script language="JavaScript">
<!--

function logout(){
   	document.formMenu.action="../logout/showLogin.action";
 	document.formMenu.target="_top";
   	document.formMenu.submit();
}

function chamaFuncao(funcao){
   	document.formAplicacao.action=funcao;
   	document.formAplicacao.submit();
}

window.onresize = function(){resizeMenu();}

</script>