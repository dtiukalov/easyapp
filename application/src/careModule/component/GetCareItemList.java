package careModule.component;

import java.util.ArrayList;

import edu.ccut.saturn.component.DefaultComponent;
import edu.ccut.saturn.component.IParameterContext;
import edu.ccut.saturn.component.SaturnData;
import edu.ccut.saturn.component.SaturnDataManager;

public class GetCareItemList extends DefaultComponent {
	@Override
	public void execute(IParameterContext parameterContext) throws Exception {
		String bucketnumStr = (String)parameterContext.getParameterValue(0);
		String priceStr = (String)parameterContext.getParameterValue(1);
		String nameStr = (String)parameterContext.getParameterValue(2);
		String danjiaStr = (String)parameterContext.getParameterValue(3);
		String sjprice = (String)parameterContext.getParameterValue(5);
		ArrayList list = new ArrayList();
		
		if(nameStr!=null&&!"".equals(nameStr)){
			String[] careNames = nameStr.split(",");
			String[] carePrices = priceStr.split(",");
			String[] careNums = bucketnumStr.split(",");
			String[] danjias = danjiaStr.split(",");
			String[] sjprices = sjprice.split(",");
			if(careNames.length>0){
				for(int i=0;i<careNames.length;i++){
					SaturnData data = SaturnDataManager.getInstance().createData("http://crm/coreModule/data::crm_careItem");
					data.set("careitemname", careNames[i]);
					data.set("price", carePrices[i]!=null&&!"".equals(carePrices[i])?Float.parseFloat(carePrices[i]):0);
					data.set("bucketnum", careNums[i]);
					data.set("unitprice", danjias[i]!=null&&!"".equals(danjias[i])?Float.parseFloat(danjias[i]):0);
					data.set("sjprice", sjprices[i]!=null&&!"".equals(sjprices[i])?Float.parseFloat(sjprices[i]):0);
					
					list.add(data);
				}
			}
		}
		
		parameterContext.setParameter(4, list);
		
		
	}
}