package pointModule.component;

import java.sql.Connection;

import edu.ccut.saturn.component.DefaultComponent;
import edu.ccut.saturn.component.IParameterContext;

public class GetSumPoint extends DefaultComponent {
	@Override
	public void execute(IParameterContext parameterContext) throws Exception {
		Connection conn=parameterContext.getConnection();
		PointDao pdao=new PointDao(conn);
		String p_vin = (String)parameterContext.getParameterValue(0);
		parameterContext.setParameter(1, pdao.getAddPoint(p_vin));
		parameterContext.setParameter(2, pdao.getDecPoint(p_vin));
		parameterContext.setParameter(3, pdao.getSumPoint(p_vin));
	}
}