package iseg.app.report;

import iseg.app.business.PropostaService;
import iseg.app.model.Periodo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


import com.opensymphony.xwork2.Action;

public class AniversarianteReportAction extends JasperReportAction{

	private static final long serialVersionUID = 1L;

	private Integer mesInicioAniversario;
	private Integer mesFimAniversario;
	private Periodo periodoDoVencimentoCNH;

	public AniversarianteReportAction(PropostaService service) {
		super(service);
	}

	public String relatorio(){
		return Action.SUCCESS;
	}
	
	public String execute(){

		//this.setQuebra(null);
		this.setOrdem("data_nascimento");

		if(periodoDoVencimentoCNH.getInicio() != null && periodoDoVencimentoCNH.getFim() != null){
			super.addParameterIfNotNull("periodoDoVencimentoCNH", periodoDoVencimentoCNH.toString());
			super.addParameterIfNotNull("DATA_INICIO_DATA_VENC_CNH", periodoDoVencimentoCNH.getInicio());
			super.addParameterIfNotNull("DATA_TERMINO_DATA_VENC_CNH", periodoDoVencimentoCNH.getFim());
			this.setOrdem("data_venc_habilitacao");
		}
		if(mesInicioAniversario != null && mesFimAniversario != null){
			if (mesInicioAniversario.compareTo(mesFimAniversario) == 0)
				try {
					super.addParameterIfNotNull("periodoDoAniversario", "Mês de " +  converterParaNome(mesInicioAniversario.toString()));
				} catch (ParseException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			else
				try {
					super.addParameterIfNotNull("periodoDoAniversario", "A partir do mês " + converterParaNome(mesInicioAniversario.toString()) +  " até " +  converterParaNome(mesFimAniversario.toString()));
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			super.addParameterIfNotNull("MES_INICIO", mesInicioAniversario);
			super.addParameterIfNotNull("MES_TERMINO", mesFimAniversario);
		}

		return super.execute();
	}

	public String getSubReportItens(){
		return "";
	}
	
	public String getTitulo() {
		return "Relatório de Aniversariantes / Vencimento CNH";
	}

	public String getJasperName(){
		String jasperName = "";
		jasperName = "/WEB-INF/report/RelAniversariantes.jasper";
		return jasperName;
	}
	
	public static String converterParaNome(String mes) throws ParseException{
		SimpleDateFormat sdf = new SimpleDateFormat("MM");
		Date mesDate = sdf.parse(mes);
		sdf.applyPattern("MMMM");
		return sdf.format(mesDate);
	}
	
	public Periodo getPeriodoDoVencimentoCNH() {
		return periodoDoVencimentoCNH;
	}

	public void setPeriodoDoVencimentoCNH(Periodo periodoDoVencimentoCNH) {
		this.periodoDoVencimentoCNH = periodoDoVencimentoCNH;
	}

	public Integer getMesInicioAniversario() {
		return mesInicioAniversario;
	}

	public void setMesInicioAniversario(Integer mesInicioAniversario) {
		this.mesInicioAniversario = mesInicioAniversario;
	}

	public Integer getMesFimAniversario() {
		return mesFimAniversario;
	}

	public void setMesFimAniversario(Integer mesFimAniversario) {
		this.mesFimAniversario = mesFimAniversario;
	}

}