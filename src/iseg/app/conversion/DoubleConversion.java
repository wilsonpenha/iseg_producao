package iseg.app.conversion;

import java.text.DecimalFormat;
import java.util.Map;

import org.apache.struts2.util.StrutsTypeConverter;


public class DoubleConversion extends StrutsTypeConverter {

	@SuppressWarnings("unchecked")
	@Override
	public Object convertFromString(Map context, String[] values, Class toClass) {
		Double[] numbers = new Double[values.length];

		for(int i=0 ; i<values.length ; i++){
			try{
				if(!"".equals(values[i])){
					numbers[i] = new Double(values[i].replaceAll("\\.", "").replace(',','.'));
				}
			} catch(Exception ex){
				ex.printStackTrace();
			}
		}
		return (numbers.length == 1) ? numbers[0] : numbers;
	}

	@SuppressWarnings("unchecked")
	@Override
	public String convertToString(Map context, Object o) {
		if(o instanceof Double){
			return new DecimalFormat("#,##0.00").format(o);
		}
		return null;
	}
}