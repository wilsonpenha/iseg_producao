package iseg.app.business;

import iseg.app.exception.GenericException;
import iseg.app.model.Corretora;
import iseg.app.model.Pessoa;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectServiceImpl;

import java.util.List;

import javax.persistence.Query;



//@Service
public class PessoaServiceImpl extends PObjectServiceImpl implements PessoaService {

	@SuppressWarnings("unchecked")
	public List<PObject> findAll() throws Exception {
		return (List<PObject>)genericFindBySQLQuery("select p FROM Pessoa p ORDER BY p.nome", null);
	}

	@SuppressWarnings("unchecked")
	public List<Pessoa> getPessoasForSearch(Pessoa pessoa, Integer page, Integer pageSize) throws Exception {
		
		try{

			Corretora corretoraCorrente = (Corretora)this.getRequest().getSession().getAttribute("corretoraEmUso");
			
			if (corretoraCorrente.ehAssessoria())
				this.applyFilterAssessoria();
			else
				this.applyFilter();
				
			String strQuery = "from Pessoa p where id not in (select id from Seguradora) and id not in (Select id from Corretora) "+
							  "and id not in (Select id from Produtor) ";
			
			if(pessoa.getNome() != null && !pessoa.getNome().equals("")){
				strQuery += "and p.nome = :nome ";
			}
			if(pessoa.getCpfOuCnpj() != null && !pessoa.getCpfOuCnpj().equals("")){
				strQuery += "and p.cpfOuCnpj = :cpfOuCnpj ";
			}
			
			strQuery += " order by p.nome ";
			Query query = this.getEntityManager().createQuery("select p "+strQuery);
			
			if(pessoa.getNome() != null && !pessoa.getNome().equals("")){
				query.setParameter("nome", pessoa.getNome());
			}
			if(pessoa.getCpfOuCnpj() != null && !pessoa.getCpfOuCnpj().equals("")){
				query.setParameter("cpfOuCnpj", pessoa.getCpfOuCnpj());
			}
			
			query.setFirstResult(page*pageSize);
			query.setMaxResults(pageSize);
			
			return query.getResultList();

		}catch (Exception e) {
			throw new GenericException("Ocorreu uma falha no sistema.", e);
		}
	}

	// TODO: Tirar isso daqui depois!!
	public Long getCountPessoasForSearch(Pessoa pessoa) throws Exception {
		
		try{

			Corretora corretoraCorrente = (Corretora)this.getRequest().getSession().getAttribute("corretoraEmUso");
			
			if (corretoraCorrente.ehAssessoria())
				this.applyFilterAssessoria();
			else
				this.applyFilter();
				
			String strQuery = "from Pessoa p where id not in (select id from Seguradora) and id not in (Select id from Corretora) "+
			  "and id not in (Select id from Produtor) ";
			
			if(pessoa.getNome() != null && !pessoa.getNome().equals("")){
				strQuery += "and p.nome = :nome ";
			}
			if(pessoa.getCpfOuCnpj() != null && !pessoa.getCpfOuCnpj().equals("")){
				strQuery += "and p.cpfOuCnpj = :cpfOuCnpj ";
			}
			
			Query queryCount = this.getEntityManager().createQuery("select count(*) "+strQuery);
			
			if(pessoa.getNome() != null && !pessoa.getNome().equals("")){
				queryCount.setParameter("nome", pessoa.getNome());
			}
			if(pessoa.getCpfOuCnpj() != null && !pessoa.getCpfOuCnpj().equals("")){
				queryCount.setParameter("cpfOuCnpj", pessoa.getCpfOuCnpj());
			}
			
			return (Long)queryCount.getSingleResult();

		}catch (Exception e) {
			throw new GenericException("Ocorreu uma falha no sistema.", e);
		}
	}
}