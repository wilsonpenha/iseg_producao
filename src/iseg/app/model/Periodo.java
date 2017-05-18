package iseg.app.model;

import java.sql.Timestamp;

public class Periodo {

	private Timestamp inicio;
	private Timestamp fim;

	public Timestamp getInicio() {
		return inicio;
	}

	public void setInicio(final Timestamp inicio) {
		this.inicio = inicio;
	}

	public Timestamp getFim() {
		return fim;
	}

	public void setFim(final Timestamp fim) {
		this.fim = fim;
	}
	
	@Override
	public String toString() {
		if(inicio != null && fim != null){
			return String.format("A partir de %1$td/%1$tm/%1$tY até %2$td/%2$tm/%2$tY", inicio, fim);
		}else if(inicio != null){
			return String.format("Até %1$td/%1$tm/%1$tY", inicio);
		}else if(fim != null){
			return String.format("A partir de %1$td/%1$tm/%1$tY", fim);
		}else {
			return "";
		}
	}
}
