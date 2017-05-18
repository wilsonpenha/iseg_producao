package iseg.app.conversion;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.apache.struts2.util.StrutsTypeConverter;


public class DateConversion extends StrutsTypeConverter {

	@SuppressWarnings("unchecked")
	@Override
	public Object convertFromString(Map context, String[] values, Class toClass) {
		Date[] dates = new Date[values.length];

		for(int i=0 ; i<values.length ; i++){
			try{
				if(!"".equals(values[i])){
					
					dates[i] = new SimpleDateFormat("dd/MM/yyyy").parse(values[i]);
				}
			}catch (ParseException e) {
				e.printStackTrace();
			}
		}
		return dates.length == 1 ? dates[0] : dates;
	}

	@SuppressWarnings("unchecked")
	@Override
	public String convertToString(Map context, Object o) {
		if(o instanceof Date){
			return new SimpleDateFormat("dd/MM/yyyy").format(o);
		}
		return null;
	}
}
