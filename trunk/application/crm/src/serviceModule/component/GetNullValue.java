package serviceModule.component;

import edu.ccut.saturn.component.DefaultComponent;
import edu.ccut.saturn.component.IParameterContext;

public class GetNullValue extends DefaultComponent {
	@Override
	public void execute(IParameterContext parameterContext) throws Exception {
		String value1 = (String)parameterContext.getParameterValue(0);
		String value2 = (String)parameterContext.getParameterValue(1);
		
		if("".equals(value1)){
			value1 = null;
		}
		if("".equals(value2)){
			value2 = null;
		}
		parameterContext.setParameter(0, value1);
		parameterContext.setParameter(1, value2);
	}
}