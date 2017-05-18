package iseg.app.business;

import iseg.app.exception.GenericException;
import iseg.app.model.Automovel;
import iseg.app.model.Proposta;
import iseg.app.model.Protocolo;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectServiceImpl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import javax.persistence.Query;

import org.springframework.stereotype.Service;


@Service
public class ProtocoloServiceImpl extends PObjectServiceImpl implements ProtocoloService {

	@PersistenceContext(type = PersistenceContextType.TRANSACTION)
	private EntityManager localEM = this.getEntityManager();
	
	public List<PObject> findAll(int page, int pageSize) throws Exception {
		return genericFindByNamedQuery("getProtocolo", null, page, pageSize);
	}

	@SuppressWarnings("unchecked")
	public List<PObject> findAll() throws Exception {
		return (List<PObject>)genericFindByNamedQuery("getProtocolo", null);
	}
	
	@SuppressWarnings("unchecked")
	public List<Protocolo> getProtocoloForSearch(Protocolo protocolo, Proposta proposta, Integer page, Integer pageSize, Long statusProtocolo) throws Exception {

		try{ 
			this.applyFilter();
			String strQuery = "from Protocolo as pr left outer join pr.protocoloItensCollection as pi left outer join pi.proposta as p left outer join p.propostaAutomovelCollection pa left outer join pa.automovel a left outer join p.grupoDeVenda gv "+
			"where 1=1 ";

			if(proposta.getNumero() != null){
				strQuery += "and p.numero = :numero ";
			}
			if(proposta.getNroApolice() != null && !proposta.getNroApolice().isEmpty()){
				strQuery += "and p.nroApolice = :nroApolice ";
			}
			if(proposta.getCliente() != null && proposta.getCliente().getId() != null){
				strQuery += "and p.cliente.id = :clienteId ";
			}
			if(proposta.getGrupoDeVenda() != null && proposta.getGrupoDeVenda().getId() != null){
				strQuery += "and p.grupoDeVenda.id = :grupoDeVendaId ";
			}
			if(proposta.getCliente() != null && proposta.getCliente().getNome() != null && !proposta.getCliente().getNome().equals("")){
				strQuery += "and p.cliente.nome = :clienteNome ";
			}
			if(proposta.getCliente() != null && proposta.getCliente().getCpfOuCnpj() != null && !proposta.getCliente().getCpfOuCnpj().equals("")){
				strQuery += "and p.cliente.cpfOuCnpj = :clienteCpfOuCnpj ";
			}
			if(proposta.getSeguradora() != null && proposta.getSeguradora().getId() != null){
				strQuery += "and p.seguradora.id = :seguradoraId ";
			}
			if(proposta.getStatusOperacional() != null && !proposta.getStatusOperacional().equals("")){
				strQuery += "and p.statusOperacional = :statusOperacional ";
			}	
			if(protocolo.getTipoProtocolo() != null){
				strQuery += "and pr.tipoProtocolo = :tipoProtocolo ";
			}
			if(protocolo.getNumero() != null){
				strQuery += "and pr.numero = :protocoloNumero ";
			}
			if(protocolo.getDestinoOrigem() != null){
				strQuery += "and pr.destinoOrigem = :destinoOrigem ";
			}
			if(proposta.getAutomovelWizCollection() != null && !proposta.getAutomovelWizCollection().isEmpty()){
				Automovel automovel = proposta.getAutomovelWizCollection().get(0);
				if(automovel.getNroPlaca() != null && !automovel.getNroPlaca().equals("")){
					strQuery += "and a.nroPlaca = :nroPlaca ";
				}
			}

			strQuery += " ORDER BY pr.dataAbertura desc ";

			Query query = localEM.createQuery("select distinct pr "+strQuery);

			if(proposta.getNumero() != null){
				query.setParameter("numero", proposta.getNumero());
			}
			if(proposta.getNroApolice() != null && !proposta.getNroApolice().isEmpty()){
				query.setParameter("nroApolice", proposta.getNroApolice());
			}
			if(proposta.getCliente() != null && proposta.getCliente().getId() != null){
				query.setParameter("clienteId", proposta.getCliente().getId());
			}
			if(proposta.getGrupoDeVenda() != null && proposta.getGrupoDeVenda().getId() != null){
				query.setParameter("grupoDeVendaId", proposta.getGrupoDeVenda().getId());
			}
			if(proposta.getCliente() != null && proposta.getCliente().getNome() != null && !proposta.getCliente().getNome().equals("")){
				query.setParameter("clienteNome", proposta.getCliente().getNome().trim());
			}
			if(proposta.getCliente() != null && proposta.getCliente().getCpfOuCnpj() != null && !proposta.getCliente().getCpfOuCnpj().equals("")){
				query.setParameter("clienteCpfOuCnpj", proposta.getCliente().getCpfOuCnpj());
			}
			if(proposta.getSeguradora() != null && proposta.getSeguradora().getId() != null){
				query.setParameter("seguradoraId", proposta.getSeguradora().getId());
			}
			if(protocolo.getTipoProtocolo() != null){
				query.setParameter("tipoProtocolo", proposta.getStatusOperacional());
			}
			if(protocolo.getNumero() != null){
				query.setParameter("protocoloNumero", protocolo.getNumero());
			}
			if(protocolo.getDestinoOrigem() != null){
				query.setParameter("destinoOrigem", protocolo.getDestinoOrigem());
			}
			if(proposta.getAutomovelWizCollection() != null && !proposta.getAutomovelWizCollection().isEmpty()){
				Automovel automovel = proposta.getAutomovelWizCollection().get(0);
				if(automovel.getNroPlaca() != null && !automovel.getNroPlaca().equals("")){
					query.setParameter("nroPlaca", automovel.getNroPlaca());
				}
			}

			query.setFirstResult(page*pageSize);
			query.setMaxResults(pageSize);

			return query.getResultList();

		}catch (Exception e) {
			throw new GenericException("Ocorreu uma falha no sistema.", e);
		}
	}

	// TODO: Alterar a forma de contar os registros!!
	public Long getCountProtocoloForSearch(Protocolo protocolo, Proposta proposta, Long statusProtocolo) throws Exception {

		try{

			this.applyFilter();
			String strQuery = "from Protocolo as pr left outer join pr.protocoloItensCollection as pi left outer join pi.proposta as p left outer join p.propostaAutomovelCollection pa left outer join pa.automovel a left outer join p.grupoDeVenda gv "+
			"where 1=1 ";

			if(proposta.getNumero() != null){
				strQuery += "and p.numero = :numero ";
			}
			if(proposta.getNroApolice() != null && !proposta.getNroApolice().isEmpty()){
				strQuery += "and p.nroApolice = :nroApolice ";
			}
			if(proposta.getCliente() != null && proposta.getCliente().getId() != null){
				strQuery += "and p.cliente.id = :clienteId ";
			}
			if(proposta.getGrupoDeVenda() != null && proposta.getGrupoDeVenda().getId() != null){
				strQuery += "and p.grupoDeVenda.id = :grupoDeVendaId ";
			}
			if(proposta.getCliente() != null && proposta.getCliente().getNome() != null && !proposta.getCliente().getNome().equals("")){
				strQuery += "and p.cliente.nome = :clienteNome ";
			}
			if(proposta.getCliente() != null && proposta.getCliente().getCpfOuCnpj() != null && !proposta.getCliente().getCpfOuCnpj().equals("")){
				strQuery += "and p.cliente.cpfOuCnpj = :clienteCpfOuCnpj ";
			}
			if(proposta.getSeguradora() != null && proposta.getSeguradora().getId() != null){
				strQuery += "and p.seguradora.id = :seguradoraId ";
			}
			if(proposta.getStatusOperacional() != null && !proposta.getStatusOperacional().equals("")){
				strQuery += "and p.statusOperacional = :statusOperacional ";
			}	
			if(protocolo.getTipoProtocolo() != null){
				strQuery += "and pr.tipoProtocolo = :tipoProtocolo ";
			}
			if(protocolo.getNumero() != null){
				strQuery += "and pr.numero = :protocoloNumero ";
			}
			if(protocolo.getDestinoOrigem() != null){
				strQuery += "and pr.destinoOrigem = :destinoOrigem ";
			}
			if(proposta.getAutomovelWizCollection() != null && !proposta.getAutomovelWizCollection().isEmpty()){
				Automovel automovel = proposta.getAutomovelWizCollection().get(0);
				if(automovel.getNroPlaca() != null && !automovel.getNroPlaca().equals("")){
					strQuery += "and a.nroPlaca = :nroPlaca ";
				}
			}

			Query queryCount = localEM.createQuery("select count(distinct pr.id) "+strQuery);

			if(proposta.getNumero() != null){
				queryCount.setParameter("numero", proposta.getNumero());
			}
			if(proposta.getNroApolice() != null && !proposta.getNroApolice().isEmpty()){
				queryCount.setParameter("nroApolice", proposta.getNroApolice());
			}
			if(proposta.getCliente() != null && proposta.getCliente().getId() != null){
				queryCount.setParameter("clienteId", proposta.getCliente().getId());
			}
			if(proposta.getGrupoDeVenda() != null && proposta.getGrupoDeVenda().getId() != null){
				queryCount.setParameter("grupoDeVendaId", proposta.getGrupoDeVenda().getId());
			}
			if(proposta.getCliente() != null && proposta.getCliente().getNome() != null && !proposta.getCliente().getNome().equals("")){
				queryCount.setParameter("clienteNome", proposta.getCliente().getNome().trim());
			}
			if(proposta.getCliente() != null && proposta.getCliente().getCpfOuCnpj() != null && !proposta.getCliente().getCpfOuCnpj().equals("")){
				queryCount.setParameter("clienteCpfOuCnpj", proposta.getCliente().getCpfOuCnpj());
			}
			if(proposta.getSeguradora() != null && proposta.getSeguradora().getId() != null){
				queryCount.setParameter("seguradoraId", proposta.getSeguradora().getId());
			}
			if(protocolo.getTipoProtocolo() != null){
				queryCount.setParameter("tipoProtocolo", proposta.getStatusOperacional());
			}
			if(protocolo.getNumero() != null){
				queryCount.setParameter("protocoloNumero", protocolo.getNumero());
			}
			if(protocolo.getDestinoOrigem() != null){
				queryCount.setParameter("destinoOrigem", protocolo.getDestinoOrigem());
			}
			if(proposta.getAutomovelWizCollection() != null && !proposta.getAutomovelWizCollection().isEmpty()){
				Automovel automovel = proposta.getAutomovelWizCollection().get(0);
				if(automovel.getNroPlaca() != null && !automovel.getNroPlaca().equals("")){
					queryCount.setParameter("nroPlaca", automovel.getNroPlaca());
				}
			}
			
			localEM.clear();
			return (Long)queryCount.getSingleResult();

		}catch (Exception e) {
			throw new GenericException("Ocorreu uma falha no sistema.", e);
		}
	}
}