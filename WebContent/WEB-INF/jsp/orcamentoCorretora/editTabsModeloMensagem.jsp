<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<tr>
	<td class="tabBackGround">
		<div class="marginLeft">
			<span class="dojoTabcurrentfirst">
				<div>
					<span>
						<a class="dojoTabLink" href="#" onclick="submitForm(document.formModeloMensagem, '<s:url value="/corretora/editar.action" />', false);">Corretora</a>
					</span>
				</div>
         	</span>
       		<span class="dojoTabcurrentfirst">
				<div>
					<span>
						<a class="dojoTabLink" href="#" onclick="submitForm(document.formModeloMensagem, '<s:url value="/contaCorrente/displayList.action" />', false);">Conta Corrente</a>
					</span>
				</div>
			</span>	
       		<span class="dojoTabcurrentfirst">
				<div>
					<span>
						<a class="dojoTabLink" href="#" onclick="submitForm(document.formModeloMensagem, '<s:url value="/endereco/displayList.action" />', false);">Endereço</a>
					</span>
				</div>
			</span>
       		<span class="dojoTabcurrentfirst">
				<div>
					<span>
						<a class="dojoTabLink" href="#" onclick="submitForm(document.formModeloMensagem, '<s:url value="/smsEventosCorretora/displayList.action" />', false);">Eventos SMS</a>
					</span>
				</div>
			</span>
       		<span class="dojoTabcurrentfirst">
				<div>
					<span>
						<a class="dojoTabLink" href="#" onclick="submitForm(document.formModeloMensagem, '<s:url value="/corretoraTipoLancamento/displayList.action" />', false);">Lancamentos</a>
					</span>
				</div>
			</span>
			<span class="dojoTabcurrentfirst">
				<div>
					<span>
						<a class="dojoTabLink" href="#" onclick="submitForm(document.formModeloMensagem, '<s:url value="/orcamentoCorretora/displayList.action" />', false);">Orçamento</a>
					</span>
				</div>
			</span>
			<span class="dojoTabcurrentfirst">
				<div>
					<span class="select">Modelo</span>
				</div>
			</span>
		</div>
	</td>
</tr>