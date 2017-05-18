<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try {
%>
<div id="modalDadosVeiculoCompl" style="display:none; z-index: 1000;height: 559px; width:671px;overflow: auto;">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="Main_ContentPane_TabPane" id="tdtopTabs">
		<tr id="paramParentTabContainer" style="padding: 3px">
		  <td class="tabBackGroundInit" style="background-color: #505050"></td>
		</tr>
		<tr id="paramMainTabContainer" style="padding: 3px">
		  <td class="tabBackGroundInit" style="background-color: #505050">
			<span style="color:#FFFFFF; font-size:8pt; font-weight:bold; height:26px !important; padding:0 4px; text-align:center; white-space:nowrap;">
			  Dados Complementares
			</span>
		  </td>
		</tr>
	</table>
	<form id="formAutomovel" name="formAutomovel" method="post">
		<table id="formDadosComplementares">
			<tr>
				<td>
					<s:textfield id="paramAutomovelId" style="display:none" name="automovel.id" size="15" maxlength="50" />
					<fieldset>
					 	<table width="100%">
		 						<tr>
				  				<td>
									<label for="condutorPrinc">O segurado  é o proprietário/arrendatário do veículo? </label><br />
									<s:select theme="simple" id="segPropArrend" headerKey="" headerValue="-- Selecione --" list="#{false:'NÃO',true:'SIM'}" name="automovel.isSeguradoProprietario" onchange="selectDadosArrendatario(this.value)"/>
								</td>
								<td>
							  		<label for="relacao">Relação Segurado/Proprietário</label><br />
							  		<s:select id="relacaoSegProp" list="relacaoSeguradoProprietario" listKey="id" listValue="valor" name="automovel.proprietarioArrendatario.relacaoSeguradoProprietario.id" headerValue="-- Selecione --" headerKey="" />
							  	</td>
							</tr>
						</table>
					</fieldset>
			  	</td>
			</tr>
			<tr>
		 		<td>
 					<fieldset>
					 	<legend>Dispositivo de Segurança</legend>
					 	<table width="100%">
				 			<tr>
							 	<td width="25%">
									<label for="Rastreador">Rastreador</label><br />
									<s:select id="selectRastreadorId" headerKey="" headerValue="-- Selecione --"  list="rastreadorIseg" name="automovel.rastreadorIseg.id" value="%{automovel.rastreadorIseg.id}" listKey="id" listValue="descricao" style="width: 175px;" onchange="selectRastreador(this.value);"/>
								</td>
								<td>
									<label>Outro Rastreador</label><br />
									<s:textfield id="outroRastreador" theme="simple" cssClass="readonly" disabled="true" name="automovel.outroRastreador" size="15" maxlength="50" />
								</td>
							 	<td width="25%">
							 		<label for="Rastreador">Bloqueador</label><br />
							 		<s:select id="selectBloqueadorId" headerKey="" headerValue="-- Selecione --" list="bloqueadorIseg" name="automovel.bloqueadorIseg.id" value="%{automovel.bloqueadorIseg.id}" listKey="id" listValue="descricao" style="width: 175px;" onchange="selectBloqueador(this.value);"/>
							 	</td>
							 	<td>
							 		<label>Outro Bloqueador</label><br />
							 		<s:textfield id="outroBloqueador" theme="simple" cssClass="readonly" disabled="true" name="automovel.outroBloqueador" size="15" maxlength="50" />
								</td>
						 	</tr>
						</table>
					 	<table width="100%">
					 		<s:iterator value="dispositivoSegurancaList" var="dispositivoSeguranca" status="j">
					 			<s:if test="%{#j.index == 0}">
					 				<tr>
					 			</s:if>
					 			<s:if test="%{#j.index != 0 && #j.index % 4 == 0}">
					 				</tr>
					 				<tr>
					 			</s:if>
					 				<td>
										<s:checkbox id="seguranca%{#j.index}" name="acessoriosId" fieldValue="%{id}" value="%{idSelecionado}" onchange="setAlterado(true);"/><s:label value="%{descricao}" for="seguranca%{#j.index}"/>
					 				</td>
					 		</s:iterator>
					 	</table>
		 			</fieldset>
				</td>
			</tr>
			<tr>
 				<td>
 					<fieldset>
					 	<legend for="seguranca">Opcionais</legend>
					 	<table width="100%">
					 		<s:iterator value="opcionaisList" var="opcionais" status="i">
					 			<s:if test="%{#i.index == 0}">
					 				<tr>
					 			</s:if>
					 			<s:if test="%{#i.index != 0 && #i.index % 4 == 0}">
					 				</tr>
					 				<tr>
					 			</s:if>
					 				<td>
										<s:checkbox id="opcionais%{#i.index}" name="acessoriosId" fieldValue="%{id}" value="%{idSelecionado}" onchange="setAlterado(true);"/><s:label value="%{descricao}" for="opcionais%{#i.index}"/> 
					 				</td>
					 		</s:iterator>
					 	</table>
			 		</fieldset>
				</td>
			</tr>
			<tr>
	  			<td>
	  				<fieldset>
						<legend accesskey="P"><b>Dados do Proprietário/Arrendatário</b></legend>
						<table width="100%" border="0" cellpadding="0" cellspacing="0" id="proprietarioArrendatarioTable">
							<tr>
								<td>
									<s:textfield name="automovel.proprietarioArrendatario.id" style="display:none"/>
									<label>Tipo Pessoa</label><br />
									<s:select list="#{1:'PESSOA FÍSICA',2:'PESSOA JURÍDICA'}" id="arrTipoPessoa" name="automovel.proprietarioArrendatario.tipoPessoa" headerValue="-- Selecione --" headerKey="" onchange="setTipoPessoa(this.value);"/>
								</td>
							</tr>
							<tr>
								<td width="25%">
									<label id="cpf_cnpj" for="condutorCPF">CPF</label><br />
									<s:textfield theme="simple" id="arrendatarioCPFCNPJ" name="automovel.proprietarioArrendatario.cpfOuCnpj" size="17" maxlength="14" onKeyPress="return digitos(event, this);"/>
							  	</td>
								<td width="50%">
									<label for="condutorNome">Nome</label><br />
									<s:textfield theme="simple" id="arrendatarioNome" name="automovel.proprietarioArrendatario.nome" size="43" maxlength="60" onchange="setAutomovelAlterado(true);"/>
							  	</td>
							  	<td width="25%">
									<label for="condutorTelefones">Telefone</label><br />
									<s:textfield theme="simple" id="arrendatarioTelefones" cssClass="clFone" name="automovel.proprietarioArrendatario.telefone" size="16" maxlength="30" onchange="setAutomovelAlterado(true);"/>
							  	</td>
							</tr>
							<tr id="trPessoaFisica">
								<td >
									<label for="condutorDataNascimento">Dt. Nascimento</label><br />
									<s:textfield theme="simple" cssClass="clData " id="arrendatarioDataNascimento" name="automovel.proprietarioArrendatario.dataNascimento" onblur="isValidDate(this)" size="18" maxlength="10" onchange="setAutomovelAlterado(true);"/>
								</td>
							  	<td>
									<label for="condutorData1aHabilitacao">Tempo Habilitação</label><br />
									<s:select id="condutorData1aHabilitacao" list="#{2:'ATÉ 2 ANOS', 3:'MAIS DE 2 ANOS'}" headerKey="" name="automovel.proprietarioArrendatario.tempoHabilitacao" headerValue="-- Selecione --" onchange="setAutomovelAlterado(true);"/>
							  	</td>
							</tr>
						</table>
					</fieldset>
	  			</td>
  			</tr>
			<tr>
			  	<td>
			  		<fieldset>
						<legend accesskey="P"><b>Instituição Financeira</b></legend>
						<table width="100%" border="0" cellpadding="0" cellspacing="0" id="instituicaoFinanceira">
							<tr>
								<td>
									<label for="condutorNome">Nome</label><br />
									<s:textfield theme="simple" cssClass=" " name="automovel.nomeBanco" size="43" maxlength="60" onchange="setAutomovelAlterado(true);"/>
							  	</td>
							  	<td>
									<label for="condutorCPF">CNPJ</label><br />
									<s:textfield theme="simple" cssClass="clCNPJ " name="automovel.cnpjBanco" size="17" maxlength="14" onchange="setAutomovelAlterado(true);" />
							  	</td>
							</tr>
						</table>
					</fieldset>
		  		</td>
 			</tr>
		</table>
	</form>
	<table width="100%" align="center" style="bottom: 0px; background-color: #E8E8E8; position: relative; z-index: 100;">
		<tr>
			<td align="center">
			  <a href="#" class="button" onclick="salvarComplemento();">
				<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton" >
				  <tr>
					<td class="wButton_left"></td>
					<td class="wButton_text wButton_width">salvar</td>
					<td class="wButton_right"/>
				  </tr>
				</table>
			  </a>
			</td>
			<td align="center">
			  <a href="#" class="button" onclick="closeModalComplemento();" >
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
</div>
<% } catch (Exception e) {e.printStackTrace();}%>