<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
    request.setAttribute("decorator", "none");
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

try {
%>
	
	<table width="100%" border="0" cellpadding="2" cellspacing="0">
		  <tr>
			<td>
			  <s:textfield theme="simple" id="propostaEstipulanteId" name="proposta.estipulante.id" cssStyle="display:none;" />
			  <s:textfield theme="simple" id="estipulanteId" name="estipulante.id" cssStyle="display:none;" />
			  <fieldset>
			  <legend accesskey="C"><b>Dados do <u>E</u>stipulante</b></legend>
			  <table id="tableDadosEstipulante" width="100%" border="0" cellpadding="2" cellspacing="0">
				<tr>
				  <td width="20%">
				    <label for="clienteCnpj"><a href="#" class="LabelLink" onclick="editarEstipulante();" tabindex="-1" title="Alterar dados Cadastrais do Estipulante.">CNPJ</a></label><br />
					<s:textfield theme="simple" cssClass="requiredField" id="estipulanteCnpj" name="estipulante.cpfOuCnpj" size="23" maxlength="21" onblur="checarCnpjEstipulante(this);" onchange="cnpjEstipulanteAlterado=true;setAlterado(true);"/>
				  </td>
				  <td colspan="2">
					<label for="clienteNome">Nome</label><br />
					<s:textfield theme="simple" cssClass="requiredField clTextoRestrito" id="estipulantePJNome" name="estipulante.nome" size="50" maxlength="60" onchange="setAlterado(true);"/>
				  </td>
				  <td width="20%">
					<label for="pjGrupoDeVendaId">Grupo de Venda</label><br />
					<s:select theme="simple" cssClass="requiredField" id="estipulanteGrupoDeVendaId" headerKey="" headerValue="-- Selecione --" name="estipulante.grupoDeVenda.id" list="grupoDeVendaList" listKey="id" listValue="nomeDoGrupo" onchange="setAlterado(true);"/>
				  </td>
				</tr>
				<tr>
				  <td width="20%">
					<label for="inscricaoEstadual">Inscrição Estadual</label><br />
					<s:textfield theme="simple" id="estipulanteInsEstadual" name="estipulante.inscrEstadual" onchange="setAlterado(true);"/>
				  </td>
				  <td width="20%">
					<label for="inscricaoMunicipal">Inscrição Municipal</label><br />
					<s:textfield theme="simple" id="estipulanteInsMunicipal" name="estipulante.inscricaoMunicipal" onchange="setAlterado(true);"/>
				  </td>
				  <td width="20%">
					<label for="dataFundacao">Data Fundação</label><br />
					<s:textfield theme="simple" id="estipulanteDataFundacao" cssClass="clData" name="estipulante.dataFundacao" onblur="isValidDate(this)" size="12" maxlength="10" onchange="setAlterado(true);"/>
				  </td>
				  <td width="20%">
					<label for="valorPatrimonio">Valor Patrimônio</label><br />
					<s:textfield theme="simple" cssClass="clValor2" id="estipulanteValorPatrimonio" name="estipulante.valorPatrimonio" size="16" onchange="setAlterado(true);"/>
				  </td>
				</tr>
				<tr>
				  <td>
					<label for="atividadeComercial">Atividade Comercial</label><br />
					<s:select theme="simple" id="estipulanteAtividadeComercial" headerKey="" headerValue="-- Selecione --" name="estipulante.atividadeComercial.id" list="atividadeComercialList" listKey="id" listValue="valor" onchange="setAlterado(true);"/>
				  </td>
				  <td width="20%">
					<label for="telefonePreferencial">Telef. Preferencial</label><br />
					<s:textfield theme="simple" cssClass="requiredField clFone" id="estipulanteTelefonePreferencial" name="estipulante.telefonePreferencial" size="16" maxlength="16" onchange="setAlterado(true);"/>
				  </td>
				  <td width="20%">
					<label for="telefoneAlternativo">Telefone Alternativo</label><br />
					<s:textfield theme="simple" id="estipulanteTelefoneAlternativo" cssClass="clFone" name="estipulante.telefoneAlternativo" size="16" maxlength="16" onchange="setAlterado(true);"/>
				  </td>
				  <td width="20%">
					<label for="telefoneCelular">Telefone Celular</label><br />
					<s:textfield theme="simple" id="estipulanteTelefoneCelular" cssClass="clFone" name="estipulante.telefoneCelular" size="16" maxlength="16" onchange="setAlterado(true);"/>
				  </td>
				</tr>
				<tr>
				  <td colspan="2">
					<label for="email">E-mail</label><br />
					<s:textfield theme="simple" id="estipulanteEmail" name="estipulante.email" size="40" maxlength="80" onchange="setAlterado(true);"/>
				  </td>
				  <td colspan="2">
					<label for="homePage">Site</label><br />
					<s:textfield theme="simple" id="estipulanteHomePage" name="estipulante.siteHomePage" size="40" maxlength="100" onchange="setAlterado(true);"/>
				  </td>
				  <td align="right" colspan="2">
				  	<a href="#" class="button" onclick="apagarDadosEstipulante();">
					<table onmouseout="this.className='wButton'; window.status=''; return true;" onmouseover="this.className='wButton_hover'; 	window.status='Entrar'; return true;" onmouseup="this.className='wButton'; return true;" onmousedown="this.className='wButton_active'; return true;" class="wButton">
					  <tr>
						<td class="wButton_left"></td>
						<td class="wButton_text wButton_width">Apagar Dados</td>
						<td class="wButton_right"/>
					  </tr>
					</table>
					</a>
				  </td>
				</tr>
			  </table>
			  </fieldset>
			</td>
		  </tr>
		  <tr>
			<td>
			  <fieldset>
			  <legend accesskey="E"><b><u>E</u>ndereço</b></legend>
			  <table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
				  <td width="10%">
					<label for="cepEstipulante"><a href="#" class="LabelLink" onclick="openWin('${pageContext.request.contextPath}/endereco/buscaCep.action','BuscaCep','1024','600','resizable=yes,scrollbars=yes');" tabindex="-1" title="Acessar o site dos Correrios!">CEP</a></label><br />
					<s:textfield theme="simple" id="estipulanteTipoEndereco" name="estipulante.enderecoCollection[0].tipoEndereco" value="C" cssStyle="display:none;" />
					<s:textfield theme="simple" id="estipulanteEnderecoId" name="estipulante.enderecoCollection[0].id" cssStyle="display:none;" />
					<s:textfield theme="simple" cssClass="clCep" id="cepEstipulante" name="estipulante.enderecoCollection[0].cep" size="11" maxlength="9" onchange="setAlterado(true);"/>
				  </td>
				  <td width="30%">
					<label for="lograEstipulante">Logradouro</label><br />
					<s:textfield theme="simple" cssClass="requiredField clTextoRestrito" id="lograEstipulante" name="estipulante.enderecoCollection[0].logradouro" cssStyle="width:98%" maxlength="60" onchange="setAlterado(true);"/>
				  </td>
				  <td colspan="2">
					<label for="compEstipulante">Complemento</label><br />
					<s:textfield theme="simple" id="compEstipulante" cssClass="" name="estipulante.enderecoCollection[0].complemento" cssStyle="width:98%" maxlength="60" onchange="setAlterado(true);"/>
				  </td>
				  <td width="15%">
					<label for="numeroEstipulante">Número</label><br />
					<s:textfield theme="simple" id="numeroEstipulante" name="estipulante.enderecoCollection[0].numero" maxlength="6" size="8" onchange="setAlterado(true);"/>
				  </td>
				  <td width="15%">&nbsp;
				  </td>
				</tr>
				<tr>
				  <td colspan="2">
					<label for="bairroCom">Bairro</label><br />
					<s:textfield theme="simple" id="bairroEstipulante" cssClass="clTextoRestrito" name="estipulante.enderecoCollection[0].bairro" cssStyle="width:98%" maxlength="50" onchange="setAlterado(true);"/>
				  </td>
				  <td>
					<label for="cidadeCom">Cidade</label><br />
					<s:textfield theme="simple" id="cidadeEstipulante" cssClass="clTextoRestrito" name="estipulante.enderecoCollection[0].cidade" cssStyle="width:98%" maxlength="30" onchange="setAlterado(true);"/>
				  </td>
				  <td>
					<label for="ufCom">UF</label><br />
					<s:select theme="simple" id="ufEstipulante" headerKey="" headerValue="-- Selecione --" name="estipulante.enderecoCollection[0].uf" list="ufList" listKey="uf" listValue="nome" onchange="setAlterado(true);"/>
				  </td>
				  <td>
					<label for="cidadeCom">Correspondência</label><br />
				    <s:radio theme="simple" id="correspondenciaEstipulante" name="estipulante.enderecoCollection[0].correspondencia" list='{"SIM","NAO"}' />
				  </td>
				  <td>
					<label for="faxCom">Fax</label><br />
					<s:textfield theme="simple" id="faxEstipulante" cssClass="clFone" name="estipulante.enderecoCollection[0].fax" size="16" maxlength="20" onchange="setAlterado(true);" />
					<input id="lastfield1" name="lastfield1" onkeyup="nextTab(event);" class="invisible" />
				  </td>
				</tr>
			  </table>
			  </fieldset>
			</td>
		  </tr>
		  </table>	


<script>

$("#estipulantePJNome").autocomplete('<s:url value="/objlookup/getClientePJListByNome.action" includeParams="none" />', {idFieldsToUpdate:["#estipulanteId"],onItemSelect:carregaEstipulante, mustMatch:0, autoFill:false,width:400,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
$("#estipulanteCnpj").autocomplete('<s:url value="/objlookup/getClienteListByCnpj.action" includeParams="none" />', {idFieldsToUpdate:["#estipulanteId"],onItemSelect:carregaEstipulante, mustMatch:0, autoFill:false,width:400,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});
$("#cepEstipulante").autocomplete('<s:url value="/objlookup/getCepList.action" includeParams="none" />', {idFieldsToUpdate:["#bairroEstipulante", "#cidadeEstipulante","#ufEstipulante","#lograEstipulante"],mustMatch:0,minChars:6,width:300,autoFill:false,max:300,scroll:true,scrollHeight:150,formatItemOnSelect:splitResultGetFirst});

// define a mascara padrão para telefone
$().ready(function() {
	// Mascara de telefone.
    $(".clData").setMask({mask : '39/19/9999', autoTab: false});
    $(".clFone").setMask({mask : '(99) 9999-9999', autoTab: false});
    $(".clFone").DefaultValue("(__) ____-____");
    // Converte para upper e elimina brancos no inicio e brancos duplos.
    $(".clValor2").setMask({mask : '99,999.999.999.999', type : 'reverse',defaultValue:"+000"});
    $(".clValor1").setMask({mask : '9,999.999.999.999', type : 'reverse',defaultValue:"00"});
    $(".clValor").setMask({mask : '99',  type : 'reverse',defaultValue:"0"});
 	
 })


//handleReadonly();

</script>
<% } catch (Exception e) {e.printStackTrace();}%>