package dutyModule;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import edu.ccut.saturn.component.DefaultComponent;
import edu.ccut.saturn.component.IParameterContext;
import edu.ccut.saturn.component.SaturnData;
import edu.ccut.saturn.component.SaturnDataManager;

public class GetDutyMap extends DefaultComponent {
	@Override
	public void execute(IParameterContext parameterContext) throws Exception {
		ArrayList<SaturnData> paintItems = (ArrayList<SaturnData>)parameterContext.getParameterValue(0);
		ArrayList<SaturnData> eleItems = (ArrayList<SaturnData>)parameterContext.getParameterValue(1);
		ArrayList<SaturnData> freshItems = (ArrayList<SaturnData>)parameterContext.getParameterValue(2);
		ArrayList<SaturnData> metalItems = (ArrayList<SaturnData>)parameterContext.getParameterValue(3);
		SaturnData dutyData = (SaturnData)parameterContext.getParameterValue(4);
		ArrayList list = (ArrayList)parameterContext.getParameterValue(5);
		
		if(list==null){
			list = new ArrayList();
		}
		
		if(metalItems==null){
			metalItems = new ArrayList<SaturnData>();
		}
		if(freshItems==null){
			freshItems = new ArrayList<SaturnData>();
		}
		if(eleItems==null){
			eleItems = new ArrayList<SaturnData>();
		}
		if(paintItems==null){
			paintItems = new ArrayList<SaturnData>();
		}
		
		for(int j=metalItems.size()-1;j>0&&j<3;j++){
				SaturnData newData = SaturnDataManager.getInstance().createData("http://crm/coreModule/data::crm_dutyItem");
				metalItems.add(newData);
			}
			
			for(int j=paintItems.size()-1;j>0&&j<3;j++){
				SaturnData newData = SaturnDataManager.getInstance().createData("http://crm/coreModule/data::crm_dutyItem");
				paintItems.add(newData);
			}
			
			for(int j=freshItems.size()-1;j>0&&j<3;j++){
				SaturnData newData = SaturnDataManager.getInstance().createData("http://crm/coreModule/data::crm_dutyItem");
				freshItems.add(newData);
			}
			
			for(int j=eleItems.size()-1;j>0&&j<3;j++){
				SaturnData newData = SaturnDataManager.getInstance().createData("http://crm/coreModule/data::crm_dutyItem");
				eleItems.add(newData);
			}
			
			
			Map map = new HashMap();
			
			map.put("dutyData", dutyData);
			map.put("paintItems", paintItems);
			map.put("eleItems", eleItems);
			map.put("freshItems", freshItems);
			map.put("metalItems", metalItems);
			
			list.add(map);
			
			parameterContext.setParameter(5, list);
	}
}