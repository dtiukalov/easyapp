package importModule.component;

import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

import edu.ccut.saturn.component.DefaultComponent;
import edu.ccut.saturn.component.IParameterContext;

public class GetTarget extends DefaultComponent {
	@Override
	public void execute(IParameterContext parameterContext) throws Exception {
		String dictCode = (String)parameterContext.getParameterValue(0);
		String fullKey = "";
		String fullKeyc = ""; 
		String directory = "";
		
		if("150001".equals(dictCode)){
			fullKey = "http://crm/coreModule/data::crm_car";
			fullKeyc= "http://crm/coreModule/data::crm_customer";
			directory = "car";
		}else if("150002".equals(dictCode)){
			fullKey = "http://crm/coreModule/data::crm_reserve";
			directory = "reserve";
		}else if("150003".equals(dictCode)){
			fullKey = "http://crm/coreModule/data::crm_visit";
			directory = "visit";
		}else if("150004".equals(dictCode)){
			fullKey = "http://crm/coreModule/data::crm_regulremind";
			directory = "regulremind";
		}else if("150005".equals(dictCode)){
			fullKey = "http://crm/coreModule/data::crm_service";
			directory = "service";
		}else if("150006".equals(dictCode)){
			fullKey = "http://crm/coreModule/data::crm_complaint_new";
			directory = "complaint_new";
		}else if("150007".equals(dictCode)){
			fullKey = "http://crm/coreModule/data::crm_complaint_deal";
			directory = "complaint_deal";
		}else if("150008".equals(dictCode)){
			fullKey = "http://crm/coreModule/data::crm_complaint_closed";
			directory = "complaint_closed";
		}
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		InputStream in = UploadExcel.class.getResourceAsStream("excelPath.properties");
		Properties excelPro = new Properties();
		excelPro.load(in);
		String filePath = excelPro.getProperty("excelPath") + directory + "\\"+ dateFormat.format(date) + ".xls";;
		
		parameterContext.setParameter(1, fullKey);
		parameterContext.setParameter(2, filePath);
		parameterContext.setParameter(3, fullKeyc);
	}
}