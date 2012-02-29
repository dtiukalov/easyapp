package importModule;

import java.util.Map;

import edu.ccut.saturn.component.DefaultComponent;
import edu.ccut.saturn.component.IParameterContext;

public class SetMapValues extends DefaultComponent {
	@Override
	public void execute(IParameterContext parameterContext) throws Exception {
		Map map = (Map) parameterContext.getParameterValue(0);
		Map saturnDataCar = (Map) parameterContext.getParameterValue(1);
		String currentTime = (String) parameterContext.getParameterValue(2);
		
		saturnDataCar.put("carvin", map.get("VIN"));
		saturnDataCar.put("carlicenceno", map.get("车牌号"));
		saturnDataCar.put("carengineno", map.get("发动机号"));
		saturnDataCar.put("carbrand", map.get("品牌"));
		saturnDataCar.put("carseries", map.get("车系"));
	    saturnDataCar.put("carmodel", map.get("车型"));
		saturnDataCar.put("caryearstyle", map.get("车型年"));
		saturnDataCar.put("carcolor", map.get("颜色"));
		saturnDataCar.put("membcardid", map.get("VIP编号"));
		saturnDataCar.put("carselldate", map.get("销售日期"));
		saturnDataCar.put("carregistdate", map.get("上牌日期"));
		saturnDataCar.put("carsrepairdate", map.get("保修起始日期"));
		saturnDataCar.put("carsrepairmile", map.get("保修起始里程"));
		saturnDataCar.put("carownership", map.get("车主性质"));
		saturnDataCar.put("carlrepairdate", map.get("上次维修日期"));
		saturnDataCar.put("carnmaintaintime", map.get("预计下次保养日期"));
		saturnDataCar.put("carlrepairmile", map.get("上次维修里程"));
		saturnDataCar.put("carnmaintainmile", map.get("上次保养里程"));
		saturnDataCar.put("carkeyno", map.get("钥匙号"));
		saturnDataCar.put("carseller", map.get("销售顾问"));
		saturnDataCar.put("importtime",currentTime);
		parameterContext.setParameter(1, saturnDataCar);
	}
}