package iseg.app.conversion;

import java.io.Serializable;

import javax.persistence.Embeddable;

@Embeddable
public class CaseSensitive implements Serializable {
	
	private static final long serialVersionUID = 1L;
	private String valor;

	public CaseSensitive(){}

	public CaseSensitive(String valor){
		this.valor = valor;
	}

	public String getValor() {
		return valor;
	}

	public void setValor(String valor) {
		this.valor = valor;
	}

	@Override
	public String toString() {
		return this.valor == null ? "" : this.valor;
	}
}