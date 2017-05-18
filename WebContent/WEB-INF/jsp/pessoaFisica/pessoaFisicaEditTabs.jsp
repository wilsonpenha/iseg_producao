<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<tr>
	<td class="tabBackGround">
		<div class="marginLeft">
			<span class=" dojoTabcurrentfirst">
				<div>
					<span class="select">Pessoa Fisica</span>
				</div>
			</span>
       		<span class="dojoTabcurrentfirst">
				<div>
					<span>
						<a class="dojoTabLink" href="#" onclick="submitForm(document.formPessoaFisicaTabs, '<s:url value="/contaCorrente/displayList.action" />', false);">Conta Corrente</a>
					</span>
				</div>
			</span>	
			<span class="dojoTabcurrentfirst">
				<div>
					<span>
						<a class="dojoTabLink" href="#" onclick="submitForm(document.formPessoaFisicaTabs, '<s:url value="/endereco/displayList.action" />', false);">Endereço</a>
					</span>
				</div>
         	</span>
			<span class="dojoTabcurrentfirst">
				<div>
					<span>
						<a class="dojoTabLink" href="#" onclick="submitForm(document.formPessoaFisicaTabs, '<s:url value="/dependentes/displayList.action" />', false);">Dependentes</a>
					</span>
				</div>
         	</span>
		</div>
	</td>
</tr>