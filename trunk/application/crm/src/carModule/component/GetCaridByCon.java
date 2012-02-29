package carModule.component;

import edu.ccut.saturn.component.DefaultComponent;
import edu.ccut.saturn.component.IParameterContext;

public class GetCaridByCon extends DefaultComponent {
	@Override
	public void execute(IParameterContext parameterContext) throws Exception {
		String carid = (String)parameterContext.getParameterValue(1);
		if(carid==null||"".equals(carid.trim())){
			carid="0";
		}
		//System.out.println(vins);
		parameterContext.setParameter(0, carid);
	}
}