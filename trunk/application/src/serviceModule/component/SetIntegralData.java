package serviceModule.component;

import java.text.SimpleDateFormat;
import java.util.Date;

import edu.ccut.saturn.component.DefaultComponent;
import edu.ccut.saturn.component.IParameterContext;
import edu.ccut.saturn.component.SaturnData;
import edu.ccut.saturn.component.SaturnDataManager;

public class SetIntegralData extends DefaultComponent {
	public void execute(IParameterContext parameterContext) throws Exception {
		String amount = (String)parameterContext.getParameterValue(0);
		String currentTime = (String)parameterContext.getParameterValue(1);
		String carvin = (String)parameterContext.getParameterValue(2);
		String userid = (String)parameterContext.getParameterValue(3);
		String username = (String)parameterContext.getParameterValue(4);
		String servorderid = (String)parameterContext.getParameterValue(5);
		String servouttime = (String)parameterContext.getParameterValue(6);
		
		int intglamount = 0;
		if(!"".equals(amount)){
			Float famount = Float.valueOf(amount);
			int money = famount.intValue();
			intglamount = (money-money%10)/10;
		}
		
		SaturnData data = SaturnDataManager.getInstance().createData("http://crm/coreModule/data::crm_integral");
		
		data.set("intgltime", servouttime);
		data.set("intglitem", "维修消费积分");
		data.set("intgltype", "121001");
		data.set("intglamount", intglamount);
		data.set("carvin", carvin);
		data.set("userid",userid);
		data.set("username",username);
		data.set("createtime",currentTime);
		data.set("servorderid",servorderid);
		
		parameterContext.setParameter(7, data);
	}
}