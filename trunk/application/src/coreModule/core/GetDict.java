package coreModule.core;

import java.util.List;
import java.util.Map;

import edu.ccut.saturn.component.DefaultComponent;
import edu.ccut.saturn.component.IParameterContext;
import edu.ccut.saturn.component.SaturnDictionaryManager;

public class GetDict extends DefaultComponent {
	@Override
	public void execute(IParameterContext parameterContext) throws Exception {
		String type = (String) parameterContext.getParameterValue(0);
		String parentCode = (String) parameterContext.getParameterValue(1);
		List<Map<String, String>> dictList = null;
		if (parentCode == null) {
			parentCode = "";
		}

		dictList = SaturnDictionaryManager.getInstance().getDictList(
				type + "$" + parentCode);

		parameterContext.setParameter(2, dictList);
	}
}