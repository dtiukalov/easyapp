package coreModule.core;

import java.util.ArrayList;

import edu.ccut.saturn.component.DefaultComponent;
import edu.ccut.saturn.component.IParameterContext;
import edu.ccut.saturn.component.SaturnData;

public class GetCount extends DefaultComponent {
	@Override
	public void execute(IParameterContext parameterContext) throws Exception {
		ArrayList dataList = (ArrayList)parameterContext.getParameterValue(0);
		int count = 0;
		if(dataList!=null){
			SaturnData data = (SaturnData)dataList.get(0);
			count = Integer.parseInt(data.get("count").toString());
		}
		parameterContext.setParameter(1, count);
	}
}