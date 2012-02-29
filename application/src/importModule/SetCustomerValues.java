package importModule;

import java.util.Map;

import edu.ccut.saturn.component.DefaultComponent;
import edu.ccut.saturn.component.IParameterContext;

public class SetCustomerValues extends DefaultComponent {
	@Override
	public void execute(IParameterContext parameterContext) throws Exception {
		Map map = (Map) parameterContext.getParameterValue(0);
		Map saturnDataCar = (Map) parameterContext.getParameterValue(1);
		String currentTime = (String) parameterContext.getParameterValue(2);
		
		saturnDataCar.put("carvin", map.get("VIN"));
		saturnDataCar.put("cstmname", map.get("车主"));
	    saturnDataCar.put("cstmsex", map.get("性别"));
		saturnDataCar.put("cstmcompindusty", map.get("所在行业大类"));
		saturnDataCar.put("cstmaddress", map.get("地址"));
		saturnDataCar.put("cstmzipcode", map.get("邮编"));
		saturnDataCar.put("cstmtel", map.get("电话"));
		saturnDataCar.put("cstmmobile", map.get("手机"));
		saturnDataCar.put("cstmbirthday", map.get("出生日期"));
		saturnDataCar.put("cstmemail", map.get("E_MAIL"));
		saturnDataCar.put("cstmincome", map.get("家庭月收入"));
		saturnDataCar.put("cstmmarriage", map.get("婚姻状况"));
		saturnDataCar.put("cstmeducation", map.get("学历"));
		saturnDataCar.put("cstmcontact", map.get("联系人"));
		saturnDataCar.put("cstmcontsex", map.get("联系人性别"));
		saturnDataCar.put("cstmconttel", map.get("联系人电话"));
		saturnDataCar.put("cstmcontmobile", map.get("联系人手机"));
		saturnDataCar.put("cstmcontaddr", map.get("联系人详细地址"));
		saturnDataCar.put("cstmnotes", map.get("车主备注"));
		saturnDataCar.put("cstmfavorite", map.get("爱好"));
		saturnDataCar.put("importtime", currentTime);
		parameterContext.setParameter(1, saturnDataCar);
	}
}