package ccioModule.component;

import java.util.ArrayList;
import java.util.List;

import edu.ccut.saturn.component.DefaultComponent;
import edu.ccut.saturn.component.IParameterContext;

public class GetPnum extends DefaultComponent {
	@Override
	public void execute(IParameterContext parameterContext) throws Exception {
		String pnum = (String)parameterContext.getParameterValue(0);
		if(pnum!=null&&!"".equals(pnum)){
			int t_p=Integer.parseInt(pnum)+1;
			if(t_p>255){
				t_p=t_p%255;
			}
			pnum="第"+t_p+"批";
		}
		parameterContext.setParameter(1, pnum);
	}
}