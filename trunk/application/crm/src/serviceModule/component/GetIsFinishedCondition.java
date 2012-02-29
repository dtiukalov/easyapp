package serviceModule.component;

import edu.ccut.saturn.component.DefaultComponent;
import edu.ccut.saturn.component.IParameterContext;

public class GetIsFinishedCondition extends DefaultComponent {
	@Override
	public void execute(IParameterContext parameterContext) throws Exception {
		String isFinished = (String)parameterContext.getParameterValue(0);
		String condition = " 1=1";
		if("1".equals(isFinished)){
			condition += " and servouttime is not null";
		}else if("0".equals(isFinished)){
			condition += " and servouttime is null";
		}
		
		parameterContext.setParameter(1, condition);
	}
}