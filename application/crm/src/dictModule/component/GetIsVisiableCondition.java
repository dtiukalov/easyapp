package dictModule.component;

import edu.ccut.saturn.component.DefaultComponent;
import edu.ccut.saturn.component.IParameterContext;

public class GetIsVisiableCondition extends DefaultComponent {
	@Override
	public void execute(IParameterContext parameterContext) throws Exception {
		String hiddenFlag = (String)parameterContext.getParameterValue(0);
		String condition = " 1=1";
		if("1".equals(hiddenFlag)){
			condition += " and hidden_flag = '1'";
		}else if("0".equals(hiddenFlag)){
			condition += " and hidden_flag != '1'";
		}
		
		
		parameterContext.setParameter(1, condition);
	}
}