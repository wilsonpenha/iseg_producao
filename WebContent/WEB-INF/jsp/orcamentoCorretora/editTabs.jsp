<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<tr>
	<td class="tabBackGround">
		<div class="marginLeft">
			<span class="dojoTabcurrentfirst">
				<div>
					<span>
						<a class="dojoTabLink" href="#" onclick="submitForm(document.formOrcamentoCorretoraTabs, '<s:url value="/corretora/editar.action" />', false);">Corretora</a>
					</span>
				</div>
         	</span>
       		<span class="dojoTabcurrentfirst">
				<div>
					<span>
						<a class="dojoTabLink" href="#" onclick="submitForm(document.formOrcamentoCorretoraTabs, '<s:url value="/contaCorrente/displayList.action" />', false);">Conta Corrente</a>
					</span>
				</div>
			</span>	
       		<span class="dojoTabcurrentfirst">
				<div>
					<span>
						<a class="dojoTabLink" href="#" onclick="submitForm(document.formOrcamentoCorretoraTabs, '<s:url value="/endereco/displayList.action" />', false);">Endereço</a>
					</span>
				</div>
			</span>
       		<span class="dojoTabcurrentfirst">
				<div>
					<span>
						<a class="dojoTabLink" href="#" onclick="submitForm(document.formOrcamentoCorretoraTabs, '<s:url value="/smsEventosCorretora/displayList.action" />', false);">Eventos SMS</a>
					</span>
				</div>
			</span>
       		<span class="dojoTabcurrentfirst">
				<div>
					<span>
						<a class="dojoTabLink" href="#" onclick="submitForm(document.formOrcamentoCorretoraTabs, '<s:url value="/corretoraTipoLancamento/displayList.action" />', false);">Lancamentos</a>
					</span>
				</div>
			</span>
			<span class="dojoTabcurrentfirst">
				<div>
					<span class="select">Orçamento</span>
				</div>
			</span>
       		<span class="dojoTabcurrentfirst">
				<div>
					<span>
						<a class="dojoTabLink" href="#" onclick="submitForm(document.formOrcamentoCorretoraTabs, '<s:url value="/orcamentoCorretora/modeloMansagem.action" />', false);">Modelo</a>
					</span>
				</div>
			</span>
		</div>
	</td>
</tr>