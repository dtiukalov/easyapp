package importModule.component;

import java.io.File;

import edu.ccut.saturn.component.DefaultComponent;
import edu.ccut.saturn.component.IParameterContext;

public class DeleteFile extends DefaultComponent {
	@Override
	public void execute(IParameterContext parameterContext) throws Exception {
		String filePath = (String)parameterContext.getParameterValue(0);
		File file = new File(filePath);
		if(file.exists()){
			file.delete();
		}
	}
}