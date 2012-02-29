package ccioModule.component;

import java.util.ArrayList;
import java.util.List;

import edu.ccut.saturn.component.DefaultComponent;
import edu.ccut.saturn.component.IParameterContext;

public class GetForArry extends DefaultComponent {
	@Override
	public void execute(IParameterContext parameterContext) throws Exception {
		List<String> arr=new ArrayList<String>();
		String c_num = (String)parameterContext.getParameterValue(1);
		if(c_num!=null&&!"".equals(c_num)){
			int len=Integer.parseInt(c_num);
			for(int i=0;i<len;i++){
				arr.add("0");
			}
		}
		parameterContext.setParameter(0, arr);
	}
}