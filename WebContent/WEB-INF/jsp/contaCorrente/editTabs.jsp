<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<tr>
	<td class="tabBackGround">
		<div class="marginLeft">
			<span class=" dojoTabcurrentfirst">
				<div>
					<span>
						<a class="dojoTabLink" href="#" onclick="submitForm(document.formContaCorrenteTabs, '<s:url value="/pessoaFisica/editar.action" />', false);">Pessoa Física</a>
					</span>
				</div>
			</span>
       		<span class="dojoTabcurrentfirst">
				<div>
					<span>
						<a class="dojoTabLink" href="#" onclick="submitForm(document.formContaCorrenteTabs, '<s:url value="/endereco/displayList.action" />', false);">Endereço</a>
					</span>
				</div>
			</span>	
			<span class="dojoTabcurrentfirst">
				<div>
					<span class="select">Conta Corrente</span>
				</div>
         	</span>
		</div>
	</td>
</tr>