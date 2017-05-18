package iseg.app.conversion;

import java.util.Map;

import org.apache.struts2.util.StrutsTypeConverter;


public class CEPConversion extends StrutsTypeConverter {

	@SuppressWarnings("unchecked")
	@Override
	public Object convertFromString(Map context, String[] values, Class toClass) {
		CEP[] ceps = new CEP[values.length];

		for(int i=0 ; i<values.length ; i++){
			if(!"".equals(values[i])){
				ceps[i] = new CEP(values[i].replace("-", ""));
			}
		}
		return ceps.length == 1 ? ceps[0] : ceps;
	}

	@SuppressWarnings("unchecked")
	@Override
	public String convertToString(Map context, Object o) {
		if(o instanceof CEP){
			StringBuffer strBuffer = new StringBuffer(o.toString());
			return strBuffer.toString();
		}
		return null;
	}
}
