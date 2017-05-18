package iseg.utils;

import java.text.NumberFormat;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

public class Formatter { 

	public static String getDate(Object o) {
		if (o != null) {
			SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
			Date data = new Date(((java.sql.Timestamp) o).getTime());
			return formatter.format(data);
		} else
			return ""; 
	}

	public static String getDate(Date d) {
		if (d != null) {
			SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
			return formatter.format(d);
		} else
			return ""; 
	}

	public static String getMonthYear(Object o) {
		if (o != null) {
			if (o instanceof java.sql.Timestamp){
				SimpleDateFormat formatter = new SimpleDateFormat("MM/yyyy");
				Date data = new Date(((java.sql.Timestamp) o).getTime());
				return formatter.format(data);
			}else if (o instanceof java.util.Date){
				SimpleDateFormat formatter = new SimpleDateFormat("MM/yyyy");
				Date data = (Date)o;
				return formatter.format(data);
			}else
				return "";
		} else
			return "";
	}

	public static String getMonth(Object o) {
		if (o != null) {
			SimpleDateFormat formatter = new SimpleDateFormat("MMM");
			Date data = new Date(((java.sql.Timestamp) o).getTime());
			return formatter.format(data);
		} else
			return "";
	}

	public static String getYear(Object o) {
		if (o != null) {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy");
			Date data = new Date(((java.sql.Timestamp) o).getTime());
			return formatter.format(data);
		} else
			return "";
	}

	public static String getDateString(String dataHora) {
		String s = "";
		try {
			s = getDate(new java.sql.Timestamp(getDateTimeLong(dataHora)));
		} catch (Exception ex) {
		}
		return s;
	}

	public static String getDateTimeString(String dataHora) {
		String s = "";
		try {
			s = getDateTime(new java.sql.Timestamp(getDateTimeLong(dataHora)));
		} catch (Exception ex) {
		}
		return s;
	}

	public static String getTime(Object o) {
		SimpleDateFormat formatter = new SimpleDateFormat("HH:mm");
		Date data = new Date(((java.sql.Timestamp) o).getTime());
		return formatter.format(data);
	}

	public static String getDateTime(Object o) {
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		Date data = new Date(((java.sql.Timestamp) o).getTime());
		return formatter.format(data);
	}

	public static String getDateTime(Date d) {
		if (d != null) {
			SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
			return formatter.format(d);
		} else
			return ""; 
	}

	public static long getDateLong(String s) throws Exception {
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		Date data = formatter.parse(s);
		return data.getTime();
	}

	public static long getTimeLong(String s) throws Exception {
		SimpleDateFormat formatter = new SimpleDateFormat("HH:mm");
		Date data = formatter.parse(s);
		return data.getTime();
	}

	public static long getDateTimeLong(String s) throws Exception {
		String sFormatter = "dd/MM/yyyy HH:mm:ss";
		if (s.length() == 19) { // Se a data esta no formato dd/MM/yyyy
			sFormatter = "dd/MM/yyyy HH:mm:ss";
		} else if (s.length() == 11) { // Se a data esta no formato dd/MM/yyyy
			sFormatter = "dd-MM-yyyy";
		} else if (s.length() == 10) { // Se a data esta no formato dd/MM/yyyy
			sFormatter = "dd/MM/yyyy";
		} else if ((s.length() == 9) && (s.indexOf(":") < 0)) { // Se a data esta no formato MM/dd/yy
			sFormatter = "dd-MMM-yy";
		} else if ((s.length() == 8) && (s.indexOf(":") > 0)) { // Se a data esta no formato hh:mm:ss
			sFormatter = "HH:mm:ss";
		}
		SimpleDateFormat formatter = new SimpleDateFormat(sFormatter);
		Date data = formatter.parse(s);
		return data.getTime();
	}

	public static long getCurrentDate(String sFormatter) throws Exception {
		SimpleDateFormat formatter = new SimpleDateFormat(sFormatter);
		Date data = new Date();
		String sCurrentDate = formatter.format(data);
		ParsePosition pp = new ParsePosition(0);
		Date currentDate = formatter.parse(sCurrentDate, pp);
		return currentDate.getTime();
	}

	public static String getCurrentDate() {
		try {
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		Date data = new Date(getCurrentDate("dd/MM/yyyy"));
		return formatter.format(data);
		}catch (Exception e) {
			return "";
		}
	}

	public static String getDoubleString(Double d) {
		String s = "";
		if (d != null) {
			s = String.valueOf(d.doubleValue());
		}
		return s;
	}

	public static String getBigDecimalString(java.math.BigDecimal bigDecimal) {
		NumberFormat nf = NumberFormat.getInstance(new Locale("pt-br", "BR"));
		nf.setMinimumFractionDigits(2);
		return nf.format(bigDecimal);
	}

	public static java.math.BigDecimal getNumberBigDecimal(String s) throws java.text.ParseException {
		NumberFormat nf = NumberFormat.getInstance(new Locale("pt-br", "BR"));
		nf.setMinimumFractionDigits(2);
		return new java.math.BigDecimal(nf.parse(s).toString());
	}

	private static java.text.NumberFormat dfNumero;
	static {
		dfNumero = NumberFormat.getInstance(new Locale("pt-br", "BR"));
		;
		dfNumero.setMinimumFractionDigits(2);
		dfNumero.setMaximumFractionDigits(8);
	}

	public static String colocaMascaraCGC(String noMaskCGC) throws Exception {
		String resultado = "";
		if (noMaskCGC != null) {
			resultado =
				noMaskCGC.substring(0, 2)
					+ "."
					+ noMaskCGC.substring(2, 5)
					+ "."
					+ noMaskCGC.substring(5, 8)
					+ "/"
					+ noMaskCGC.substring(8, 12)
					+ "-"
					+ noMaskCGC.substring(12, 14);
		}
		return resultado;
	}

	public static String colocaMascaraCPF(String noMaskCPF) throws Exception {
		String resultado = "";
		if ((noMaskCPF != null) && (noMaskCPF.length() > 0)) {
			resultado =
				noMaskCPF.substring(0, 3)
					+ "."
					+ noMaskCPF.substring(3, 6)
					+ "."
					+ noMaskCPF.substring(6, 9)
					+ "-"
					+ noMaskCPF.substring(9, 11);
		}
		return resultado;
	}

	public static String retiraMascaraCGC(String maskedCGC) throws Exception {
		String resultado = maskedCGC;
		if (maskedCGC != null) {
			resultado = resultado.replace('.', '/');
			resultado = resultado.replace('.', '/');
			//resultado = resultado.replaceAll("/", "");
			//resultado = resultado.replaceAll("-", "");
		}
		return resultado;
	}

	public static String retiraMascaraCPF(String maskedCPF) throws Exception {
		String resultado = maskedCPF;
		if (maskedCPF != null) {
			resultado = resultado.replace('.', '-');
			resultado = resultado.replace('.', '-');
//			resultado = resultado.replaceAll("-", "");
		}
		return resultado;
	}

	public static String retiraMascaraCEP(String cep) throws Exception {
		String resultado = cep;
/*		if (cep != null && !cep.equals("")) {
			if (resultado.indexOf("-") >= 0)
//				resultado = resultado.replaceAll("-", "");
		}*/
		return resultado;
	}

	public static String colocaMascaraCEP(String cep) throws Exception {
		String resultado = "";
		if (cep != null && !cep.equals("")) {
			resultado = cep.substring(0, 2) + "." + cep.substring(2, 5) + "-" + cep.substring(5, 8);
		}
		return resultado;
	}

	public static String formatNumber(String numero) throws Exception {
		String resultado = "";
		if (numero != null && !numero.equals("")) {
			resultado = dfNumero.format(new Double(numero));
		}
		return resultado;
	}

	public static String formatNumber(Double numero) throws Exception {
		String resultado = "";
		if (numero != null) {
			resultado = dfNumero.format(numero);
		}
		return resultado;
	}

	public static String formatNumber(Double numero, int digits) {
		String resultado = "";
		try {
			dfNumero.setMaximumFractionDigits(digits);
			if (numero != null) {
				resultado = dfNumero.format(numero);
			}
		}catch (Exception e) {
			return numero.toString();
		}
		return resultado;
	}

	public static String unFormatNumber(String numero) throws Exception {
		String resultado = "";
		if (numero != null && !numero.equals("")) {
			resultado = dfNumero.parse(numero).toString();
		}
		return resultado;
	}


	public static Date addMonth(Date date, Integer amount){
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.MONTH, amount);
		return new Date(calendar.getTimeInMillis());
	}
}