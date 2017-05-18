package iseg.app.conversion;

import java.util.Map;

import org.apache.struts2.util.StrutsTypeConverter;


public class StringConversion extends StrutsTypeConverter {

	@SuppressWarnings("unchecked")
	@Override
	public Object convertFromString(Map context, String[] values, Class toClass) {
		String[] strings = new String[values.length];

		for(int i=0 ; i<values.length ; i++){
			if(!"".equals(values[i])){
				strings[i] = values[i].toUpperCase();
			}
		}
		return strings.length == 1 ? strings[0] : strings;
	}

	@SuppressWarnings("unchecked")
	@Override
	public String convertToString(Map context, Object o) {
		if(o instanceof String[]){
			String value = ((String[])o)[0];
			return value.toUpperCase();
		}
		return null;
	}
}
