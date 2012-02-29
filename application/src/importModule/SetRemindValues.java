package importModule;

import java.util.Map;

import edu.ccut.saturn.component.DefaultComponent;
import edu.ccut.saturn.component.IParameterContext;

public class SetRemindValues extends DefaultComponent {
	@Override
	public void execute(IParameterContext parameterContext) throws Exception {
		Map map = (Map) parameterContext.getParameterValue(0);
		Map saturnDataCar = (Map) parameterContext.getParameterValue(1);
		String currentTime = (String) parameterContext.getParameterValue(2);
		
		saturnDataCar.put("carvin", map.get("VIN"));
		saturnDataCar.put("carOwnerName", map.get("车主"));
		saturnDataCar.put("carOwnerTel", map.get("车主电话"));
		saturnDataCar.put("carOwnerMobile", map.get("车主手机"));
		saturnDataCar.put("carOwnership", map.get("车主性质"));
		saturnDataCar.put("servDeliver", map.get("送修人"));
	    saturnDataCar.put("servDeliMobile", map.get("送修人手机"));
	    saturnDataCar.put("servDeliTel", map.get("送修人电话"));
		saturnDataCar.put("contactName", map.get("联系人"));
		saturnDataCar.put("contactMobile", map.get("联系人手机"));
		saturnDataCar.put("contactTel", map.get("联系人电话"));
		saturnDataCar.put("remdName", map.get("提醒人"));
		saturnDataCar.put("remdContent", map.get("提醒内容"));
		saturnDataCar.put("remdState", map.get("提醒状态"));
		saturnDataCar.put("remdFailReason", map.get("提醒失败原因"));
		saturnDataCar.put("remdTime", map.get("提醒时间"));
		saturnDataCar.put("remdFeedback", map.get("客户反馈"));
		saturnDataCar.put("importtime",currentTime);
		parameterContext.setParameter(1, saturnDataCar);
	}
}