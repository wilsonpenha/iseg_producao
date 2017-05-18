package iseg.utils;

import java.util.Calendar;
import java.util.Date;

public class UtilDate {

	public static Integer getIdade(Date dtNascto, Date dtAtual) {
		if (dtNascto == null)
			return null;
        Calendar cNascto = Calendar.getInstance();  
        Calendar cAtual = Calendar.getInstance();  
        cNascto.setTime(dtNascto);
        if (dtAtual != null)
        	cAtual.setTime(dtAtual);
        cNascto.set(Calendar.YEAR, cAtual.get(Calendar.YEAR));  
        int idade = cNascto.after(cAtual) ? -1 : 0;  
        cNascto.setTime(dtNascto);  
        idade += cAtual.get(Calendar.YEAR) - cNascto.get(Calendar.YEAR); 
        return new Integer(idade);  
    } 
	
	public static Integer getIdadeNoAno(Date dtNascto, Integer anoAtual) {  
        Calendar cAtual = Calendar.getInstance();
        if (anoAtual != null) {
        	cAtual.set(Calendar.YEAR, anoAtual);
        }
        cAtual.set(Calendar.MONTH, 11);
        cAtual.set(Calendar.DAY_OF_MONTH, 31);
        return getIdade(dtNascto, new Date(cAtual.getTimeInMillis()));  
    }	
	
}
