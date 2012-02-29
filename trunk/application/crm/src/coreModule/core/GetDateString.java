package coreModule.core;

import edu.ccut.saturn.component.DefaultComponent;
import edu.ccut.saturn.component.IParameterContext;

public class GetDateString extends DefaultComponent {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void execute(IParameterContext parameterContext) throws Exception {
		int psize = parameterContext.getParameters().size();
		for(int i = 0;i<psize;i++){
			String time = (String)parameterContext.getParameterValue(i);
			if(time!=null&&!"".equals(time)){
				if(i%2==0){
					time = time + " 00:00:00";
					parameterContext.setParameter(i, time);
				}
				if(i%2==1){
					time = time + " 23:59:59";
					parameterContext.setParameter(i, time);
				}
			}
		}
	}
}