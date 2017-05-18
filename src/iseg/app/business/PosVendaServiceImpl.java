package iseg.app.business;

import iseg.app.constants.Constants;
import iseg.app.exception.GenericException;
import iseg.app.model.Automovel;
import iseg.app.model.PosVenda;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectServiceImpl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import javax.persistence.Query;


public class PosVendaServiceImpl extends PObjectServiceImpl implements PosVendaService {

	@PersistenceContext(type = PersistenceContextType.TRANSACTION)
	private EntityManager localEM = this.getEntityManager();
	
	public List<PObject> findAll(int page, int pageSize) throws Exception {
		return genericFindByNamedQuery("getPosVenda", null, page, pageSize);
	}

	@SuppressWarnings("unchecked")
	public List<PObject> findAll() throws Exception {
		return (List<PObject>)genericFindByNamedQuery("getPosVenda", null);
	}
	
	@SuppressWarnings("unchecked")
	public List<PosVenda> getPosVendaForSearch(PosVenda posVenda, Integer page, Integer pageSize, Long statusPosVenda) throws Exception {

		try{ 
			this.applyFilter();
			String strQuery = "from PosVenda as pv join pv.proposta as p left outer join p.propostaAutomovelCollection pa left outer join pa.automovel a left outer join p.grupoDeVenda gv "+
			"left outer join gv.operadoresPosVendaCollection opv left outer join gv.observadoresPosVendaCollection obpv where 1=1 ";

			if(posVenda.getProposta().getDataProposta() != null){
				strQuery += "and p.dataProposta = :dataProposta ";
			}
			if(posVenda.getProposta().getTerminoVigencia() != null){
				strQuery += "and p.terminoVigencia >= :inicioVigencia and p.terminoVigencia <= :terminoVigencia and p.situacaoOperacional = 0 ";
			}
			if(posVenda.getProposta().getNroPropostaSeg() != null && !posVenda.getProposta().getNroPropostaSeg().equals("")){
				strQuery += "and p.nroPropostaSeg = :nroPropostaSeg ";
			}
			if(posVenda.getProposta().getNumero() != null){
				strQuery += "and p.numero = :numero ";
			}
			if(posVenda.getUsuario() != null && posVenda.getUsuario().getId() != null){
				strQuery += "and (opv.usuario.id = :usuarioId or obpv.usuario.id = :usuarioId or (:nomeLogin = '"+Constants.NOME_ADMIN+"' or :nomeLogin = '"+Constants.NOME_GESTOR+"') ) ";
			}
			if(posVenda.getProposta().getNroApolice() != null && !posVenda.getProposta().getNroApolice().isEmpty()){
				strQuery += "and p.nroApolice = :nroApolice ";
			}
			if(posVenda.getProposta().getCliente() != null && posVenda.getProposta().getCliente().getId() != null){
				strQuery += "and p.cliente.id = :clienteId ";
			}
			if(posVenda.getProposta().getGrupoDeVenda() != null && posVenda.getProposta().getGrupoDeVenda().getId() != null){
				strQuery += "and p.grupoDeVenda.id = :grupoDeVendaId ";
			}
			if(posVenda.getProposta().getCliente() != null && posVenda.getProposta().getCliente().getNome() != null && !posVenda.getProposta().getCliente().getNome().equals("")){
				strQuery += "and p.cliente.nome = :clienteNome ";
			}
			if(posVenda.getProposta().getCliente() != null && posVenda.getProposta().getCliente().getCpfOuCnpj() != null && !posVenda.getProposta().getCliente().getCpfOuCnpj().equals("")){
				strQuery += "and p.cliente.cpfOuCnpj = :clienteCpfOuCnpj ";
			}
			if(posVenda.getProposta().getSeguradora() != null && posVenda.getProposta().getSeguradora().getId() != null){
				strQuery += "and p.seguradora.id = :seguradoraId ";
			}
			if(posVenda.getProposta().getStatusOperacional() != null && !posVenda.getProposta().getStatusOperacional().equals("")){
				strQuery += "and p.statusOperacional = :statusOperacional ";
			}	
			if(posVenda.getProposta().getRamo() != null && posVenda.getProposta().getRamo().getId() != null){
				strQuery += "and p.ramo.id = :ramoId ";
			}
			if(statusPosVenda != null && statusPosVenda.equals(Constants.ST_POSVENDA_TODOS)){
				strQuery += " ";//and (r.isRespondido = false or p.dataBaixa is null)
			}
			if(statusPosVenda != null && statusPosVenda.equals(Constants.ST_POSVENDA_EM_ABERTO)){
				strQuery += "and (pv.dataEncerramento is null) ";
			}
			if(statusPosVenda != null && statusPosVenda.equals(Constants.ST_POSVENDA_BAIXADO)){
				strQuery += "and (pv.dataEncerramento is not null) ";
			}
			if(posVenda.getProposta().getPropostaAutomovelCollection() != null && !posVenda.getProposta().getPropostaAutomovelCollection().isEmpty()){
				Automovel automovel = posVenda.getProposta().getPropostaAutomovelCollection().get(0).getAutomovel();
				if(automovel.getNroPlaca() != null && !automovel.getNroPlaca().equals("")){
					strQuery += "and a.nroPlaca = :nroPlaca ";
				}
				if(automovel.getNroChassis() != null && !automovel.getNroChassis().equals("")){
					strQuery += "and a.nroChassis = :nroChassis ";
				}
			}

			strQuery += " ORDER BY pv.dataAlteracao desc ";

			Query query = localEM.createQuery("select distinct pv "+strQuery);

			query.setParameter("nomeLogin", posVenda.getUsuario().getNomeLogin());

			if(posVenda.getProposta().getDataProposta() != null){
				query.setParameter("dataProposta", posVenda.getProposta().getDataProposta());
			}
			if(posVenda.getProposta().getTerminoVigencia() != null){
				query.setParameter("inicioVigencia", posVenda.getProposta().getInicioVigencia());
				query.setParameter("terminoVigencia", posVenda.getProposta().getTerminoVigencia());
			}
			if(posVenda.getProposta().getNroPropostaSeg() != null && !posVenda.getProposta().getNroPropostaSeg().equals("")){
				query.setParameter("nroPropostaSeg", posVenda.getProposta().getNroPropostaSeg());
			}
			if(posVenda.getProposta().getNumero() != null){
				query.setParameter("numero", posVenda.getProposta().getNumero());
			}
			if(posVenda.getUsuario() != null && posVenda.getUsuario().getId() != null){
				query.setParameter("usuarioId", posVenda.getUsuario().getId());
			}
			if(posVenda.getProposta().getNroApolice() != null && !posVenda.getProposta().getNroApolice().isEmpty()){
				query.setParameter("nroApolice", posVenda.getProposta().getNroApolice());
			}
			if(posVenda.getProposta().getCliente() != null && posVenda.getProposta().getCliente().getId() != null){
				query.setParameter("clienteId", posVenda.getProposta().getCliente().getId());
			}
			if(posVenda.getProposta().getGrupoDeVenda() != null && posVenda.getProposta().getGrupoDeVenda().getId() != null){
				query.setParameter("grupoDeVendaId", posVenda.getProposta().getGrupoDeVenda().getId());
			}
			if(posVenda.getProposta().getCliente() != null && posVenda.getProposta().getCliente().getNome() != null && !posVenda.getProposta().getCliente().getNome().equals("")){
				query.setParameter("clienteNome", posVenda.getProposta().getCliente().getNome().trim());
			}
			if(posVenda.getProposta().getCliente() != null && posVenda.getProposta().getCliente().getCpfOuCnpj() != null && !posVenda.getProposta().getCliente().getCpfOuCnpj().equals("")){
				query.setParameter("clienteCpfOuCnpj", posVenda.getProposta().getCliente().getCpfOuCnpj());
			}
			if(posVenda.getProposta().getSeguradora() != null && posVenda.getProposta().getSeguradora().getId() != null){
				query.setParameter("seguradoraId", posVenda.getProposta().getSeguradora().getId());
			}
			if(posVenda.getProposta().getStatusOperacional() != null && !posVenda.getProposta().getStatusOperacional().equals("")){
				query.setParameter("statusOperacional", posVenda.getProposta().getStatusOperacional());
			}
			if(posVenda.getProposta().getRamo() != null && posVenda.getProposta().getRamo().getId() != null){
				query.setParameter("ramoId", posVenda.getProposta().getRamo().getId());
			}
			if(posVenda.getProposta().getPropostaAutomovelCollection() != null && !posVenda.getProposta().getPropostaAutomovelCollection().isEmpty()){
				Automovel automovel = posVenda.getProposta().getPropostaAutomovelCollection().get(0).getAutomovel();
				if(automovel.getNroPlaca() != null && !automovel.getNroPlaca().equals("")){
					query.setParameter("nroPlaca", automovel.getNroPlaca());
				}
				if(automovel.getNroChassis() != null && !automovel.getNroChassis().equals("")){
					query.setParameter("nroChassis", automovel.getNroChassis());
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
	public Long getCountPosVendaForSearch(PosVenda posVenda, Long statusPosVenda) throws Exception {

		try{

			this.applyFilter();
			String strQuery = "from PosVenda as pv join pv.proposta as p left outer join p.propostaAutomovelCollection pa left outer join pa.automovel a left outer join p.grupoDeVenda gv "+
			"left outer join gv.operadoresPosVendaCollection opv left outer join gv.observadoresPosVendaCollection obpv where 1=1 ";

			if(posVenda.getProposta().getDataProposta() != null){
				strQuery += "and p.dataProposta = :dataProposta ";
			}
			if(posVenda.getProposta().getTerminoVigencia() != null){
				strQuery += "and p.terminoVigencia >= :inicioVigencia and p.terminoVigencia <= :terminoVigencia and p.situacaoOperacional = 0 ";
			}
			if(posVenda.getProposta().getNroPropostaSeg() != null && !posVenda.getProposta().getNroPropostaSeg().equals("")){
				strQuery += "and p.nroPropostaSeg = :nroPropostaSeg ";
			}
			if(posVenda.getProposta().getNumero() != null){
				strQuery += "and p.numero = :numero ";
			}
			if(posVenda.getUsuario() != null && posVenda.getUsuario().getId() != null){
				strQuery += "and (opv.usuario.id = :usuarioId or obpv.usuario.id = :usuarioId or (:nomeLogin = '"+Constants.NOME_ADMIN+"' or :nomeLogin = '"+Constants.NOME_GESTOR+"') ) ";
			}
			if(posVenda.getProposta().getNroApolice() != null && !posVenda.getProposta().getNroApolice().isEmpty()){
				strQuery += "and p.nroApolice = :nroApolice ";
			}
			if(posVenda.getProposta().getCliente() != null && posVenda.getProposta().getCliente().getId() != null){
				strQuery += "and p.cliente.id = :clienteId ";
			}
			if(posVenda.getProposta().getGrupoDeVenda() != null && posVenda.getProposta().getGrupoDeVenda().getId() != null){
				strQuery += "and p.grupoDeVenda.id = :grupoDeVendaId ";
			}
			if(posVenda.getProposta().getCliente() != null && posVenda.getProposta().getCliente().getNome() != null && !posVenda.getProposta().getCliente().getNome().equals("")){
				strQuery += "and p.cliente.nome = :clienteNome ";
			}
			if(posVenda.getProposta().getCliente() != null && posVenda.getProposta().getCliente().getCpfOuCnpj() != null && !posVenda.getProposta().getCliente().getCpfOuCnpj().equals("")){
				strQuery += "and p.cliente.cpfOuCnpj = :clienteCpfOuCnpj ";
			}
			if(posVenda.getProposta().getSeguradora() != null && posVenda.getProposta().getSeguradora().getId() != null){
				strQuery += "and p.seguradora.id = :seguradoraId ";
			}
			if(posVenda.getProposta().getStatusOperacional() != null && !posVenda.getProposta().getStatusOperacional().equals("")){
				strQuery += "and p.statusOperacional = :statusOperacional ";
			}
			if(posVenda.getProposta().getRamo() != null && posVenda.getProposta().getRamo().getId() != null){
				strQuery += "and p.ramo.id = :ramoId ";
			}
			if(statusPosVenda != null && statusPosVenda.equals(Constants.ST_POSVENDA_TODOS)){
				strQuery += " ";//and (r.isRespondido = false or p.dataBaixa is null)
			}
			if(statusPosVenda != null && statusPosVenda.equals(Constants.ST_POSVENDA_EM_ABERTO)){
				strQuery += "and (pv.dataEncerramento is null) ";
			}
			if(statusPosVenda != null && statusPosVenda.equals(Constants.ST_POSVENDA_BAIXADO)){
				strQuery += "and (pv.dataEncerramento is not null) ";
			}
			if(posVenda.getProposta().getPropostaAutomovelCollection() != null && !posVenda.getProposta().getPropostaAutomovelCollection().isEmpty()){
				Automovel automovel = posVenda.getProposta().getPropostaAutomovelCollection().get(0).getAutomovel();
				if(automovel.getNroPlaca() != null && !automovel.getNroPlaca().equals("")){
					strQuery += "and a.nroPlaca = :nroPlaca ";
				}
				if(automovel.getNroChassis() != null && !automovel.getNroChassis().equals("")){
					strQuery += "and a.nroChassis = :nroChassis ";
				}
			}

			Query queryCount = localEM.createQuery("select count(distinct pv.id) "+strQuery);

			queryCount.setParameter("nomeLogin", posVenda.getUsuario().getNomeLogin());

			if(posVenda.getProposta().getDataProposta() != null){
				queryCount.setParameter("dataProposta", posVenda.getProposta().getDataProposta());
			}
			if(posVenda.getProposta().getTerminoVigencia() != null){
				queryCount.setParameter("inicioVigencia", posVenda.getProposta().getInicioVigencia());
				queryCount.setParameter("terminoVigencia", posVenda.getProposta().getTerminoVigencia());
			}
			if(posVenda.getProposta().getNroPropostaSeg() != null && !posVenda.getProposta().getNroPropostaSeg().equals("")){
				queryCount.setParameter("nroPropostaSeg", posVenda.getProposta().getNroPropostaSeg());
			}
			if(posVenda.getProposta().getNumero() != null){
				queryCount.setParameter("numero", posVenda.getProposta().getNumero());
			}
			if(posVenda.getUsuario() != null && posVenda.getUsuario().getId() != null){
				queryCount.setParameter("usuarioId", posVenda.getUsuario().getId());
			}
			if(posVenda.getProposta().getNroApolice() != null && !posVenda.getProposta().getNroApolice().isEmpty()){
				queryCount.setParameter("nroApolice", posVenda.getProposta().getNroApolice());
			}
			if(posVenda.getProposta().getCliente() != null && posVenda.getProposta().getCliente().getId() != null){
				queryCount.setParameter("clienteId", posVenda.getProposta().getCliente().getId());
			}
			if(posVenda.getProposta().getGrupoDeVenda() != null && posVenda.getProposta().getGrupoDeVenda().getId() != null){
				queryCount.setParameter("grupoDeVendaId", posVenda.getProposta().getGrupoDeVenda().getId());
			}
			if(posVenda.getProposta().getCliente() != null && posVenda.getProposta().getCliente().getNome() != null && !posVenda.getProposta().getCliente().getNome().equals("")){
				queryCount.setParameter("clienteNome", posVenda.getProposta().getCliente().getNome());
			}
			if(posVenda.getProposta().getCliente() != null && posVenda.getProposta().getCliente().getCpfOuCnpj() != null && !posVenda.getProposta().getCliente().getCpfOuCnpj().equals("")){
				queryCount.setParameter("clienteCpfOuCnpj", posVenda.getProposta().getCliente().getCpfOuCnpj());
			}
			if(posVenda.getProposta().getSeguradora() != null && posVenda.getProposta().getSeguradora().getId() != null){
				queryCount.setParameter("seguradoraId", posVenda.getProposta().getSeguradora().getId());
			}
			if(posVenda.getProposta().getStatusOperacional() != null && !posVenda.getProposta().getStatusOperacional().equals("")){
				queryCount.setParameter("statusOperacional", posVenda.getProposta().getStatusOperacional());
			}
			if(posVenda.getProposta().getRamo() != null && posVenda.getProposta().getRamo().getId() != null){
				queryCount.setParameter("ramoId", posVenda.getProposta().getRamo().getId());
			}
			if(posVenda.getProposta().getPropostaAutomovelCollection() != null && !posVenda.getProposta().getPropostaAutomovelCollection().isEmpty()){
				Automovel automovel = posVenda.getProposta().getPropostaAutomovelCollection().get(0).getAutomovel();
				if(automovel.getNroPlaca() != null && !automovel.getNroPlaca().equals("")){
					queryCount.setParameter("nroPlaca", automovel.getNroPlaca());
				}
				if(automovel.getNroChassis() != null && !automovel.getNroChassis().equals("")){
					queryCount.setParameter("nroChassis", automovel.getNroChassis());
				}
			}
			
			localEM.clear();
			return (Long)queryCount.getSingleResult();

		}catch (Exception e) {
			throw new GenericException("Ocorreu uma falha no sistema.", e);
		}
	}
}