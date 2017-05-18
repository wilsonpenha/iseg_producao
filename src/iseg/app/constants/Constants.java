package iseg.app.constants;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

public class Constants {
	
	/** Eventos SMS */
	public static final Long SMS_EVT_ANIVERSARIANTE = 1L;
	public static final Long SMS_EVT_APOLICE_VENCIDA = 2L;
	public static final Long SMS_EVT_CNH_VENCIDA = 3L;
	public static final Long SMS_EVT_PROPOSTA_EFETIVADA = 4L;
	public static final Long SMS_EVT_APOLICE_EMITIDA = 5L;
	
	/** SMS Short-code */
	public static final String SMS_SC_PLACA = "PL";
	public static final String SMS_SC_CHASSIS = "CH";
	
	/** ID's exclusivos da aplicação */
	public static final Long MENU_ID_MENUS = 30531L;
	public static final Long MENU_ID_EVENTOS_SMS = 648820L;
	
	/** Versão Proposta **/
	public static final Integer VERSAO_PERIL_POR_SEGURADORA = 1;
	public static final Integer VERSAO_PERFIL_GENERICO = 2;
	
	/** Tipo Proposta **/
	public static final Long TP_PROP_COMUM = 1L;
	public static final Long TP_PROP_ENDOSSO_PROPRIO = 2L;
	public static final Long TP_PROP_ENDOSSO_CONGENERE = 3L;
	public static final Long TP_PROP_RENOVACAO_PROPRIA = 4L;
	public static final Long TP_PROP_RENOVACAO_CONGENERE = 5L;
	public static final Long TP_PROP_RENOVACAO_EXTERNA = 6L;

	public static Map<Long, String> getTipoPropostaMap(){
		Map<Long, String>map = new HashMap<Long, String>();

		map.put(TP_PROP_COMUM, "NOVA");
		map.put(TP_PROP_RENOVACAO_PROPRIA, "RENOVACAO ISEG");
		map.put(TP_PROP_RENOVACAO_EXTERNA, "RENOVACAO NAO ISEG");

		return map;
	}

	public static String getTipoPropostaDescricao(Long tipoProposta){
		String descricao = getTipoPropostaMap().get(tipoProposta);
		return descricao == null ? "" : descricao;
	}
	
	/** Status Orcamento **/
	public static final Long STATUS_ORCA_PEDIDO = 1L;
	public static final Long STATUS_ORCA_CALCULANDO  = 2L;
	public static final Long STATUS_ORCA_CALCULADO = 3L;
	public static final Long STATUS_ORCA_EFETIVADO = 4L;
	public static final Long STATUS_ORCA_VERSIONADO = 5L;
	public static final Long STATUS_ORCA_CANCELADO = 6L;
	
	public static Map<Long, String> getStatusOrcamento(){
		Map<Long, String>map = new HashMap<Long, String>();
		map.put(STATUS_ORCA_PEDIDO, "PEDIDO DE CALCULO");
		map.put(STATUS_ORCA_CALCULANDO, "CALCULANDO");
		map.put(STATUS_ORCA_CALCULADO, "CALCULADO");
		map.put(STATUS_ORCA_EFETIVADO, "EFETIVADO");
		map.put(STATUS_ORCA_VERSIONADO, "VERSIONADO");
		map.put(STATUS_ORCA_CANCELADO, "CANCELADO");
		
		return map;
	}
	
	public static String getStatusOrcamentoDescricao(Long statusOrcamento){
		String descricao = getStatusOrcamento().get(statusOrcamento);
		return descricao == null ? "" : descricao;
	}

	/** Ramo de Seguro **/
	public static final Long RAMO_AUTOMOVEL = 2L;
	public static final Long RAMO_IMOVEL = 3L;
	public static final Long RAMO_RISCO_DIVERSOS = 4L;
	public static final Long RAMO_VIDA_EMPRESARIAL = 5L;
	public static final Long RAMO_VIDA_INDIVIDUAL = 6L;
	public static final Long RAMO_RESIDENCIAL = 7L;
	public static final Long RAMO_EMPRESARIAL = 8L;
	public static final Long RAMO_CONDOMINIO = 9L;

	/** Ramo de Seguro p/ Transportes **/
	public static final Long RAMO_TRANSPORTES = 10L;
	public static final Long RAMO_RCTR_C = 11L;
	public static final Long RAMO_RCF_DC = 12L;
	public static final Long RAMO_RCTA_C = 13L;
	public static final Long RAMO_RCA_C = 14L;
	public static final Long RAMO_RCTF_C = 15L;

	/** Grupos de Ramos **/
	public static final Long RAMO_PATRIMONIAL = 20L;
	public static final Long RAMO_RISCO_FINANCEIRO = 40L;
	public static final Long RAMO_PESSOAS_INVIVIDUAL = 60L;
	public static final Long RAMO_PESSOAS_COLETIVO = 80L;
	public static final Long RAMO_RESPONSABILIDADES = 100L;

	/** ID Assessoria **/
	public static final Long ASSESSORIA_ID = 1L;

	/** Nome do ADMIN do sistema **/
	public static final String NOME_ADMIN = "ADMIN";

	/** Nome do usuario Gestor na Corretora (O mesmo pra todas as corretoras) **/
	public static final String NOME_GESTOR = "GESTOR";

	/** Tipo Documento Proposta **/
	public static final Long TP_DOCUMENTO_PROPOSTA = 4000L;

	/** Tipo Lançamento **/
	public static final String TP_LANC_AUTOMOVEL = "AUTOMOVEL";
	public static final String TP_LANC_IMOVEL = "IMOVEL";
	public static final String TP_LANC_VIDA = "VIDA";
	public static final String TP_LANC_VIDAEMP = "VIDAEMP";

	/** Status Operacional -  Em Ordem Cronológica**/
	public static final Long STATUS_OPER_PEDIDO = 0L;
	public static final Long STATUS_OPER_PEDIDO_VALIDO = 1L;
	public static final Long STATUS_OPER_PROPOSTA = 4L;
	public static final Long STATUS_OPER_APOLICE = 2L;
	public static final Long STATUS_OPER_PEDIDO_ENDOSSO = 5L;
	public static final Long STATUS_OPER_PEDIDO_ENDOSSO_VALIDO = 51L;
	public static final Long STATUS_OPER_PROPOSTA_ENDOSSO = 6L;
	public static final Long STATUS_OPER_ENDOSSO = 7L;
	public static final Long STATUS_OPER_PEDIDO_ENDOSSO_CANCELAMENTO = 8L;
	public static final Long STATUS_OPER_PEDIDO_ENDOSSO_CANCEL_VALIDO = 81L;
	public static final Long STATUS_OPER_PROPOSTA_ENDOSSO_CANCELAMENTO = 9L;
	public static final Long STATUS_OPER_ENDOSSO_CANCELAMENTO = 10L;
	public static final Long STATUS_OPER_PROPOSTA_EXCLUIDA = 99L;

	/** Situacao Operacional **/
	public static final Long SITUACAO_TODAS = -1L;
	public static final Long SITUACAO_ATIVA = 0L;
	public static final Long SITUACAO_CANCELADA = 1L;
	public static final Long SITUACAO_ENDOSSADA = 2L;
	public static final Long SITUACAO_RENOVADA = 3L;

	/** Operacao de Endosso ou Alteracao ou Cancelamento **/
	public static final Long OPERACAO_EDITAR_PROPOSTA = 0L;
	public static final Long OPERACAO_CANCELAR_PROPOSTA = 1L;
	public static final Long OPERACAO_ENDOSSO_CANCELAMENTO = 2L;
	public static final Long OPERACAO_ENDOSSO_ALTERACAO = 3L;
	public static final Long OPERACAO_CANCELAR_ENDOSSO = 4L;
	public static final Long OPERACAO_CANCELAR_ENDOSSO_CANCELAMENTO = 5L;
	public static final Long OPERACAO_CANCELAR_VALIDACAO_PEDIDO = 6L;

	/** Status PosVenda **/
	public static final Long ST_POSVENDA_TODOS = 0L;
	public static final Long ST_POSVENDA_EM_ABERTO = 1L;
	public static final Long ST_POSVENDA_BAIXADO = 2L;

	/** Tipo Protocolo **/
	public static final Long TIPO_PROTOCOLO_ENTRADA = 0L;
	public static final Long TIPO_PROTOCOLO_SAIDA = 1L;

	public static Map<Long, String> getTipoProtocoloMap(){
		Map<Long, String>map = new HashMap<Long, String>();

		map.put(TIPO_PROTOCOLO_ENTRADA, "ENTRADA");
		map.put(TIPO_PROTOCOLO_SAIDA, "SAIDA");

		return map;
	}

	public static String getTipoProtocoloDescricao(Long tipoProtocolo){
		String descricao = getStatusOperacionalMap().get(tipoProtocolo);
		return descricao == null ? "" : descricao;
	}

	public static Map<Long, String> getStatusOperacionalMap(){
		LinkedHashMap<Long, String>map = new LinkedHashMap<Long, String>();

		map.put(STATUS_OPER_PEDIDO, "PEDIDO");
		map.put(STATUS_OPER_PEDIDO_VALIDO, "PEDIDO VALIDADO");
		map.put(STATUS_OPER_PROPOSTA, "PROPOSTA");
		map.put(STATUS_OPER_APOLICE, "APOLICE");
		map.put(STATUS_OPER_PEDIDO_ENDOSSO, "PEDIDO DE ENDOSSO");
		map.put(STATUS_OPER_PEDIDO_ENDOSSO_VALIDO, "PEDIDO ENDOSSO VALIDADO");
		map.put(STATUS_OPER_PROPOSTA_ENDOSSO, "PROPOSTA DE ENDOSSO");
		map.put(STATUS_OPER_ENDOSSO, "ENDOSSO");
		map.put(STATUS_OPER_PEDIDO_ENDOSSO_CANCELAMENTO, "PED ENDOSSO CANCELAMENTO");
		map.put(STATUS_OPER_PEDIDO_ENDOSSO_CANCEL_VALIDO, "PED ENDOSSO CANCEL VALIDADO");
		map.put(STATUS_OPER_PROPOSTA_ENDOSSO_CANCELAMENTO, "PROP ENDOSSO CANCELAMENTO");
		map.put(STATUS_OPER_ENDOSSO_CANCELAMENTO, "ENDOSSO CANCELAMENTO");

		return map;
	}

	public static Map<Long, String> getSituacaoOperacionalMap(){
		Map<Long, String>map = new HashMap<Long, String>();

		map.put(SITUACAO_ATIVA, "ATIVO");
		map.put(SITUACAO_CANCELADA, "CANCELADO");
		map.put(SITUACAO_ENDOSSADA, "ENDOSSADO");
		map.put(SITUACAO_RENOVADA, "RENOVADO");
		map.put(SITUACAO_TODAS, "TODAS");

		return map;
	}

	public static Map<Long, String> getSituacaoOperacionalVencida(){
		Map<Long, String>map = new HashMap<Long, String>();

		map.put(SITUACAO_ATIVA, "VENCIDO");
		map.put(SITUACAO_CANCELADA, "VENCIDO");
		map.put(SITUACAO_ENDOSSADA, "VENCIDO");
		map.put(SITUACAO_RENOVADA, "RENOVADO");

		return map;
	}

	public static Map<Long, String> getStatusOperacionalBaixaMap(){
		Map<Long, String>map = new HashMap<Long, String>();

		map.put(STATUS_OPER_PROPOSTA, "PROPOSTA");
		map.put(STATUS_OPER_APOLICE, "APOLICE");
		map.put(STATUS_OPER_PEDIDO_ENDOSSO, "PEDIDO DE ENDOSSO");
		map.put(STATUS_OPER_PROPOSTA_ENDOSSO, "PROPOSTA DE ENDOSSO");
		map.put(STATUS_OPER_ENDOSSO, "ENDOSSO");
		map.put(STATUS_OPER_PEDIDO_ENDOSSO_CANCELAMENTO, "PED ENDOSSO CANCELAMENTO");
		map.put(STATUS_OPER_PROPOSTA_ENDOSSO_CANCELAMENTO, "PROP ENDOSSO CANCELAMENTO");
		map.put(STATUS_OPER_ENDOSSO_CANCELAMENTO, "ENDOSSO CANCELAMENTO");

		return map;
	}

	public static Map<Long, String> getOperacaoEndossoMap(){
		Map<Long, String>map = new HashMap<Long, String>();

		map.put(OPERACAO_EDITAR_PROPOSTA, "EDITAR PEDIDO");
		map.put(OPERACAO_CANCELAR_PROPOSTA, "CANCELAR PEDIDO");
		map.put(OPERACAO_ENDOSSO_CANCELAMENTO, "ENDOSSO DE CANCELAMENTO");
		map.put(OPERACAO_ENDOSSO_ALTERACAO, "ENDOSSO DE ALTERAÇÃO");
		map.put(OPERACAO_CANCELAR_ENDOSSO, "CANCELAR ENDOSSO");

		return map;
	}

	public static String getStatusOperacionalDescricao(Long statusOperacional){
		String descricao = getStatusOperacionalMap().get(statusOperacional);
		return descricao == null ? "" : descricao;
	}

	public static String getSituacaoOperacionalDescricao(Long situacaoOperacional){
		String descricao = getSituacaoOperacionalMap().get(situacaoOperacional);
		return descricao == null ? "" : descricao;
	}

	/** Tipo de Recebimento Comissão **/
	// Recebimento a vista
	public static final Long TP_RECEB_COM_ANTECIPADA = 0L;
	// Recebimento no fluxo
	public static final Long TP_RECEB_COM_FLUXO = 1L;
	// Recebimento parcelado
	public static final Long TP_RECEB_COM_PARCELADO = 2L;

	public static Map<Long, String> getTipoRecebimentoComissaoMap(){
		Map<Long, String>map = new HashMap<Long, String>();

		map.put(TP_RECEB_COM_ANTECIPADA, "ANTECIPADA");
		map.put(TP_RECEB_COM_FLUXO, "NO FLUXO");
		map.put(TP_RECEB_COM_PARCELADO, "PARCELADA");

		return map;
	}

	public static String getTipoRecebimentoComissaoDescricao(Long recebimentoComissao){
		String descricao = getTipoRecebimentoComissaoMap().get(recebimentoComissao);
		return descricao == null ? "" : descricao;
	}

	/** Tipo de lancamento no Lote **/
	public static final Integer TP_LOTE_COMISSAO = 0;
	public static final Integer TP_LOTE_BONUS = 1;
	public static final Integer TP_LOTE_ISS = 2;
	public static final Integer TP_LOTE_IR = 3;
	public static final Integer TP_LOTE_ESTORNO = 4;
	public static final Integer TP_LOTE_AGENCIAMENTO = 5;
	public static final Integer TP_LOTE_ESTORNO_AGENC = 6;
	public static final Integer TP_LOTE_VISTORIA_IMPRODUTIVA = 7;
	public static final Integer TP_LOTE_CUSTO_APOLICE = 8;

	public static Map<Integer, String> getTipoLancamentoLoteMap(){
		Map<Integer, String>map = new HashMap<Integer, String>();

		map.put(TP_LOTE_COMISSAO, "COMISSAO");
		map.put(TP_LOTE_BONUS, "BONUS");
		map.put(TP_LOTE_ISS, "ISS");
		map.put(TP_LOTE_IR, "IR");
		map.put(TP_LOTE_ESTORNO, "ESTORNO");
		map.put(TP_LOTE_AGENCIAMENTO, "AGENCIAMENTO");
		map.put(TP_LOTE_ESTORNO_AGENC, "ESTORNO-AGENC");
		map.put(TP_LOTE_VISTORIA_IMPRODUTIVA, "VISTORIA IMPRODUTIVA");
		map.put(TP_LOTE_CUSTO_APOLICE, "CUSTO DE APOLICE");

		return map;
	}

	public static String getTipoLancamentoLoteDescricao(Integer tipoLancamentoLote){
		String descricao = getTipoLancamentoLoteMap().get(tipoLancamentoLote);
		return descricao == null ? "" : descricao;
	}

	/** Tipo de Comissão **/
	// Percentual sobre percentual da Comissão
	public static final Long TP_COM_PERC_SOBRE_COMISSAO = 0L;
	// Percentual sobre Premio Liquido
	public static final Long TP_COM_PERC_SOBRE_PREMIO_LIQ = 1L;
	// Valor fixo 
	public static final Long TP_COM_VALOR = 2L;

	public static Map<Long, String> getTipoComissaoMap(){
		Map<Long, String>map = new HashMap<Long, String>();

		map.put(TP_COM_PERC_SOBRE_COMISSAO, "SOBRE COMISSAO");
		map.put(TP_COM_PERC_SOBRE_PREMIO_LIQ, "SOBRE PREMIO LIQUIDO");
		map.put(TP_COM_VALOR, "VALOR FIXO");

		return map;
	}

	public static String getTipoComissaoDescricao(Long tipoComissao){
		String descricao = getTipoComissaoMap().get(tipoComissao);
		return descricao == null ? "" : descricao;
	}
	
	public static final Long ID_ASSESSORIA = 8000L;
	// Tipo de lancamento na PropostaComissao/Origem de lancamento no Repasse
	public static final Integer TP_LANCAMENTO_AUTOMATICO = 0;
	public static final Integer TP_LANCAMENTO_MANUAL = 1;
	
	// Tipo de lancamento no Repasse
	public static final Integer TP_LANCAMENTO_DEBITO = 0;
	public static final Integer TP_LANCAMENTO_CREDITO = 1;
	public static final Integer TP_LANCAMENTO_ESTORNO = 2;

	// Situacao do Lote de baixa de comissao
	public static final Integer ST_LOTE_EM_ABERTO = 0;
	public static final Integer ST_LOTE_FECHADO = 1;
	public static final Integer ST_LOTE_ESTORNADO = 2;
	public static final Integer ST_LOTE_DE_ESTORNO = 3;

	public static Map<Integer, String> getSituacaoLoteMap(){
		Map<Integer, String>map = new HashMap<Integer, String>();

		map.put(ST_LOTE_EM_ABERTO, "LOTE EM ABERTO");
		map.put(ST_LOTE_FECHADO, "LOTE FECHADO");
		map.put(ST_LOTE_ESTORNADO, "LOTE ESTORNADO");
		map.put(ST_LOTE_DE_ESTORNO, "LOTE DE ESTORNO");
		map.put(-1, "TODOS");

		return map;
	}

	public static String getSituacaoLoteDescricao(Integer situacaoLote){
		String descricao = getSituacaoLoteMap().get(situacaoLote);
		return descricao == null ? "" : descricao;
	}

	// Situacao de lancamento na PropostaComissao/Comissionado/Repasse
	public static final Integer ST_EM_ABERTO = 0;
	public static final Integer ST_BAIXA_PARCIAL = 1;
	public static final Integer ST_BAIXADO = 2;
	public static final Integer ST_CANCELAMENTO = 3;
	public static final Integer ST_ESTORNO = 4;
	
	// Natureza de lancamentos na PropostaComissao
	public static final Integer NT_COMISSAO = 0;
	public static final Integer NT_BAIXA = 1;
	public static final Integer NT_ESTORNO = 2;
	public static final Integer NT_COMISSAO_CANCELAMENTO = 3;
	public static final Integer NT_ESTORNO_CANCELAMENTO = 4;
	public static final Integer NT_AGENCIAMENTO = 5;
	public static final Integer NT_AGENCIAMENTO_CANCELAMENTO = 6;
	public static final Integer NT_BAIXA_AGENCIAMENTO = 7;
	public static final Integer NT_ESTORNO_AGENCIAMENTO = 8;
	public static final Integer NT_ESTORNO_AGENCIAMENTO_CANCELAMENTO = 9;
	

	/** Forma Pagamento**/
	public static final Long FORMA_PAG_CARTAO_CREDITO = 2L;
	public static final Long FORMA_PAG_CARNET = 3L;
	public static final Long FORMA_PAG_DEBITO_CONTA = 4L;
	public static final Long FORMA_PAG_CHEQUE = 5L;

	public static Map<Long, String> getFormaPagamentoMap(){
		Map<Long, String>map = new HashMap<Long, String>();

		map.put(FORMA_PAG_CARNET, "CARNET");
		map.put(FORMA_PAG_CARTAO_CREDITO, "CARTAO DE CREDITO");
		map.put(FORMA_PAG_CHEQUE, "CHEQUE");
		map.put(FORMA_PAG_DEBITO_CONTA, "DEBITO EM CONTA");

		return map;
	}

	public static String getFormaPagamentoDescricao(Long formaPagamento){
		String descricao = getFormaPagamentoMap().get(formaPagamento);
		return descricao == null ? "" : descricao;
	}
	
	/** Tipo de Cliente **/
	public static final Integer CLIENTE_PF = 0;
	public static final Integer CLIENTE_PJ = 1;
	
	/** Status Usuario Ativo/Inativo **/
	public static final String USUARIO_ATIVO = "ATIVO";
	public static final String USUARIO_INATIVO = "INATIVO";
	
	/** Frequencia Pagamento**/
	public static final Long FREQUENCIA_PAGTO_MENSAL = 1L; // Gerar 12 parceals
	public static final Long FREQUENCIA_PAGTO_BIMESTRAL = 2L; // Gerar 6 parcelas
	public static final Long FREQUENCIA_PAGTO_TRIMESTRAL = 3L; // Gerar 4 parcelas
	public static final Long FREQUENCIA_PAGTO_QUADRIMESTRAL = 4L; // Gerar 3 parcelas
	public static final Long FREQUENCIA_PAGTO_SEMESTRAL = 6L; // Gerar 2 parcelas
	public static final Long FREQUENCIA_PAGTO_ANUAL = 12L; // Gerar 1 parcelas

	public static Map<Long, String> getFrequenciaPagamentoMap(){
		Map<Long, String>map = new HashMap<Long, String>();

		map.put(FREQUENCIA_PAGTO_MENSAL, "MENSAL");
		map.put(FREQUENCIA_PAGTO_BIMESTRAL, "BIMESTRAL");
		map.put(FREQUENCIA_PAGTO_TRIMESTRAL, "TRIMESTRAL");
		map.put(FREQUENCIA_PAGTO_QUADRIMESTRAL, "QUADRIMESTRAL");
		map.put(FREQUENCIA_PAGTO_SEMESTRAL, "SEMESTRAL");
		map.put(FREQUENCIA_PAGTO_ANUAL, "ANUAL");

		return map;
	}

	/** Situação da Cotação**/
	public static final Long COTACAO_ABERTA = 1L;
	public static final Long COTACAO_FECHADA_COM_VENDA = 2L;
	public static final Long COTACAO_FECHADA_SEM_VENDA = 3L;
	public static final Long COTACAO_CANCELADA = 4L;

	public static Map<Long, String> getSituacaoCotacaoMap(){
		Map<Long, String>map = new HashMap<Long, String>();

		map.put(COTACAO_ABERTA, "ABERTA");
		map.put(COTACAO_FECHADA_COM_VENDA, "FECHADA COM VENDA");
		map.put(COTACAO_FECHADA_SEM_VENDA, "FECHADA SEM VENDA");
		map.put(COTACAO_CANCELADA, "CANCELADA");

		return map;
	}
	public static String getSituacaoCotacaoDescricao(Long situacaoCotacao){
		String descricao = getSituacaoCotacaoMap().get(situacaoCotacao);
		return descricao == null ? "" : descricao;
	}
	
	
	/** Configuração de E-mail */
	public static final Long TIPO_MENSAGEM_ORCAMENTO = 1L;
	public static final Integer TEMPLATE_INMIDIA_EMAIL =1;
	public static final Integer TEMPLATE_INMIDIA_SMS = 2;
	
	
	/** Principais Seguradoras Arquivos Importação */
	public static final Long SEGURADORA_BRADESCO_AGRUPADO = 15343L;
	public static final Integer EDI_IMPORTACAO_ANEXO_TIPO_ARQUIVO_COMISSAO = 0;
	public static final Integer EDI_IMPORTACAO_ANEXO_TIPO_ARQUIVO_EMISSAO = 1;
	
	public static Map<Integer, String> getTipoLoteImportacao(){
		Map<Integer, String>map = new HashMap<Integer, String>();
		map.put(EDI_IMPORTACAO_ANEXO_TIPO_ARQUIVO_COMISSAO, "Comissão");
		map.put(EDI_IMPORTACAO_ANEXO_TIPO_ARQUIVO_EMISSAO, "Seguro Emitido");
		return map;
	}
	
	public static String getTipoLoteImportacaoDescricao(Integer tipoLoteImportacao){
		String descricao = getTipoLoteImportacao().get(tipoLoteImportacao);
		return descricao == null ? "" : descricao;
	}
	
	public static final Integer LOTE_IMPORTACAO_SITUACAO_IMPORTADO = 0;
	public static final Integer LOTE_IMPORTACAO_SITUACAO_PROCESSADO = 1;
	
	public static Map<Integer, String> getSituacaoImportacao(){
		Map<Integer, String>map = new HashMap<Integer, String>();
		map.put(LOTE_IMPORTACAO_SITUACAO_IMPORTADO, "Importado");
		map.put(LOTE_IMPORTACAO_SITUACAO_PROCESSADO, "Processado");
		return map;
	}
	
	public static String getSituacaoImportacaoDescricao(Integer situacaoImportacao){
		String descricao = getSituacaoImportacao().get(situacaoImportacao);
		return descricao == null ? "" : descricao;
	}
	
	
	/** Situação da BorderoLançamento**/
	public static final Integer ST_BORDERO_LANCAMENTO_NULO = null;
	public static final Integer ST_BORDERO_LANCAMENTO_PENDENTE = 0;
	public static final Integer ST_BORDERO_LANCAMENTO_NAO_IDENTIFICADO = 1;
	public static final Integer ST_BORDERO_LANCAMENTO_BAIXADO = 2;

	public static Map<Integer, String> getSituacaoBorderoLancamento(){
		Map<Integer, String>map = new HashMap<Integer, String>();

		map.put(ST_BORDERO_LANCAMENTO_NULO, "Nulo");
		map.put(ST_BORDERO_LANCAMENTO_PENDENTE, "Pendente");
		map.put(ST_BORDERO_LANCAMENTO_NAO_IDENTIFICADO, "Não Identificado");
		map.put(ST_BORDERO_LANCAMENTO_BAIXADO, "Baixado");

		return map;
	}
	public static String getSituacaoCotacaoDescricao(Integer situacaoBorderoLancamento){
		String descricao = getSituacaoBorderoLancamento().get(situacaoBorderoLancamento);
		return descricao == null ? "" : descricao;
	}
	
	
}