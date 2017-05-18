package iseg.app.webservice.client;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Marshaller;

import br.com.bradseg.paol.calculoauto.model.vo.ArrayOfEOpcionalVo;
import br.com.bradseg.paol.calculoauto.model.vo.BuscaCotacaoVo;
import br.com.bradseg.paol.calculoauto.model.vo.BuscaFipeVo;
import br.com.bradseg.paol.calculoauto.model.vo.CalculoVo;
import br.com.bradseg.paol.calculoauto.model.vo.CotacaoVo;
import br.com.bradseg.paol.calculoauto.model.vo.ECalculoVo;
import br.com.bradseg.paol.calculoauto.model.vo.ECoberturaVo;
import br.com.bradseg.paol.calculoauto.model.vo.EOpcionalVo;
import br.com.bradseg.paol.calculoauto.model.vo.EPacoteServicoVo;
import br.com.bradseg.paol.calculoauto.model.vo.EParametroVo;
import br.com.bradseg.paol.calculoauto.model.vo.EPerfilVo;
import br.com.bradseg.paol.calculoauto.model.vo.ERenovacaoVo;
import br.com.bradseg.paol.calculoauto.model.vo.EVeiculoVo;
import br.com.bradseg.paol.calculoauto.model.vo.EVerificaTarifaVo;
import br.com.bradseg.paol.calculoauto.model.vo.InfoVeiculoVo;
import br.com.bradseg.paol.calculoauto.model.vo.PacoteServicoVoOut;
import br.com.bradseg.paol.wsat.controller.services.BolCalculoAuto;
import br.com.bradseg.paol.wsat.controller.services.BolCotacaoAuto;
import br.com.bradseg.paol.wsat.controller.services.BolWebserviceUtil;

/**
 * 
 * 
 * LOGINS          SENHAS
 * CASA DO CORRETO         - "03673941000184", "108704"
 * BRASICOR CORRETORA / G8 - "37255056000105", "106336"
 * POOLCOR CORRETORA       - "02643661000160", "159632"
 * KCL CORRETORA           - "07829911000175", "968344"
 *
 */
public class CalculoSeguro {

	private EParametroVo eParametroVo;
	private EVeiculoVo eVeiculoVo;
	private ECoberturaVo eCoberturaVo;
	private EPerfilVo ePerfilSeguradoVo;
	private EPerfilVo ePerfilProprietarioVo;
	private ERenovacaoVo eRenovacaoVo;
	
	private String nuCpfCnpjCorretor;
	private String senhaCorretor;
	
	private CalculoSeguro calculoSeguro;
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		try {
			CalculoSeguro calculoSeguro = new CalculoSeguro();
			CalculoVo calculoVo = calculoSeguro.gerenciadorCalculo();
			
			BuscaCotacaoVo buscaCotacaoVo = new BuscaCotacaoVo();
			//buscaCotacaoVo.setCdCorretor(111427);
			//buscaCotacaoVo.setCdItem(1); 
			buscaCotacaoVo.setCdModalidade("N");
			//buscaCotacaoVo.setCdSucursal(83);
			buscaCotacaoVo.setNuCotacao(calculoVo.getBuscaCotacaoVo().getNuCotacao());
			buscaCotacaoVo.setNuCpfCnpjCorretor("07829911000175");
			
			CotacaoVo cotacaoVo = calculoSeguro.buscaCotacao("07829911000175", "968344", buscaCotacaoVo);
			System.out.print(cotacaoVo);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	public CalculoSeguro(String nuCpfCnpjCorretor, String senhaCorretor) {
		this.nuCpfCnpjCorretor = nuCpfCnpjCorretor;
		this.senhaCorretor = senhaCorretor;
	}
	
	public CalculoSeguro() {
		this.nuCpfCnpjCorretor = "07829911000175";
		this.senhaCorretor = "968344";

		ArrayOfEOpcionalVo arrayOfEOpcionalVo = new ArrayOfEOpcionalVo();
		List<EOpcionalVo> eOpcionalVoList = new ArrayList<EOpcionalVo>();
		EOpcionalVo eOpcionalVo = new EOpcionalVo();
		eOpcionalVo.setCdOpcional(10); // Cambio automatico
		eOpcionalVoList.add(eOpcionalVo);
		//arrayOfEOpcionalVo.setEOpcionalVo(eOpcionalVoList);
		
		this.eVeiculoVo = new EVeiculoVo();
		this.eVeiculoVo.setCdVeiculo(6623);
		this.eVeiculoVo.setCdAntiFurto(128);
		this.eVeiculoVo.setListaOpcionais(arrayOfEOpcionalVo);
		this.eVeiculoVo.setCdCombustivel(7);
		this.eVeiculoVo.setCdUsoVeiculo(44);
		this.eVeiculoVo.setCdFranquia(22);
		this.eVeiculoVo.setCdProduto(1);
		this.eVeiculoVo.setDtSaidaConcessionaria("11042013");
		this.eVeiculoVo.setFlChassiRemarcado("N");
		this.eVeiculoVo.setFlComodato("N");
		this.eVeiculoVo.setFlIdenticar("N");
		this.eVeiculoVo.setFlValorMercado("S");
		this.eVeiculoVo.setNuAnoFabricacao(2012);
		this.eVeiculoVo.setNuAnoModelo(2013);
		this.eVeiculoVo.setNuChassi("3N1AB61D28L602368");
		this.eVeiculoVo.setNuEixo(2);
		this.eVeiculoVo.setNuPassageiros(5);
		this.eVeiculoVo.setNuPlaca("CFM1967");
		this.eVeiculoVo.setNuPortas(4);
		this.eVeiculoVo.setPcAjusteValorVeiculo(110);
		
		this.ePerfilProprietarioVo = new EPerfilVo();
		this.ePerfilProprietarioVo.setCdEstadoCivil("C");
		this.ePerfilProprietarioVo.setCdSexo("M");
		this.ePerfilProprietarioVo.setCdTipoPerfil(2);
		this.ePerfilProprietarioVo.setDtNascimento("28071963");
		this.ePerfilProprietarioVo.setFlFilhosAte16Anos("S");
		this.ePerfilProprietarioVo.setFlFilhosEntre17E25("S");
		this.ePerfilProprietarioVo.setFlHaMaisVeiculoGaragem("S");
		this.ePerfilProprietarioVo.setFlVeiculoPernoiteGaragem("S");

		this.ePerfilSeguradoVo = new EPerfilVo();
		this.ePerfilSeguradoVo.setCdEstadoCivil("C");
		this.ePerfilSeguradoVo.setCdSexo("M");
		this.ePerfilSeguradoVo.setCdTipoPerfil(1);
		this.ePerfilSeguradoVo.setDtNascimento("28071963");
		this.ePerfilSeguradoVo.setFlFilhosAte16Anos("S");
		this.ePerfilSeguradoVo.setFlFilhosEntre17E25("S");
		this.ePerfilSeguradoVo.setFlHaMaisVeiculoGaragem("S");
		this.ePerfilSeguradoVo.setFlVeiculoPernoiteGaragem("S");
		
		this.eCoberturaVo = new ECoberturaVo();
		this.eCoberturaVo.setCdClausulaAssistencia(63);
		this.eCoberturaVo.setCdClausulaCarroReserva(85);
		this.eCoberturaVo.setCdClausulaVidros(24);
		this.eCoberturaVo.setCdZeroKm(6);
		this.eCoberturaVo.setFlDespesasExtraordinarias("N");
		this.eCoberturaVo.setIsAppInvalidez(12500.0);
		this.eCoberturaVo.setIsAppMorte(12500.0);
		this.eCoberturaVo.setIsDanosCorporais(50000.0);
		this.eCoberturaVo.setIsDanosMateriais(50000.0);
		this.eCoberturaVo.setIsDanosMorais(50000.0);
		this.eCoberturaVo.setFlCoberturaSP("S");

		this.eParametroVo = new EParametroVo();
		this.eParametroVo.setCdCorretor(111427);
		this.eParametroVo.setFlAdicionalFracionamento("S");
		this.eParametroVo.setFlCcb("S");
		this.eParametroVo.setFlCustoApolice("S");
		this.eParametroVo.setFlIOF("S");
		this.eParametroVo.setFlProRata("N");
		this.eParametroVo.setNuCpfCnpjCorretor("07829911000175");
	}
	
	/**
	 * @param args
	 */
	public CotacaoVo testeCalculoSeguro() {
		CotacaoVo cotacaoVo = null;
		try {
			CalculoSeguro calculoSeguro = new CalculoSeguro();
			CalculoVo calculoVo = calculoSeguro.gerenciadorCalculo();
			
			BuscaCotacaoVo buscaCotacaoVo = new BuscaCotacaoVo();
			//buscaCotacaoVo.setCdCorretor(111427);
			//buscaCotacaoVo.setCdItem(1);
			buscaCotacaoVo.setCdModalidade("N");
			//buscaCotacaoVo.setCdSucursal(83);
			buscaCotacaoVo.setNuCotacao(calculoVo.getBuscaCotacaoVo().getNuCotacao());
			buscaCotacaoVo.setNuCpfCnpjCorretor("07829911000175");
			
			cotacaoVo = calculoSeguro.buscaCotacao("07829911000175", "968344",buscaCotacaoVo);
			return cotacaoVo;
		}catch (Exception e) {
			e.printStackTrace();
			return cotacaoVo;
		}
	}

	public boolean verificaTarifa(EVerificaTarifaVo eVerificaTarifaVo) {
		boolean verificaTarifa = false;
		try {
			BolWebserviceUtil bolWebserviceUtil = new BolWebserviceUtil();
			verificaTarifa = bolWebserviceUtil.getBolWebserviceUtilHttpPort().verificaTarifa(eVerificaTarifaVo, this.nuCpfCnpjCorretor, this.senhaCorretor);
			return verificaTarifa;
		}catch (Exception e) {
			e.printStackTrace();
			return verificaTarifa;
		}
		
	}

	public EPacoteServicoVo buscaPacoteServico() {
		boolean verificaTarifa = false;
		PacoteServicoVoOut pacoteServicoVoOut = null;
		EPacoteServicoVo ePacoteServicoVo = new EPacoteServicoVo();
		try {
			EVerificaTarifaVo eVerificaTarifaVo = new EVerificaTarifaVo();
			eVerificaTarifaVo.setDtInicioVigencia("11042013");
			eVerificaTarifaVo.setDtCalculo("11042013");
			eVerificaTarifaVo.setCepRisco("74230100");
			eVerificaTarifaVo.setCdVeiculo(6623);
			
			verificaTarifa = this.verificaTarifa(eVerificaTarifaVo);
			BolWebserviceUtil bolWebserviceUtil = new BolWebserviceUtil();
			ePacoteServicoVo.setCdUso(1);
			ePacoteServicoVo.setCdSegmento(1);
			ePacoteServicoVo.setCdVeiculo(6623);
			ePacoteServicoVo.setCdRegiao(74230100);
			ePacoteServicoVo.setCdCobertura(1);
			ePacoteServicoVo.setFlBlindagem("N");
			ePacoteServicoVo.setCdRelacaoSegurado("7"); 
			ePacoteServicoVo.setDtNascimentoSegurado("28071963");
			ePacoteServicoVo.setDtNascimentoProprietario("28071963");
			ePacoteServicoVo.setDtInicioVigencia("11042013");
			ePacoteServicoVo.setCdUsuario(8000); 
			ePacoteServicoVo.setFlBasica("N");
			ePacoteServicoVo.setFlPacoteEspecial("S");
			ePacoteServicoVo.setFlIndicativoNovaTarifa(verificaTarifa ? "S" : "N");
			ePacoteServicoVo.setNuCep(74230100);
			ePacoteServicoVo.setCdOperacao(0);
			ePacoteServicoVo.setInPropostaGcon("1");
			ePacoteServicoVo.setTipoPessoa("F");
			ePacoteServicoVo.setTipoProposta("1");
			ePacoteServicoVo.setDtFimVigencia("11042014");
			
			pacoteServicoVoOut = bolWebserviceUtil.getBolWebserviceUtilHttpPort().buscaPacoteServico(ePacoteServicoVo, "07829911000175", "968344");
			return ePacoteServicoVo;
		}catch (Exception e) {
			e.printStackTrace();
			return ePacoteServicoVo;
		}
	}
	
	public EPacoteServicoVo buscaPacoteServico(
			String dtInicioVigencia, 
			String dtCalculo,
			String cepRisco,
			Integer cdVeiculo,
			Integer cdUso,
			Integer cdSegmento,
			Integer cdRegiao,
			Integer cdCobertura,
			String flBlindagem,
			String cdRelacaoSegurado,
			String dtNascimentoSegurado,
			String dtNascimentoProprietario,
			Integer cdUsuario,
			String flBasica,
			String flPacoteEspecial,
			Integer cdOperacao,
			String inPropostaGcon,
			String tipoPessoa,
			String tipoProposta,
			String dtFimVigencia) {
		boolean verificaTarifa = false;
		PacoteServicoVoOut pacoteServicoVoOut = null;
		EPacoteServicoVo ePacoteServicoVo = new EPacoteServicoVo();
		try {
			EVerificaTarifaVo eVerificaTarifaVo = new EVerificaTarifaVo();
			eVerificaTarifaVo.setDtInicioVigencia(dtInicioVigencia);
			eVerificaTarifaVo.setDtCalculo(dtCalculo);
			eVerificaTarifaVo.setCepRisco(cepRisco);
			eVerificaTarifaVo.setCdVeiculo(cdVeiculo);
			
			verificaTarifa = this.verificaTarifa(eVerificaTarifaVo);
			BolWebserviceUtil bolWebserviceUtil = new BolWebserviceUtil();
			ePacoteServicoVo.setCdUso(cdUso);
			ePacoteServicoVo.setCdSegmento(cdSegmento);
			ePacoteServicoVo.setCdVeiculo(cdVeiculo);
			ePacoteServicoVo.setCdRegiao(cdRegiao);
			ePacoteServicoVo.setCdCobertura(cdCobertura);
			ePacoteServicoVo.setFlBlindagem(flBlindagem);
			ePacoteServicoVo.setCdRelacaoSegurado(cdRelacaoSegurado);
			ePacoteServicoVo.setDtNascimentoSegurado(dtNascimentoSegurado);
			ePacoteServicoVo.setDtNascimentoProprietario(dtNascimentoProprietario);
			ePacoteServicoVo.setDtInicioVigencia(dtInicioVigencia);
			ePacoteServicoVo.setCdUsuario(cdUsuario);  
			ePacoteServicoVo.setFlBasica(flBasica);
			ePacoteServicoVo.setFlPacoteEspecial(flPacoteEspecial);
			ePacoteServicoVo.setFlIndicativoNovaTarifa(verificaTarifa ? "S" : "N");
			ePacoteServicoVo.setNuCep(new Integer(cepRisco));
			ePacoteServicoVo.setCdOperacao(cdOperacao);
			ePacoteServicoVo.setInPropostaGcon(inPropostaGcon);
			ePacoteServicoVo.setTipoPessoa(tipoPessoa);
			ePacoteServicoVo.setTipoProposta(tipoProposta);
			ePacoteServicoVo.setDtFimVigencia(dtFimVigencia);
			
			pacoteServicoVoOut = bolWebserviceUtil.getBolWebserviceUtilHttpPort().buscaPacoteServico(ePacoteServicoVo, nuCpfCnpjCorretor, senhaCorretor);
   
			JAXBContext jc = JAXBContext.newInstance(PacoteServicoVoOut.class);
	        Marshaller marshaller = jc.createMarshaller();
	        marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
	        marshaller.marshal(pacoteServicoVoOut, System.out);
	        
			jc = JAXBContext.newInstance(EPacoteServicoVo.class);
			  
	        marshaller = jc.createMarshaller();
	        marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
	        marshaller.marshal(ePacoteServicoVo, System.out);

	        return ePacoteServicoVo;  
		}catch (Exception e) {
			e.printStackTrace();
			return ePacoteServicoVo;
		}
	}
	
	public CalculoVo calcularSeguroBradesco(ECalculoVo eCalculoVo) throws Exception{
			
		CalculoVo calculoVo = null;
		BolCalculoAuto bolCalculoAuto = new BolCalculoAuto();
		
		calculoVo = bolCalculoAuto.getBolCalculoAutoHttpPort().gerenciadorCalculo(eCalculoVo, this.nuCpfCnpjCorretor, this.senhaCorretor);

		JAXBContext jc = JAXBContext.newInstance(CalculoVo.class);
        Marshaller marshaller = jc.createMarshaller();
        marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        marshaller.marshal(calculoVo, System.out);
        
		jc = JAXBContext.newInstance(ECalculoVo.class);
		 
        marshaller = jc.createMarshaller();
        marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        marshaller.marshal(eCalculoVo, System.out);

        return calculoVo;
	}
	
	public CalculoVo gerenciadorCalculo() {
		CalculoVo calculoVo = null;
		EPacoteServicoVo ePacoteServicoVo = null;
		try{
			ePacoteServicoVo = this.buscaPacoteServico();
			BolCalculoAuto bolCalculoAuto = new BolCalculoAuto();
			ECalculoVo eCalculoVo = new ECalculoVo();
			
			eCalculoVo.setCdTipoSistema(1);
			eCalculoVo.setCdEmpresa(0000);
			eCalculoVo.setCdInspetoria(18);
			eCalculoVo.setCdModalidade("N");
			eCalculoVo.setCdProdutoCliente(1);
			eCalculoVo.setDtInicioVigencia("11042013");
			eCalculoVo.setDtFinalVigencia("11042014");
			eCalculoVo.setDtProcessamento("11042013");
			eCalculoVo.setCdTipoPessoaSegurado("F");
			eCalculoVo.setCdTipoPessoaProprietario("F");
			eCalculoVo.setCdRelacaoSeguradoProprietario(7);
			eCalculoVo.setNuCEP("74230100");
			eCalculoVo.setPcDescontoAuto(0.0);
			eCalculoVo.setPcDescontoAPP(0.0);
			eCalculoVo.setPcDescontoRCF(0.0);
			eCalculoVo.setFlNovaTarifa(ePacoteServicoVo.getFlIndicativoNovaTarifa());
			eCalculoVo.setNmProponente("WILSON MENDON�A DA PENHA JR");
			eCalculoVo.setNuCpfCnpjProponente("30986370134");
			eCalculoVo.setResidencialVo(null); // objeto VO
			eCalculoVo.setNuCpfCnpjProprietario(null);
			eCalculoVo.setCdCindMesaNegocio(null);
			eCalculoVo.setCnroContrato(null);
			eCalculoVo.setEParametroVo(this.eParametroVo); // objeto VO
			eCalculoVo.setEVeiculoVo(this.eVeiculoVo); // objeto VO
			eCalculoVo.setECoberturaVo(this.eCoberturaVo); // objeto VO
			eCalculoVo.setEPerfilSeguradoVo(this.ePerfilSeguradoVo); // objeto VO
			eCalculoVo.setEPerfilProprietarioVo(this.ePerfilProprietarioVo);  // objeto VO
			eCalculoVo.setERenovacaoVo(null);  // objeto VO
			eCalculoVo.setCdSucursal(83); // atributo obrigatorio para o calculo.
			
			calculoVo = bolCalculoAuto.getBolCalculoAutoHttpPort().gerenciadorCalculo(eCalculoVo, "07829911000175", "968344");
			
			JAXBContext jc = JAXBContext.newInstance(CalculoVo.class);
	        Marshaller marshaller = jc.createMarshaller();
	        marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
	        marshaller.marshal(calculoVo, System.out);
	        
			jc = JAXBContext.newInstance(ECalculoVo.class);
			 
	        marshaller = jc.createMarshaller();
	        marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
	        marshaller.marshal(eCalculoVo, System.out);

	        return calculoVo;
		}catch (Exception e) {
			e.printStackTrace();
			return calculoVo;
		}
	}

	public CotacaoVo buscaCotacao(String nuCpfCnpjCorretor, String senhaCorretor, BuscaCotacaoVo buscaCotacaoVo) {
		BolCotacaoAuto bolCotacaoAuto = new BolCotacaoAuto();
		CotacaoVo cotacaoVo = bolCotacaoAuto.getBolCotacaoAutoHttpPort().recuperarCotacao(buscaCotacaoVo, "07829911000175", "968344");
		return cotacaoVo;
	}
	
	public EParametroVo getEParametroVo() {
		return eParametroVo;
	}

	public void setEParametroVo(EParametroVo parametroVo) {
		eParametroVo = parametroVo;
	}

	public EVeiculoVo getEVeiculoVo() {
		return eVeiculoVo;
	}

	public void setEVeiculoVo(EVeiculoVo veiculoVo) {
		eVeiculoVo = veiculoVo;
	}

	public ECoberturaVo getECoberturaVo() {
		return eCoberturaVo;
	}

	public void setECoberturaVo(ECoberturaVo coberturaVo) {
		eCoberturaVo = coberturaVo;
	}

	public EPerfilVo getEPerfilSeguradoVo() {
		return ePerfilSeguradoVo;
	}

	public void setEPerfilSeguradoVo(EPerfilVo perfilSeguradoVo) {
		ePerfilSeguradoVo = perfilSeguradoVo;
	}

	public EPerfilVo getEPerfilProprietarioVo() {
		return ePerfilProprietarioVo;
	}

	public void setEPerfilProprietarioVo(EPerfilVo perfilProprietarioVo) {
		ePerfilProprietarioVo = perfilProprietarioVo;
	}

	public ERenovacaoVo getERenovacaoVo() {
		return eRenovacaoVo;
	}

	public void setERenovacaoVo(ERenovacaoVo renovacaoVo) {
		eRenovacaoVo = renovacaoVo;
	}

	public String getNuCpfCnpjCorretor() {
		return nuCpfCnpjCorretor;
	}

	public void setNuCpfCnpjCorretor(String nuCpfCnpjCorretor) {
		this.nuCpfCnpjCorretor = nuCpfCnpjCorretor;
	}

	public String getSenhaCorretor() {
		return senhaCorretor;
	}

	public void setSenhaCorretor(String senhaCorretor) {
		this.senhaCorretor = senhaCorretor;
	}

	public CalculoSeguro getCalculoSeguro() {
		return calculoSeguro;
	}

	public void setCalculoSeguro(CalculoSeguro calculoSeguro) {
		this.calculoSeguro = calculoSeguro;
	}
}
