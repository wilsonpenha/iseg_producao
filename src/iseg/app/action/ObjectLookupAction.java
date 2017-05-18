package iseg.app.action;

import iseg.app.model.Automovel;
import iseg.app.model.Cep;
import iseg.app.model.Cidade;
import iseg.app.model.Dominio;
import iseg.app.model.Endereco;
import iseg.app.model.Fabricante;
import iseg.app.model.Pessoa;
import iseg.app.model.PessoaFisica;
import iseg.app.model.PessoaJuridica;
import iseg.app.model.Produtor;
import iseg.app.model.Proposta;
import iseg.app.model.Ramo;
import iseg.app.model.Seguradora;
import iseg.app.model.Uf;
import iseg.app.persistence.PObject;
import iseg.app.persistence.PObjectService;
import iseg.utils.Util;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;

import org.apache.struts2.interceptor.validation.SkipValidation;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.Preparable;

public class ObjectLookupAction extends BaseAction implements Preparable{
	private static final long serialVersionUID = 1L;
	private Proposta proposta;
	private Dominio dominio;
	private Produtor produtor;
	private Pessoa pessoa;
	private PessoaFisica pessoaFisica;
	private PessoaJuridica pessoaJuridica;
	private Uf uf;
	private Cidade cidade;
	private Endereco endereco;
	private Cep cep;
	private Fabricante fabricante;
	private Seguradora seguradora;
	private Ramo ramo;
	private Ramo subRamo;

	private List<PObject> list;
	private List<Automovel> itensSegurados;
	private List<Seguradora> seguradoras;
	private List<Ramo> ramos;

	private List<String[]> options = new ArrayList<String[]>();
	private String jsonList;
	private String autoCompleteResult;
	private String nome;
	private String divName;
	private String campoId;
	private String campoNome;
	private String formName;
	private Integer tipoLancamento;

	//@Autowired
	public ObjectLookupAction(PObjectService service) {
		this.service = service;
	}

	public void prepare() throws Exception {
		try {
			super.prepare();

		} catch (Exception ge) {
			addActionError(ge.getMessage());
		}
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String getSeguradorasByRamo(){
		try{

			if (this.ramo.getId()!=null)
				this.ramo = (Ramo)this.service.find(Ramo.class,this.ramo.getId());
			this.seguradoras = (List<Seguradora>)this.service.genericFindBySQLQuery("SELECT s FROM Seguradora s WHERE id in (select seguradora.id from Coberturas where ramo.id = ?0 and isAtiva = true) Order by s.nome", new Object[]{this.ramo.getId()});
			if (this.seguradoras==null)
				this.seguradoras = new ArrayList<Seguradora>();

			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return Action.ERROR;
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String getRamosBySubRamo(){
		try{

			this.ramos = (List<Ramo>)this.service.genericFindBySQLQuery("SELECT s FROM Ramo s WHERE subRamo.id = ?0 Order by s.nome", new Object[]{this.ramo.getId()});

			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return Action.ERROR;
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String getProdutorList(){

		try{

			List<String>produtores = (List<String>)this.service.genericFindBySQLQuery("SELECT p.pessoa.nome || '|' || p.id || '|' || COALESCE(to_char(p.comissao,'999G999D99'),'0D00') ||'\n' FROM Produtor p  WHERE upper(p.pessoa.nome) like ?0 Order by p.pessoa.nome", new Object[]{this.nome.toUpperCase()+"%"});
			this.autoCompleteResult = prepareToAutocomplete(produtores); //.replace(".", "#").replace(",", ".").replace("#", ",")
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return Action.ERROR;
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String getUsuarioList(){

		try{

			List<String>usuarios = (List<String>)this.service.genericFindBySQLQuery("SELECT p.nomeLogin || '|' || p.id ||'\n' FROM Usuario p  WHERE upper(p.nomeLogin) like ?0 Order by p.nomeLogin", new Object[]{this.nome.toUpperCase()+"%"});
			this.autoCompleteResult = prepareToAutocomplete(usuarios);
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return Action.ERROR;
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String getPessoaList(){
		try{

			List<String>pessoas = (List<String>)this.service.genericFindBySQLQuery("Select p.nome || '|' || p.id || '\n' From Pessoa p where upper(p.nome) like ?0 and id not in (select id from Seguradora) and id not in (Select id from Corretora) and id not in (Select id from Produtor) Order by p.nome", new Object[]{"%"+this.nome.toUpperCase()+"%"});
			this.autoCompleteResult = prepareToAutocomplete(pessoas);
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return Action.ERROR;
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String getPessoaByCpfOuCnpj(){
		try{

			List<String>pessoas = (List<String>)this.service.genericFindBySQLQuery("Select p.cpfOuCnpj || '|' || p.id || '|' || p.nome || '\n' From Pessoa p where p.cpfOuCnpj.valor like ?0 and id not in (select id from Seguradora) and id not in (Select id from Corretora) and id not in (Select id from Produtor) Order by p.nome", new Object[]{this.nome+"%"});
			this.autoCompleteResult = prepareToAutocomplete(pessoas);
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return Action.ERROR;
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String getPessoaSmsList(){
		try{

			List<String>pessoas = (List<String>)this.service.genericFindBySQLQuery("Select p.nome || ' # ' || p.cpfOuCnpj || '|' || p.id || '|' || p.cpfOuCnpj || '|' || coalesce(p.telefoneCelular,'') || '\n' From Pessoa p where upper(p.nome) like ?0 and id not in (select id from Seguradora) Order by p.nome", new Object[]{"%"+this.nome.toUpperCase()+"%"});
			this.autoCompleteResult = prepareToAutocomplete(pessoas);
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return Action.ERROR;
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String getPessoaSmsByCpfOuCnpj(){
		try{

			List<String>pessoas = (List<String>)this.service.genericFindBySQLQuery("Select p.cpfOuCnpj || ' # ' || p.nome || '|' || p.id || '|' || p.nome || '|' || coalesce(p.telefoneCelular,'') || '\n' From Pessoa p where p.cpfOuCnpj.valor like ?0 and id not in (select id from Seguradora) Order by p.nome", new Object[]{this.nome+"%"});
			this.autoCompleteResult = prepareToAutocomplete(pessoas);
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return Action.ERROR;
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String getPessoasByNomeTodos(){
		try{

			List<String> pessoas = null;
			if (this.corretoraEmUso.ehAssessoria())
				pessoas = (List<String>)this.service.genericFindBySQLQueryAssessoriaFilter("Select p.nome || '|' || p.id || '|' || p.cpfOuCnpj || '\n' From Pessoa p where upper(p.nome) like ?0 Order by p.nome", new Object[]{"%"+this.nome.toUpperCase()+"%"});
			else
				pessoas = (List<String>)this.service.genericFindBySQLQuery("Select p.nome || '|' || p.id || '|' || p.cpfOuCnpj || '\n' From Pessoa p where upper(p.nome) like ?0 Order by p.nome", new Object[]{"%"+this.nome.toUpperCase()+"%"});

			this.autoCompleteResult = prepareToAutocomplete(pessoas);
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return Action.ERROR;
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String getPessoasByCpfOuCnpjTodos(){
		try{

			List<String> pessoas = null;
			if (this.corretoraEmUso.ehAssessoria())
				pessoas = (List<String>)this.service.genericFindBySQLQueryAssessoriaFilter("Select p.cpfOuCnpj || '|' || p.id || '|' || p.nome || '\n' From Pessoa p where p.cpfOuCnpj.valor like ?0 Order by p.nome", new Object[]{this.nome+"%"});
			else
				pessoas = (List<String>)this.service.genericFindBySQLQuery("Select p.cpfOuCnpj || '|' || p.id || '|' || p.nome || '\n' From Pessoa p where p.cpfOuCnpj.valor like ?0 Order by p.nome", new Object[]{this.nome+"%"});
			
			this.autoCompleteResult = prepareToAutocomplete(pessoas);
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return Action.ERROR;
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String getVistoriadoraList(){
		try{

			List<String>vistoriadoras = (List<String>)this.service.genericFindBySQLQuery("Select v.nome || '|' || v.id || '\n' From Vistoriadora v where upper(v.nome) like ?0 Order by v.nome", new Object[]{this.nome.toUpperCase()+"%"});
			this.autoCompleteResult = prepareToAutocomplete(vistoriadoras);
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return Action.ERROR;
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String getSeguradoraByNome(){
		try{

			List<String>seguraList = (List<String>)this.service.genericFindBySQLQuery("Select v.nome || '|' || v.id || '\n' From Seguradora v where upper(v.nome) like ?0 Order by v.nome", new Object[]{this.nome.toUpperCase()+"%"});
			this.autoCompleteResult = prepareToAutocomplete(seguraList);
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return Action.ERROR;
	}
	
	@SuppressWarnings("unchecked")
	@SkipValidation
	public String getProfissaoByNome(){
		try{
			List<String>profissaoList = (List<String>)this.service.genericFindBySQLQuery("SELECT v.descricao || '|' || v.id || '\n' FROM Profissao v WHERE UPPER(v.descricao) LIKE ?0 ORDER BY v.descricao", new Object[]{this.nome.toUpperCase()+"%"});
			this.autoCompleteResult = prepareToAutocomplete(profissaoList);
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return Action.ERROR;
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String getCorretorasListByNome(){
		try{

			List<String>corretoraList = (List<String>)this.service.genericFindBySQLQuery("Select c.nome || '|' || c.id || '\n' From Corretora c where upper(c.nome) like ?0 Order by c.nome", new Object[]{this.nome.toUpperCase()+"%"});
			this.autoCompleteResult = prepareToAutocomplete(corretoraList);
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return Action.ERROR;
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String getClienteListByNome(){
		try{

			List<String>clientes = (List<String>)this.service.genericFindBySQLQuery("Select p.nome || '|' || p.id || '|' || p.cpfOuCnpj || '\n' From Pessoa p where upper(p.nome) like ?0 Order by p.nome", new Object[]{"%"+this.nome.toUpperCase()+"%"});
			this.autoCompleteResult = prepareToAutocomplete(clientes);
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return Action.ERROR;
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String getClienteListByCpfCnpj(){
		try{

			List<String>clientes = (List<String>)this.service.genericFindBySQLQuery("Select p.cpfOuCnpj || '|' || p.id || '|' || p.nome || '\n' From Pessoa p where p.cpfOuCnpj.valor like ?0 Order by p.nome", new Object[]{this.nome+"%"});
			this.autoCompleteResult = prepareToAutocomplete(clientes);
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return Action.ERROR;
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String getSeguradoListByCpf(){
		try{

			List<String>clientes = (List<String>)this.service.genericFindBySQLQuery("Select p.cpfOuCnpj || '|' || p.nome || '|' || CASE WHEN p.dataNascimento IS NULL THEN '' ELSE p.dataNascimento END || '\n' From PessoaFisica p where p.cpfOuCnpj.valor like ?0 Order by p.nome", new Object[]{this.nome+"%"});
			//List<String>clientes = (List<String>)this.service.genericFindBySQLQuery("Select p.cpfOuCnpj || '|' || p.nome || '|' || COALESCE(CAST(p.dataNascimento AS VARCHAR)),'') From PessoaFisica p where p.cpfOuCnpj.valor like ?0 Order by p.nome", new Object[]{this.nome+"%"});
			this.autoCompleteResult = prepareToAutocomplete(clientes);
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return Action.ERROR;
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String getSeguradoListByNome(){
		try{

			List<String>clientes = (List<String>)this.service.genericFindBySQLQuery("Select p.cpfOuCnpj || '|' || p.nome || '|' || COALESCE(p.dataNascimento,'') || '|' || COALESCE(p.sexo,'') || '|' || COALESCE(p.estadoCivil,'') || '|' || COALESCE(p.rg,'') || '|' || COALESCE(p.orgaoEmissor,'') || '|' || COALESCE(p.dataEmissao,'') || '|' || COALESCE(p.telefonePreferencial,'') || '|' || COALESCE(p.telefoneAlternativo,'') ||"+
			" '|' || COALESCE(p.telefoneCelular,'') || '|' || COALESCE(p.email,'') || '|' || COALESCE(e.cep,'') || '|' || COALESCE(e.logradouro,'') || '|' || COALESCE(e.complemento,'') || '|' || COALESCE(e.numero,'') || '|' || COALESCE(e.bairro,'') || '|' || COALESCE(e.cidade,'') || '|' || COALESCE(e.uf,'') || '|' || COALESCE(e.fax,'')"+
			" || '\n' From Endereco e right outer join e.pessoa p where p.nome like ?0 and (e.id is null or e.tipoEndereco='R') Order by p.nome", new Object[]{this.nome+"%"});
			this.autoCompleteResult = prepareToAutocomplete(clientes);
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return Action.ERROR;
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String getCepList(){
		try{
			String cep = this.nome.replace("-", "");
			List<String>ceps = (List<String>)this.service.genericFindBySQLQuery("Select c.cep || ' # ' || c.logradouro || '|' || c.bairro || '|' || c.cidade || '|' || c.uf || '|' || c.logradouro || '\n' From Cep c where c.cep like ?0 Order by c.cep", new Object[]{cep+"%"});
			this.autoCompleteResult = prepareToAutocomplete(ceps);
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return Action.ERROR;
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String getCidadeList(){
		try{
			List<String>cidades = (List<String>)this.service.genericFindBySQLQuery("Select c.nome || ' # ' || c.uf.uf || '\n' From Cidade c where upper(c.nome) like ?0 Order by c.nome", new Object[]{this.cidade.getNome()+"%"});
			//List<String>cidades = (List<String>)this.service.genericFindBySQLQuery("Select distinct(c.cidade || ' # ' || c.uf || '\n') From Cep c where upper(c.cidade) like ?0 Order by c.cidade", new Object[]{this.cidade.getNome()+"%"});
			this.autoCompleteResult = prepareToAutocomplete(cidades);
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return Action.ERROR;
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String getClientePFListByNome(){
		try{
			List<String>clientes = (List<String>)this.service.genericFindBySQLQuery("Select p.nome || ' # ' || p.cpfOuCnpj || '|' || p.id || '\n' From PessoaFisica p where upper(p.nome) like ?0 Order by p.nome", new Object[]{this.nome+"%"});
			this.autoCompleteResult = prepareToAutocomplete(clientes);
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return Action.ERROR;
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String getClienteListByCpf(){
		try{

			List<String>clientes = (List<String>)this.service.genericFindBySQLQuery("Select p.cpfOuCnpj || ' # ' || p.nome || '|' || p.id || '\n' From PessoaFisica p where p.cpfOuCnpj.valor like ?0 Order by p.nome", new Object[]{this.nome+"%"});
			this.autoCompleteResult = prepareToAutocomplete(clientes);
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return Action.ERROR;
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String getClientePJListByNome(){
		try{
			List<String>clientes = (List<String>)this.service.genericFindBySQLQuery("Select p.nome || ' # ' || p.cpfOuCnpj || '|' || p.id || '\n' From PessoaJuridica p where upper(p.nome) like ?0 Order by p.nome", new Object[]{this.nome+"%"});
			this.autoCompleteResult = prepareToAutocomplete(clientes);
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return Action.ERROR;
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String getClienteListByCnpj(){
		try{
			List<String>clientes = (List<String>)this.service.genericFindBySQLQuery("select p.cpfOuCnpj || ' # ' || p.nome || '|' || p.id || '\n' From PessoaJuridica p where p.cpfOuCnpj.valor like ?0 Order by p.nome", new Object[]{this.nome+"%"});
			this.autoCompleteResult = prepareToAutocomplete(clientes);
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return Action.ERROR;
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String getMarcaList(){
		try{
			List<String>marcas = (List<String>)this.service.genericFindBySQLQuery("select f.nome || '|' || f.id || '\n' From Fabricante f where upper(f.nome) like ?0 order by f.nome", new Object[]{this.nome.toUpperCase()+"%"});
			this.autoCompleteResult = prepareToAutocomplete(marcas);
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return Action.ERROR;
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String getCorList(){
		try{
			List<String>cores = (List<String>)this.service.genericFindBySQLQuery("select desp.valor || '\n' From DominioEsp desp where desp.dominio.nome = 'COR' and upper(desp.valor) like ?0 order by desp.valor", new Object[]{this.nome.toUpperCase()+"%"});
			this.autoCompleteResult = prepareToAutocomplete(cores);
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return Action.ERROR;
	}
	
	@SuppressWarnings("unchecked")
	@SkipValidation
	public String getEscolaridade(){
		try{
			List<String>escolaridadesList = (List<String>)this.service.genericFindBySQLQuery("SELECT desp.descricao || '|' || desp.id || '|' || '\n' From Escolaridade desp where upper(desp.descricao) like ?0 order by desp.descricao", new Object[]{this.nome.toUpperCase()+"%"});
			this.autoCompleteResult = prepareToAutocomplete(escolaridadesList);
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return Action.ERROR;
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String getModeloVeiculoList(){
		try{
			List<String>modelos = null;
			if(this.fabricante != null && this.fabricante.getId() != null){
				modelos = (List<String>)this.service.genericFindBySQLQuery("select m.descricao || '|' || m.id || '|' || coalesce(m.codigoFipe,' ') || '\n' From VeiculoModelo m where upper(m.descricao) like ?0 and m.fabricante.id = ?1 Order by m.descricao", new Object[]{"%"+this.nome.toUpperCase()+"%", this.fabricante.getId()});
			}else{
				modelos = (List<String>)this.service.genericFindBySQLQuery("select m.descricao || '|' || m.id || '|' || coalesce(m.codigoFipe,' ') || '\n' From VeiculoModelo m where upper(m.descricao) like ?0 Order by m.descricao", new Object[]{"%"+this.nome.toUpperCase()+"%"});
			}
			this.autoCompleteResult = prepareToAutocomplete(modelos);
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return Action.ERROR;
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String getComissoesPorNroApoliceList(){
		try{
			List<String>propostas = new ArrayList<String>();

			if (this.ramo.getId()==null && this.ramo.getSubRamo().getId()!=null){
				this.ramo = this.ramo.getSubRamo();
			}

			if (this.ramo.getId()!=null){
				this.ramo = (Ramo)this.service.find(this.ramo);
				propostas = (List<String>)this.service.genericFindBySQLQuery("select coalesce(p.nroApolice,' ') || ' # ' || p.cliente.nome || ' - Loc:' || p.numero || ' # ' || case when p.situacaoOperacional = 0 then 'ATIVA' when p.situacaoOperacional = 1 then 'CANCELADA' else 'ENDOSSADA' end || '#' || coalesce(sr.nome,' ') ||'/'|| r.nome || '#' || to_char(p.premioLiquido,'99G999G999D99') || '#' || coalesce(to_char(p.referenciaParcela,'mm/yyyy'),'') || '|' || case when sr.id is not null then sr.id else r.id end || '|' || case when sr.id is null then 0 else r.id end "+
					" || '|' || p.cliente.nome || '|' || '0,00' || '|' || p.id || '|' || '0,00' || '|' || '' || '|' || '' || '|' || to_char(sum(pc.valorComissao),'99G999G999D99') || '|' || to_char(p.premioLiquido,'99G999G999D99') || '|' || coalesce(to_char(p.referenciaParcela,'mm/yyyy'),'') || '|' || p.isFatura || '\n' From Proposta p left join p.propostaComissaoCollection pc join p.ramo r left join r.subRamo sr where p.statusOperacional in (2,4,6,7,9,10) and p.nroApolice like ?0 and (p.seguradora.id = ?1 or p.seguradora.id in (select s.id from Seguradora s where s.ciaAgrupadora.id = ?1)) and p.ramo.id = ?2 group by p.cliente.nome, p.numero, p.nroApolice,  p.nroEndosso, p.statusOperacional, p.situacaoOperacional, p.id, r.id, sr.id, r.nome, sr.nome, p.premioLiquido, p.referenciaParcela, p.isFatura Order by p.cliente.nome", new Object[]{this.nome.toUpperCase()+"%", this.seguradora.getId(),this.ramo.getId()});
			}else{
				propostas = (List<String>)this.service.genericFindBySQLQuery("select coalesce(p.nroApolice,' ') || ' # ' || p.cliente.nome || ' - Loc:' || p.numero || ' # ' || case when p.situacaoOperacional = 0 then 'ATIVA' when p.situacaoOperacional = 1 then 'CANCELADA' else 'ENDOSSADA' end || '#' || coalesce(sr.nome,' ') ||'/'|| r.nome || '#' || to_char(p.premioLiquido,'99G999G999D99') || '#' || coalesce(to_char(p.referenciaParcela,'mm/yyyy'),'') || '|' || case when sr.id is not null then sr.id else r.id end || '|' || case when sr.id is null then 0 else r.id end "+
						" || '|' || p.cliente.nome || '|' || '0,00' || '|' || p.id || '|' || '0,00' || '|' || '' || '|' || '' || '|' || to_char(sum(pc.valorComissao),'99G999G999D99') || '|' || to_char(p.premioLiquido,'99G999G999D99') ||  '|' || coalesce(to_char(p.referenciaParcela,'mm/yyyy'),'') || '|' || p.isFatura || '\n' From Proposta p left join p.propostaComissaoCollection pc join p.ramo r left join r.subRamo sr where p.statusOperacional in (2,4,6,7,9,10) and p.nroApolice like ?0 and (p.seguradora.id = ?1 or p.seguradora.id in (select s.id from Seguradora s where s.ciaAgrupadora.id = ?1)) group by p.cliente.nome, p.numero, p.nroApolice,  p.nroEndosso, p.statusOperacional, p.situacaoOperacional, p.id, r.id, sr.id, r.nome, sr.nome, p.premioLiquido, p.referenciaParcela, p.isFatura Order by p.cliente.nome", new Object[]{this.nome.toUpperCase()+"%", this.seguradora.getId()});
			}
			
			this.autoCompleteResult = prepareToAutocomplete(propostas);//.replace(".", "#").replace(",", ".").replace("#", ",");
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return Action.ERROR;
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String getComissoesPorNomeSeguradoList(){
		try{
			List<String>propostas = new ArrayList<String>();

			if (this.ramo.getId()==null && this.ramo.getSubRamo().getId()!=null){
				this.ramo = this.ramo.getSubRamo();
			}

			if (this.ramo.getId()!=null){
				this.ramo = (Ramo)this.service.find(this.ramo);
				propostas = (List<String>)this.service.genericFindBySQLQuery("select p.cliente.nome || ' # ' || coalesce(p.nroApolice,' ') || ' - Loc:' || p.numero || ' # ' || case when p.situacaoOperacional = 0 then 'ATIVA' when p.situacaoOperacional = 1 then 'CANCELADA' else 'ENDOSSADA' end || '#' || coalesce(sr.nome,' ') ||'/'|| r.nome || '#' || to_char(p.premioLiquido,'99G999G999D99') || '#' || coalesce(to_char(p.referenciaParcela,'mm/yyyy'),'') || '|' || case when sr.id is not null then sr.id else r.id end || '|' || case when sr.id is null then 0 else r.id end "+
					" || '|' || case when p.statusOperacional <= 4 then coalesce(p.nroApolice,' ') else coalesce(p.nroEndosso,' ') end || '|' || p.id || '|' || '0,00' || '|' || '0,00' || '|' || '' || '|' || '' || '|' || to_char(sum(coalesce(pc.valorComissao,0.00)),'99G999G999D99') || '|' || to_char(p.premioLiquido,'99G999G999D99') || '|' || coalesce(to_char(p.referenciaParcela,'mm/yyyy'),'') || '|' || p.isFatura || '\n' From Proposta p left join p.propostaComissaoCollection pc join p.ramo r left join r.subRamo sr where p.statusOperacional in (2,4,6,7,9,10) and p.cliente.nome like ?0 and (p.seguradora.id = ?1 or p.seguradora.id in (select s.id from Seguradora s where s.ciaAgrupadora.id = ?1)) and p.ramo.id = ?2 group by p.cliente.nome, p.numero, p.nroApolice, p.nroEndosso, p.statusOperacional, p.situacaoOperacional, p.id, r.id, sr.id, r.nome, sr.nome, p.premioLiquido, p.referenciaParcela, p.isFatura Order by p.cliente.nome", new Object[]{this.nome.toUpperCase()+"%", this.seguradora.getId(),this.ramo.getId()});
			}else{
				propostas = (List<String>)this.service.genericFindBySQLQuery("select p.cliente.nome || ' # ' || coalesce(p.nroApolice,' ') || ' - Loc:' || p.numero || ' # ' || case when p.situacaoOperacional = 0 then 'ATIVA' when p.situacaoOperacional = 1 then 'CANCELADA' else 'ENDOSSADA' end || '#' || coalesce(sr.nome,' ') ||'/'|| r.nome || '#' || to_char(p.premioLiquido,'99G999G999D99') || '#' || coalesce(to_char(p.referenciaParcela,'mm/yyyy'),'') || '|' || case when sr.id is not null then sr.id else r.id end || '|' || case when sr.id is null then 0 else r.id end "+
						" || '|' || case when p.statusOperacional <= 4 then coalesce(p.nroApolice,' ') else coalesce(p.nroEndosso,' ') end || '|' || p.id || '|' || '0,00' || '|' || '0,00' || '|' || '' || '|' || '' || '|' || to_char(sum(coalesce(pc.valorComissao,0.00)),'99G999G999D99') || '|' || to_char(p.premioLiquido,'99G999G999D99') ||  '|' || coalesce(to_char(p.referenciaParcela,'mm/yyyy'),'') || '|' || p.isFatura || '\n' From Proposta p left join p.propostaComissaoCollection pc join p.ramo r left join r.subRamo sr where p.statusOperacional in (2,4,6,7,9,10) and p.cliente.nome like ?0 and (p.seguradora.id = ?1 or p.seguradora.id in (select s.id from Seguradora s where s.ciaAgrupadora.id = ?1)) group by p.cliente.nome, p.numero, p.nroApolice,  p.nroEndosso, p.statusOperacional, p.situacaoOperacional, p.id, r.id, sr.id, r.nome, sr.nome, p.premioLiquido, p.referenciaParcela, p.isFatura Order by p.cliente.nome", new Object[]{this.nome.toUpperCase()+"%", this.seguradora.getId()});
			}

			this.autoCompleteResult = prepareToAutocomplete(propostas);//.replace(".", "#").replace(",", ".").replace("#", ",");
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return Action.ERROR;
	}

	public String getSeguradoraBySeguradoNome(){
		try{
			List<String>propostas = new ArrayList<String>();

			propostas = (List<String>)this.service.genericFindBySQLQuery("select p.cliente.nome || ' # ' || p.seguradora.nome || ' # ' || coalesce(p.nroApolice,' ') || ' - Loc:' || p.numero || ' # ' || case when p.situacaoOperacional = 0 then 'ATIVA' when p.situacaoOperacional = 1 then 'CANCELADA' else 'ENDOSSADA' end "+
				" || '|' || p.seguradora.id ||'\n' From Proposta p where p.statusOperacional in (2,4,6,7,9,10) and upper(p.cliente.nome) like ?0 Order by p.cliente.nome", new Object[]{this.nome.toUpperCase()+"%"});

			this.autoCompleteResult = prepareToAutocomplete(propostas);//.replace(".", "#").replace(",", ".").replace("#", ",");
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return Action.ERROR;
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String getCepOrCidadeList(){

		try{
			List<String>list = new ArrayList<String>();
			if(Util.isInteger(this.nome)){
				list = (List<String>)this.service.genericFindBySQLQuery("Select c.cep || '\n' From Cep c where c.cep like ?0 Order by c.cep", new Object[]{this.nome+"%"});
			}else{
				list = (List<String>)this.service.genericFindBySQLQuery("Select c.nome || ' # ' || c.uf.uf || '\n' From Cidade c where upper(c.nome) like ?0 Order by c.nome", new Object[]{this.nome+"%"});
			}
			this.autoCompleteResult = prepareToAutocomplete(list);
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return Action.ERROR;
	}

	/*
	 *
	 *
	 * Posibilitar autocomplete do endere�o
	 *
	 *
	 * */
	@SuppressWarnings("unchecked")
	@SkipValidation
	public String getEstadoListAC(){
		try{
			List<Uf> lista = null;
			lista = (List<Uf>) this.service.genericFindBySQLQuery("Select u From Uf u", null);

			ArrayList<String[]> ufsList = new ArrayList<String[]>();
			for(PObject pobject : lista) {
				Uf uf = (Uf) pobject;
				String[] option = { uf.getUf(), uf.getId().toString() };
				ufsList.add(option);
			}
			this.jsonList = getJsonArray(ufsList);
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return Action.ERROR;
	}



	@SuppressWarnings("unchecked")
	@SkipValidation
	public String getEnderecoCepAC(){
		try{
			String cep = this.nome.replace("-", "");
			List<String>ceps = (List<String>)this.service.genericFindBySQLQuery("Select c.cep || ' # ' || c.logradouro || '|' || c.bairro || '|' || c.cidade || '|' || c.uf || '|' || c.logradouro || '\n' From Cep c where c.cep like ?0 Order by c.cep", new Object[]{cep+"%"});
			this.autoCompleteResult = prepareToAutocomplete(ceps);
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return Action.ERROR;
	}

	@SuppressWarnings("unchecked")
	public String getEnderecoNumeroAC(){
		try{
			List<String>numeros = (List<String>)this.service.genericFindBySQLQuery("Select e.numero || '|' || e.cep.valor || '|' || e.complemento || '\n' From Endereco e where upper(e.numero) like ?0 Order by e.numero", new Object[]{this.endereco.getNumero()+"%"});
			this.autoCompleteResult = prepareToAutocomplete(numeros);
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return Action.ERROR;
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String getEnderecoEstadoSiglaAC(){
		try{
			List<String>siglas = (List<String>)this.service.genericFindBySQLQuery("Select e.uf || '|' || '\n' From Endereco e where upper(e.uf) like ?0 Order by e.numero", new Object[]{this.endereco.getUf()+"%"});
			this.autoCompleteResult = prepareToAutocomplete(siglas);
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return Action.ERROR;
	}

	/*  final*/


	@SkipValidation
	public String getDadosCliente(){
		try{
			if(this.getPessoa() != null && this.getPessoa().getId() != null){
				//TODO: Alterar para pegar o Endereço Residencial ou Comercial. Ver como será feito.
				this.setEndereco((Endereco)this.service.genericFindFirstResultByNamedQuery("getEnderecoByPessoaId", new Object[] { this.getPessoa().getId() }));
				this.setPessoaFisica((PessoaFisica)this.service.genericFindFirstResultByNamedQuery("getPessoaFisicaById", new Object[] { this.getPessoa().getId() }));
				this.setPessoaJuridica((PessoaJuridica)this.service.genericFindFirstResultByNamedQuery("getPessoaJuridicaById", new Object[] { this.getPessoa().getId() }));
			}
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return Action.ERROR;
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String getPropostaList(){
		try{
			List<String>propostas = (List<String>)this.service.genericFindBySQLQuery("Select p.numero  || ' # ' || p.cliente.nome || ' # ' || p.cliente.cpfOuCnpj || ' - Apolice # ' || p.nroApolice || '|' || p.id || '|' || p.nroApolice || '|' || p.dataEmissaoApolice || '|' || p.inicioVigencia || '|' || p.terminoVigencia || '|' || p.seguradora.nome || '|' || p.ramo.nome || '\n' From Proposta p where to_char(p.numero) like ?0 Order by p.numero", new Object[]{this.nome+"%"});
			this.autoCompleteResult = prepareToAutocomplete(propostas);
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return Action.ERROR;
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String getOficinaList(){
		try{
			List<String>oficinas = (List<String>)this.service.genericFindBySQLQuery("Select o.nome || '|' || o.id || '\n' From Oficina o where o.nome like ?0 Order by o.nome", new Object[]{this.nome+"%"});
			this.autoCompleteResult = prepareToAutocomplete(oficinas);
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return Action.ERROR;
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String getPropostaByNroApolice(){
		try{
			List<String>propostas = (List<String>)this.service.genericFindBySQLQuery("Select p.nroApolice  || ' # ' || p.cliente.nome || ' # ' || p.cliente.cpfOuCnpj || ' - Proposta # ' || p.numero || '|' || p.id || '|' || p.numero || '|' || p.dataEmissaoApolice || '|' || p.inicioVigencia || '|' || p.terminoVigencia || '|' || p.seguradora.nome || '|' || p.ramo.nome || '\n' From Proposta p where p.nroApolice like ?0 Order by p.numero", new Object[]{this.nome+"%"});
			this.autoCompleteResult = prepareToAutocomplete(propostas);
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return Action.ERROR;
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String getPropostaByCpf(){
		try{
			List<String>propostas = (List<String>)this.service.genericFindBySQLQuery("Select p.cliente.cpfOuCnpj || ' # ' || p.cliente.nome || ' - Proposta # ' || p.numero || '|' || p.numero  || '|' || p.id || '|' || p.nroApolice || '|' || p.dataEmissaoApolice || '|' || p.inicioVigencia || '|' || p.terminoVigencia || '|' || p.seguradora.nome || '|' || p.ramo.nome || '\n' From Proposta p where length(p.cliente.cpfOuCnpj.valor)=11 and p.cliente.cpfOuCnpj.valor like ?0 Order by p.numero", new Object[]{this.nome+"%"});
			this.autoCompleteResult = prepareToAutocomplete(propostas);
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return Action.ERROR;
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String getPropostaByCnpj(){
		try{
			List<String>propostas = (List<String>)this.service.genericFindBySQLQuery("Select p.cliente.cpfOuCnpj || ' # ' || p.cliente.nome || ' - Proposta # ' || p.numero || '|' || p.numero  || '|' || p.id || '|' || p.nroApolice || '|' || p.dataEmissaoApolice || '|' || p.inicioVigencia || '|' || p.terminoVigencia || '|' || p.seguradora.nome || '|' || p.ramo.nome || '\n' From Proposta p where length(p.cliente.cpfOuCnpj.valor)=14 and p.cliente.cpfOuCnpj.valor like ?0 Order by p.numero", new Object[]{this.nome+"%"});
			this.autoCompleteResult = prepareToAutocomplete(propostas);
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return Action.ERROR;
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String getPropostaByNomePf(){
		try{
			List<String>propostas = (List<String>)this.service.genericFindBySQLQuery("Select p.cliente.nome || ' # ' || p.cliente.cpfOuCnpj || ' - Proposta # ' || p.numero || '|' || p.numero  || '|' || p.id || '|' || p.nroApolice || '|' || p.dataEmissaoApolice || '|' || p.inicioVigencia || '|' || p.terminoVigencia || '|' || p.seguradora.nome || '|' || p.ramo.nome || '\n' From Proposta p where length(p.cliente.cpfOuCnpj.valor)=11 and p.cliente.nome like ?0 Order by p.numero", new Object[]{this.nome+"%"});
			this.autoCompleteResult = prepareToAutocomplete(propostas);
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return Action.ERROR;
	}
	
	public String getBancoByCodigoOrNome(){
		try{
			List<String> bancos = null; 
			if(this.nome.matches("[0-9]+")){
				bancos = (List<String>)this.service.genericFindBySQLQuery("SELECT substring(concat('000',p.codigo),length(p.codigo)+1,2+length(p.codigo)) || ' # ' ||p.nome || '|' || p.codigo || '\n' FROM Banco p WHERE p.codigo like ?0 Order by 1", new Object[]{this.nome+"%"});
			}
			else{
				bancos = (List<String>)this.service.genericFindBySQLQuery("SELECT substring(concat('000',p.codigo),length(p.codigo)+1,2+length(p.codigo)) || ' # ' ||p.nome || '|' || p.codigo || '\n' FROM Banco p WHERE p.nome like ?0 Order by 1", new Object[]{this.nome+"%"});	
			}
			this.autoCompleteResult = prepareToAutocomplete(bancos);
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return Action.ERROR;
	}
	
	public static void main(String[] args) {
//	    String[] str = {"fabio","nascimento","1986"};  
//        
//        for(int i=0;i<str.length;i++ ) {  
//            if(str[i].matches("[0-9]+")) {  
//                System.out.println("Match: " + str[i]);  
//            }  
//        }
		String s = "001asds";
		System.out.println(s.matches("[0-9]+"));
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String getPropostaByNomePj(){
		try{
			List<String>propostas = (List<String>)this.service.genericFindBySQLQuery("Select p.cliente.nome || ' # ' || p.cliente.cpfOuCnpj || ' - Proposta # ' || p.numero || '|' || p.numero  || '|' || p.id || '|' || p.nroApolice || '|' || p.dataEmissaoApolice || '|' || p.inicioVigencia || '|' || p.terminoVigencia || '|' || p.seguradora.nome || '|' || p.ramo.nome || '\n' From Proposta p where length(p.cliente.cpfOuCnpj.valor)=14 and p.cliente.nome like ?0 Order by p.numero", new Object[]{this.nome+"%"});
			this.autoCompleteResult = prepareToAutocomplete(propostas);
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return Action.ERROR;
	}

	@SkipValidation
	public String getItemSeguradoList(){
		try{

			if(this.getProposta() != null && this.getProposta().getId() != null){
				List<Automovel> itensSegurados = this.service.genericFindByNamedQuery("getAutomovelByProposta", new Object[] { this.getProposta().getId() });
				this.setItensSegurados(itensSegurados);
			}
			return Action.SUCCESS;
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return Action.ERROR;
	}

	public String prepareToAutocomplete(List<String>list){
		StringBuffer strBuffer = new StringBuffer();
		for(String str : list){
			strBuffer.append(str);
		}
		return strBuffer.toString();
	}

	public String getJsonArray(ArrayList arrayList) {
		JSONArray jsonArray = JSONArray.fromObject( arrayList );
		String json = jsonArray.toString().replace("{", "[");
		json = json.replace("}", "]");
		System.out.println( json );
		System.out.println( jsonArray );
		return json;
	}

	protected void setPObjectInstance() {
		this.dominio = (Dominio)this.pobject;
	}

	public List<PObject> getList(){
		return list;
	}

	public int getRowCount(){
		try{
			return this.service.getRowCount("getCountDominio", new Object[]{});
		} catch (Exception e) {
			addActionError(e.getMessage());
		}
		return 0;
	}

	public void setQ(String q){
		this.nome = q;
	}

	public Dominio getDominio() {
		return dominio;
	}

	public void setDominio(Dominio dominio) {
		this.dominio = dominio;
	}

	public Pessoa getPessoa() {
		return pessoa;
	}

	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
	}

	public PessoaFisica getPessoaFisica() {
		return pessoaFisica;
	}

	public void setPessoaFisica(PessoaFisica pessoaFisica) {
		this.pessoaFisica = pessoaFisica;
	}

	public PessoaJuridica getPessoaJuridica() {
		return pessoaJuridica;
	}

	public void setPessoaJuridica(PessoaJuridica pessoaJuridica) {
		this.pessoaJuridica = pessoaJuridica;
	}

	public Proposta getProposta() {
		return proposta;
	}

	public void setProposta(Proposta proposta) {
		this.proposta = proposta;
	}

	public Endereco getEndereco() {
		return endereco;
	}

	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}

	public List<String[]> getOptions() {
		return options;
	}

	public void setOptions(List<String[]> options) {
		this.options = options;
	}

	public String getJsonList() {
		return jsonList;
	}

	public void setJsonList(String jsonList) {
		this.jsonList = jsonList;
	}

	public String getAutoCompleteResult() {
		return autoCompleteResult;
	}

	public void setAutoCompleteResult(String autoCompleteResult) {
		this.autoCompleteResult = autoCompleteResult;
	}

	public Cep getCep() {
		return cep;
	}

	public void setCep(Cep cep) {
		this.cep = cep;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getDivName() {
		return divName;
	}

	public void setDivName(String divName) {
		this.divName = divName;
	}

	public String getCampoId() {
		return campoId;
	}

	public void setCampoId(String campoId) {
		this.campoId = campoId;
	}

	public String getCampoNome() {
		return campoNome;
	}

	public void setCampoNome(String campoNome) {
		this.campoNome = campoNome;
	}

	public String getFormName() {
		return formName;
	}

	public void setFormName(String formName) {
		this.formName = formName;
	}

	public void setList(List<PObject> list) {
		this.list = list;
	}

	public List<Automovel> getItensSegurados() {
		return itensSegurados;
	}

	public void setItensSegurados(List<Automovel> itensSegurados) {
		this.itensSegurados = itensSegurados;
	}

	public Uf getUf() {
		return uf;
	}

	public void setUf(Uf uf) {
		this.uf = uf;
	}

	public Cidade getCidade() {
		return cidade;
	}

	public void setCidade(Cidade cidade) {
		this.cidade = cidade;
	}

	public Fabricante getFabricante() {
		return fabricante;
	}

	public void setFabricante(Fabricante fabricante) {
		this.fabricante = fabricante;
	}

	public Produtor getProdutor() {
		return produtor;
	}

	public void setProdutor(Produtor produtor) {
		this.produtor = produtor;
	}

	public Seguradora getSeguradora() {
		return seguradora;
	}

	public void setSeguradora(Seguradora seguradora) {
		this.seguradora = seguradora;
	}

	public Ramo getRamo() {
		return ramo;
	}

	public void setRamo(Ramo ramo) {
		this.ramo = ramo;
	}

	public List<Seguradora> getSeguradoras() {
		return seguradoras;
	}

	public void setSeguradoras(List<Seguradora> seguradoras) {
		this.seguradoras = seguradoras;
	}

	public Integer getTipoLancamento() {
		return tipoLancamento;
	}

	public void setTipoLancamento(Integer tipoLancamento) {
		this.tipoLancamento = tipoLancamento;
	}

	public List<Ramo> getRamos() {
		return ramos;
	}

	public void setRamos(List<Ramo> ramos) {
		this.ramos = ramos;
	}

	public Ramo getSubRamo() {
		return subRamo;
	}

	public void setSubRamo(Ramo subRamo) {
		this.subRamo = subRamo;
	}
}