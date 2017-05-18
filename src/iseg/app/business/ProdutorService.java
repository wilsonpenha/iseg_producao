package iseg.app.business;

import iseg.app.model.Pessoa;
import iseg.app.model.Produtor;
import iseg.app.persistence.PObjectService;


public interface ProdutorService extends PObjectService{

	public void save(Produtor produtor, Pessoa pessoa) throws Exception;
	//public void save(Produtor produtor, PessoaJuridica pessoaJuridica) throws Exception;
}
