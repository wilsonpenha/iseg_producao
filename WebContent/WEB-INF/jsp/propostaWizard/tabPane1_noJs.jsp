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
  
    <table>
	    <tr>
		  <td colspan="4">
		    <div class="divMessages" id="divMessagesTab2" style="padding-bottom: 10px;">
		  	  <s:actionerror/>
			  <s:actionmessage/>
			  <s:fielderror/>
		    </div>
		  </td>
	    </tr>
	</table>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	  <tr>
		<td>
		  <fieldset>
		  <legend accesskey="C"><b>Dados do <u>C</u>ondutor</b></legend>
		  <div id="divDadosCondutor">
		  <table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
			  <td>
				<label for="condutorCPF">CPF</label><br />
				<s:textfield theme="simple" cssClass="clCPF" id="condutorCPF" tabindex="11" name="condutor.cpf" size="14" maxlength="14" onblur="validaCPF(this);" />
			  </td>
			  <td colspan="2">
				<label for="condutorNome">Condutor</label><br />
				<s:textfield theme="simple" id="condutorId" name="condutor.id" cssStyle="display:none"/>
				<s:textfield theme="simple" id="produtorId" name="condutor.proposta.id" cssStyle="display:none"/>
				<s:textfield theme="simple" tabindex="1" id="condutorNome" name="condutor.nome" size="50" maxlength="60" />
			  </td>
			  <td width="15%">
				<label for="condutorEstadoCivil">Estado Civil</label><br />
				<s:select theme="simple" id="condutorEstadoCivil" headerKey="" headerValue="-- Selecione --" tabindex="2" name="condutor.estadoCivil" list="{'CASADO','DIVORCIADO','SOLTEIRO','UNIÃO ESTÁVEL','VIÚVO'}"/>
			  </td>
			  <td width="15%">
				<label for="condutorDataNascimento">Dt. Nascimento</label><br />
				<s:textfield theme="simple" cssClass="clData" id="condutorDataNascimento" tabindex="3" name="condutor.dataNascimento" onblur="isValidDate(this)" size="10" maxlength="10"/>
			  </td>
			  <td width="15%">
				<label for="condutorSexo">Sexo</label><br />
				<s:select theme="simple" id="condutorSexo" headerKey="" headerValue="-- Selecione --" tabindex="4" name="condutor.sexo" list="{'MASCULINO','FEMININO'}"/>
			  </td>
			</tr>
			<tr>
			  <td width="20%">
				<label for="condutorTipoCondutor">Condutor Principal</label><br />
				<s:select theme="simple" id="condutorTipoCondutor" headerKey="" headerValue="-- Selecione --" tabindex="6" name="condutor.tipoCondutor" list="{'NAO','SIM'}"/>
			  </td>
			  <td width="20%">
				<label for="condutorProfissao">Profissão</label><br />
				<s:textfield theme="simple" id="condutorProfissao" cssClass="clTextoRestrito" tabindex="7" name="condutor.profissao.descricao" size="25" maxlength="30"/>
			  </td>
			  <td>
				<label for="condutorCNH">CNH</label><br />
				<s:textfield theme="simple" id="condutorCNH" tabindex="8" name="condutor.cnh" size="15" maxlength="15"/>
			  </td>
			  <td>
				<label for="condutorData1aHabilitacao">Dt 1a. Habilitação</label><br />
				<s:textfield theme="simple" cssClass="clData" id="condutorData1aHabilitacao" tabindex="9" name="condutor.data1aHabilitacao" onblur="isValidDate(this)" size="10" maxlength="10"/>
			  </td>
			  <td>
				<label for="condutorDataVencHabilitacao">Dt Venc. Habilitação</label><br />
				<s:textfield theme="simple" cssClass="clData" id="condutorDataVencHabilitacao" tabindex="10" name="condutor.dataVencHabilitacao" onblur="isValidDate(this)" size="10" maxlength="10"/>
			  </td>
			  <td width="15%">
				<label for="condutorTelefones">Telefone</label><br />
				<s:textfield theme="simple" id="condutorTelefones" cssClass="clFone" tabindex="5" name="condutor.telefones" size="16" maxlength="30"/>
			  </td>
			</tr>
		  </table>
		  </div>
		  <br/>
		  <hr/>
		  <table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
			<s:if test="tipoCliente == 0">
			  <td style="width: 160px;">
			    <table border="0" cellpadding="0" cellspacing="0"><tr><td id="labelCover"><label>
				    <a href="#" class="button" onclick="importarDadosCliente();" tabindex="12">
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
			  </s:if>
			  <td style="width:105px;">
			    <table border="0" cellpadding="0" cellspacing="0"><tr><td id="labelCover"><label>
				    <a href="#" class="button" onclick="apagarDadosCondutor();" tabindex="13">
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
			    <table border="0" cellpadding="0" cellspacing="0"><tr><td id="labelCover"><label>
				    <a href="#" class="button" onclick="if(validaCondutorPrincipal()){inserirCondutor();}" tabindex="14" >
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
		  <div id="divListaCondutores" style="border: 1px;overflow:auto;">
			<table id="tableCondutorItens" class="listItens">
			  <tr class="listItensHeader">
				<td colspan="2" width="8%" nowrap="nowrap">Ações</td>
				<td width="20%" nowrap="nowrap">Nome</td>
				<td width="8%" nowrap="nowrap">Principal?</td>
				<td width="8%" nowrap="nowrap">Dt Nasc.</td>
				<td width="8%" nowrap="nowrap">Sexo</td>
				<td width="8%" nowrap="nowrap">Telefone</td>
				<td width="8%" nowrap="nowrap">Est. Civil</td>
				<td width="8%" nowrap="nowrap">CNH</td>
				<td width="8%" nowrap="nowrap">Dt. 1a Habil.</td>
				<td width="8%" nowrap="nowrap">CPF</td> 
			  </tr>
			  <s:iterator value="condutores" status="stat">
				<tr>
				  <td nowrap="nowrap" class="small_image" align="center" id="labelCover">
				    <a href="#" onclick="if(confirma('Confirma exclusão?')){removeCondutor('<s:property value="id"/>');}" class="Main_ToolBar_Button " onMouseOver="window.status='Excluir Registro';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonDelete">
 				       <img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Delete" id="buttonDelete" title="Excluir Condutor">
				    </a>
				  </td>
				  <td nowrap="nowrap" class="small_image" align="center" id="labelCover">
				    <a href="#" onclick="if(confirma('Confirma edição?')){editarCondutor('<s:property value="id"/>');}" class="Main_ToolBar_Button " onMouseOver="window.status='Editar Registro';return true;" onMouseOut="window.status='';return true;" onblur="this.hideFocus=false" id="linkButtonEditar">
 				       <img src="<s:url value="/common/web/images/blank.gif" />" width="1" height="1" border="0" class="Main_ToolBar_Button_Icon Main_ToolBar_Button_Icon_Edit" id="buttonEditar" title="Editar Condutor">
				    </a>
				  </td>
				  <td nowrap="nowrap"><s:property value="nome"/>&nbsp;</td>
				  <td nowrap="nowrap"><s:property value="%{isCondutorPrincipal != null? isCondutorPrincipal == true?'SIM':'NÃO' : tipoCondutor}" />&nbsp;<input type="hidden" name="ePrincipal[]" value="<s:property value="%{isCondutorPrincipal != null ? isCondutorPrincipal == true?'SIM':'NÃO' : tipoCondutor}" />"/>&nbsp;</td>
				  <td nowrap="nowrap"><s:property value="dataNascimento"/>&nbsp;</td>
				  <td nowrap="nowrap"><s:property value="sexo"/>&nbsp;</td>
				  <td nowrap="nowrap"><s:property value="telefones"/>&nbsp;</td>
				  <td nowrap="nowrap"><s:property value="estadoCivil"/>&nbsp;</td>
				  <td nowrap="nowrap"><s:property value="cnh"/>&nbsp;</td>
				  <td nowrap="nowrap"><s:property value="data1aHabilitacao"/>&nbsp;</td>
				  <td nowrap="nowrap"><s:property value="cpf"/>&nbsp;</td>
				</tr>
			  </s:iterator>
			</table>
		  </div>
		</td>
	  </tr>
	  <tr>
		<td>
		  <div id="divPerfilSegurado" style="border: 1px;overflow:auto;">
		  <fieldset>
		  <legend accesskey="P"><b><u>P</u>erfil do Segurado</b></legend>
		  <table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
			  <td width="20%" colspan="4">
				<label for="pjGrupoDeVendaId">Selecione o Perfil : </label>
				<s:textfield theme="simple" id="perfilAlterado" name="perfilAlterado" cssStyle="display:none;" />
				<s:select theme="simple" id="propostaPerfilId" headerKey="" headerValue="-- Selecione --" name="proposta.perfil.id" list="perfilList" listKey="id" listValue="nome" onchange="setAlterado(true);propostaPerfilAlterada=true"/>
				<br/>
			  </td>
			</tr>
		  </table>
  		  <br/>
		  <hr/>
		  <table id="tablePerfil" width="100%" border="0" cellpadding="0" cellspacing="1">
			<s:iterator value="proposta.respostaPerfilCollection" status="stat">
			  <s:textfield theme="simple" id="respostaPerfilId" name="proposta.respostaPerfilCollection[%{#stat.index}].id" cssStyle="display:none"/>
			  <s:textfield theme="simple" id="perfilId" name="proposta.respostaPerfilCollection[%{#stat.index}].perguntasPerfil.id" cssStyle="display:none"/>
			  <s:textfield theme="simple" id="ordem" name="proposta.respostaPerfilCollection[%{#stat.index}].ordem" cssStyle="display:none"/>
			  <s:if test="#stat.odd == true"> 
				<tr>
				  <td><s:label for="resposta%{#stat.index}" value="%{perguntasPerfil.pergunta}" theme="simple" /></td>
				  <s:if test="%{perguntasPerfil.tipoResposta == 0}">
					<td><s:select theme="simple" id="resposta%{#stat.index}" headerKey="" headerValue="-- Selecione --" name="proposta.respostaPerfilCollection[%{#stat.index}].resposta" list="{'SIM','NAO'}" cssStyle="width:120px;" onchange="setAlterado(true);"/></td>
				  </s:if>
				  <s:else>
					<td><s:textfield theme="simple" id="resposta%{#stat.index}" name="proposta.respostaPerfilCollection[%{#stat.index}].resposta" onchange="setAlterado(true);" cssStyle="height:14px;width:118px;" /></td>
				  </s:else>
				</s:if>
				<s:else>
				  <td><s:label for="resposta%{#stat.index}" value="%{perguntasPerfil.pergunta}" theme="simple" /></td>
				  <s:if test="%{perguntasPerfil.tipoResposta == 0}">
					<td><s:select theme="simple" id="resposta%{#stat.index}" headerKey="" headerValue="-- Selecione --" name="proposta.respostaPerfilCollection[%{#stat.index}].resposta" list="{'SIM','NAO'}" cssStyle="width:120px;" onchange="setAlterado(true);"/></td>
				  </s:if>
				  <s:else>
					<td><s:textfield theme="simple" cssClass=" clTextoRestrito" id="resposta%{#stat.index}" name="proposta.respostaPerfilCollection[%{#stat.index}].resposta" size="16" onchange="setAlterado(true);" cssStyle="height:14px;width:118px;" /></td>
				 </tr>
				  </s:else>
			  </s:else>
			</s:iterator>
			<tr><td><input id="lastfield2" name="lastfield2" onkeyup="nextTab(event);" class="invisible" /></td></tr>
		  </table>
		  </fieldset>
		  </div>
		</td>
	  </tr>
	</table>
  	
<% } catch (Exception e) {e.printStackTrace();}%>