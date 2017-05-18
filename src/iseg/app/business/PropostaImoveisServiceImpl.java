package iseg.app.business;

import iseg.app.exception.GenericException;
import iseg.app.model.Imovel;
import iseg.app.model.ImovelCobertura;
import iseg.app.model.ImovelServicos;
import iseg.app.model.Proposta;
import iseg.app.model.PropostaEndereco;
import iseg.app.persistence.PObject;
import iseg.utils.Util;

import java.util.List;

import javax.persistence.Query;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
public class PropostaImoveisServiceImpl extends PropostaServiceImpl implements PropostaImoveisService {

	public List<PObject> findAll(int page, int pageSize) throws Exception {

		return genericFindByNamedQuery("getProposta", null, page, pageSize);
	}

	@SuppressWarnings("unchecked")
	public List<PObject> findAll() throws Exception {
		return (List<PObject>)genericFindByNamedQuery("getProposta", null);
	}

	public void saveNoRefresh(PObject pobject) throws Exception {
		try{
			if (pobject.getId() == null) {
				// new
				this.save(pobject);
			} else {
				// update
				this.save(pobject);
			}
		}catch (Exception e) {
			throw new GenericException("Ocorreu uma falha no sistema.", e);
		}
	}

	@SuppressWarnings("unchecked")
	public List<Proposta> getPropostasForSearch(Proposta proposta, Integer page, Integer pageSize) {

		String strQuery = "from Proposta p where (1=1) ";

		if(proposta.getDataProposta() != null){
			strQuery += "and p.dataProposta = :dataProposta ";
		}
		if(proposta.getNumero() != null){
			strQuery += "and p.numero = :numero ";
		}
		if(proposta.getNroPropostaSeg() != null && !proposta.getNroPropostaSeg().equals("")){
			strQuery += "and p.nroPropostaSeg = :nroPropostaSeg ";
		}
		if(proposta.getCliente() != null && proposta.getCliente().getId() != null){
			strQuery += "and p.cliente.id = :clienteId ";
		}
		if(proposta.getSeguradora() != null && proposta.getSeguradora().getId() != null){
			strQuery += "and p.seguradora.id = :seguradoraId ";
		}
		if(proposta.getDataVencim1aParcela() != null){
			strQuery += "and p.dataVencim1aParcela = :dataVencim1aParcela ";
		}
		if(proposta.getStatusOperacional() != null && !proposta.getStatusOperacional().equals("")){
			strQuery += "and p.statusOperacional = :statusOperacional ";
		}
		if(proposta.getRamo() != null && proposta.getRamo().getId() != null){
			strQuery += "and p.ramo.id = :ramoId ";
		}

		strQuery += " ORDER BY p.cliente.nome ";

		Query query = this.getEntityManager().createQuery("select p "+strQuery);

		if(proposta.getNumero() != null){
			query.setParameter("numero", proposta.getNumero());
		}
		if(proposta.getDataProposta() != null){
			query.setParameter("dataProposta", proposta.getDataProposta());
		}
		if(proposta.getNroPropostaSeg() != null && !proposta.getNroPropostaSeg().equals("")){
			query.setParameter("nroPropostaSeg", proposta.getNroPropostaSeg());
		}
		if(proposta.getCliente() != null && proposta.getCliente().getId() != null){
			query.setParameter("clienteId", proposta.getCliente().getId());
		}
		if(proposta.getSeguradora() != null && proposta.getSeguradora().getId() != null){
			query.setParameter("seguradoraId", proposta.getSeguradora().getId());
		}
		if(proposta.getDataVencim1aParcela() != null){
			query.setParameter("dataVencim1aParcela", proposta.getDataVencim1aParcela());
		}
		if(proposta.getStatusOperacional() != null && !proposta.getStatusOperacional().equals("")){
			query.setParameter("statusOperacional", proposta.getStatusOperacional());
		}
		if(proposta.getRamo() != null && proposta.getRamo().getId() != null){
			query.setParameter("ramoId", proposta.getRamo().getId());
		}

		query.setFirstResult(page*pageSize);
		query.setMaxResults(pageSize);

		return query.getResultList();
	}

	// TODO: Tirar isso daqui depois!!
	public Long getCountPropostasForSearch(Proposta proposta) {

		String strQuery = "from Proposta p where (1=1) ";

		if(proposta.getNumero() != null){
			strQuery += "and p.numero = :numero ";
		}
		if(proposta.getDataProposta() != null){
			strQuery += "and p.dataProposta = :dataProposta ";
		}
		if(proposta.getNroPropostaSeg() != null && !proposta.getNroPropostaSeg().equals("")){
			strQuery += "and p.nroPropostaSeg = :nroPropostaSeg ";
		}
		if(proposta.getCliente() != null && proposta.getCliente().getId() != null){
			strQuery += "and p.cliente.id = :clienteId ";
		}
		if(proposta.getSeguradora() != null && proposta.getSeguradora().getId() != null){
			strQuery += "and p.seguradora.id = :seguradoraId ";
		}
		if(proposta.getDataVencim1aParcela() != null){
			strQuery += "and p.dataVencim1aParcela = :dataVencim1aParcela ";
		}
		if(proposta.getStatusOperacional() != null && !proposta.getStatusOperacional().equals("")){
			strQuery += "and p.statusOperacional = :statusOperacional ";
		}
		if(proposta.getRamo() != null && proposta.getRamo().getId() != null){
			strQuery += "and p.ramo.id = :ramoId ";
		}

		strQuery += " ";

		Query queryCount = this.getEntityManager().createQuery("select count(*) "+strQuery);

		if(proposta.getNumero() != null){
			queryCount.setParameter("numero", proposta.getNumero());
		}
		if(proposta.getDataProposta() != null){
			queryCount.setParameter("dataProposta", proposta.getDataProposta());
		}
		if(proposta.getNroPropostaSeg() != null && !proposta.getNroPropostaSeg().equals("")){
			queryCount.setParameter("nroPropostaSeg", proposta.getNroPropostaSeg());
		}
		if(proposta.getCliente() != null && proposta.getCliente().getId() != null){
			queryCount.setParameter("clienteId", proposta.getCliente().getId());
		}
		if(proposta.getSeguradora() != null && proposta.getSeguradora().getId() != null){
			queryCount.setParameter("seguradoraId", proposta.getSeguradora().getId());
		}
		if(proposta.getDataVencim1aParcela() != null){
			queryCount.setParameter("dataVencim1aParcela", proposta.getDataVencim1aParcela());
		}
		if(proposta.getStatusOperacional() != null && !proposta.getStatusOperacional().equals("")){
			queryCount.setParameter("statusOperacional", proposta.getStatusOperacional());
		}
		if(proposta.getRamo() != null && proposta.getRamo().getId() != null){
			queryCount.setParameter("ramoId", proposta.getRamo().getId());
		}

		return (Long)queryCount.getSingleResult();
	}

	@Override
	public void copyDadosProposta(Proposta propostaEndossada, Proposta proposta) throws Exception{
		if(propostaEndossada.getPropostaEnderecoCollection() != null){
			PropostaEndereco propostaEnderecoTmp = null;
			for(PropostaEndereco propostaEndereco : propostaEndossada.getPropostaEnderecoCollection()){
				propostaEnderecoTmp = (PropostaEndereco)Util.cloneBean(propostaEndereco, "id", "proposta");
				propostaEnderecoTmp.setProposta(proposta);
				this.save(propostaEnderecoTmp);
				proposta.getPropostaEnderecoCollection().add(propostaEnderecoTmp);
			}
		}

		if(propostaEndossada.getImovelCollection() != null){
			Imovel imovelTmp = null;
			for(Imovel imovel : propostaEndossada.getImovelCollection()){
				if (!imovel.getLinhaVazia()){
					imovelTmp = (Imovel)Util.cloneBean(imovel, "id", "proposta");
					imovelTmp.setProposta(proposta);
					this.save(imovelTmp);
					proposta.getImovelCollection().add(imovelTmp);

					if (proposta.getSeguradora().getId().equals(propostaEndossada.getSeguradora().getId())){
						if(imovel.getImovelCoberturaCollection() != null){
							ImovelCobertura imovelCoberturaTmp = null;
							for(ImovelCobertura imovelCobertura : imovel.getImovelCoberturaCollection()){
								imovelCoberturaTmp = (ImovelCobertura)Util.cloneBean(imovelCobertura, "id", "imovel","sequencia");
								imovelCoberturaTmp.setImovel(imovelTmp);
								this.save(imovelCoberturaTmp);
								imovelTmp.getImovelCoberturaCollection().add(imovelCoberturaTmp);
							}
						}
					}

					if (proposta.getSeguradora().getId().equals(propostaEndossada.getSeguradora().getId())){
						if(imovel.getImovelServicosCollection() != null){
							ImovelServicos imovelServicoTmp = null;
							for(ImovelServicos imovelServico : imovel.getImovelServicosCollection()){
								imovelServicoTmp = (ImovelServicos)Util.cloneBean(imovelServico, "id", "imovel","sequencia");
								imovelServicoTmp.setImovel(imovelTmp);
								this.save(imovelServicoTmp);
								imovelTmp.getImovelServicosCollection().add(imovelServicoTmp);
							}
						}
					}
				}
			}
		}
	}
}