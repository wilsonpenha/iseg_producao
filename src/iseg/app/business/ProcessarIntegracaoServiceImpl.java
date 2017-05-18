package iseg.app.business;

import iseg.app.constants.Constants;
import iseg.app.exception.GenericException;
import iseg.app.model.Corretora;
import iseg.app.model.EdiImportacaoAnexo;
import iseg.app.model.LoteImportacao;
import iseg.app.model.Seguradora;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectServiceImpl;
import iseg.utils.HibernateUtil;

import java.util.Date;
import java.util.List;

import javax.persistence.Query;

import org.springframework.scheduling.annotation.Scheduled;

public class ProcessarIntegracaoServiceImpl extends PObjectServiceImpl implements ProcessarIntegracaoService{
	
	private IntegracaoService integracaoService;
	
	@Scheduled(cron = "0 1/1 * * * ?")
	public void processarArquivoComissao() throws Exception {
		this.integracaoService = new BradescoIntegracaoServiceImpl(this.getHibernateSession(),this.getEntityManager(),this.getRequest());
		try{
			List<LoteImportacao> importacaoEdiArquivoList = this.genericFindByNamedQueryNoFilter("getLoteImportacaoBySituacao", new Object[]{new Integer(Constants.LOTE_IMPORTACAO_SITUACAO_IMPORTADO)});
			
			for(LoteImportacao importacaoEdiArquivo : importacaoEdiArquivoList){
				if(importacaoEdiArquivo.getSeguradora().getId().compareTo(Constants.SEGURADORA_BRADESCO_AGRUPADO) == 0){
					EdiImportacaoAnexo ediImportacaoAnexo = null;
					for(EdiImportacaoAnexo ediImportacaoAnexoObj : importacaoEdiArquivo.getEdiImportacaoAnexoCollection()){
						if(ediImportacaoAnexoObj.getTipoArquivo() == Constants.EDI_IMPORTACAO_ANEXO_TIPO_ARQUIVO_COMISSAO){
							ediImportacaoAnexo = ediImportacaoAnexoObj;
						}
					}
					if(ediImportacaoAnexo != null)
						this.integracaoService.processaArquivoComissao(importacaoEdiArquivo, ediImportacaoAnexo);
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	@Scheduled(cron = "0 0/1 * * * ?")
	public void processarArquivoEmissao() throws Exception {
		this.integracaoService = new BradescoIntegracaoServiceImpl(this.getHibernateSession(),this.getEntityManager(),this.getRequest());
		try{
			List<LoteImportacao> importacaoEdiArquivoList = this.genericFindByNamedQueryNoFilter("getLoteImportacaoBySituacao", new Object[]{new Integer(Constants.LOTE_IMPORTACAO_SITUACAO_IMPORTADO)});
			
			for(LoteImportacao importacaoEdiArquivo : importacaoEdiArquivoList){
				if(importacaoEdiArquivo.getSeguradora().getId().compareTo(Constants.SEGURADORA_BRADESCO_AGRUPADO) == 0){
					EdiImportacaoAnexo ediImportacaoAnexo = null;
					for(EdiImportacaoAnexo ediImportacaoAnexoObj : importacaoEdiArquivo.getEdiImportacaoAnexoCollection()){
						if(ediImportacaoAnexoObj.getTipoArquivo() == Constants.EDI_IMPORTACAO_ANEXO_TIPO_ARQUIVO_EMISSAO){
							ediImportacaoAnexo = ediImportacaoAnexoObj;
						}
					}
					if(ediImportacaoAnexo != null)
						this.integracaoService.processaArquivoEmissao(importacaoEdiArquivo, ediImportacaoAnexo);
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public List<EdiImportacaoAnexo> ediImportacaoAnexoListSearch(Seguradora seguradora, Date dataInicial, Date dataFinal, Integer tipo, Corretora corretora) throws GenericException{
		try{ 
			this.applyFilter();
			String strQuery = "FROM EdiImportacaoAnexo AS p WHERE(1=1) ";

			if(seguradora != null && seguradora.getId() != null){
				strQuery = strQuery.concat("AND p.loteImportacao.seguradora.id = :seguradoraId ");
			}
			if(dataInicial != null || dataFinal != null){
				strQuery = strQuery.concat("AND p.loteImportacao.dtInicioProcessamento >= :dtInicioProcessamento and p.loteImportacao.dtInicioProcessamento <= :dtFimProcessamento ");
			}
			if(tipo != null){
				strQuery = strQuery.concat("AND p.tipoArquivo = :tipoArquivo ");
			}
			
			strQuery = strQuery.concat("AND p.loteImportacao.corretora.id = :corretoraId ");
			
			Query query = getEntityManager().createQuery("SELECT p ".concat(strQuery));

			if(seguradora != null && seguradora.getId() != null){
				query.setParameter("seguradoraId", seguradora.getId());
			}
			if(dataInicial != null || dataFinal != null){
				query.setParameter("dtInicioProcessamento", dataInicial);
				query.setParameter("dtFimProcessamento", dataFinal);
			}
			if(tipo != null){
				query.setParameter("tipoArquivo", tipo);
			}
			query.setParameter("corretoraId", corretora.getId());
			
			List<EdiImportacaoAnexo> ediImportAnexoList = query.getResultList();
			for(EdiImportacaoAnexo ediImportacaoAnexo : ediImportAnexoList){
				LoteImportacao loteImportacao = HibernateUtil.initializeAndUnproxy(ediImportacaoAnexo.getLoteImportacao());
			}
			
			return ediImportAnexoList;
		}catch (Exception e) {
			throw new GenericException("Ocorreu uma falha no sistema.", e);
		}
	}
	
	public List<LoteImportacao> pesquisaLoteImportacao(Corretora corretora){
		this.applyFilter();
		String strQuery = "FROM LoteImportacao AS p WHERE p.corretora.id = :corretoraId ORDER BY p.id";
		
		Query query = getEntityManager().createQuery("SELECT p ".concat(strQuery));

		query.setParameter("corretoraId", corretora.getId());
		
		query.setMaxResults(10);
		
		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public <K extends PObject> List<K> genericFindByNamedQuery(String namedQuery, Object[] params){
		Query query = this.getEntityManager().createNamedQuery(namedQuery);
		if(params != null){
			for(int i=0 ; i<params.length ; i++){
				query.setParameter(i, params[i]);
			}
		}
		return query.getResultList();
	}

}