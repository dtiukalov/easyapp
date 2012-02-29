package importModule.component;

import edu.ccut.saturn.component.DefaultComponent;
import edu.ccut.saturn.component.IParameterContext;

public class SetAlertMesg extends DefaultComponent {
	@Override
	public void execute(IParameterContext parameterContext) throws Exception {
		String type=(String)parameterContext.getParameterValue(0);
		String key1=(String)parameterContext.getParameterValue(1);
		String value1=(String)parameterContext.getParameterValue(2);
		String key2=(String)parameterContext.getParameterValue(3);
		String value2=(String)parameterContext.getParameterValue(4);
		String message = "";
		if("alert".equals(type)){
			message = key1 +":" +value1 + " "+ key2 + ":" + value2 +",数据不符合" + key2 + "的导入规则,已经导入.";	
			if("车架号".equals(key1)&&("".equals(key2)||key2==null)){
				message = "车架号" + value1 + ",数据的车架号格式错误,已经导入.";
			}
		}else{
			message = key1 +":" + value1 + ",数据的导入时出现错误,未导入.";
			
			if(!"".equals(key2)&&key2!=null){
				message = key1 +":" +value1 + ""+ key2 + ":" + value2 +",数据的导入时出现错误,未导入";	
			}
			
		}
		
		
		parameterContext.setParameter(5, message);
	}
}