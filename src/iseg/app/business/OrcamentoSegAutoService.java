package iseg.app.business;

import java.util.List;
import java.util.Map;

import iseg.app.model.OrcamentoSeguradora;
import iseg.app.model.OrcamentoSeguro;
import iseg.app.persistence.PObject;

public interface OrcamentoSegAutoService extends OrcamentoSeguroService {
	
	public OrcamentoSeguro salvarEditar(OrcamentoSeguro orcamentoSeguro) throws Exception;
	public OrcamentoSeguradora salvarCalculoOrcamentoSegAuto(OrcamentoSeguradora orcamentoSeguradora) throws Exception;
	public void salvarOrcamento(OrcamentoSeguro orcamentoSeguro) throws Exception;
	public List<? extends PObject> findByNativeQuery(String nativeSQL, Class<?> resultClass, Map<String, Object> args, Integer start, Integer limit);
	public Object[] findByNativeQuery(String nativeSQL, String resultSet, Map<String, Object> args, Integer start, Integer limit) ;
	
}
