package iseg.app.conversion;

import java.util.Map;

import org.apache.struts2.util.StrutsTypeConverter;


public class CaseSensitiveConversion extends StrutsTypeConverter {

	@SuppressWarnings("unchecked")
	@Override
	public Object convertFromString(Map context, String[] values, Class toClass) {
		CaseSensitive[] text = new CaseSensitive[values.length];

		for(int i=0 ; i<values.length ; i++){
			if(!"".equals(values[i])){
				text[i] = new CaseSensitive(values[i]);
			}
		}
		return text.length == 1 ? text[0] : text.toString().trim();
	}

	@SuppressWarnings("unchecked")
	@Override
	public String convertToString(Map context, Object o) {
		if(o instanceof CaseSensitive){
			StringBuffer strBuffer = new StringBuffer(o.toString());
			return strBuffer.toString().trim();
		}
		return null;
	}
}
