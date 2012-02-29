package importModule.component;

import edu.ccut.saturn.component.DefaultComponent;
import edu.ccut.saturn.component.IParameterContext;
import edu.ccut.saturn.component.SaturnData;

public class CheckVin extends DefaultComponent {
	@Override
	public void execute(IParameterContext parameterContext) throws Exception {
		SaturnData data = (SaturnData)parameterContext.getParameterValue(0);
		boolean flg=false;
		String vin = (String)data.get("carvin");
		
		if(vin.length()!=17){
			flg = true;
		}
		parameterContext.setParameter(1, flg);
	}
}