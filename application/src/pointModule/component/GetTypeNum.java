package pointModule.component;

import edu.ccut.saturn.component.DefaultComponent;
import edu.ccut.saturn.component.IParameterContext;

public class GetTypeNum extends DefaultComponent {
	@Override
	public void execute(IParameterContext parameterContext) throws Exception {
		String serv_servtype = (String)parameterContext.getParameterValue(1);
		if("112003".equals(serv_servtype)){
			parameterContext.setParameter(0, "0102");
		}else{
			parameterContext.setParameter(0, "0101");
		}
		//System.out.println(serv_servtype);
	}
}