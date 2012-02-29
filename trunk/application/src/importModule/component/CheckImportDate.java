package importModule.component;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import edu.ccut.saturn.component.DefaultComponent;
import edu.ccut.saturn.component.IParameterContext;

public class CheckImportDate extends DefaultComponent {
	@Override
	public void execute(IParameterContext parameterContext) throws Exception {
		String impDateTime = (String)parameterContext.getParameterValue(0);
		boolean flag = false;
		String impDate = ""; 
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");   
		//获得导入数据的日期
		if("".equals(impDateTime)&&impDateTime!=null){
			impDate = df.format(impDateTime);
		}
		//获得当前年月日
		Calendar calendar=Calendar.getInstance();   
		calendar.add(calendar.DATE, -1); 
		Date sysDate = calendar.getTime();
		String today = df.format(sysDate);
		
		if(today.equals(impDate)){
			flag = true;
		}
		parameterContext.setParameter(1, flag);
	}
}