package memberModule.component;

import java.text.SimpleDateFormat;
import java.util.Date;

import edu.ccut.saturn.component.DefaultComponent;
import edu.ccut.saturn.component.IParameterContext;
import edu.ccut.saturn.component.SaturnData;

public class SetIntegralData extends DefaultComponent {
	@Override
	public void execute(IParameterContext parameterContext) throws Exception {
		SaturnData data = (SaturnData)parameterContext.getParameterValue(0);
		String amount = (String)parameterContext.getParameterValue(1);
		int intglamount = 0;
		Date now = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String intgltime = format.format(now);
		if(!"".equals(amount)){
			Float famount = Float.valueOf(amount);
			int money = famount.intValue();
			intglamount = (money-money%10)/10;
		}
		
		if(data!=null){
			data.set("intgltime", intgltime);
			data.set("intglitem", "维修消费积分");
			data.set("intgltype", "121001");
			data.set("intglamount", intglamount);
		}
		
		parameterContext.setParameter(0, data);
	}
}