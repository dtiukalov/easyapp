package importModule.component;

import java.text.SimpleDateFormat;
import java.util.Date;

import edu.ccut.saturn.component.DefaultComponent;
import edu.ccut.saturn.component.IParameterContext;

public class DateTimeFormat extends DefaultComponent {
	@Override
	public void execute(IParameterContext parameterContext) throws Exception {
		String dateTime = (String)parameterContext.getParameterValue(0);
		if(dateTime!=null&&!"".equals(dateTime)){
			dateTime = dateTime.substring(0,10);
		}
		parameterContext.setParameter(0, dateTime);
		
	}
}