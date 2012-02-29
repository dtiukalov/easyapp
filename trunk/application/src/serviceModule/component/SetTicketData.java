package serviceModule.component;

import edu.ccut.saturn.component.DefaultComponent;
import edu.ccut.saturn.component.IParameterContext;
import edu.ccut.saturn.component.SaturnData;
import edu.ccut.saturn.component.SaturnDataManager;

public class SetTicketData extends DefaultComponent {
	@Override
	public void execute(IParameterContext parameterContext) throws Exception {
		String carvin = (String)parameterContext.getParameterValue(0);
		String ticketAmount = (String)parameterContext.getParameterValue(1);
		String currentTime = (String)parameterContext.getParameterValue(2);
		String servorderid = (String)parameterContext.getParameterValue(3);
		String userid = (String)parameterContext.getParameterValue(4);
		String username = (String)parameterContext.getParameterValue(5);
		
		SaturnData data = SaturnDataManager.getInstance().createData("http://crm/coreModule/data::crm_ticket");
		data.set("carvin", carvin);
		data.set("tiktamount", ticketAmount);
		data.set("tiktstate", "122002");
		data.set("tiktusetime",currentTime);
		data.set("tiktusetime",currentTime);
		data.set("servorderid",servorderid);
		data.set("userid",userid);
		data.set("username",username);
		
		parameterContext.setParameter(6, data);
	}
}