package iseg.app.conversion;

import java.util.Map;

import org.apache.struts2.util.StrutsTypeConverter;

public class CPFCNPJConversion extends StrutsTypeConverter {

	@SuppressWarnings("unchecked")
	@Override
	public Object convertFromString(Map context, String[] values, Class toClass) {
		CpfCnpj[] cpfcnpjs = new CpfCnpj[values.length];
		String replace;
		for (int i = 0; i < values.length; i++) {
			if (!"".equals(values[i])) {
				replace = values[i].replace(".", "");
				replace = replace.replace("/", "");
				replace = replace.replace("-", "");

				cpfcnpjs[i] = new CpfCnpj(replace);
			}
		}
		return cpfcnpjs.length == 1 ? cpfcnpjs[0] : cpfcnpjs;
	}

	@SuppressWarnings("unchecked")
	@Override
	public String convertToString(Map context, Object o) {
		if (o instanceof CpfCnpj) {
			StringBuffer strBuffer = new StringBuffer(o.toString());
			if (o.toString().length() == 14) {// cnpj
				strBuffer.insert(2, ".");
				strBuffer.insert(6, ".");
				strBuffer.insert(10, "/");
				strBuffer.insert(15, "-");
			} else if(o.toString().length() == 11){//cpf}
				strBuffer.insert(3, ".");
				strBuffer.insert(7, ".");
				strBuffer.insert(11, "-");
			}
			
			return strBuffer.toString();
		}
		return null;
	}
}
