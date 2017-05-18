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
	<s:hidden name="orcamentoSeguro.perfilOrcamentoCollection[0].orcamentoSeguro.id"/>
    <table>
	    <tr>
		  <td colspan="4">
		    <div class="divMessages" id="divMessagesTab1" style="padding-bottom: 10px;">
		  	  <s:actionerror/>
			  <s:actionmessage/>
			  <s:fielderror/>
		    </div>
		  </td>
	    </tr>
	</table>
	<fieldset>
	  <table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
		  <td width="15%">
			<label for="dataOrcamento">Data</label><br/>
			<s:textfield theme="simple" cssClass="readonly" id="dataOrcamento" disabled="true" value="%{orcamentoSeguro.dataOrcamento}" onblur="isValidDate(this)" size="13" onchange="setAlterado(true);" />
		  </td>
		  <td width="20%">
		    <label for="situacaoOperacionalId">Situação</label><br/>
		    <s:select theme="simple" cssClass="Combo readonly" id="statusOrcamentoId" disabled="true" emptyOption="false" listKey="id" listValue="descricao" value="%{orcamentoSeguro.situacao.id}" list="statusOrcamentoList" name="statusOrcamento[]"/>
		  </td>
		  <td width="20%">
			<label for="ramoNome">Ramo</label><br />
			<s:textfield theme="simple" size="30" id="ramoNome" value="%{orcamentoSeguro.ramo.nome}" cssClass="readonly" disabled="true" readonly="true" tabindex="-1" />	
		  </td>
		  <td width="15%">
		  	<label for="ramoNome">Versão da Cotação</label><br />
			<s:textfield theme="simple" size="15" id="ramoNome" value="%{orcamentoSeguro.numero}" cssClass="readonly" readonly="true" />
		  </td>
		</tr>
	  </table>
  </fieldset>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	  <tr>
		<td>
		  <fieldset>
			  <legend accesskey="C"><b>Localização</b></legend>
			  <table width="100%" border="0" cellpadding="0" cellspacing="3">
			  	<tr>
			  	  <td>
			  	  	<label for="tpResidenciaId">Tipo Residencia</label><br />
					<s:select theme="simple" cssClass="" id="tpResidenciaId" headerKey="" headerValue="-- Selecione --" list="tipoResidencia" listKey="id" listValue="valor" name="orcamentoSeguro.perfilOrcamentoCollection[0].tipoResidencia.id"  style="width: 164px" />
			  	  </td>
			  	  <td>
			  	  	<label for="cep">CEP da Residencia</label><br />
					<s:textfield id="cepResidencia" theme="simple" cssClass="clCep" size="18" maxlength="15" name="orcamentoSeguro.perfilOrcamentoCollection[0].cepResidencia"/>
			  	  </td>
		  		  <td>
		  			<label for="cepPernoite">Cep de Pernoite:</label><br />
		  			<s:textfield theme="simple" cssClass="clCep" id="cepPernoite" size="18" maxlength="15" name="orcamentoSeguro.perfilOrcamentoCollection[0].cepPernoite"/>
		  		  </td>
		  		  <td>
		  			<label for="cepTrabalho">Cep do Trabalho:</label><br />
		  			<s:textfield theme="simple" cssClass="clCep" id="cepTrabalho" size="18" maxlength="15" name="orcamentoSeguro.perfilOrcamentoCollection[0].cepTrabalho"/>
		  		  </td>
			  	</tr>
			  	<tr>
			  		 <td>
				  	  	<label for="qtdCarro">Quantos veículos existem na residência?</label><br />
						<s:textfield theme="simple" id="qtdCarro" size="5" maxlength="2" name="orcamentoSeguro.perfilOrcamentoCollection[0].qtdOutrosVeiculos"/>
			  	  	</td>
			  	  	<td>
  						<label>Garagem</label><br />
  						<s:select theme="simple" cssClass="" id="tpGaragem" headerKey="" headerValue="-- Selecione --" name="orcamentoSeguro.perfilOrcamentoCollection[0].tipoGaragem.id" list="tipoGaragem" listKey="id" listValue="valor" style="width: 164px" />
	  				</td>
			  	</tr>
			  </table>
		  </fieldset>
		</td>
	  </tr>
	  <tr>
		<td>
		  <fieldset>
			  <legend accesskey="C"><b>Como usa o carro?</b></legend>
			  <table width="100%" border="0" cellpadding="0" cellspacing="3">
			  	<tr>
			  	  <td>
			  	  	<label for="utlCarro">Você utiliza o veículo para:</label><br />
					<s:select list="utilizacaoVeiculo" listKey="id" listValue="valor" name="orcamentoSeguro.perfilOrcamentoCollection[0].utilizacaoVeiculo.id"/>
			  	  </td>
			  	  <td>
			  	  	<label for="km">Qual a quilometragem média rodada pelo veículo mensalmente?</label><br />
					<s:textfield theme="simple" id="km" size="10" maxlength="15" name="orcamentoSeguro.perfilOrcamentoCollection[0].quilometragem"/><label>Km</label>
			  	  </td>
			  	</tr>
			  </table>
		  </fieldset>
		</td>
	  </tr>
	  <tr>
		<td>
		  <fieldset>
			  <legend accesskey="C"><b>Questionário</b></legend>
			  <table width="100%" border="0" cellpadding="0" cellspacing="0">
				  <s:iterator value="respostaPerfilList" var="respostaPerfil" status="i">
				  	<tr>
				  		<td>
				  			<s:textfield style="display:none;" name="orcamentoSeguro.respostaPerfilCollection[%{#i.index}].orcamentoSeguro.id" value="%{orcamentoSeguro.id}"/>
				  			<s:textfield style="display:none;" name="orcamentoSeguro.respostaPerfilCollection[%{#i.index}].id"/>
				  			<s:textfield style="display:none;" name="orcamentoSeguro.respostaPerfilCollection[%{#i.index}].perguntasPerfil.id" value="%{perguntasPerfil.id}"/>
				  		</td>
				  	</tr>
				  	<tr>
				  	  <td width="39%">
				  	  	<label for="pergunta%{#i.index}"><s:property value="perguntasPerfil.pergunta"/></label>
				  	  </td>
				  	  <s:if test="perguntasPerfil.tipoResposta == 0">
				  	  	<td width="19%">
							<s:select theme="simple" cssClass="" id="pergunta%{#i.index}" headerKey="" headerValue="-- Selecione --" list="{'NAO','SIM'}" style="width: 164px" name="orcamentoSeguro.respostaPerfilCollection[%{#i.index}].resposta" value="%{resposta}" />
				  	  	</td>
				  	  </s:if>
				  	  <s:if test="perguntasPerfil.tipoResposta == 2">
				  	  	<td width="19%">
							<s:textfield theme="simple" cssClass="clData " id="pergunta%{#i.index}" name="orcamentoSeguro.respostaPerfilCollection[%{#i.index}].resposta" value="%{resposta}" onblur="isValidDate(this)" size="16" maxlength="10"/>
				  	  	</td>
				  	  </s:if>
				  	</tr>
				  </s:iterator>
			  </table>
		  </fieldset>
		</td>
	  </tr>
	  <tr>
	  	<td>
	  		<fieldset>
			  <legend accesskey="P"><b>Bancos</b></legend>
			  <table width="100%" border="0" cellpadding="0" cellspacing="0">
			  		<tr>
			  			<td>
			  				<label>Banco</label><br/>
			  			</td>
			  			<td>
			  				<label>Tipo de Conta</label><br/>
			  			</td>
			  			<td>
			  				<label>Agência</label><br/>
			  			</td>
			  			<td>
			  				<label>Conta</label><br/>
			  			</td>
			  		</tr>
			  	<s:iterator value="bancoRelacionamentoList" status="i">
					<tr id="linhaBanco<s:property value="%{#i.index}"/>">
					  <td>
						<s:checkbox id="checkIdBanco%{#i.index}" name="bancosRelacionamentoIds" fieldValue="%{id}" value="%{selecionado}" onclick="habilitaDesabilitaCamposBanco(this);"/>
						<label><s:property value="%{nome}"/></label>	
					  </td>
					  <td>
						<s:select theme="simple" cssClass="readonly" disabled="true" headerKey="" headerValue="-- Selecione --" listKey="id" listValue="descricao" name="orcamentoSeguro.orcamentoBancosCollection[%{#i.index}].tipoContaRelacionamento.id" value="%{orcamentoSeguro.orcamentoBancosCollection[#i.index].tipoContaRelacionamento.id}"  list="tipoContaRelacionamentoCollection"/>
					  </td>
					  <td>
						<s:textfield theme="simple" cssClass="readonly alfanumerico" disabled="true" name="orcamentoSeguro.orcamentoBancosCollection[%{#i.index}].agencia" maxlength="10"/>	
					  </td>
					  <td>
						<s:textfield theme="simple" cssClass="readonly alfanumerico" disabled="true" name="orcamentoSeguro.orcamentoBancosCollection[%{#i.index}].conta" maxlength="20"/> - <s:textfield theme="simple" cssClass="readonly" disabled="true" maxlength="2" size="2" name="orcamentoSeguro.orcamentoBancosCollection[%{#i.index}].digito"/>	
					  </td>
					</tr>
				</s:iterator>
			  </table>
			</fieldset>
	  	</td>
	  </tr>
	  <tr>
	  	<td>
			<div id="divCondutor" style="display:none; z-index: 1000;height: 272px; width:671px;">
			  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="Main_ContentPane_TabPane" id="tdtopTabs">
				<tr id="paramParentTabContainer" style="padding: 3px">
				  <td class="tabBackGroundInit" style="background-color: #505050"></td>
				</tr>
				<tr id="paramMainTabContainer" style="padding: 3px">
				  <td class="tabBackGroundInit" style="background-color: #505050">
					<span style="color:#FFFFFF; font-size:8pt; font-weight:bold; height:26px !important; padding:0 4px; text-align:center; white-space:nowrap;">
					  Dados Condutor
					</span>
				  </td>
				</tr>
			  </table>
			  <fieldset>
			  <legend accesskey="P"><b>Dados do Condutor</b></legend>
			  <div id="divDadosCondutor">
			  <table width="100%" border="0" cellpadding="0" cellspacing="0" id="contudor_principal">
				<tr>
				  <td>
				  	<s:textfield theme="simple" cssClass="requiredField" name="condutor.orcamentoSeguro.id" value="%{orcamentoSeguro.id}" style="display:none;"/>
				  	<s:textfield theme="simple" cssClass="requiredField" id="clienteCondutorId" style="display:none;"/>
					<label for="clienteCpf2">CPF</label><br />
					<s:textfield theme="simple" cssClass="requiredField" title="autocomplete" id="condutorCpf" name="condutor.cpf" size="18" maxlength="14" onblur="checarCpfCondutor(this);" onchange="setAlterado(true);"/>
			  	  </td>
				  <td colspan="2" width="50%">
					<label for="clientePFNome2">Nome</label><br />
					<s:textfield theme="simple" cssClass="requiredField clTextoRestrito" id="condutorNome" name="condutor.nome" size="50" maxlength="60" onchange="setAlterado(true);" onblur="carregaCondutor();"/>
				  </td>
				  <td width="25%">
					<label for="condutorSexo">Sexo</label><br />
					<s:select theme="simple" id="condutorSexo" cssClass="requiredField" headerKey="" headerValue="-- Selecione --" name="condutor.sexo" list="{'MASCULINO','FEMININO'}"/>
				  </td>
				  
				</tr>
				<tr>
				  <td>
					<label for="condutorDataNascimento">Dt. Nascimento</label><br />
					<s:textfield theme="simple" cssClass="clData " id="condutorDataNascimento" name="condutor.dataNascimento" onblur="isValidDate(this)" size="18" maxlength="10"/>
				  </td>
				  <td>
					<label for="condutorEstadoCivil">Estado Civil</label><br />
					<s:select theme="simple" id="condutorEstadoCivil" headerKey="" headerValue="-- Selecione --" name="condutor.estadoCivil" list="{'CASADO','DIVORCIADO','SOLTEIRO','UNIÃO ESTÁVEL','VIÚVO'}"/>
				  </td>
				  <td>
					<label for="condutorCNH">CNH</label><br />
					<s:textfield theme="simple" cssClass="" id="condutorCNH" name="condutor.cnh" size="18" maxlength="15"/>
				  </td>
				  <td>
					<label for="condutorData1aHabilitacao">Dt 1a. Habilitação</label><br />
					<s:textfield theme="simple" cssClass="clData " id="condutorData1aHabilitacao" name="condutor.data1aHabilitacao" onblur="isValidDate(this)" size="16" maxlength="10"/>
				  </td>
				</tr>
				<tr>
				  <td>
					<label for="condutorTelefones">Telefone Celular</label><br />
					<s:textfield theme="simple" id="condutorTelefones" cssClass="clFone" name="condutor.telefones" size="18" maxlength="30"/>
				  </td>
				  <td>
					<label for="telefonePreferencial">Telef. Preferencial</label><br />
					<s:textfield theme="simple" cssClass=" clFone" id="telefonePreferencial" name="orcamentoSeguro.telefonePreferencial" size="18" maxlength="16" onchange="setAlterado(true);"/>
				  </td>
				  <td>
					<label for="telefoneAlternativo">Telefone Alternativo</label><br />
					<s:textfield theme="simple" id="telefoneAlternativo" cssClass="clFone" name="orcamentoSeguro.telefoneAlternativo" size="16" maxlength="16" onchange="setAlterado(true);"/>
				  </td>
				  <td>
				  	<label for="relacaoCondutor">Relação Segurado</label><br />
				  	<s:select id="relacaoCondutorSegurado" list="relacaoSeguradoProprietario" listKey="id" listValue="valor" name="condutor.relacaoCondutorSegurado.id" headerValue="-- Selecione --" headerKey="" />
				  </td>
				 </tr>
				 <tr>
				 	<td colspan="2">
				 		<label>Escolaridade</label><br />
				 		<s:textfield theme="simple" name="condutor.escolaridade.id" style="display:none;" id="escolaridadeCondutorId"/>
				 		<s:textfield theme="simple" name="condutor.escolaridade.descricao" id="escolaridadeCondutor" size="41"/>
				 	</td>
				 	<td colspan="2">
						<label for="condutorProfissao">Profissão</label><br />
						<s:textfield id="condutorProfissaoId" name="condutor.profissao.id" style="display:none"/>
						<s:textfield theme="simple" id="condutorProfissao" cssClass="clTextoRestrito" name="condutor.profissao.descricao" size="42" maxlength="30"/>
				    </td>
				 </tr>
				 <tr>
				 	<td colspan="2">
				 		<label for="emailCondutor">E-mail</label><br />
				 		<s:textfield size="41" theme="simple" id="condutorEmail" name="condutor.email"/>
				 	</td>
				 	<td colspan="2">
				 		<label>Principal Condutor?</label><br/>
				 		<s:select theme="simple" cssClass="" headerKey="" id="isCondutorPrincipal"  list="#{false:'NÃO',true:'SIM'}" name="condutor.isCondutorPrincipal" style="width: 60px" onchange="setAlterado(true);"/>
				 	</td>
				 </tr>
			  </table>
			  </div>
	  		  </fieldset>
			  <table width="100%" align="center" style="bottom: 0px; background-color: #E8E8E8; position: absolute; z-index: 100;">
			    <tr>
			    	<td style="height: 20px;" colspan="2">
			    		<div id="msgCondutor" style="height : 0px; background-color: #FFFADE">
			    			<label id="labelMsgCondutor" style="display:none; color: #AA0000; font-weight: bold">Condutor Adicionado/Alterado com Sucesso!</label>
			    		</div>
			    	</td>
			    </tr>
				<tr>
					<td align="right">
					  <a href="#" class="button" onclick="inserirCondutor();">
						<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
						  <tr>
							<td class="wButton_left"></td>
							<td class="wButton_text wButton_width">Salvar</td>
							<td class="wButton_right"/>
						  </tr>
						</table>
					  </a>
					</td>
					<td align="left">
					  <a href="#" class="button" onclick="closeModalCondutor();">
						<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
						  <tr>
							<td class="wButton_left"></td>
							<td class="wButton_text wButton_width">Fechar</td>
							<td class="wButton_right"/>
						  </tr>
						</table>
					  </a>
					</td>
				</tr>
			  </table>
			  <script>
			  	$("#condutorNome").autocomplete('<s:url value="/objlookup/getClientePFListByNome.action" includeParams="none" />', {idFieldsToUpdate:["#clienteCondutorId"],onItemSelect:carregaCondutor, mustMatch:0, autoFill:false,width:400,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
				$("#condutorCpf").autocomplete('<s:url value="/objlookup/getClienteListByCpf.action" includeParams="none" />', {idFieldsToUpdate:["#clienteCondutorId"],onItemSelect:carregaCondutor, mustMatch:0, autoFill:false,width:400,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
				$("#condutorProfissao").autocomplete('<s:url value="/objlookup/getProfissaoByNome.action" includeParams="none" />', {idFieldsToUpdate:["#condutorProfissaoId"]});
				$("#escolaridadeCondutor").autocomplete('<s:url value="/objlookup/getEscolaridade.action" includeParams="none" />', {idFieldsToUpdate:["#escolaridadeCondutorId"]});
			  </script>
			  </div>
			  <br />
			  <hr>
			  <table>
			  	<tr>
				  	<td valign="bottom">
				      <a href="#" class="button" onclick="abrirDivCondutor();">
						  <table onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
						    <tr>
							  <td class="wButton_left"></td>
							  <s:if test="%{condutor.id != null}">
							  	<td class="wButton_text wButton_width" id="addEditCondutor">Editar Condutor</td>
							  </s:if>
							  <s:else>
							  	<td class="wButton_text wButton_width" id="addEditCondutor">Adicionar Condutor</td>
							  </s:else>
							  <td class="wButton_right"/>
						    </tr>
						  </table>
					  </a>
					</td>
					<td valign="bottom">
				      <a href="#" class="button" onclick="importarDadosCliente();">
						  <table onmouseout="this.className='wButton';return true;" onmouseover="this.className='wButton_hover';return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
						    <tr>
							  <td class="wButton_left"></td>
						  	  <td class="wButton_text wButton_width">Importar Segurado</td>
							  <td class="wButton_right"/>
						    </tr>
						  </table>
					  </a>
					</td>
				</tr>
			  </table>
			  </div>
			  <fieldset>
			  	<legend>Lista de Condutores</legend>
			  		<div id="divListaCondutores" style="border: 1px;overflow:auto;">
			  			<jsp:include page="listaCondutores.jsp" flush="false"></jsp:include>
			  		</div>
			   </fieldset>
	  	</td>
	  </tr>
	</table>
<% } catch (Exception e) {e.printStackTrace();}%>