package serviceModule.component;

import edu.ccut.saturn.component.DefaultComponent;
import edu.ccut.saturn.component.IParameterContext;
import edu.ccut.saturn.component.SaturnData;
import edu.ccut.saturn.component.SaturnDataManager;

public class SetJiYouData extends DefaultComponent {
	@Override
	public void execute(IParameterContext parameterContext) throws Exception {
		String carvin = (String)parameterContext.getParameterValue(0);
		String jytype = (String)parameterContext.getParameterValue(1);
		String bignum = (String)parameterContext.getParameterValue(2);
		String smallnum = (String)parameterContext.getParameterValue(3);
		String currentTime = (String)parameterContext.getParameterValue(4);
		String orderid = (String)parameterContext.getParameterValue(5);
		String userid = (String)parameterContext.getParameterValue(6);
		String username = (String)parameterContext.getParameterValue(7);
		String staff = (String)parameterContext.getParameterValue(8);
		
		SaturnData data = SaturnDataManager.getInstance().createData("http://crm/coreModule/data::crm_jy");
		data.set("carvin", carvin);
		data.set("jytype", jytype);
		data.set("jybignum", bignum);
		data.set("jysmallnum",smallnum);
		data.set("servorderid",orderid);
		data.set("userid",userid);
		data.set("username",username);
		data.set("createtime",currentTime);
		data.set("jystaff",staff);
		
		parameterContext.setParameter(9, data);
	}
}