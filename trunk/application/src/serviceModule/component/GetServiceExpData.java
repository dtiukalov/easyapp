package serviceModule.component;

import java.util.ArrayList;

import edu.ccut.saturn.component.DefaultComponent;
import edu.ccut.saturn.component.IParameterContext;
import edu.ccut.saturn.component.SaturnData;
import edu.ccut.saturn.component.SaturnDataManager;
import edu.ccut.saturn.component.SaturnMenuManager;

public class GetServiceExpData extends DefaultComponent {
	@Override
	public void execute(IParameterContext parameterContext) throws Exception {
		ArrayList<SaturnData> list = (ArrayList<SaturnData>)parameterContext.getParameterValue(0);
		SaturnData dingBao = null;
		SaturnData banPen = null;
		SaturnData shiGu = null;
		SaturnData yiBan = null;
		SaturnData shouBao = null;
		SaturnData baoXiu = null;
		if(list!=null){
			for(int i=0;i<list.size();i++){
				SaturnData data = (SaturnData)list.get(i);
				if("112001".equals(data.get("servtype"))){
					dingBao = data;
				}
				if("112002".equals(data.get("servtype"))){
					banPen = data;
				}
				if("112003".equals(data.get("servtype"))){
					shiGu = data;
				}
				
				if("112004".equals(data.get("servtype"))){
					shouBao = data;
				}
				if("112005".equals(data.get("servtype"))){
					yiBan = data;
				}
				if("112009".equals(data.get("servtype"))){
					baoXiu = data;
				}
			}
			if(dingBao==null){
				dingBao = SaturnDataManager.getInstance().createData("http://crm/coreModule/data::crm_servexp");
			}
			if(banPen==null){
				banPen = SaturnDataManager.getInstance().createData("http://crm/coreModule/data::crm_servexp");
			}
			if(baoXiu==null){
				baoXiu = SaturnDataManager.getInstance().createData("http://crm/coreModule/data::crm_servexp");
			}
			if(shouBao==null){
				shouBao = SaturnDataManager.getInstance().createData("http://crm/coreModule/data::crm_servexp");
			}
			if(yiBan==null){
				yiBan = SaturnDataManager.getInstance().createData("http://crm/coreModule/data::crm_servexp");
			}
			if(shiGu==null){
				shiGu = SaturnDataManager.getInstance().createData("http://crm/coreModule/data::crm_servexp");
			}
		}
		
		parameterContext.setParameter(1, dingBao);
		parameterContext.setParameter(2, banPen);
		parameterContext.setParameter(3, shiGu);
		parameterContext.setParameter(4, shouBao);
		parameterContext.setParameter(5, yiBan);
		parameterContext.setParameter(6, baoXiu);
		
	}
}