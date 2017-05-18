package iseg.app.conversion;

import iseg.utils.Util;

import java.io.Serializable;

import javax.persistence.Embeddable;

@Embeddable
public class CpfCnpj implements Serializable {

	private static final long serialVersionUID = 1L;
	private String valor;

	public CpfCnpj() {
	}
	
	public CpfCnpj(String valor){
		this.valor = valor;
	}

	public String getValor() {
		return valor;
	}

	public void setValor(String valor) {
		this.valor = valor;
	}
	
	public String getCnpj(){
		return this.valor != null ? Util.formatar(String.format("%014d", Long.parseLong(this.valor.trim())),"##.###.###/####-##") : "";
	}
	
	public String teste(){
		return valor;
	}
	
	@Override
	public String toString() {
		return this.valor == null ? "" : this.valor;
	}

	@Override
	public boolean equals(Object obj) {
		try{
			if(obj instanceof CpfCnpj){
				return this.getValor().equals(((CpfCnpj)obj).getValor());
			}
			if(obj instanceof String){
				return this.getValor().toString().equals((String)obj);
			}
		}catch (NullPointerException e) {
			return false;
		}
		return false;
	}
}
