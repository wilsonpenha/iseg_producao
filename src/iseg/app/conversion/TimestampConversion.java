package iseg.app.conversion;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Map;

import org.apache.struts2.util.StrutsTypeConverter;

public class TimestampConversion extends StrutsTypeConverter {

	@Override
	public Object convertFromString(Map context, String[] values, Class toClass) {
		Timestamp[] timestamps = new Timestamp[values.length];

		for(int i=0 ; i<values.length ; i++){
			try{
				if(values[i].length() == 10){
					try {
						timestamps[i] = new Timestamp(new SimpleDateFormat("dd/MM/yyyy").parse(values[i]).getTime() );
					} catch (ParseException e) {
						e.printStackTrace();
					}
				}else if (values[i].length() == 19){  
					try {
						timestamps[i] = new Timestamp(new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").parse(values[i]).getTime());
					} catch (ParseException e) {
						e.printStackTrace();
					}
				}else if(!values[i].equals("")){
					throw new ParseException(values[i], 0);
				}			
			}catch (ParseException e) {
				e.printStackTrace();
			}
		}
		return timestamps.length == 1 ? timestamps[0] : timestamps;
	}

	@Override
	public String convertToString(Map context, Object o) {
		if(o instanceof Timestamp){
			return new SimpleDateFormat("dd/MM/yyyy").format(o);
		}
		return null;
	}
}
