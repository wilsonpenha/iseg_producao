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

	<div id="divForm2" style="width:100%; overflow: auto;">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	  <tr><td>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	    <tr>
		  <td colspan="4">
			<s:textfield theme="simple" id="itemCorrente" name="itemCorrente" cssStyle="display:none;" />
			<s:textfield theme="simple" id="itens" name="itens" cssStyle="display:none;" />
			<div class="demo" id="demo">
			<div id="accordion" style="height: 0px;width: 100%; line-height: 0px;">
			<a id="itensSegurados" href="#" style="display:none; padding: 0.0em 0.0em 0.0em 0.0em; height: 0px;" onclick="setTimeout(function(){if (navigator.userAgent.indexOf('Chrome') > -1){$('#accordionContent').css('height',$('#divListaImoveis').css('height'))}},400);"></a>
			  <div id="accordionContent" style="margin-top: 1px; padding: 1px;background: #E8E8E8 none repeat scroll 0 0; -moz-border-radius: 4px; border: 1px solid #AAAAAA; z-index: 100;">
			  <div id="divListaImoveis" style="padding: 0px; background: #E8E8E8 none repeat scroll 0 0;">
				<table id="tableImovelItens" style="padding-top: 1px;" class="listItens" style="width: 100%" cellspacing="0" cellpadding="0" border="0">
				  <tr class="listItensHeader">
					<td width="10%" nowrap="nowrap">Ações</td>
					<td width="10%" nowrap="nowrap">CEP</td>
					<td width="35%" nowrap="nowrap">Logradouro</td>
					<td width="20%" nowrap="nowrap">Bairro</td>
					<td width="20%" nowrap="nowrap">Cidade</td>
					<td width="5%" nowrap="nowrap">UF</td>
				  </tr>
				  <s:iterator value="imovelList" status="stat">
				  <s:if test="!linhaVazia">
					<tr>
					  <td nowrap="nowrap" class="small_image">
						<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/delete.gif" includeParams="none"/>" onclick="if(confirma('Confirma exclusão?')){removerItem('${stat.index}');}"/>
						<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/edit.gif" includeParams="none"/>" onclick="editarImovel('${stat.index}')"/>
					  </td>
					  <td nowrap="nowrap"><s:property value="cep"/>&nbsp;</td>
					  <td nowrap="nowrap"><s:property value="logradouro"/>&nbsp;</td>
					  <td nowrap="nowrap"><s:property value="bairro"/>&nbsp;</td>
					  <td nowrap="nowrap"><s:property value="cidade"/>&nbsp;</td>
					  <td nowrap="nowrap"><s:property value="uf"/>&nbsp;</td>
					</tr>
				  </s:if>
				  </s:iterator>
				</table>
			  	<table style="margin-left:10px; -moz-border-radius: 4px;">
				  <tr>
				  	<td>
				      <a href="#" class="button" onclick="$('#itensSegurados').click();" >
					  <table cellpadding="0" cellspacing="0" onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
					    <tr>
						  <td class="wButton_left"></td>
						  <td class="wButton_text wButton_width">Fechar</td>
						  <td class="wButton_right"/>
					    </tr>
					  </table>
					  </a>
				    </td>
				  	<td>
				      <a href="#" class="button" onclick="novoItem();" >
					  <table cellpadding="0" cellspacing="0" onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
					    <tr>
						  <td class="wButton_left"></td>
						  <td class="wButton_text wButton_width">Novo Item</td>
						  <td class="wButton_right"/>
					    </tr>
					  </table>
					  </a>
				    </td>
				  </tr>
				</table>
			  </div>
			  </div>
			</div><!-- End accordion -->
			</div><!-- End demo -->
		  </td>
	    </tr>
	</table>
	  </td></tr>
	  <tr>
		<td>
      <table style="height: 32px; -moz-border-radius: 4px; border: 1px solid #AAAAAA;" class="Main_ContentPane_ToolBar Main_ToolBar_bg" id="tdToolBar">
        <tr>
			<td class="Main_ToolBar_Separator_cell" ><IMG src="<s:url value="/common/web/images/blank.gif" />" class="Main_ToolBar_Separator"></td>
			<td width="2%" ><a id="divButtonNew" href="#" onClick="novoItem();" class="Main_ToolBar_Button" onMouseOver="window.status='Novo Registro';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonNew"><img class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_New" src="<s:url value="/common/web/images/blank.gif" />" title="Novo Registro" border="0" id="buttonNew"></a></td>
			<td class="Main_ToolBar_Separator_cell" ><IMG src="<s:url value="/common/web/images/blank.gif" />" class="Main_ToolBar_Separator"></td>
			<td width="2%" ><a id="divButtonDelete" href="#" onClick="if(confirma('Confirma exclusão?')){removerItem();}" class="Main_ToolBar_Button" onMouseOver="window.status='Excluir Registro';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonDelete"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Delete" id="buttonDelete" title="Excluir Registro"></a></td>
			<td class="Main_ToolBar_Separator_cell" ><IMG src="<s:url value="/common/web/images/blank.gif" />" class="Main_ToolBar_Separator"></td>
			<td width="2%" ><a href="#" onClick="$('#itensSegurados').click();" class="Main_ToolBar_Button" onMouseOver="window.status='Efetuar uma Busca';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonSearch"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Search" id="buttonSearch" title="Efetuar uma busca"></a></td>
			<td class="Main_ToolBar_Separator_cell" ><IMG src="<s:url value="/common/web/images/blank.gif" />" class="Main_ToolBar_Separator"></td>
			<td width="2%" ><a href="#" onclick="primeiroItem();" class="Main_ToolBar_Button" onmouseover="window.status='Primeiro Item';return true;" onmouseout="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonPrevious"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_First" id="buttonPrevious" title="Primeiro item"/></a></td>
			<td class="Main_ToolBar_Separator_cell" ><IMG src="<s:url value="/common/web/images/blank.gif" />" class="Main_ToolBar_Separator"></td>
			<td width="2%" ><a href="#" onclick="itemAnterior();" class="Main_ToolBar_Button" onmouseover="window.status='Item Anterior';return true;" onmouseout="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonPrevious"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Previous" id="buttonPrevious" title="Item anterior"/></a></td>
			<td class="Main_ToolBar_Separator_cell" ><IMG src="<s:url value="/common/web/images/blank.gif" />" class="Main_ToolBar_Separator"></td>
			<td width="2%" ><a href="#" onclick="proximoItem();" class="Main_ToolBar_Button" onmouseover="window.status='Próximo Item';return true;" onmouseout="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonNext"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Next" id="buttonNext" title="Proximo Item"/></a></td>
			<td class="Main_ToolBar_Separator_cell" ><IMG src="<s:url value="/common/web/images/blank.gif" />" class="Main_ToolBar_Separator"></td>
			<td width="2%" ><a href="#" onclick="ultimoItem();" class="Main_ToolBar_Button" onmouseover="window.status='Último Item';return true;" onmouseout="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonNext"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Last" id="buttonNext" title="Ultimo Item"/></a></td>
			<td width="1"><IMG src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_textlabel_bg_left"></td>
			<td class="Main_ToolBar_textlabel_bg_body"><nobr id="bookmark" class="Main_ToolBar_text_bookmark">${itemCorrente+1} / ${itens}</nobr></td>
			<td width="1"><IMG src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_textlabel_bg_right"></td>
			<td class="Main_ToolBar_Separator_cell" ><IMG src="<s:url value="/common/web/images/blank.gif" />" class="Main_ToolBar_Separator"></td>
			<td class="Main_ToolBar_Space"></td>
        </tr>
      </table>
	<table>
	    <tr>
		  <td colspan="4">
		    <div id="divMessagesTab2" class="divMessages" style="padding-bottom: 1px;">
		  	  <s:actionerror/>
			  <s:actionmessage/>
			  <s:fielderror/>
		    </div>
		  </td>
	    </tr>
	</table>
	  </td></tr>
	  <tr>
		<td>
		  <fieldset>
		  <legend accesskey="R"><b>Dados do <u>R</u>isco</b></legend>
		  	<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
			  <td width="10%">
				<label id="labelCover" for="cepRis"><a href="#" class="LabelLink" onclick="openWin('${pageContext.request.contextPath}/endereco/buscaCep.action','BuscaCep','1024','600','resizable=yes,scrollbars=yes');">CEP</a><br /></label>
				<s:textfield theme="simple" id="imovelAlterado" name="imovelAlterado" cssStyle="display:none;" />
				<s:textfield theme="simple" id="imovelId" name="proposta.imovelCollection[%{itemCorrente}].id" cssStyle="display:none;" />
				<s:textfield theme="simple" id="imovelLinhaVazia" name="proposta.imovelCollection[%{itemCorrente}].linhaVazia" cssStyle="display:none;" />
				<s:textfield theme="simple" id="imovelPropostaId" name="proposta.imovelCollection[%{itemCorrente}].proposta.id" cssStyle="display:none;" />
				<s:textfield theme="simple" cssClass="clCep" id="cepRis" name="proposta.imovelCollection[%{itemCorrente}].cep" size="11" maxlength="9" onchange="setImovelAlterado(true);"/>
				
			  </td>
			  <td width="30%">
				<label for="lograRis">Logradouro</label><br />
				<s:textfield theme="simple" cssClass="requiredField" id="lograRis" name="proposta.imovelCollection[%{itemCorrente}].logradouro" cssStyle="width:98%" maxlength="60" onchange="setImovelAlterado(true);"/>
			  </td>
			  <td width="30%">
				<label for="compRis">Complemento</label><br />
				<s:textfield theme="simple" id="compRis" name="proposta.imovelCollection[%{itemCorrente}].complemento" cssStyle="width:98%" maxlength="60" onchange="setImovelAlterado(true);"/>
			  </td>
			  <td width="15%">
				<label for="numeroRis">Número</label><br />
				<s:textfield theme="simple" id="numeroRis" name="proposta.imovelCollection[%{itemCorrente}].numero" maxlength="6" size="8"  onchange="setImovelAlterado(true);"/>
			  </td>
			  <td width="15%">
				<label for="foneRis">Telefone</label><br />
				<s:textfield theme="simple" id="foneRis" cssClass="clFone" name="proposta.imovelCollection[%{itemCorrente}].telefone" size="16" maxlength="20" onchange="setImovelAlterado(true);"/>
			  </td>
			</tr>
			<tr>
			  <td colspan="2">
				<label for="bairroRis">Bairro</label><br />
				<s:textfield theme="simple" cssClass="requiredField" id="bairroRis" name="proposta.imovelCollection[%{itemCorrente}].bairro" cssStyle="width:98%" maxlength="50" onchange="setImovelAlterado(true);"/>
			  </td>
			  <td>
				<label for="cidadeRis">Cidade</label><br />
				<s:textfield theme="simple" cssClass="requiredField" id="cidadeRis" name="proposta.imovelCollection[%{itemCorrente}].cidade" cssStyle="width:98%" maxlength="35" onchange="setImovelAlterado(true);"/>
			  </td>
			  <td>
				<label for="ufRis">UF</label><br />
				<s:select theme="simple" cssClass="requiredField" id="ufRis" headerKey="" headerValue="-- Selecione --" name="proposta.imovelCollection[%{itemCorrente}].uf" list="ufList" listKey="uf" listValue="nome" onchange="setImovelAlterado(true);"/>
			  </td>
			  <td>
				<label for="faxRis">Fax</label><br />
				<s:textfield theme="simple" id="faxRis" cssClass="clFone" name="proposta.imovelCollection[%{itemCorrente}].fax" size="16" maxlength="20" onchange="setImovelAlterado(true);"/>
			  </td>
			</tr>
			<tr>
			<td colspan="5">
				<table border="0" cellpadding="0" cellspacing="0"><tr><td><label id="labelCover">
    			    <a href="#" class="button" onclick="importarEnderecoCliente();" tabindex="-1">
					<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton">
					  <tr>
						<td class="wButton_left"></td>
						<td class="wButton_text wButton_width">Importar Dados Cliente</td>
						<td class="wButton_right"/>
					  </tr>
					</table>
				    </a></label></td></tr>
			    </table>
			  </td>
			</tr>
		  </table>
		  </fieldset>
		</td>
	  </tr>
	  <tr>
		<td colspan="2">
		  <table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
			  <td colspan="2">
				<fieldset>
			  <legend><b>Informações do Imóvel</b></legend>
				  <table id="tableCobertura" width="100%" cellspacing="3" cellpadding="3" class="Main_Client_TableEdition" style="">
					<tr>
					  <td width="25%">
						<label for="cobertura">Idade do Imóvel</label><br />
						<s:textfield theme="simple" id="idadeDoImovel" cssClass="currency clValor51 dojoValidateValid TextBox_100percent_width" cssStyle="width:96%" maxlength="5" name="proposta.imovelCollection[%{itemCorrente}].idadeDoImovel"  onchange="setImovelAlterado(true);"/>
					  </td>
					  <td width="25%">
						<label for="coberturaPremio">Área Construída</label><br />
						<s:textfield theme="simple" id="areaConstruida" cssClass="clValor2 currency dojoValidateValid TextBox_100percent_width" cssStyle="width:96%" maxlength="11" name="proposta.imovelCollection[%{itemCorrente}].areaConstruida"  onchange="setImovelAlterado(true);"/>
					  </td>
					  <td width="25%">
						<label for="coberturaLMI">Tipo do Imóvel</label><br />
						<s:select theme="simple" cssClass="requiredField TextBox_100percent_width" id="tipoDoImovel" name="proposta.imovelCollection[%{itemCorrente}].tipoDoImovel" list="#{'0':'COMERCIAL', '1':'INDUSTRIAL', '2':'RESIDENCIAL', '3':'MISTO'}" onchange="setImovelAlterado(true);"/>
					  </td>
					  <td width="25%">
						<label for="coberturaFranquia">Uso do Imóvel</label><br />
						<s:select theme="simple" cssClass="requiredField TextBox_100percent_width" id="usoDoImovel" name="proposta.imovelCollection[%{itemCorrente}].usoDoImovel" list="#{'0':'HABITUAL', '1':'VERANEIO'}" onchange="setImovelAlterado(true);"/>
					  </td>
					</tr>
					<tr>
					  <td width="25%">
						<label for="cobertura">Tipo de Contrução</label><br />
						<s:select theme="simple" cssClass="requiredField TextBox_100percent_width" id="tipoDeConstrucao" name="proposta.imovelCollection[%{itemCorrente}].tipoDeConstrucao" list="#{'0':'ANDAR TÉRREO', '1':'ANDAR SUPERIOR', '2':'PRÉDIO'}" onchange="setImovelAlterado(true);"/>
					  </td>
					  <td width="25%">
						<label for="coberturaPremio">Classe Construção</label><br />
						<s:select theme="simple" cssClass="requiredField TextBox_100percent_width" id="classeDeContrucao" name="proposta.imovelCollection[%{itemCorrente}].classeDeContrucao" list="#{'0':'SUPERIOR', '1':'SÓLIDA', '2':'MISTA', '3':'INFERIOR'}" onchange="setImovelAlterado(true);"/>
					  </td>
					  <td width="25%">
						<label for="coberturaLMI">Ocupante/Usuário</label><br />
						<s:select theme="simple" cssClass="requiredField TextBox_100percent_width" id="ocupante" name="proposta.imovelCollection[%{itemCorrente}].ocupante" list="#{'0':'INQUILINO', '1':'PROPRIETÁRIO'}" onchange="setImovelAlterado(true);"/>
					  </td>
					  <td width="25%">
						<label for="coberturaFranquia">Valor do Aluguel</label><br />
						<s:textfield theme="simple" id="valorDoAluguel" cssClass="clValor2 currency dojoValidateValid  TextBox_100percent_width" cssStyle="width:96%" maxlength="14" name="proposta.imovelCollection[%{itemCorrente}].valorDoAluguel" onchange="setImovelAlterado(true);"/>
					  </td>
					</tr>
				  </table>
			    </fieldset>
	    	  </td>
	        </tr>
	        <tr>
			  <td valign="top" width="50%">
				<fieldset style="height: 78px;">
			  <legend><b>Segurança do Imóvel</b></legend>
				  <table id="segurancaImovel" width="100%" cellspacing="3" cellpadding="3" class="Main_Client_TableEdition" style="height: 70px;">
					<tr>
					  <td width="40%" align="right">
						<label for="cobertura">Vigilância Permanente: </label>
					  </td>
					  <td>
						<s:select theme="simple" cssClass="requiredField" id="temVigilancia" headerKey="" headerValue="---" name="proposta.imovelCollection[%{itemCorrente}].temVigilancia" list="{'NAO','SIM'}" onchange="setImovelAlterado(true);"/>
					  </td>
					  <td width="40%" align="right">
						<label for="coberturaPremio">Porteiro Eletrônico: </label>
					  </td>
					  <td>
						<s:select theme="simple" cssClass="requiredField" id="porteiroEletronico" headerKey="" headerValue="---" name="proposta.imovelCollection[%{itemCorrente}].porteiroEletronico" list="{'NAO','SIM'}" onchange="setImovelAlterado(true);"/>
					  </td>
					</tr>
					<tr>
					  <td width="40%" align="right">
						<label for="coberturaLMI">Alarmes: </label>
					  </td>
					  <td>
						<s:select theme="simple" cssClass="requiredField" id="alarmes" headerKey="" headerValue="---" name="proposta.imovelCollection[%{itemCorrente}].alarmes" list="{'NAO','SIM'}" onchange="setImovelAlterado(true);"/>
					  </td>
					  <td width="40%" align="right">
						<label for="coberturaFranquia">Sem Terreno Baldio: </label>
					  </td>
					  <td>
						<s:select theme="simple" cssClass="requiredField" id="semTerrenoBaldio" headerKey="" headerValue="---" name="proposta.imovelCollection[%{itemCorrente}].semTerrenoBaldio" list="{'NAO','SIM'}" onchange="setImovelAlterado(true);"/>
					  </td>
					</tr>
					<tr>
					  <td width="40%" align="right">
					  	<label for="cobertura">Grades, Portas, Janelas: </label>
					  </td>
					  <td>
						<s:select theme="simple" cssClass="requiredField" id="gradesMetalicas" headerKey="" headerValue="---" name="proposta.imovelCollection[%{itemCorrente}].gradesMetalicas" list="{'NAO','SIM'}" onchange="setImovelAlterado(true);"/>
					  </td>
					  <td width="40%" align="right">
						<label for="coberturaPremio">Muro Fechado no Terreno: </label>
					  </td>
					  <td>
						<s:select theme="simple" cssClass="requiredField" id="muroFechado" headerKey="" headerValue="---" name="proposta.imovelCollection[%{itemCorrente}].muroFechado" list="{'NAO','SIM'}" onchange="setImovelAlterado(true);"/>
					  </td>
					</tr>
				  </table>
			    </fieldset>
	    	  </td>
			  <td valign="top" width="50%">
				<fieldset style="height: 78px;">
			      <legend><b>Valor Estimado do Risco em Patrimônio</b></legend>
				  <table id="valoresPatrimonio" width="100%" cellspacing="3" cellpadding="3" class="Main_Client_TableEdition" style="height: 70px;">
					<tr>
					  <td width="35%">
						<label for="cobertura">Prédio: </label>
					  </td>
					  <td>
						<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" id="vlrRiscoPredio" name="proposta.imovelCollection[%{itemCorrente}].vlrRiscoPredio" maxlength="14" onchange="setImovelAlterado(true);" />
					  </td>
					  <td width="35%">
						<label for="coberturaPremio">Instalações:</label>
					  </td>
					  <td>
						<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" id="vlrRiscoInstalacoes" name="proposta.imovelCollection[%{itemCorrente}].vlrRiscoInstalacoes" maxlength="14" onchange="setImovelAlterado(true);" />
					  </td>
					</tr>
					<tr>
					  <td colspan="4">
					  </td>
					</tr>
					<tr>
					  <td width="35%">
						<label for="coberturaLMI">Máquinas e Equipamentos:</label>
					  </td>
					  <td>
						<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" id="vlrRiscoMaqEquip" name="proposta.imovelCollection[%{itemCorrente}].vlrRiscoMaqEquip" maxlength="14" onchange="setImovelAlterado(true);" />
					  </td>
					  <td width="35%">
						<label for="coberturaFranquia">Mercadorias e Insumos:</label>
					  </td>
					  <td>
						<s:textfield theme="simple" cssClass="TextBox_OneCells_width clValor2 currency" id="vlrRiscoMercadorias" name="proposta.imovelCollection[%{itemCorrente}].vlrRiscoMercadorias" maxlength="14" onchange="setImovelAlterado(true);" />
					  </td>
					</tr>
				  </table>
			    </fieldset>
	    	  </td>
	        </tr>
		  <tr>
			<td colspan="2">
				<fieldset>
				<legend accesskey="o">Descrição de Atividades Exercidas no Imóvel Segurado</legend>
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
				  <tr>
					<td>
					  <label for="clausulaSeguro">Observações:</label><br/>
					  <s:textarea theme="simple" cssClass="dojoValidateValid requiredField clTextoRestrito TextArea_Medium_height TextBox_100percent_width" rows="3" id="descricaoAtividades" name="proposta.imovelCollection[%{itemCorrente}].descricaoAtividades" onkeyup="return checkMaxLength(this, 600);" onchange="setImovelAlterado(true);" />
					</td>
				  </tr>
				</table>
				</fieldset>
	    	  </td>
	        </tr>
		  <tr>
			<td colspan="2">
	    	  </td>
	        </tr>
		  <tr>
			<td colspan="2">
				<fieldset>
				<legend accesskey="o">Coberturas Contratadas</legend>
				<div id="divListaCoberturas">
				<table id="tableCoberturas" width="100%" border="0" cellpadding="2" cellspacing="1" >
				<tbody>
				  <tr>
					<td width="40%">&nbsp;</td>
					<td width="15%">LMI</td>
					<td width="15%">Franquia</td>
					<td width="15%">Observação Franquia</td>
					<td width="15%">Prêmio Líquido por Cobertura</td>
				  </tr>
				  <s:iterator value="imovelCoberturaList" status="stat">
				  <s:if test="cobertura.id != null">
				  <s:if test="%{cobertura.ramo.id == proposta.ramo.id}">
					<tr>
					  <td nowrap="nowrap">
						<s:textfield theme="simple" id="imovelCoberturaId%{#stat.index}" name="proposta.imovelCollection[%{itemCorrente}].imovelCoberturaCollection[%{#stat.index}].id" value="%{id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaId%{#stat.index}" name="proposta.imovelCollection[%{itemCorrente}].imovelCoberturaCollection[%{#stat.index}].cobertura.id" value="%{cobertura.id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaImovelId%{#stat.index}" name="proposta.imovelCollection[%{itemCorrente}].imovelCoberturaCollection[%{#stat.index}].imovel.id" value="%{imovel.id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaSequencia%{#stat.index}" name="proposta.imovelCollection[%{itemCorrente}].imovelCoberturaCollection[%{#stat.index}].sequencia" value="%{sequencia}" cssStyle="display:none"/>
					    <s:property value="cobertura.descricao"/>:
					  </td>
					  <td><s:textfield theme="simple" id="coberturaLmi%{#stat.index}" cssClass="clValor2 currency" name="proposta.imovelCollection[%{itemCorrente}].imovelCoberturaCollection[%{#stat.index}].lmi" value="%{lmi}" onkeyup="enableDisableDadosCobertura('%{#stat.index}');" onchange="setImovelAlterado(true);" cssStyle="width:80%" /></td>
					  <s:if test="cobertura.blnInformaFranquia">
					    <td><s:textfield theme="simple" id="coberturaFranquia%{#stat.index}" cssClass="clValor2 currency" name="proposta.imovelCollection[%{itemCorrente}].imovelCoberturaCollection[%{#stat.index}].franquia" value="%{franquia}" cssStyle="width:80%" onchange="setImovelAlterado(true);"/></td>
					    <td><s:textfield theme="simple" id="coberturaTextoFranquia%{#stat.index}" name="proposta.imovelCollection[%{itemCorrente}].imovelCoberturaCollection[%{#stat.index}].textoFranquia" value="%{textoFranquia}" maxlength="100" cssStyle="width:96%" onchange="setImovelAlterado(true);"/></td>
					  </s:if>
					  <s:else>
					    <td></td><td></td>
					  </s:else>
					  <td><s:textfield theme="simple" id="coberturaPremio%{#stat.index}" cssClass="clValor2 currency" name="proposta.imovelCollection[%{itemCorrente}].imovelCoberturaCollection[%{#stat.index}].premio" value="%{premio}" cssStyle="width:80%" onchange="setImovelAlterado(true);"/></td>
					</tr>
				  </s:if>
				  </s:if>
				  <s:else>
					<tr>
					  <td nowrap="nowrap">
						<s:textfield theme="simple" id="imovelCoberturaId%{#stat.index}" name="proposta.imovelCollection[%{itemCorrente}].imovelCoberturaCollection[%{#stat.index}].id" value="%{id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaImovelId%{#stat.index}" name="proposta.imovelCollection[%{itemCorrente}].imovelCoberturaCollection[%{#stat.index}].imovel.id" value="%{imovel.id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaBlnFranquia%{#stat.index}" name="proposta.imovelCollection[%{itemCorrente}].imovelCoberturaCollection[%{#stat.index}].blnInformaFranquia" value="%{blnInformaFranquia}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaSequencia%{#stat.index}" name="proposta.imovelCollection[%{itemCorrente}].imovelCoberturaCollection[%{#stat.index}].sequencia" value="%{sequencia}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaDescricao%{#stat.index}" name="proposta.imovelCollection[%{itemCorrente}].imovelCoberturaCollection[%{#stat.index}].descricao" value="%{descricao}" onchange="setImovelAlterado(true);" />
					  </td>
					  <td><s:textfield theme="simple" id="coberturaLmi%{#stat.index}" cssClass="clValor2 currency" name="proposta.imovelCollection[%{itemCorrente}].imovelCoberturaCollection[%{#stat.index}].lmi" value="%{lmi}" onkeyup="enableDisableDadosCobertura('%{#stat.index}');"  onchange="setImovelAlterado(true);" cssStyle="width:80%" /></td>
					  <s:if test="blnInformaFranquia">
					    <td><s:textfield theme="simple" id="coberturaFranquia%{#stat.index}" cssClass="clValor2 currency" name="proposta.imovelCollection[%{itemCorrente}].imovelCoberturaCollection[%{#stat.index}].franquia" value="%{franquia}" cssStyle="width:80%" onchange="setImovelAlterado(true);"/></td>
					    <td><s:textfield theme="simple" id="coberturaTextoFranquia%{#stat.index}" name="proposta.imovelCollection[%{itemCorrente}].imovelCoberturaCollection[%{#stat.index}].textoFranquia" value="%{textoFranquia}" maxlength="100" cssStyle="width:96%" onchange="setImovelAlterado(true);"/></td>
					  </s:if>
					  <s:else>
					    <td></td><td></td>
					  </s:else>
					  <td><s:textfield theme="simple" id="coberturaPremio%{#stat.index}" cssClass="clValor2 currency" name="proposta.imovelCollection[%{itemCorrente}].imovelCoberturaCollection[%{#stat.index}].premio" value="%{premio}" cssStyle="width:80%" onchange="setImovelAlterado(true);"/></td>
					</tr>
				  </s:else>
				  </s:iterator>
				  </tbody>
				</table>
				</div>
				<table>
				  <tr>
				  	<td>
					<table border="0" cellpadding="0" cellspacing="0"><tr><td><label id="labelCover">
				      <a href="#" class="button" onclick="abrirDivNovaCobertura();" >
					  <table onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
					    <tr>
						  <td class="wButton_left"></td>
						  <td class="wButton_text wButton_width">Adicionar Cobertura</td>
						  <td class="wButton_right"/>
					    </tr>
					  </table>
					    </a></label></td></tr>
				    </table>
				    </td>
				  </tr>
				</table>
				</fieldset>
	    	  </td>
	        </tr>
	      </table>
		</td>
	  </tr>
	</table>
  </div>
<% } catch (Exception e) {e.printStackTrace();}%>