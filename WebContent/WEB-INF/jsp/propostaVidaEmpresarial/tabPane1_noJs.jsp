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

	<div id="divForm2" style="width:100%">
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
			  <div id="divListaSegurados" style="padding: 0px; background: #E8E8E8 none repeat scroll 0 0;">
				<table id="tableSeguradoItens" style="padding-top: 1px;" class="listItens" style="width: 100%" cellspacing="0" cellpadding="0" border="0">
				  <tr class="listItensHeader">
					<td width="10%" nowrap="nowrap">Ações</td>
					<td width="45%" nowrap="nowrap">Nome</td>
					<td width="15%" nowrap="nowrap">CPF</td>
					<td width="10%" nowrap="nowrap">Nasc</td>
					<td width="10%" nowrap="nowrap">Inclusão</td>
					<td width="10%" nowrap="nowrap">Vigência</td>
				  </tr>
				  <s:iterator value="seguradoEmpresarialList" status="stat">
				  <s:if test="!linhaVazia">
					<tr>
					  <td nowrap="nowrap" class="small_image">
						<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/delete.gif" includeParams="none"/>" onclick="if(confirma('Confirma exclusão?')){removerSegurado('${stat.index}');}"/>
						<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/edit.gif" includeParams="none"/>" onclick="editarSegurado('${stat.index}')"/>
					  </td>
					  <td nowrap="nowrap"><s:property value="nome"/>&nbsp;</td>
					  <td nowrap="nowrap"><s:property value="cpf"/>&nbsp;</td>
					  <td nowrap="nowrap"><s:property value="dataNascimento"/>&nbsp;</td>
					  <td nowrap="nowrap"><s:property value="dataInclusao"/>&nbsp;</td>
					  <td nowrap="nowrap"><s:property value="inicioVigencia"/>&nbsp;</td>
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
				      <a href="#" class="button" onclick="novoSegurado();" >
					  <table cellpadding="0" cellspacing="0" onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
					    <tr>
						  <td class="wButton_left"></td>
						  <td class="wButton_text wButton_width">Novo item</td>
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
			<td width="2%" ><a id="divButtonNew" href="#" onClick="novoSegurado();" class="Main_ToolBar_Button" onMouseOver="window.status='Novo Registro';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonNew"><img class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_New" src="<s:url value="/common/web/images/blank.gif" />" title="Novo Registro" border="0" id="buttonNew"></a></td>
			<td class="Main_ToolBar_Separator_cell" ><IMG src="<s:url value="/common/web/images/blank.gif" />" class="Main_ToolBar_Separator"></td>
			<td width="2%" ><a id="divButtonDelete" href="#" onClick="if(confirma('Confirma exclusão?')){removerSegurado();}" class="Main_ToolBar_Button" onMouseOver="window.status='Excluir Registro';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonDelete"><img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Delete" id="buttonDelete" title="Excluir Registro"></a></td>
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
			<td class="Main_ToolBar_Separator_cell" ><IMG src="<s:url value="/common/web/images/blank.gif" />" class="Main_ToolBar_Separator"></td>
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
		<td colspan="2">
		  <div id="divDadosSegurado">
		  <table width="100%" border="0" cellpadding="0" cellspacing="0">
		  <tr>
			<td>
			  <fieldset>
			  <legend accesskey="C"><b>Dados do <u>S</u>egurado</b></legend>
			  <table width="100%" border="0" cellpadding="2" cellspacing="0">
				<tr>
				  <td width="15%">
					<s:textfield theme="simple" id="seguradoId" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].id" cssStyle="display:none;" />
					<s:textfield theme="simple" id="seguradoAlterado" name="seguradoAlterado" cssStyle="display:none;" />
					<s:textfield theme="simple" id="seguradoLinhaVazia" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].linhaVazia" cssStyle="display:none;" />
					<s:textfield theme="simple" id="seguradoPropostaId" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].proposta.id" cssStyle="display:none;" />
					<label id="labelCover" for="seguradoCpf"><a href="#" class="LabelLink" onclick="editarCliente();" tabindex="-1" title="Alterar dados Cadastrais do Segurado.">CPF</a><br /></label>
		  		    <s:textfield theme="simple" id="seguradoClienteId" name="seguradoId" cssStyle="display:none;" />
					<s:textfield theme="simple" cssClass="requiredField" id="seguradoCpf" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].cpf" size="18" maxlength="14" onblur="checarCpfSegurado(this);" onchange="cpfSeguradoAlterado=true;setSeguradoAlterado(true);"/>
					
				  </td>
				  <td colspan="2">
					<label for="seguradoNome">Nome do Cliente</label><br />
					<s:textfield theme="simple" cssClass="requiredField" id="seguradoNome" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].nome" size="50" maxlength="60" onchange="setSeguradoAlterado(true);"/>
				  </td>
				  <td width="15%">
					<label for="dataNascimento">Dt. Nascimento</label><br />
					<s:textfield theme="simple" cssClass="requiredField clData" id="seguradoDataNascimento" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].dataNascimento" onblur="isValidDate(this)" size="12" maxlength="10" onchange="setSeguradoAlterado(true);"/>
				  </td>
				  <td width="15%">
					<label for="sexo">Sexo</label><br />
					<s:select theme="simple" id="seguradoSexo" headerKey="" headerValue="-- Selecione --" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].sexo" list="{'MASCULINO','FEMININO'}" onchange="setSeguradoAlterado(true);"/>
				  </td>
				  <td width="15%">
				<label for="pfEstadoCivil">Estado Civil</label><br />
				<s:select theme="simple" id="pfEstadoCivil" headerKey="" headerValue="-- Selecione --" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].estadoCivil" list="{'CASADO','DIVORCIADO','SOLTEIRO','UNIÃO ESTÁVEL','VIÚVO'}" onchange="setSeguradoAlterado(true);"/>
				  </td>
				</tr>
				<tr>
				  <td>
					<label for="rg">Identidade</label><br />
					<s:textfield theme="simple" id="seguradoRg" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].rg" size="15" maxlength="15" onchange="setSeguradoAlterado(true);"/>
				  </td>
				  <td width="20%">
					<label for="orgaoEmissor">Emissor</label><br />
					<s:textfield theme="simple" id="seguradoOrgaoEmissor" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].orgaoEmissor" size="15" maxlength="15" onchange="setSeguradoAlterado(true);"/>
				  </td>
				  <td width="15%">
					<label for="dataEmissao">Profissão</label><br />
					<s:textfield theme="simple" id="seguradoProfissao" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].profissao.descricao" size="30" maxlength="50" onchange="setSeguradoAlterado(true);"/>
				  </td>
				  <td>
					<label for="telefonePreferencial">Telef. Preferencial</label><br />
					<s:textfield theme="simple" cssClass="requiredField clFone" id="seguradoTelefonePreferencial" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].telefonePreferencial" size="16" maxlength="16" onchange="setSeguradoAlterado(true);"/>
				  </td>
				  <td>
					<label for="telefoneAlternativo">Telefone Alternativo</label><br />
					<s:textfield theme="simple" id="seguradoTelefoneAlternativo" cssClass="clFone" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].telefoneRecados" size="16" maxlength="16" onchange="setSeguradoAlterado(true);"/>
				  </td>
				  <td>
					<label for="telefoneCelular">Telefone Celular</label><br />
					<s:textfield theme="simple" id="seguradoTelefoneCelular" cssClass="clFone" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].telefoneCelular" size="16" maxlength="16" onchange="setSeguradoAlterado(true);"/>
				  </td>
				</tr>
				<tr>
				  <td colspan="2">
					<label for="email">E-mail</label><br />
					<s:textfield theme="simple" id="seguradoEmail" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].email" size="40" maxlength="80" onchange="setSeguradoAlterado(true);"/>
				  </td>
				  <td colspan="2">
					<label for="conjuge">Nome do Cônjuge</label><br />
					<s:textfield theme="simple" id="seguradoConjuge" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].conjuge" size="40" maxlength="60" onchange="setSeguradoAlterado(true);"/>
				  </td>
				  <td width="15%">
					<label for="dataNascimentoConjuge">Dt. Nascimento</label><br />
					<s:textfield theme="simple" cssClass="clData" id="seguradoDataNascimentoConj" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].dataNascimentoConj" onblur="isValidDate(this)" size="12" maxlength="10" onchange="setSeguradoAlterado(true);"/>
				  </td>
				  <td width="15%">
					<label for="sexoConjuge">Sexo</label><br />
					<s:select theme="simple" id="seguradoSexoConjuge" headerKey="" headerValue="-- Selecione --" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].sexoConjuge" list="{'MASCULINO','FEMININO'}" onchange="setSeguradoAlterado(true);"/>
				  </td>
				</tr>
				<tr>
				  <td>
					<label for="email">Prêmio Titular</label><br />
					<s:textfield theme="simple" id="premioTitular" cssClass="clValor2 currency" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].premioTitular" size="15" maxlength="15" onchange="setSeguradoAlterado(true);"/>
				  </td>
				  <td>
					<label for="conjuge">Prêmio Cônjuge</label><br />
					<s:textfield theme="simple" id="premioConjuge" cssClass="clValor2 currency" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].premioConjuge" size="15" maxlength="15" onchange="setSeguradoAlterado(true);"/>
				  </td>
				  <td>
					<label for="seguradoFormaPagamento">Forma de Pagamento</label><br />
					<s:select theme="simple" id="seguradoFormaPagamento" headerKey="" headerValue="-- Selecione --" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].formaPagamento" list="#{'0':'DEBITO EM CONTA','1':'DESCONTO EM FOLHA'}" onchange="setSeguradoAlterado(true);"/>
				  </td>
				</tr>
			  </table>
			  </fieldset>
			</td>
		  </tr>
		  <tr>
			<td>
			  <fieldset>
			  <legend accesskey="E"><b><u>E</u>ndereço Residencial</b></legend>
			  <table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
				  <td width="10%">
					<label id="labelCover" for="cepRes"><a href="#" class="LabelLink" onclick="openWin('${pageContext.request.contextPath}/endereco/buscaCep.action','BuscaCep','1024','600','resizable=yes,scrollbars=yes');" tabindex="-1" title="Acessar o site dos Correrios!">CEP</a><br /></label>
					<s:textfield theme="simple" id="seguradoCepRes" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].cep" size="11" maxlength="9" onchange="setSeguradoAlterado(true);"/>
					
				  </td>
				  <td width="30%">
					<label for="lograRes">Logradouro</label><br />
					<s:textfield theme="simple" cssClass="requiredField" id="seguradoLograRes" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].logradouro" cssStyle="width:98%" maxlength="60" onchange="setSeguradoAlterado(true);"/>
				  </td>
				  <td width="30%">
					<label for="compRes">Complemento</label><br />
					<s:textfield theme="simple" id="seguradoCompRes" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].complemento" cssStyle="width:98%" maxlength="60" onchange="setSeguradoAlterado(true);"/>
				  </td>
				  <td width="15%">
					<label for="numeroRes">Número</label><br />
					<s:textfield theme="simple" id="seguradoNumeroRes" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].numero" maxlength="6" size="8" onchange="setSeguradoAlterado(true);"/>
				  </td>
				  <td width="15%">&nbsp;
				  </td>
				</tr>
				<tr>
				  <td colspan="2">
					<label for="bairroRes">Bairro</label><br />
					<s:textfield theme="simple" cssClass="requiredField" id="seguradoBairroRes" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].bairro" cssStyle="width:98%" maxlength="50" onchange="setSeguradoAlterado(true);"/>
				  </td>
				  <td>
					<label for="cidadeRes">Cidade</label><br />
					<s:textfield theme="simple" cssClass="requiredField" id="seguradoCidadeRes" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].cidade" cssStyle="width:98%" maxlength="35" onchange="setSeguradoAlterado(true);"/>
				  </td>
				  <td>
					<label for="ufRes">UF</label><br />
					<s:select theme="simple" cssClass="requiredField" id="seguradoUfRes" headerKey="" headerValue="-- Selecione --" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].uf" list="ufList" listKey="uf" listValue="nome" onchange="setSeguradoAlterado(true);"/>
				  </td>
				  <td>
					<label for="faxRes">Fax</label><br />
					<s:textfield theme="simple" cssClass="clFone" id="seguradoFaxRes" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].fax" size="16" maxlength="20" onchange="setSeguradoAlterado(true);"/>
				  </td>
				</tr>
			  </table>
			  </fieldset>
			</td>
		  </tr>
		</table>
		</div>
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
		  <tr>
		<td>
		  <fieldset>
		  <legend accesskey="C"><b>Dados do <u>S</u>eguro</b></legend>
		  <table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
			  <td >
				<label for="SeguradoDataInclusao">Data da Inclusão</label><br />
				<s:textfield theme="simple" cssClass="requiredField clData" id="seguradoDataInclusao" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].dataInclusao" onblur="isValidDate(this)" size="12" maxlength="10" onchange="setSeguradoAlterado(true);"/>
			  </td>
			  <td >
				<label for="seguradoInicioVigencia">Início Vigência</label><br />
				<s:textfield theme="simple" cssClass="requiredField clData" id="seguradoInicioVigencia" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].inicioVigencia" onblur="isValidDate(this)" size="12" maxlength="10" onchange="setSeguradoAlterado(true);"/>
			  </td>
			  <td >
				<label for="seguradoSituacao">Situação</label><br />
				<s:select theme="simple" id="seguradoSituacao" headerKey="" headerValue="-- Selecione --" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].situacao" list="{'ATIVO','INATIVO'}" onchange="setSeguradoAlterado(true);"/>
			  </td>
			  <td >
				<label for="seguradoDataInativacao">Data Inativação</label><br />
				<s:textfield theme="simple" cssClass="clData" id="seguradoInicioVigencia" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].dataInativacao" onblur="isValidDate(this)" size="12" maxlength="10"/>
			  </td>
			  <td >
				<label for="seguradoRendaMensal">Renda Mensal</label><br />
				<s:textfield theme="simple" id="seguradoRendaMensal" cssClass="clValor2 currency" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].rendaMensal" size="15" maxlength="10" onchange="setSeguradoAlterado(true);"/>
			  </td>
			  <td >
				<label for="seguradoCertificado">Certificado</label><br />
				<s:textfield theme="simple" id="seguradoCertificado" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].certificado" size="15" maxlength="35" onchange="setSeguradoAlterado(true);"/>
			  </td>
			</tr>
		  </table>
		  </fieldset>
		</td>
	  </tr>
		<tr>
		<td>
		  <fieldset>
		  <legend accesskey="C"><b>Dados dos <u>B</u>eneficiários</b></legend>
		  <div id="divDadosBeneficiario">
		  <table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
			  <td colspan="2">
				<label for="beneficiarioNome">Beneficiários</label><br />
				<s:textfield theme="simple" id="beneficiarioEmpresarialId" name="beneficiarioEmpresarial.id" cssStyle="display:none"/>
				<s:textfield theme="simple" cssClass="requiredField clTextoRestrito" id="beneficiarioNome" name="beneficiarioEmpresarial.nome" size="50" maxlength="60" />
			  </td>
			  <td width="15%">
				<label for="beneficiarioDataNasc">Dt. Nascimento</label><br />
				<s:textfield theme="simple" cssClass="requiredField clData" id="beneficiarioDataNasc" name="beneficiarioEmpresarial.dataNascimento" onblur="isValidDate(this)" size="12" maxlength="10"/>
			  </td>
			  <td width="15%">
				<label for="beneficiarioSexo">Sexo</label><br />
				<s:select theme="simple" id="beneficiarioSexo" headerKey="" headerValue="-- Selecione --" name="beneficiarioEmpresarial.sexo" list="{'MASCULINO','FEMININO'}"/>
			  </td>
			  <td width="15%">
				<label for="beneficiarioParentesco">Parentesco</label><br />
				<s:select theme="simple" id="beneficiarioParentesco" headerKey="" headerValue="-- Selecione --" name="beneficiarioEmpresarial.parentesco" list="{'CÔNJUGE','FILHO','ENTEADO','MÃE','PAI','IRMÃO'}"/>
			  </td>
			  <td width="15%">
				<label for="beneficiarioPercentual">Percentual</label><br />
				<s:textfield theme="simple" id="beneficiarioPercentual" cssClass="clValor2 currency" name="beneficiarioEmpresarial.percentual" size="15" maxlength="10"/>
			  </td>
			</tr>
		  </table>
		  </div>
		  <br/>
		  <hr/>
		  <table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
			  <td style="width:105px;">
			  <table border="0" cellpadding="0" cellspacing="0"><tr><td><label id="labelCover">
			    <a href="#" class="button" onclick="apagarDadosBeneficiario();" tabindex="-1">
				<table onmouseout="this.className='wButton'; return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton">
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">Apagar Dados</td>
					<td class="wButton_right"/>
				  </tr>
				</table>
			    </a></label></td></tr>
				</table>
			  </td>
			  <td>
				<table border="0" cellpadding="0" cellspacing="0"><tr><td><label id="labelCover">
			    <a href="#" class="button" onclick="inserirBeneficiario()" >
				<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">Adicionar</td>
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
		<td>
		  <div id="divListaBeneficiarios" style="border: 1px;overflow:auto;">
			<table id="tableBeneficiarios" class="listItens">
			  <tr class="listItensHeader">
				<td width="8%" nowrap="nowrap">Ações</td>
				<td width="47%" nowrap="nowrap">Nome</td>
				<td width="10%" nowrap="nowrap">Dt Nasc.</td>
				<td width="10%" nowrap="nowrap">Sexo</td>
				<td width="10%" nowrap="nowrap">Parentesco</td>
				<td width="15%" nowrap="nowrap">Percentual</td>
			  </tr>
			  <s:iterator value="beneficiarioList" status="stat">
				<tr>
				  <td nowrap="nowrap" class="small_image">
					<s:textfield theme="simple" id="beneficiarioSeguradoId%{#stat.index}" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].beneficiarioEmpresarialCollection[%{#stat.index}].seguradoEmpresarial.id" value="%{seguradoEmpresarial.id}" cssStyle="display:none"/>
					<s:textfield theme="simple" id="beneficiarioEmpresarialId%{#stat.index}" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].beneficiarioEmpresarialCollection[%{#stat.index}].id" value="%{id}" cssStyle="display:none"/>
					<s:textfield theme="simple" id="beneficiarioNome%{#stat.index}" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].beneficiarioEmpresarialCollection[%{#stat.index}].nome" value="%{nome}" cssStyle="display:none"/>
					<s:textfield theme="simple" id="beneficiarioDataNasc%{#stat.index}" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].beneficiarioEmpresarialCollection[%{#stat.index}].dataNascimento" value="%{dataNascimento}" cssStyle="display:none"/>
					<s:textfield theme="simple" id="beneficiarioSexo%{#stat.index}" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].beneficiarioEmpresarialCollection[%{#stat.index}].sexo" value="%{sexo}" cssStyle="display:none"/>
					<s:textfield theme="simple" id="beneficiarioParentesco%{#stat.index}" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].beneficiarioEmpresarialCollection[%{#stat.index}].parentesco" value="%{parentesco}" cssStyle="display:none"/>
					<s:textfield theme="simple" id="beneficiarioPercentual%{#stat.index}" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].beneficiarioEmpresarialCollection[%{#stat.index}].percentual" value="%{percentual}" cssStyle="display:none"/>
					<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/delete.gif" includeParams="none"/>" onclick="if(confirma('Confirma exclusão?')){removeBeneficiario('<s:property value="id"/>');}"/>
					<img alt="" style="cursor:pointer;" src="<s:url value="/common/web/images/edit.gif" includeParams="none"/>" onclick="if(confirma('Confirma edição?')){editarBeneficiario('<s:property value="id"/>');}"/>
				  </td>
				  <td nowrap="nowrap"><s:property value="nome"/>&nbsp;</td>
				  <td nowrap="nowrap"><s:property value="dataNascimento"/>&nbsp;</td>
				  <td nowrap="nowrap"><s:property value="sexo"/>&nbsp;</td>
				  <td nowrap="nowrap"><s:property value="parentesco"/>&nbsp;</td>
				  <td nowrap="nowrap"><fmt:formatNumber value="${percentual}" type="currency" currencySymbol=""/>&nbsp;</td>
				</tr>
			  </s:iterator>
			</table>
		  </div>
		</td>
	  </tr>
	  </table>
		  <table width="100%" border="0" cellpadding="0" cellspacing="0">
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
					<td width="15%">Prêmio Líquido por Cobertura</td>
				  </tr>
				  <s:iterator value="seguradoCoberturasList" status="stat">
				  <s:if test="coberturas.id != null">
				  <s:if test="%{coberturas.ramo.id == ramoVidaEmpresarial}">
					<tr>
					  <td nowrap="nowrap">
						<s:textfield theme="simple" id="seguradoCoberturasId%{#stat.index}" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].seguradoCoberturasCollection[%{#stat.index}].id" value="%{id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaId%{#stat.index}" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].seguradoCoberturasCollection[%{#stat.index}].coberturas.id" value="%{coberturas.id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaSeguradoId%{#stat.index}" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].seguradoCoberturasCollection[%{#stat.index}].seguradoEmpresarial.id" value="%{seguradoEmpresarial.id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaSequencia%{#stat.index}" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].seguradoCoberturasCollection[%{#stat.index}].sequencia" value="%{sequencia}" cssStyle="display:none"/>
					    <s:property value="coberturas.descricao"/>:
					  </td>
					  <td><s:textfield theme="simple" id="coberturaLmi%{#stat.index}" cssClass="clValor2 currency" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].seguradoCoberturasCollection[%{#stat.index}].lmi" value="%{lmi}" onkeyup="enableDisableDadosCobertura('%{#stat.index}');" onchange="setSeguradoAlterado(true);" cssStyle="width:80%" /></td>
					  <td><s:textfield theme="simple" id="coberturaPremio%{#stat.index}" cssClass="clValor2 currency" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].seguradoCoberturasCollection[%{#stat.index}].premio" value="%{premio}" cssStyle="width:80%" onchange="setSeguradoAlterado(true);"/></td>
					</tr>
				  </s:if>
				  </s:if>
				  <s:else>
					<tr>
					  <td nowrap="nowrap">
						<s:textfield theme="simple" id="seguradoCoberturasId%{#stat.index}" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].seguradoCoberturasCollection[%{#stat.index}].id" value="%{id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaSeguradoId%{#stat.index}" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].seguradoCoberturasCollection[%{#stat.index}].seguradoEmpresarial.id" value="%{seguradoEmpresarial.id}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaSequencia%{#stat.index}" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].seguradoCoberturasCollection[%{#stat.index}].sequencia" value="%{sequencia}" cssStyle="display:none"/>
						<s:textfield theme="simple" id="coberturaDescricao%{#stat.index}" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].seguradoCoberturasCollection[%{#stat.index}].descricao" value="%{descricao}" size="30" onchange="setSeguradoAlterado(true);" />
					  </td>
					  <td><s:textfield theme="simple" id="coberturaLmi%{#stat.index}" cssClass="clValor2 currency" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].seguradoCoberturasCollection[%{#stat.index}].lmi" value="%{lmi}" onkeyup="enableDisableDadosCobertura('%{#stat.index}');"  onchange="setSeguradoAlterado(true);" cssStyle="width:80%" /></td>
					  <td><s:textfield theme="simple" id="coberturaPremio%{#stat.index}" cssClass="clValor2 currency" name="proposta.seguradoEmpresarialCollection[%{itemCorrente}].seguradoCoberturasCollection[%{#stat.index}].premio" value="%{premio}" cssStyle="width:80%" onchange="setSeguradoAlterado(true);"/></td>
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