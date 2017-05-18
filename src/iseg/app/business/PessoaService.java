package iseg.app.business;

import iseg.app.model.Pessoa;
import iseg.app.persistence.PObjectService;

import java.util.List;



public interface PessoaService extends PObjectService{

	public List<Pessoa>getPessoasForSearch(Pessoa pessoa, Integer page, Integer pageSize) throws Exception;
	// TODO: Tirar isso daqui depois!
	public Long getCountPessoasForSearch(Pessoa pessoa) throws Exception;
}
