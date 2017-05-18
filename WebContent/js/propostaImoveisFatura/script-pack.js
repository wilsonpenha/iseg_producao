
﻿ArrNomeCampo=["#dataProposta","#ramoId","#seguradoraId","#clientePFNome","#pfGrupoDeVendaId","#clientePJNome","#pjGrupoDeVendaId"];ArrLabelCampo=["Data da Proposta","Ramo de Seguro","Seguradora","Nome do Cliente","Grupo de Venda","Nome do Cliente","Grupo de Venda"];ArrTipoCampo=[TIPOFORM_DATA,TIPOFORM_TEXT,TIPOFORM_SELECT,TIPOFORM_TEXT,TIPOFORM_SELECT,TIPOFORM_TEXT,TIPOFORM_SELECT];ArrOperacaoCampo=[OP_INSERT_UPDATE,OP_INSERT_UPDATE,OP_INSERT_UPDATE,OP_INSERT_UPDATE,OP_INSERT_UPDATE,OP_INSERT_UPDATE,OP_INSERT_UPDATE];function novaProposta(){var error="";if($('#paramSeguradoraId').val()==""){error="Selecione uma Seguradora!";$('#paramSeguradoraId').focus();}else if($('#paramRamoId').val()==""){error="Selecione um Ramo!";$('#paramRamoId').focus();}
if(error==""){$("#gpSeguradoraId").val($('#paramSeguradoraId').val());$("#gpRamoId").val($('#paramRamoId').val());$("#gpTipoCliente").val($("#tipoCliente0").get(0).checked?$("#tipoCliente0").val():$("#tipoCliente1").val());submitForm($('#formLookup').get(0),getContextApp()+'/proposta/novo.action',false);}else{alert(error);}}
function listaPropostas(){submitForm($('#formEdit').get(0),getContextApp()+'/proposta/displayList.action',false);mostrarMenu('buttonMenu');resizeArea(true);}
function setarPedidoValidado(){if($('#statusOperacional').val()=='0')
$('#statusOperacional').val('1');if($('#statusOperacional').val()=='5')
$('#statusOperacional').val('51');if($('#statusOperacional').val()=='8')
$('#statusOperacional').val('81');submitForm($('#formEdit').get(0),getContextApp()+'/propostaImoveisFatura/efetivarProposta.action',false);}
function gerarProposta(){if($('#statusOperacional').val()=='0'||$('#statusOperacional').val()=='1')
$('#statusOperacional').val('4');if($('#statusOperacional').val()=='5'||$('#statusOperacional').val()=='51')
$('#statusOperacional').val('6');if($('#statusOperacional').val()=='8'||$('#statusOperacional').val()=='81')
$('#statusOperacional').val('9');submitForm($('#formEdit').get(0),getContextApp()+'/propostaImoveisFatura/efetivarProposta.action',false);}
function gerarApolice(){if($('#statusOperacional').val()=='4')
$('#statusOperacional').val('2');if($('#statusOperacional').val()=='6')
$('#statusOperacional').val('7');if($('#statusOperacional').val()=='9')
$('#statusOperacional').val('10');submitForm($('#formEdit').get(0),getContextApp()+'/propostaImoveisFatura/efetivarProposta.action',false);}
function salvarProposta(){if($("#currentTabId").val()==2)
$("#blnReloaded").val("false");if($("#propostaId").val()=='')
submitFormAjax('#formEdit',getContextApp()+'/propostaImoveisFatura/salvarEditar.action','#allForms','#saveProgress');else
submitFormAjax('#formEdit',getContextApp()+'/propostaImoveisFatura/salvarEditar.action','#tabPane'+$('#currentTabId').val(),'#saveProgress');setImovelAlterado(false);formNavigateAlterado=false;}
function efetivarProposta(){submitFormAjax('#formEdit',getContextApp()+'/propostaImoveisFatura/efetivarProposta.action','#allForms','#saveProgress');}
function excluirProposta(){var propostaId=$('#propostaId').val();if(propostaId!=""&&$('#statusOperacional').val()=='0'){$("#gpPropostaId").val(propostaId);submitForm($('#formLookup').get(0),getContextApp()+'/propostaImoveisFatura/excluir.action',false);}}
function carregaComboVistoriadora(seguradoraId){$("#gpSeguradoraId").val(seguradoraId);submitFormAjax('#formLookup',getContextApp()+'/propostaImoveisFatura/vistoriadoraPorSeguradora.action','#divVistoriadora');}
function carregaCliente(){$("#gpPropostaId").val($("#propostaId").val());$("#gpTipoCliente").val($("#tipoCliente").val());$("#gpClienteId").val($("#clienteId").val());$("#gpClienteCpf").val($("#clienteCpf").val());$("#gpClienteCnpj").val($("#clienteCnpj").val());submitFormAjax('#formLookup',getContextApp()+'/propostaImoveisFatura/propostaImoveisDadosCliente.action','#divDadosCliente');alterado=true;setImovelAlterado(true);setTimeout(function(){if(!isEmpty('#clienteId')){if($("#tipoCliente").val()==0){$("#cepRes").focus();}else{$("#cepCom").focus();}}else
if($("#tipoCliente").val()==0){$("#clientePFNome").focus();}else{$("#clientePJNome").focus();}},200);}
function apagarDadosCliente(){$('#formLookup #currentTabId').val('0');$("#gpTipoCliente").val($("#tipoCliente").val());submitFormAjax('#formLookup',getContextApp()+'/propostaImoveisFatura/novoDadosClienteForm.action','#divDadosCliente');}
function editarCliente(){var clienteId=$('#clienteId').val();if(clienteId!=''){openWin(contextApp+'/pessoa/editar.action?pessoa.id='+clienteId,'clienteEdicao','750','500','resizable=yes');}else{alert('Este cliente não possui registro no sistema!');}}
function importarEnderecoCliente(){$("#cepRis").val($("#cepRes").val());$("#lograRis").val($("#lograRes").val());$("#compRis").val($("#compRes").val());$("#numeroRis").val($("#numeroRes").val());$("#foneRis").val($("#foneRes").val());$("#bairroRis").val($("#bairroRes").val());$("#cidadeRis").val($("#cidadeRes").val());$("#ufRis").val($("#ufRes").val());$("#faxRis").val($("#faxRes").val());}
function calculaTotalComissao(){var premioLiquido=converte_numero($("#premioLiquido").val());var fator=converte_numero($("#fator").val());if(fator!=0&&premioLiquido!=0){$("#totalComissao").val((premioLiquido*fator/100).toFixed(2));valida_numero($("#totalComissao").get(0),15,2,'totalComissao');}}
TP_COM_PERC_SOBRE_COMISSAO=0;TP_COM_PERC_SOBRE_PREMIO_LIQ=1;TP_COM_VALOR=2;function calculaVlrComissaoComissionado(comissao){if($('#comissionadoPropostaTipoComissao').val()==TP_COM_PERC_SOBRE_COMISSAO){var valorComissaoPrincipal=converte_numero($("#totalComissao").val());var fator=converte_numero(comissao);if(fator!=0&&valorComissaoPrincipal!=0){$("#comissionadoPropostaVlrComissao").val((valorComissaoPrincipal*(fator/100)).toFixed(2));valida_numero($("#comissionadoPropostaVlrComissao").get(0),15,2,'comissionadoPropostaVlrComissao');}}else if($('#comissionadoPropostaTipoComissao').val()==TP_COM_PERC_SOBRE_PREMIO_LIQ){var valorComissaoPrincipal=converte_numero($("#premioLiquido").val());var fator=converte_numero(comissao);if(fator!=0&&valorComissaoPrincipal!=0){$("#comissionadoPropostaVlrComissao").val((valorComissaoPrincipal*(fator/100)).toFixed(2));valida_numero($("#comissionadoPropostaVlrComissao").get(0),15,2,'comissionadoPropostaVlrComissao');}}}
function calculaFator(){var premioLiquido=converte_numero($("#premioLiquido").val());var totalComissao=converte_numero($("#totalComissao").val());if(totalComissao!=0&&premioLiquido!=0){$("#fator").val((totalComissao*100/premioLiquido).toFixed(2));valida_numero($("#fator").get(0),15,2,'fator');}}
function carregaParcelas(){if(alterado){$("#blnGerarParcelas").val("true");salvarProposta();}else{$("#gpPropostaId").val($("#propostaId").val());$("#gpIsFatura").val($("#isFatura").val());$("#gpPropostaParcelaAtual").val($("#parcelaAtual").val());$("#gpQuantParc").val($('#quantParc').val());$("#gpFormaPagamento").val($('#formaPagamento').val());$("#gpFormaPagamento1aParcela").val($('#formaPagamento1aParcela').val());$("#gpValorDemaisParcelas").val($('#valorDemaisParcelas').val());$("#gpDataVencim1aParcela").val($("#dataVencim1aParcela").val());$("#gpCustoApolice").val($("#custoApolice").val());$("#gpNroFatura").val($("#nroFatura").val());$("#gpValor1aParcela").val($("#valor1aParcela").val());$("#gpPremioTotal").val($("#premioTotal").val());$("#gpNroBanco").val($("#nroBanco").val());$("#gpCodigoAgencia").val($("#codigoAgencia").val());$("#gpContaCorrente").val($("#contaCorrente").val());$("#gpContaDigito").val($("#contaDigito").val());submitFormAjax('#formLookup',getContextApp()+'/propostaImoveisFatura/gerarParcelas.action','#divParcelas');}}
function calculaParcelas(){var valor1aParcela=converte_numero($("#valor1aParcela").val());var premioTotal=converte_numero($("#premioTotal").val());var qtdeParcelas=converte_numero($("#quantParc").val());if(valor1aParcela==0||qtdeParcelas==1||valor1aParcela>premioTotal){if(qtdeParcelas==0){qtdeParcelas=1;$("#quantParc").val(1);}
var valorParcela=premioTotal/qtdeParcelas;$("#valor1aParcela").val(valorParcela.toFixed(2));valida_numero($("#valor1aParcela").get(0),15,2,'valor1aParcela');$("#valorDemaisParcelas").val(valorParcela.toFixed(2));valida_numero($("#valorDemaisParcelas").get(0),15,2,'valorDemaisParcelas');}else{calculaDemaisParcelas();}}
function replicarComissao(valor,index){qtdeParcelas=12/$("#quantParc").val();for(var i=index;i<qtdeParcelas;i++){baseComissao=converte_numero($("#baseCalculoComissao"+i).val());percComissao=converte_numero(valor);if($("#percentualComissao"+i)){$("#percentualComissao"+i).val(valor);valorComissao=((baseComissao*percComissao)/100).toFixed(2);$("#valorComissao"+i).val(valorComissao.replace(".",","));$("#valorComissao"+i).setMask({mask:'99,999.999.99',type:'reverse',defaultValue:"+000"});}}}
function calculaDemaisParcelas(){var premioTotal=converte_numero($("#premioTotal").val());var qtdeParcelas=converte_numero($("#quantParc").val());var valor1aParcela=converte_numero($("#valor1aParcela").val());if(valor1aParcela!=0){qtdeParcelas=qtdeParcelas-1;}
if(qtdeParcelas==0){qtdeParcelas=1;$("#quantParc").val(1);}
var valorParcela=((premioTotal-valor1aParcela)/qtdeParcelas).toFixed(2);$("#valorDemaisParcelas").val(valorParcela);valida_numero($("#valorDemaisParcelas").get(0),15,2,'valorDemaisParcelas');}
function validaComissionado(){var hasError=false;var divComissionados=$('#divMessagesComissionados').html('').get(0);if($('#comissionadoPropostaPessoaId').val()==""){addErrorText('É necessário especificar uma pessoa.',divComissionados);hasError=true;}
if($('#comissionadoPropostaPercentualComissao').val()==""){addErrorText('É necessário especificar um percentual para o comissionado.',divComissionados);hasError=true;}
if(!hasError){var percVlrComissao=converte_numero($("#comissionadoPropostaComissao").val());var premioLiquido=converte_numero($("#premioLiquido").val());if($('#comissionadoPropostaTipoComissao').val()==TP_COM_PERC_SOBRE_COMISSAO||$('#comissionadoPropostaTipoComissao').val()==TP_COM_PERC_SOBRE_PREMIO_LIQ){if(percVlrComissao>100){addErrorText('O percentual de comissão não poder ser maior que 100%.',divComissionados);hasError=true;}}
if($('#comissionadoPropostaTipoComissao').val()==TP_COM_VALOR){if(percVlrComissao>100){addErrorText('O valor da comissão não poder ser maior que o Prêmio liquido.',divComissionados);hasError=true;}}}
return!hasError;}
function carregarComissionados(){var propostaId=$('#propostaId').val();if(propostaId!=""){$("#comPropostaId").val(propostaId);submitFormAjax('#formComissionados',getContextApp()+'/comissionadoProposta/carregarComissionados.action','#divDadosComissao');}}
function inserirComissionado(){if(validaComissionado()){$("#comPropId").val($('#comissionadoPropostaId').val());$("#comPropPropostaId").val($("#propostaId").val());$("#comPropPessoaId").val($("#comissionadoPropostaPessoaId").val());$("#comPropComissionadoParcelaId").val($("#comissionadoPropostaParcelaId").val());$("#comPropComissao").val($("#comissionadoPropostaComissao").val());$("#comPropTipoComissao").val($("#comissionadoPropostaTipoComissao").val());$("#comPropVlrComissao").val($("#comissionadoPropostaVlrComissao").val());$("#comDemaisParcelas").val($("#demaisParcelas").val());submitFormAjax('#formComissionados',getContextApp()+'/comissionadoProposta/inserirComissionado.action','#divListaComissionados');$('#comissionadoPropostaPessoaId').val('');$('#comissionadoPropostaPessoaNome').val('');$("#comissionadoPropostaComissao").val('');$("#comissionadoPropostaTipoComissao").val('');}}
function removerComissionado(id){$("#comPropId").val(id);$("#comPropPropostaId").val($("#propostaId").val());$("#comDemaisParcelas").val($("#demaisParcelas").val());submitFormAjax('#formComissionados',getContextApp()+'/comissionadoProposta/removerComissionado.action','#divListaComissionados');salvarProposta();}
function editarComissionado(id){$("#comPropId").val(id);$("#comDemaisParcelas").val($("#demaisParcelas").val());submitFormAjax('#formComissionados',getContextApp()+'/comissionadoProposta/editarComissionado.action','#divDadosComissionados');}
function alterarGrupoDeVenda(){$("#gpPropostaId").val($("#propostaId").val());$("#gpGrupoDeVendaId").val($("#grupoDeVendaId").val());submitFormAjax('#formLookup',getContextApp()+'/propostaImoveisFatura/alterarGrupoVenda.action','#divComissaoPagar');}
function alterarGrupoDeVendaParcelaSelecionada(){$("#gpPropostaId").val($("#propostaId").val());$("#gpGrupoDeVendaId").val($("#comissoesGrupoDeVendaId").val());$("#gpParcelaSelecionadaId").val($("#comissionadoPropostaParcelaId").val());$("#gpDemaisParcelas").val($("#demaisParcelas").val());submitFormAjax('#formLookup',getContextApp()+'/propostaImoveisFatura/alterarGrupoVendaComissao.action','#divRepasseComissao');}
function abrirDivNovaCobertura(){$('#novaCobertura').modal({onOpen:openModalNovaCobertura,close:false});}
function openModalNovaCobertura(dialog){dialog.overlay.fadeIn('slow',function(){dialog.container.fadeIn('slow',function(){dialog.data.slideDown('slow');});});$("#paramCobPropostaId").val($('#propostaId').val());setTimeout(function(){$("#paramCobDescricaoCobertura").focus();$('#btnf3').attr('disabled',true);$('#btnf4').attr('disabled',true);$('#btnf5').attr('disabled',true);$('#btnf6').attr('disabled',true);$('#btnf7').attr('disabled',true);$('#btnf8').attr('disabled',true);$('#btnf11').attr('disabled',true);},2000);}
function inserirCobertura(){$('#paramCobItemCorrente').val($("#itemCorrente").val());submitFormAjaxAllArgs('#formCobertura',getContextApp()+'/propostaImoveisFatura/inserirCobertura.action',null,null,null,null,function(response){$('#tableCoberturas tbody').append(response);});$("#paramCobDescricaoCobertura").val('');$("#paramCobInformaFranquia").val('');}
function novoItem(){submitFormAjax('#formEdit',getContextApp()+'/propostaImoveisFatura/novoItem.action','#tabPane1');}
function editarImovel(item){$("#itensSegurados").click();$("#itemCorrente").val(item);submitFormAjax('#formEdit',getContextApp()+'/propostaImoveisFatura/editarImovel.action','#tabPane1');}
function removerItem(item){$("#itensSegurados").click();$("#itemCorrente").val(item);submitFormAjax('#formEdit',getContextApp()+'/propostaImoveisFatura/removerItem.action','#tabPane1');}
function removerItem(){if($("#itemCorrente").val()==$("#itens").val()){$("#itemCorrente").val(0);submitFormAjax('#formEdit',getContextApp()+'/propostaImoveisFatura/editarImovel.action','#tabPane1');}else{submitFormAjax('#formEdit',getContextApp()+'/propostaImoveisFatura/removerItem.action','#tabPane1');}}
function proximoItem(){var _itens=converte_numero($("#itens").val());var _item=converte_numero($("#itemCorrente").val());_item=_item+1;if(_item<_itens){$("#itemCorrente").val(_item);submitFormAjax('#formEdit',getContextApp()+'/propostaImoveisFatura/editarImovel.action','#tabPane1');}else
return false;}
function ultimoItem(){var _item=converte_numero($("#itens").val());if(_item>1){$("#itemCorrente").val(_item-1);submitFormAjax('#formEdit',getContextApp()+'/propostaImoveisFatura/editarImovel.action','#tabPane1');}else
return false;}
function itemAnterior(){var _item=converte_numero($("#itemCorrente").val());_item=_item-1;if(_item>=0){$("#itemCorrente").val(_item);submitFormAjax('#formEdit',getContextApp()+'/propostaImoveisFatura/editarImovel.action','#tabPane1');}else
return false;}
function primeiroItem(){var _item=converte_numero($("#itemCorrente").val());if(_item>0){$("#itemCorrente").val(0);submitFormAjax('#formEdit',getContextApp()+'/propostaImoveisFatura/editarImovel.action','#tabPane1');}else
return false;}
function calculaPremioTotal(){var premioLiquido=$("#premioLiquido").val();var custoApolice=$("#custoApolice").val();var iof=$("#iof").val();var desconto=$("#desconto").val();premioLiquido=converte_numero(premioLiquido);custoApolice=converte_numero(custoApolice);desconto=converte_numero(desconto);iof=converte_numero(iof);$("#premioTotal")[0].value=((premioLiquido+custoApolice+iof)-desconto).toFixed(2);valida_numero($("#premioTotal")[0],15,2,'premioTotal');calculaDemaisParcelas();}
function calculaDemaisParcelas(){var premioTotal=converte_numero($("#premioTotal").val());var qtdeParcelas=converte_numero($("#quantParc").val());var valor1aParcela=converte_numero($("#valor1aParcela").val());if(valor1aParcela!=0){qtdeParcelas=qtdeParcelas-1;}
if(qtdeParcelas==0){qtdeParcelas=1;$("#quantParc").val(1);}
$("#valorDemaisParcelas").val(((premioTotal-valor1aParcela)/qtdeParcelas).toFixed(2));valida_numero($("#valorDemaisParcelas")[0],15,2,'valorDemaisParcelas');}
function calculaTotalComissao(){var premioLiquido=converte_numero($("#premioLiquido").val());var fator=converte_numero($("#fator").val());if(fator!=0&&premioLiquido!=0){$("#totalComissao").val((premioLiquido*fator/100).toFixed(2));valida_numero($("#totalComissao")[0],15,2,'totalComissao');}}
function calculaFator(){var premioLiquido=converte_numero($("#premioLiquido").val());var totalComissao=converte_numero($("#totalComissao").val());if(totalComissao!=0&&premioLiquido!=0){$("#fator").val((totalComissao*100/premioLiquido).toFixed(2));valida_numero($("#fator")[0],15,2,'fator');}}
function buildReport(url){frmLOV=window.open(url,"winReport","left=0,top=0,scrollbars=yes,resizable=yes,width=800,height=600");frmLOV.focus();if(frmLOV.opener==null){frmLOV.opener=self;}}
function showHideDadosFormaPagamento(){var formaPagamento=$('#formaPagamento').val();var formaPagamento1aParcela=$('#formaPagamento1aParcela').val();$('#tableDadosDebitoConta').hide();if(formaPagamento=='4'||formaPagamento1aParcela=='4'){$('#tableDadosDebitoConta').show();}}
function openWindowCliente(){var url='';if($('#clienteNome')[0].value!=''){if($('#pfRG')[0]!=null){url=contextApp+'/pessoaFisica/editar.action?pessoaFisica.id='+$('#clienteId')[0].value;}else if($('#pjRazaoSocial')[0]!=null){url=contextApp+'/pessoaJuridica/editar.action?pessoaJuridica.id='+$('#clienteId')[0].value;}}else{url=contextApp+'/pessoa/displayList.action';}
if(url!=''){openWin(url,'clienteEdicao','750','500','resizable=yes');}}
function openWindowGrupoDeVenda(){var grupoDeVendaId=$('#grupoVendaId')[0];if(grupoDeVendaId.value!=''){url=contextApp+'/grupoDeVenda/editar.action?grupoDeVenda.id='+$('#grupoVendaId')[0].value;if(url!=''){openWin(url,'grupoDeVendaEdicao','750','500','resizable=yes');}}else{alert('Selecione um Grupo de Venda.');}}
function nextTab(event){if(event.keyCode==9||event.keyCode==13){navigate('proximo');return false;}
return true;}
function handleReadonly(){if(!isEmpty('#propostaId')||!isEmpty('#clienteId')){$('#tableDadosCliente input').attr('readonly','true');$('#tableDadosCliente input').addClass('readonly');$('#tableDadosCliente select').attr('disabled','true');$('#tableDadosCliente select').addClass('readonly');}}
function setAlterado(b){$("#blnReloaded").val('false');alterado=b;}
function setImovelAlterado(b){alterado=b;imovelAlterado=b;$('#imovelAlterado').val(b);}
function showOptionsRecebimentoComissao(){var tipoRecebimentoComissao=$('#tipoRecebimentoComissao').val();if(tipoRecebimentoComissao=='0'){$('#labelOpcoesRecebComissao').html('Nro Parcelas');$('#labelOpcoesRecebComissao').html('');$('#labelOpcoesRecebComissao').attr('for','');$('#quantParcComissao').addClass('readonly');$('#descontaCustoApoliceIof').hide();}else if(tipoRecebimentoComissao=='1'){$('#labelOpcoesRecebComissao').html('Nro Parcelas');$('#labelOpcoesRecebComissao').html('');$('#labelOpcoesRecebComissao').attr('for','');$('#quantParcComissao').addClass('readonly');$('#descontaCustoApoliceIof').hide();}else if(tipoRecebimentoComissao=='2'){$('#labelOpcoesRecebComissao').html('Nro Parcelas');$('#labelOpcoesRecebComissao').attr('for','quantParcComissao');$('#quantParcComissao').removeClass('readonly');$('#quantParcComissao').focus();$('#descontaCustoApoliceIof').hide();}}
function showHideDadosDemaisParcelas(){var qtdeParcelas=converte_numero($("#quantParc").val());if(qtdeParcelas==0||qtdeParcelas==1){$('#formaPagamento').val('');$('#formaPagamento').hide();$('#valorDemaisParcelas').val('');$('#valorDemaisParcelas').hide();$('#labelFormaPagamento').hide();$('#labelValorDemaisParcelas').hide();}else{$('#formaPagamento').show();$('#valorDemaisParcelas').show();$('#labelFormaPagamento').show();$('#labelValorDemaisParcelas').show();}}
function disableDadosClientes(){if(!isEmpty('#propostaId')||!isEmpty('#clienteId')){$('#tableDadosCliente input[type=text]').attr('disabled','true');$('#tableDadosCliente input[type=text]').addClass('readonly');$('#tableDadosCliente select').attr('disabled','true');$('#tableDadosCliente select').addClass('readonly');}}
function enableDisableDadosCobertura(rowNumber){if(rowNumber==null||rowNumber==''){var lmiElements=$('#tableCoberturas tr input').filter('[id^="coberturaLmi"]');for(var i=0;i<lmiElements.length;i++){if(converte_numero(lmiElements[i].value)==0){$('#coberturaFranquia'+i).attr('disabled',true);$('#coberturaFranquia'+i).addClass('readonly');$('#coberturaTextoFranquia'+i).attr('disabled',true);$('#coberturaTextoFranquia'+i).addClass('readonly');$('#coberturaPremio'+i).attr('disabled',true);$('#coberturaPremio'+i).addClass('readonly');}else{$('#coberturaFranquia'+i).attr('disabled',false);$('#coberturaFranquia'+i).removeClass('readonly');$('#coberturaTextoFranquia'+i).attr('disabled',false);$('#coberturaTextoFranquia'+i).removeClass('readonly');$('#coberturaPremio'+i).attr('disabled',false);$('#coberturaPremio'+i).removeClass('readonly');}}}else{if(converte_numero($('#coberturaLmi'+rowNumber).val())==0){$('#coberturaFranquia'+rowNumber).attr('disabled',true);$('#coberturaFranquia'+rowNumber).addClass('readonly');$('#coberturaTextoFranquia'+rowNumber).attr('disabled',true);$('#coberturaTextoFranquia'+rowNumber).addClass('readonly');$('#coberturaPremio'+rowNumber).attr('disabled',true);$('#coberturaPremio'+rowNumber).addClass('readonly');}else{$('#coberturaFranquia'+rowNumber).attr('disabled',false);$('#coberturaFranquia'+rowNumber).removeClass('readonly');$('#coberturaTextoFranquia'+rowNumber).attr('disabled',false);$('#coberturaTextoFranquia'+rowNumber).removeClass('readonly');$('#coberturaPremio'+rowNumber).attr('disabled',false);$('#coberturaPremio'+rowNumber).removeClass('readonly');}}}
var fieldErrors='';var msgErrors='';var errors='';function validacaoGerarProposta(apolice){if(isEmpty('#dataProposta')){fieldErrors+='- Data da Proposta<br/>';}
if(isEmpty('#seguradoraId')){fieldErrors+='- Seguradora<br/>';}
if(isEmpty('#ramoId')){fieldErrors+='- Ramo<br/>';}
if(!isEmpty('#pessoaFisicaId')){if(isEmpty('#clientePFNome')){fieldErrors+='- Nome do Segurado<br/>';}
if(isEmpty('#dataNascimento')){fieldErrors+='- Data de Nascimento do Segurado<br/>';}
if(isEmpty('#sexo')){fieldErrors+='- Sexo do Segurado<br/>';}
if(isEmpty('#rg')){fieldErrors+='- RG do Segurado<br/>';}
if(isEmpty('#orgaoEmissor')){fieldErrors+='- Órgão Emissor do RG do Segurado<br/>';}
if(isEmpty('#dataEmissao')){fieldErrors+='- Data de Emissão do RG do Segurado<br/>';}}else if(!isEmpty('#pessoaJuridicaId')){if(isEmpty('#clientePJNome')){fieldErrors+='- Nome do Segurado<br/>';}}else{msgErrors+='- Não existe um Seguradora cadastrado para essa Proposta<br/>';}
if(isEmpty('#telefonePreferencial')){fieldErrors+='- Telefone Preferencial do Segurado<br/>';}
if(isEmpty('#cepRes')){fieldErrors+='- CEP<br/>';}
if(isEmpty('#lograRes')){fieldErrors+='- Logradouro<br/>';}
if(isEmpty('#bairroRes')){fieldErrors+='- Bairro<br/>';}
if(isEmpty('#cidadeRes')){fieldErrors+='- Cidade<br/>';}
if(isEmpty('#ufRes')){fieldErrors+='- Estado<br/>';}
if($('#tableCoberturas input[id^="coberturaLmi"]').add('#percentualReferenciado').add('#valorCasco').not('[value=""]').not('[value="0,00"]').size()==0){msgErrors+='';}
if(isEmpty('#premioLiquido')){fieldErrors+='- Prêmio Líquido<br/>';}
if(isEmpty('#custoApolice')){fieldErrors+='- Custo da Apólice<br/>';}
if(isEmpty('#premioTotal')){fieldErrors+='- Prêmio Total<br/>';}
if(isEmpty('#fator')){fieldErrors+='- Fator<br/>';}
if(isEmpty('#inicioVigencia')){fieldErrors+='- Início Vigência<br/>';}
if(isEmpty('#terminoVigencia')){fieldErrors+='- Término Vigência<br/>';}
if(isEmpty('#formaPagamento1aParcela')){fieldErrors+='- Forma de Pagamento<br/>';}
if(isEmpty('#formaPagamento')&&$('quantParc').val()>1){fieldErrors+='- Forma de Pagamento<br/>';}
if(isEmpty('#quantParc')){fieldErrors+='- Quantidade de Parcelas<br/>';}
if(isEmpty('#tipoRecebimentoComissao')){fieldErrors+='- Tipo de Recebimento de Comissão<br/>';}else{if($('#tipoRecebimentoComissao').val()=='1'&&isEmpty('#descontaCustoApoliceIof')){fieldErrors+='- Desconta Custo Apólice e IOF<br/>';}else if($('#tipoRecebimentoComissao').val()=='2'&&isEmpty('#quantParcComissao')){fieldErrors+='- Quantidade de Parcelas de Comissão<br/>';}}
if(isEmpty('#grupoDeVendaId')){fieldErrors+='- Grupo de Venda da Proposta<br/>';}
if(isEmpty('#nroPropostaSeg')){fieldErrors+='- Nro da Proposta na Seguradora<br/>';}
if(isEmpty('#dataTransmissao')){fieldErrors+='- Data da Transmissão<br/>';}
if(isEmpty('#dataGeracao')){fieldErrors+='- Data da Geração<br/>';}
if($('#tableComissionadoItens tr').length<2){msgErrors+='- Não existe nenhum comissionado cadastrado para essa proposta<br/>';}
if(isNaN(apolice))
msg="efetivação do Proposta";else
msg=apolice;if(fieldErrors!=''){errors+='<b>Para a '+msg+', os seguintes campos devem ser preenchidos: </b><br/>'+fieldErrors;}
if(msgErrors!=''){errors+='<b>Existem condições pendentes que impossibilitam a '+msg+': </b><br/>'+msgErrors;}
if(errors!=''){$('div[id^="divMessagesTab"]').html('').html(errors);fieldErrors='';msgErrors='';errors='';return false;}
fieldErrors='';msgErrors='';errors='';return true;}
function validacaoPedido(apolice){if(isEmpty('#dataProposta')){fieldErrors+='- Data da Proposta<br/>';}
if(isEmpty('#seguradoraId')){fieldErrors+='- Seguradora<br/>';}
if(isEmpty('#ramoId')){fieldErrors+='- Ramo<br/>';}
if(!isEmpty('#pessoaFisicaId')){if(isEmpty('#clientePFNome')){fieldErrors+='- Nome do Segurado<br/>';}
if(isEmpty('#dataNascimento')){fieldErrors+='- Data de Nascimento do Segurado<br/>';}
if(isEmpty('#sexo')){fieldErrors+='- Sexo do Segurado<br/>';}
if(isEmpty('#rg')){fieldErrors+='- RG do Segurado<br/>';}
if(isEmpty('#orgaoEmissor')){fieldErrors+='- Órgão Emissor do RG do Segurado<br/>';}
if(isEmpty('#dataEmissao')){fieldErrors+='- Data de Emissão do RG do Segurado<br/>';}}else if(!isEmpty('#pessoaJuridicaId')){if(isEmpty('#clientePJNome')){fieldErrors+='- Nome do Segurado<br/>';}}else{msgErrors+='- Não existe um Seguradora cadastrado para essa Proposta<br/>';}
if(isEmpty('#telefonePreferencial')){fieldErrors+='- Telefone Preferencial do Segurado<br/>';}
if(isEmpty('#cepRes')){fieldErrors+='- CEP<br/>';}
if(isEmpty('#lograRes')){fieldErrors+='- Logradouro<br/>';}
if(isEmpty('#bairroRes')){fieldErrors+='- Bairro<br/>';}
if(isEmpty('#cidadeRes')){fieldErrors+='- Cidade<br/>';}
if(isEmpty('#ufRes')){fieldErrors+='- Estado<br/>';}
if($('#tableCoberturas input[id^="coberturaLmi"]').add('#percentualReferenciado').add('#valorCasco').not('[value=""]').not('[value="0,00"]').size()==0){msgErrors+='';}
if(isEmpty('#premioLiquido')){fieldErrors+='- Prêmio Líquido<br/>';}
if(isEmpty('#custoApolice')){fieldErrors+='- Custo da Apólice<br/>';}
if(isEmpty('#premioTotal')){fieldErrors+='- Prêmio Total<br/>';}
if(isEmpty('#fator')){fieldErrors+='- Fator<br/>';}
if(isEmpty('#inicioVigencia')){fieldErrors+='- Início Vigência<br/>';}
if(isEmpty('#terminoVigencia')){fieldErrors+='- Término Vigência<br/>';}
if(isEmpty('#formaPagamento1aParcela')){fieldErrors+='- Forma de Pagamento<br/>';}
if(isEmpty('#formaPagamento')&&$('quantParc').val()>1){fieldErrors+='- Forma de Pagamento<br/>';}
if(isEmpty('#quantParc')){fieldErrors+='- Quantidade de Parcelas<br/>';}
if(isEmpty('#tipoRecebimentoComissao')){fieldErrors+='- Tipo de Recebimento de Comissão<br/>';}else{if($('#tipoRecebimentoComissao').val()=='1'&&isEmpty('#descontaCustoApoliceIof')){fieldErrors+='- Desconta Custo Apólice e IOF<br/>';}else if($('#tipoRecebimentoComissao').val()=='2'&&isEmpty('#quantParcComissao')){fieldErrors+='- Quantidade de Parcelas de Comissão<br/>';}}
if(isEmpty('#grupoDeVendaId')){fieldErrors+='- Grupo de Venda da Proposta<br/>';}
if($('#tableComissionadoItens tr').length<2){msgErrors+='- Não existe nenhum comissionado cadastrado para essa proposta<br/>';}
if(isNaN(apolice))
msg="Validação do Pedido";else
msg=apolice;if(fieldErrors!=''){errors+='<b>Para a '+msg+', os seguintes campos devem ser preenchidos: </b><br/>'+fieldErrors;}
if(msgErrors!=''){errors+='<b>Existem condições pendentes que impossibilitam a '+msg+': </b><br/>'+msgErrors;}
if(errors!=''){$('div[id^="divMessagesTab"]').html('').html(errors);fieldErrors='';msgErrors='';errors='';return false;}
fieldErrors='';msgErrors='';errors='';return true;}
function checarReferencia(referencia){if(referencia!=""){var splitRef=referencia.split("/");var mesRef=splitRef[0];var anoRef=parseInt(splitRef[1]);var inicioVigencia=$('#inicioVigencia').val();var splitVigIni=inicioVigencia.split("/");var mesVigIni=splitVigIni[1];var anoVigIni=parseInt(splitVigIni[2]);var terminoVigencia=$('#terminoVigencia').val();var splitVigTer=terminoVigencia.split("/");var mesVigTer=splitVigTer[1];var anoVigTer=parseInt(splitVigTer[2]);var msg='';if(mesRef<mesVigIni&&anoRef==anoVigIni)
msg='Mês da referencia menor que inicio vigência';if(mesRef>mesVigTer&&anoRef==anoVigTer)
msg='Mês da referencia maior que término vigência';if(anoRef<anoVigIni)
msg='Ano da referencia menor que inicio vigência';if(anoRef>anoVigTer)
msg='Ano da referencia maior que término vigência';if(msg!=''){alert(msg);$('#referenciaParcela').val("");$('#referenciaParcela').focus();}}}
function validacaoGerarApolice(){if(isEmpty('#nroApolice')){fieldErrors+='- Numero da Apólice<br/>';}
if(isEmpty('#dataEmissaoApolice')){fieldErrors+='- Data de Emissão da Apólice<br/>';}
if(isEmpty('#dataRecebApolice')){fieldErrors+='- Data de Recebimento da Apólice<br/>';}
return validacaoGerarProposta("Gerar Apólice");}