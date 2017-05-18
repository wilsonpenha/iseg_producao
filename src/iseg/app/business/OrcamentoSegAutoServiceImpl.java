package iseg.app.business;

import iseg.app.conversion.CEP;
import iseg.app.conversion.CpfCnpj;
import iseg.app.model.Automovel;
import iseg.app.model.AutomovelAcessorios;
import iseg.app.model.AutomovelCobertura;
import iseg.app.model.AutomovelOrcAcessorios;
import iseg.app.model.AutomovelPropAcessorios;
import iseg.app.model.AutomovelServicos;
import iseg.app.model.Condutor;
import iseg.app.model.Orcamento;
import iseg.app.model.OrcamentoBancos;
import iseg.app.model.OrcamentoCobertura;
import iseg.app.model.OrcamentoCoberturaIseg;
import iseg.app.model.OrcamentoFranquias;
import iseg.app.model.OrcamentoSeguradora;
import iseg.app.model.OrcamentoSeguro;
import iseg.app.model.OrcamentoServicos;
import iseg.app.model.OrcamentoServicosIseg;
import iseg.app.model.PerfilProposta;
import iseg.app.model.PessoaFisica;
import iseg.app.model.PessoaJuridica;
import iseg.app.model.Proposta;
import iseg.app.model.PropostaAutomovel;
import iseg.app.model.PropostaBancos;
import iseg.app.model.ProprietarioArrendatario;
import iseg.app.model.RespostaPerfil;
import iseg.app.persistence.LogType;
import iseg.app.persistence.PObject;
import iseg.utils.HibernateUtil;
import iseg.utils.Util;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import javax.persistence.Query;

import org.springframework.dao.InvalidDataAccessApiUsageException;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;



//@Service
@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
public class OrcamentoSegAutoServiceImpl extends OrcamentoSeguroServiceImpl implements OrcamentoSegAutoService {

	@PersistenceContext(type = PersistenceContextType.TRANSACTION)
	private EntityManager localEM = this.getEntityManager();
	
	//@Override
	public OrcamentoSeguro salvarEditar(OrcamentoSeguro orcamentoSeguro) throws Exception {
		if(orcamentoSeguro.getCliente() != null && orcamentoSeguro.getCliente().getId() == null){
			if(HibernateUtil.initializeAndUnproxy(orcamentoSeguro.getCliente()) instanceof PessoaFisica){
				PessoaFisica pessoaFisica = (PessoaFisica) HibernateUtil.initializeAndUnproxy(orcamentoSeguro.getCliente());
				orcamentoSeguro.setClienteNome(pessoaFisica.getNome());
				orcamentoSeguro.setCpfOuCnpj(pessoaFisica.getCpfOuCnpj());
				orcamentoSeguro.setTelefoneAlternativo(pessoaFisica.getTelefoneAlternativo());
				orcamentoSeguro.setTelefoneCelular(pessoaFisica.getTelefoneCelular());
				orcamentoSeguro.setTelefonePreferencial(pessoaFisica.getTelefonePreferencial());
				orcamentoSeguro.setEmail(pessoaFisica.getEmail());
				orcamentoSeguro.setReferenciaPessoal(pessoaFisica.getReferenciaPessoal());
				orcamentoSeguro.setCnh(pessoaFisica.getCnh());
				orcamentoSeguro.setData1aHabilitacao(pessoaFisica.getData1aHabilitacao());
				orcamentoSeguro.setDataNascimento(pessoaFisica.getDataNascimento());
				orcamentoSeguro.setEstadoCivil(pessoaFisica.getEstadoCivil());
				orcamentoSeguro.setSexo(pessoaFisica.getSexo());
				orcamentoSeguro.setProfissao(pessoaFisica.getProfissao());
				orcamentoSeguro.setOutraProfissao(pessoaFisica.getProfissaoNome());
			}else{
				PessoaJuridica pessoaJuridica = (PessoaJuridica) HibernateUtil.initializeAndUnproxy(orcamentoSeguro.getCliente());
				orcamentoSeguro.setClienteNome(pessoaJuridica.getNome());
				orcamentoSeguro.setCpfOuCnpj(pessoaJuridica.getCpfOuCnpj());
				orcamentoSeguro.setTelefoneAlternativo(pessoaJuridica.getTelefoneAlternativo());
				orcamentoSeguro.setTelefoneCelular(pessoaJuridica.getTelefoneCelular());
				orcamentoSeguro.setTelefonePreferencial(pessoaJuridica.getTelefonePreferencial());
				orcamentoSeguro.setEmail(pessoaJuridica.getEmail());
				orcamentoSeguro.setReferenciaPessoal(pessoaJuridica.getReferenciaPessoal());
			}
			orcamentoSeguro.setCliente(null);
		}
		if(orcamentoSeguro.getProposta() != null && orcamentoSeguro.getProposta().getId() == null)
			orcamentoSeguro.setProposta(null);
		if(orcamentoSeguro.getId() == null)
			orcamentoSeguro.setNumero(getSequenciaNumeroOrcamentoSeguro());
		
		if(orcamentoSeguro.getTipoCobertura() != null && orcamentoSeguro.getTipoCobertura().getId() == null){
			orcamentoSeguro.setTipoCobertura(null);
		}
		if(orcamentoSeguro.getRespostaPerfilCollection() != null || !orcamentoSeguro.getRespostaPerfilCollection().isEmpty()){
			for(RespostaPerfil resposta : orcamentoSeguro.getRespostaPerfilCollection()){
				resposta.setOrcamentoSeguro(orcamentoSeguro);
			}
		}
		if(orcamentoSeguro.getPerfilOrcamentoCollection() != null || !orcamentoSeguro.getPerfilOrcamentoCollection().isEmpty()){
			orcamentoSeguro.getPerfilOrcamentoCollection().get(0).setOrcamentoSeguro(orcamentoSeguro);
		}
		if(orcamentoSeguro.getAutomovelOrcamentoCollection() != null || !orcamentoSeguro.getAutomovelOrcamentoCollection().isEmpty()){
			if(orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getId() != null){
				this.executeNamedQuery("deleteAutomovelOrcAcessoriosByAutomovelOrcamento", new Object[]{orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getId()});
			}
			orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).setOrcamentoSeguro(orcamentoSeguro);
			if(orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getProprietarioArrendatario() != null){
				setNullObject(orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getProprietarioArrendatario());
				this.save(orcamentoSeguro.getAutomovelOrcamentoCollection().get(0).getProprietarioArrendatario());
			}
		}
		if(orcamentoSeguro.getId() != null){
			this.executeNamedQuery("deleteOrcamentoBancosByOrcamentoSeguro", new Object[]{orcamentoSeguro.getId()});
		}
		setNullObjectCollection(orcamentoSeguro.getCondutoresCollection());
		setNullObjectCollection(orcamentoSeguro.getAutomovelOrcamentoCollection());
		setNullObjectCollection(orcamentoSeguro.getOrcamentoSeguradoraCollection());
		setNullObjectCollection(orcamentoSeguro.getPerfilOrcamentoCollection());
		for(OrcamentoSeguradora orcamentoSeguradora: orcamentoSeguro.getOrcamentoSeguradoraCollection()){
			orcamentoSeguradora.setOrcamentoSeguro(orcamentoSeguro);
			for(OrcamentoFranquias orcamentoFranquias: orcamentoSeguradora.getOrcamentoFranquiasCollection()){
				orcamentoFranquias.setOrcamentoSeguradora(orcamentoSeguradora);
				setNullObject(orcamentoFranquias);
			}
		}
		if(orcamentoSeguro.getId() != null || orcamentoSeguro.getProposta() != null && orcamentoSeguro.getProposta().getId() == null){
			setNullObjectCollection(orcamentoSeguro.getOrcamentoCoberturaIsegCollection());
			setNullObjectCollection(orcamentoSeguro.getOrcamentoServicosIsegCollection());
		}
		List<OrcamentoCoberturaIseg> lstOrcamentoCoberturaIsegRemove = new ArrayList<OrcamentoCoberturaIseg>();
//		for(OrcamentoCoberturaIseg orcamentoCoberturaIseg : orcamentoSeguro.getOrcamentoCoberturaIsegCollection()){
//			if(orcamentoCoberturaIseg.getDescricao() == null || orcamentoCoberturaIseg.getDescricao().trim().equals("")){
//				this.executeNamedQuery("deleteOrcamentoCoberturaIsegById", new Object[]{orcamentoCoberturaIseg.getId()});
//				lstOrcamentoCoberturaIsegRemove.add(orcamentoCoberturaIseg);
//			}
//		}
		if(lstOrcamentoCoberturaIsegRemove != null && !lstOrcamentoCoberturaIsegRemove.isEmpty()){
			orcamentoSeguro.getOrcamentoCoberturaIsegCollection().removeAll(lstOrcamentoCoberturaIsegRemove);
		}
		List<OrcamentoServicosIseg> lstOrcamentoServicosIsegRemove = new ArrayList<OrcamentoServicosIseg>();
//		for(OrcamentoServicosIseg orcamentoServicosIseg : orcamentoSeguro.getOrcamentoServicosIsegCollection()){
//			if(orcamentoServicosIseg.getDescricao() == null || orcamentoServicosIseg.getDescricao().trim().equals("")){
//				this.executeNamedQuery("deleteOrcamentoServicosIsegById", new Object[]{orcamentoServicosIseg.getId()});
//				lstOrcamentoServicosIsegRemove.add(orcamentoServicosIseg);
//			}
//		}
		if(lstOrcamentoServicosIsegRemove != null && !lstOrcamentoServicosIsegRemove.isEmpty()){
			orcamentoSeguro.getOrcamentoServicosIsegCollection().removeAll(lstOrcamentoServicosIsegRemove);
		}
		this.save(orcamentoSeguro);
		return orcamentoSeguro;
	}
	
	public void salvarOrcamento(OrcamentoSeguro orcamentoSeguro) throws Exception {
		for(OrcamentoSeguradora orcamentoSeguradora : orcamentoSeguro.getOrcamentoSeguradoraCollection()){
		    Orcamento orcamento = new Orcamento();
		    orcamento.setDataOrcamento(new Date());
		    orcamento.setOrcamentoSeguradora(orcamentoSeguradora);
		    orcamento.setOrcamentoSeguro(orcamentoSeguro);
		    orcamento.setValidade(new Date());
		    save(orcamento);
		    orcamentoSeguro.getOrcamentoCollection().add(orcamento);
	    }
	}
	
	/**
	 * Metodo genérico para anular todos os objetos instanciados mas que estão com Id null, este método auxilia na eliminação do erro TransientObjectException
	 * @param obj
	 */
	public void setNullObjectCollection(Object obj) throws SecurityException, NoSuchMethodException, IllegalArgumentException, IllegalAccessException, InvocationTargetException{
		if(obj instanceof List){
			for(int i = 0; i < ((List<?>)obj).size(); i++){
				if(((List<?>)obj).get(i) != null){
					setNullObject(((List<?>)obj).get(i));
				}
			}
		}
	}
	public void setNullObject(Object object) throws SecurityException, NoSuchMethodException, IllegalArgumentException, IllegalAccessException, InvocationTargetException{
		List<Field> f = new ArrayList<Field>(Arrays.asList(object.getClass().getDeclaredFields()));
		if(object.getClass().getSuperclass() != null && !object.getClass().getSuperclass().getSimpleName().equals("PObject")){
			for(Field field : object.getClass().getSuperclass().getDeclaredFields()){
				f.add(field);
			}
		}
		object.getClass().getSuperclass().getDeclaredFields();
		for(Field field : f){
			String pLe = field.getName().substring(0,1).toUpperCase();
			String rest = field.getName().substring(1);
			String metodo = pLe+rest;
			Method m = null;
			Object o = null;
			if(!metodo.equals("SerialVersionUID")){
				m = object.getClass().getMethod("get"+metodo, null);
				o = m.invoke(object, null);
				if(!m.getReturnType().getName().equals(String.class.getName()) && 
				   !m.getReturnType().getName().equals(Long.class.getName()) &&
				   !m.getReturnType().getName().equals(Date.class.getName()) &&
				   !m.getReturnType().getName().equals(Integer.class.getName())&&
				   !m.getReturnType().getName().equals(Double.class.getName())&&
				   !m.getReturnType().getName().equals(Boolean.class.getName())&&
				   !m.getReturnType().getName().equals(CpfCnpj.class.getName())&&
				   !m.getReturnType().getName().equals(CEP.class.getName())&&
				   !m.getReturnType().getName().equals(BigDecimal.class.getName())){
					if(o != null){
						if(o instanceof List){
							if(((List)o).isEmpty()){
								Method method = object.getClass().getMethod("set"+metodo,m.getReturnType());
								method.invoke(object, new Object[]{null});
							}else{
								setNullObjectCollection(object);
							}
						}else{
							Method met = o.getClass().getMethod("getId", null);
							Object oId = met.invoke(o, null);
							if(oId == null){
								Method method = object.getClass().getMethod("set"+metodo,m.getReturnType());
								method.invoke(object, new Object[]{null});
							}
						}
					}
				}
			}
		}
	}
	
	@Override
	public void copyDadosProposta(OrcamentoFranquias orcamentoFranquias,Proposta proposta) throws Exception{
		OrcamentoSeguradora orcamentoSeguradora = orcamentoFranquias.getOrcamentoSeguradora();
		
		if(proposta.getCondutorCollection() != null){
			for(Condutor condutor : orcamentoSeguradora.getOrcamentoSeguro().getCondutoresCollection()){
				condutor.setProposta(proposta);
				condutor.setTipoCondutor(condutor.getIsCondutorPrincipal()==true?"SIM":"NAO");
			}
		}
		if(orcamentoSeguradora.getOrcamentoSeguro().getAutomovelOrcamentoCollection() != null){
			Automovel automovelTmp = new Automovel();
			automovelTmp.setModeloVeiculo(orcamentoSeguradora.getOrcamentoSeguro().getAutomovelOrcamentoCollection().get(0).getVeiculoModelo());
			automovelTmp.setAnoFabricacao(orcamentoSeguradora.getOrcamentoSeguro().getAutomovelOrcamentoCollection().get(0).getAnoFabricacao());
			automovelTmp.setAnoModelo(orcamentoSeguradora.getOrcamentoSeguro().getAutomovelOrcamentoCollection().get(0).getAnoModelo());
			automovelTmp.setAutomovelAcessoriosCollection(new ArrayList<AutomovelAcessorios>());
			automovelTmp.setCapacidade(orcamentoSeguradora.getOrcamentoSeguro().getAutomovelOrcamentoCollection().get(0).getCapacidade());
			automovelTmp.setCategoria(orcamentoSeguradora.getOrcamentoSeguro().getAutomovelOrcamentoCollection().get(0).getCategoria());
			automovelTmp.setCepPernoite(orcamentoSeguradora.getOrcamentoSeguro().getPerfilOrcamentoCollection().get(0).getCepPernoite());
			automovelTmp.setClasseBonus(orcamentoSeguradora.getOrcamentoSeguro().getAutomovelOrcamentoCollection().get(0).getClasseBonus());
//			automovelTmp.setCoberturaCasco(orcamentoSeguradora.getOrcamentoSeguro().getAutomovelOrcamentoCollection().get(0).get());
			automovelTmp.setCodigoFipe(orcamentoSeguradora.getOrcamentoSeguro().getAutomovelOrcamentoCollection().get(0).getCodigoFipe());
			automovelTmp.setCodigoIdentificacao(orcamentoSeguradora.getOrcamentoSeguro().getAutomovelOrcamentoCollection().get(0).getCodigoIdentificacao());
			automovelTmp.setCodigoIdentificacaoAnterior(orcamentoSeguradora.getOrcamentoSeguro().getAutomovelOrcamentoCollection().get(0).getCodigoIdentificacaoAnterior());
			automovelTmp.setCorPredominante(orcamentoSeguradora.getOrcamentoSeguro().getAutomovelOrcamentoCollection().get(0).getCorPredominante());
			automovelTmp.setFimVigApoliceAnterior(orcamentoSeguradora.getOrcamentoSeguro().getAutomovelOrcamentoCollection().get(0).getFimVigApoliceAnterior());
//			automovelTmp.setFranquia(orcamentoSeguradora.getOrcamentoSeguro().getAutomovelOrcamentoCollection().get(0).getFranquia());
			automovelTmp.setGravameAlienacao(orcamentoSeguradora.getOrcamentoSeguro().getAutomovelOrcamentoCollection().get(0).getGravameAlienacao());
//			automovelTmp.setNomeProprietario(orcamentoSeguradora.getOrcamentoSeguro().getAutomovelOrcamentoCollection().get(0).getNomeProprietario());
			automovelTmp.setNroApoliceAnterior(orcamentoSeguradora.getOrcamentoSeguro().getAutomovelOrcamentoCollection().get(0).getNroApoliceAnterior());
			automovelTmp.setNroChassis(orcamentoSeguradora.getOrcamentoSeguro().getAutomovelOrcamentoCollection().get(0).getNroChassis());
			automovelTmp.setNroNf(orcamentoSeguradora.getOrcamentoSeguro().getAutomovelOrcamentoCollection().get(0).getNroNf());
			automovelTmp.setNroPlaca(orcamentoSeguradora.getOrcamentoSeguro().getAutomovelOrcamentoCollection().get(0).getNroPlaca());
			automovelTmp.setNumeroItem(orcamentoSeguradora.getOrcamentoSeguro().getAutomovelOrcamentoCollection().get(0).getNumeroItem());
			automovelTmp.setRastreadorIseg(orcamentoSeguradora.getOrcamentoSeguro().getAutomovelOrcamentoCollection().get(0).getRastreadorIseg());
			automovelTmp.setBloqueadorIseg(orcamentoSeguradora.getOrcamentoSeguro().getAutomovelOrcamentoCollection().get(0).getBloqueadorIseg());
			automovelTmp.setOutroRastreador(orcamentoSeguradora.getOrcamentoSeguro().getAutomovelOrcamentoCollection().get(0).getOutroRastreador());
			automovelTmp.setOutroBloqueador(orcamentoSeguradora.getOrcamentoSeguro().getAutomovelOrcamentoCollection().get(0).getOutroBloqueador());
			automovelTmp.setNumeroItem(1);
			automovelTmp.setUsoVeiculo(orcamentoSeguradora.getOrcamentoSeguro().getAutomovelOrcamentoCollection().get(0).getUsoVeiculo());
			
			if(orcamentoSeguradora.getOrcamentoSeguro().getAutomovelOrcamentoCollection().get(0).getTipoIndenizacao().equals("VD")){
				automovelTmp.setValorCasco(orcamentoSeguradora.getOrcamentoSeguro().getAutomovelOrcamentoCollection().get(0).getValorCasco());
			}else{
				automovelTmp.setPercentualReferenciado(orcamentoSeguradora.getOrcamentoSeguro().getAutomovelOrcamentoCollection().get(0).getValorCasco());
			}
			
//			automovelTmp.setProposta(proposta);
			automovelTmp.setRenavan(orcamentoSeguradora.getOrcamentoSeguro().getAutomovelOrcamentoCollection().get(0).getRenavan());
			automovelTmp.setRenovacao(orcamentoSeguradora.getOrcamentoSeguro().getAutomovelOrcamentoCollection().get(0).getRenovacao());
			automovelTmp.setSeguradora(orcamentoSeguradora.getSeguradora());
			automovelTmp.setStatus(orcamentoSeguradora.getOrcamentoSeguro().getAutomovelOrcamentoCollection().get(0).getStatus());
			automovelTmp.setTipoCombustivel(orcamentoSeguradora.getOrcamentoSeguro().getAutomovelOrcamentoCollection().get(0).getTipoCombustivel());
			automovelTmp.setTipoFranquia(orcamentoSeguradora.getOrcamentoSeguro().getAutomovelOrcamentoCollection().get(0).getTipoFranquia());
			automovelTmp.setTipoIndenizacao(orcamentoSeguradora.getOrcamentoSeguro().getAutomovelOrcamentoCollection().get(0).getTipoIndenizacao());
			automovelTmp.setIsSeguradoProprietario(orcamentoSeguradora.getOrcamentoSeguro().getAutomovelOrcamentoCollection().get(0).getIsSeguradoProprietario());
			automovelTmp.setZeroKm(orcamentoSeguradora.getOrcamentoSeguro().getAutomovelOrcamentoCollection().get(0).getIsZeroKm()!= null && orcamentoSeguradora.getOrcamentoSeguro().getAutomovelOrcamentoCollection().get(0).getIsZeroKm()==true?"SIM":"N�O");
			automovelTmp.setFranquia(orcamentoFranquias.getValorFranquia());
			automovelTmp.setCepPernoite(orcamentoSeguradora.getOrcamentoSeguro().getPerfilOrcamentoCollection().get(0).getCepPernoite());

			
			PerfilProposta perfilProposta = new PerfilProposta();
			perfilProposta.setCepResidencia(orcamentoSeguradora.getOrcamentoSeguro().getPerfilOrcamentoCollection().get(0).getCepResidencia());
			perfilProposta.setCepTrabalho(orcamentoSeguradora.getOrcamentoSeguro().getPerfilOrcamentoCollection().get(0).getCepTrabalho());
			perfilProposta.setCepPernoite(orcamentoSeguradora.getOrcamentoSeguro().getPerfilOrcamentoCollection().get(0).getCepPernoite());
			perfilProposta.setTipoResidencia(orcamentoSeguradora.getOrcamentoSeguro().getPerfilOrcamentoCollection().get(0).getTipoResidencia());
			perfilProposta.setUtilizacaoVeiculo(orcamentoSeguradora.getOrcamentoSeguro().getPerfilOrcamentoCollection().get(0).getUtilizacaoVeiculo());
			perfilProposta.setQuilometragem(orcamentoSeguradora.getOrcamentoSeguro().getPerfilOrcamentoCollection().get(0).getQuilometragem());
			perfilProposta.setTipoGaragem(orcamentoSeguradora.getOrcamentoSeguro().getPerfilOrcamentoCollection().get(0).getTipoGaragem());
			perfilProposta.setQtdOutrosVeiculos(orcamentoSeguradora.getOrcamentoSeguro().getPerfilOrcamentoCollection().get(0).getQtdOutrosVeiculos());
			perfilProposta.setProposta(proposta);
			proposta.setPerfilPropostaCollection(new ArrayList<PerfilProposta>());
			proposta.getPerfilPropostaCollection().add(perfilProposta);
			ProprietarioArrendatario prop = (ProprietarioArrendatario)Util.cloneBean(orcamentoSeguradora.getOrcamentoSeguro().getAutomovelOrcamentoCollection().get(0).getProprietarioArrendatario(), ProprietarioArrendatario.class, "id");
			if(prop != null){
				this.save(prop);
				automovelTmp.setProprietarioArrendatario(prop);
			}else{
				automovelTmp.setProprietarioArrendatario(null);
			}
			proposta.setPropostaBancosCollection(new ArrayList<PropostaBancos>());
			for(OrcamentoBancos orcamentoBancos : orcamentoSeguradora.getOrcamentoSeguro().getOrcamentoBancosCollection()){
				PropostaBancos propostaBancos = new PropostaBancos();
				propostaBancos.setAgencia(orcamentoBancos.getAgencia());
				propostaBancos.setBancoRelacionamento(orcamentoBancos.getBancoRelacionamento());
				propostaBancos.setConta(orcamentoBancos.getConta());
				propostaBancos.setDigito(orcamentoBancos.getDigito());
				propostaBancos.setProposta(proposta);
				propostaBancos.setTipoContaRelacionamento(orcamentoBancos.getTipoContaRelacionamento());
				proposta.getPropostaBancosCollection().add(propostaBancos);
			}
			
			for(AutomovelOrcAcessorios automovelOrcAcessorios : orcamentoSeguradora.getOrcamentoSeguro().getAutomovelOrcamentoCollection().get(0).getAutomovelOrcAcessoriosCollection()){
				AutomovelPropAcessorios automovelAcessorios = new AutomovelPropAcessorios();
				automovelAcessorios.setAcessorio(automovelOrcAcessorios.getAcessorio());
				automovelAcessorios.setAutomovel(automovelTmp);
				automovelTmp.getAutomovelPropAcessoriosCollection().add(automovelAcessorios);
			}
			
			OrcamentoSeguradora orcSeguradora = (OrcamentoSeguradora)this.find(orcamentoSeguradora);
			if(orcSeguradora.getOrcamentoCoberturaCollection() != null && !orcSeguradora.getOrcamentoCoberturaCollection().isEmpty()){
				orcamentoSeguradora.setOrcamentoCoberturaCollection(orcSeguradora.getOrcamentoCoberturaCollection());	
			}
			if(orcamentoSeguradora.getOrcamentoCoberturaCollection() != null){
				for(OrcamentoCobertura orcamentoCobertura : orcamentoSeguradora.getOrcamentoCoberturaCollection()){
					orcamentoCobertura  = (OrcamentoCobertura)find(OrcamentoCobertura.class,orcamentoCobertura.getId());
					AutomovelCobertura automovelCobertura = new AutomovelCobertura();
					automovelCobertura.setAutomovel(automovelTmp);
					automovelCobertura.setBlnInformaFranquia(orcamentoCobertura.getInformaFranquia());
					if(orcamentoCobertura.getCoberturas()!=null && orcamentoCobertura.getCoberturas().getId() != null)
						automovelCobertura.setCobertura(orcamentoCobertura.getCoberturas());
					else
						automovelCobertura.setCobertura(null);
					automovelCobertura.setCoberturasIseg(orcamentoCobertura.getCoberturasIseg());
					automovelCobertura.setDescricao(orcamentoCobertura.getDescricao());
					automovelCobertura.setFranquia(orcamentoCobertura.getFranquia());
					automovelCobertura.setLmi(orcamentoCobertura.getLmi());
					automovelCobertura.setPremio(orcamentoCobertura.getPremio());
					automovelCobertura.setSequencia(new Integer(String.valueOf(orcamentoCobertura.getSequencia()!=null?orcamentoCobertura.getSequencia():0)));
					automovelCobertura.setTextoFranquia(orcamentoCobertura.getTextoFranquia());
					automovelTmp.getAutomovelCoberturaCollection().add(automovelCobertura);
				}
			}
			if(orcSeguradora.getOrcamentoServicosCollection() != null && !orcSeguradora.getOrcamentoServicosCollection().isEmpty()){
				orcamentoSeguradora.setOrcamentoServicosCollection(orcSeguradora.getOrcamentoServicosCollection());	
			}
			if(orcamentoSeguradora.getOrcamentoServicosCollection() != null){
				for(OrcamentoServicos orcamentoServico : orcamentoSeguradora.getOrcamentoServicosCollection()){
					orcamentoServico = (OrcamentoServicos)find(OrcamentoServicos.class,orcamentoServico.getId());
					AutomovelServicos automovelServico = new AutomovelServicos();
					automovelServico.setAutomovel(automovelTmp);
					automovelServico.setBlnInformaFranquia(orcamentoServico.getInformaFranquia());
					if((orcamentoServico.getServicosIseg() != null && orcamentoServico.getServicosIseg().getId() != null) || (orcamentoServico.getServicos() != null && orcamentoServico.getServicos().getId() != null)){
						if(orcamentoServico.getServicos() != null && orcamentoServico.getServicos().getId() != null)
							automovelServico.setServicos(orcamentoServico.getServicos());
						else
							automovelServico.setServicos(null);
						automovelServico.setServicosIseg(orcamentoServico.getServicosIseg());
						automovelServico.setDescricao(orcamentoServico.getDescricao());
						automovelServico.setFranquia(orcamentoServico.getFranquia());
						automovelServico.setPremio(orcamentoServico.getPremio());
						automovelServico.setSequencia(orcamentoServico.getSequencia());
						automovelServico.setTextoFranquia(orcamentoServico.getTextoFranquia());
						if(orcamentoServico.getInformaFranquia()!=null){
							if(orcamentoServico.getInformaFranquia()){
								automovelServico.setServicoContratado("SIM");
							}else{
								automovelServico.setServicoContratado("NAO");
							}
						}
						automovelTmp.getAutomovelServicosCollection().add(automovelServico);
					}
				}
			}
			this.save(automovelTmp);
			PropostaAutomovel propostaAutomovelTmp = new PropostaAutomovel();
			if(orcamentoSeguradora.getOrcamentoSeguro().getProposta() != null){
				propostaAutomovelTmp.setPropostaOriginal(orcamentoSeguradora.getOrcamentoSeguro().getProposta());
			}else{
				propostaAutomovelTmp.setPropostaOriginal(proposta);
			}
			propostaAutomovelTmp.setProposta(proposta);
			propostaAutomovelTmp.setAutomovel(automovelTmp);
			propostaAutomovelTmp.setLog(new LogType());
			propostaAutomovelTmp.getLog().setAutor(proposta.getUsuario());
			propostaAutomovelTmp.getLog().setEditor(null);
			propostaAutomovelTmp.getLog().setExcluidoPor(null);
			propostaAutomovelTmp.setDataInclusao(new Date());
			propostaAutomovelTmp.setNumeroItem(1);
			this.save(propostaAutomovelTmp);
			proposta.getPropostaAutomovelCollection().add(propostaAutomovelTmp);
		}
	}
	
    public List<? extends PObject> findByNativeQuery(String nativeSQL, Class<?> resultClass, Map<String, Object> args, Integer start, Integer limit) {
          try {
			Query q = null;
			q = getEntityManager().createNativeQuery(nativeSQL, resultClass);
			if (args != null) {
				for (Map.Entry<String, Object> entry : args.entrySet()) {
					// will throw IllegalArgumentException if parameter name not
					// found or value is incorrect type
					q.setParameter(entry.getKey(), entry.getValue());
				}
			}
			if (!(null == start))
				q.setFirstResult(start);
			if (!(null == limit))
				q.setMaxResults(limit);
			return (List<PObject>) q.getResultList();
		} catch (RuntimeException re) {
			// logger.error("find failed", re);
			throw new InvalidDataAccessApiUsageException(re.getMessage(), re);
		}
    }
    public Object[] findByNativeQuery(String nativeSQL, String resultSet, Map<String, Object> args, Integer start, Integer limit) {
    	try {
    		Query q = null;
			q = getEntityManager().createNativeQuery(nativeSQL, resultSet);
    		if (args != null) {
    			for (Map.Entry<String, Object> entry : args.entrySet()) {
    				// will throw IllegalArgumentException if parameter name not
    				// found or value is incorrect type
    				q.setParameter(entry.getKey(), entry.getValue());
    			}
    		}
    		if (!(null==start))
    			q.setFirstResult(start);
    		if (!(null==limit))
    			q.setMaxResults(limit);
    		return q.getResultList().toArray();
    	} catch (RuntimeException re) {
    		//logger.error("find failed", re);
    		throw new InvalidDataAccessApiUsageException(re.getMessage(), re);
    	}
    }
}