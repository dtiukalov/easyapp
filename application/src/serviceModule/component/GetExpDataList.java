package serviceModule.component;

import java.util.ArrayList;

import edu.ccut.saturn.component.DefaultComponent;
import edu.ccut.saturn.component.IParameterContext;
import edu.ccut.saturn.component.SaturnData;

public class GetExpDataList extends DefaultComponent {
	@Override
	public void execute(IParameterContext parameterContext) throws Exception {
		SaturnData dingBao = (SaturnData)parameterContext.getParameterValue(0);
		SaturnData banPen = (SaturnData)parameterContext.getParameterValue(1);
		SaturnData baoXian = (SaturnData)parameterContext.getParameterValue(2);
		SaturnData shouBao = (SaturnData)parameterContext.getParameterValue(3);
		SaturnData yiBan = (SaturnData)parameterContext.getParameterValue(4);
		SaturnData baoXiu = (SaturnData)parameterContext.getParameterValue(5);
		
		ArrayList<SaturnData> list = new ArrayList<SaturnData>();
		
		if(IsNullData(dingBao)){
			
			list.add(dingBao);
		}
		if(IsNullData(banPen)){
			list.add(banPen);
		}
		if(IsNullData(baoXian)){
			list.add(baoXian);
		}
		if(IsNullData(shouBao)){
			list.add(shouBao);
		}
		if(IsNullData(yiBan)){
			list.add(yiBan);
		}
		if(IsNullData(baoXiu)){
			list.add(baoXiu);
		}
		
		parameterContext.setParameter(6, list);
	}
	
	public boolean IsNullData(SaturnData data){
		boolean bool = false;
		String servhoursexp = String.valueOf(data.get("servhoursexp"));
		String servhoursreb = String.valueOf(data.get("servhoursreb"));
		String servhoursmembreb = String.valueOf(data.get("servhoursmembreb"));
		String servpartsexp =String.valueOf(data.get("servpartsexp"));
		String servpartsreb = String.valueOf(data.get("servpartsreb"));
		String servpartsmembreb = String.valueOf(data.get("servpartsmembreb"));
		String servrepairexp = String.valueOf(data.get("servrepairexp"));
		//System.out.println("======"+servrepairexp+"================");
		String servinsureexp = String.valueOf(data.get("servinsureexp"));
		String servticketexp = String.valueOf(data.get("servticketexp"));
		if((servhoursexp!=null&&!"".equals(servhoursexp)&&!"null".equals(servhoursexp))
			||(servhoursreb!=null&&!"".equals(servhoursreb)&&!"null".equals(servhoursreb))
			||(servhoursmembreb!=null&&!"".equals(servhoursmembreb)&&!"null".equals(servhoursmembreb))
			||(servpartsexp!=null&&!"".equals(servpartsexp)&&!"null".equals(servpartsexp))
			||(servpartsreb!=null&&!"".equals(servpartsreb)&&!"null".equals(servpartsreb))
			||(servpartsmembreb!=null&&!"".equals(servpartsmembreb)&&!"null".equals(servpartsmembreb))
			||(servrepairexp!=null&&!"".equals(servrepairexp)&&!"null".equals(servrepairexp)&&!"0.0".equals(servrepairexp))
			||(servinsureexp!=null&&!"".equals(servinsureexp)&&!"null".equals(servinsureexp)&&!"0.0".equals(servinsureexp))
			||(servticketexp!=null&&!"".equals(servticketexp)&&!"null".equals(servticketexp))){
			
			bool = true;
		}
		return bool;
	}
}