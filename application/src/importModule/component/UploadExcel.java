package importModule.component;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;
import java.util.Properties;

import edu.ccut.saturn.component.DefaultComponent;
import edu.ccut.saturn.component.IParameterContext;

public class UploadExcel extends DefaultComponent {
	@Override
	public void execute(IParameterContext parameterContext) throws Exception {
		ArrayList list = (ArrayList)parameterContext.getParameterValue(0);
		Map map = (Map)list.get(0);
		String saveType = (String)parameterContext.getParameterValue(1);
		byte[] contentBytes = (byte[])map.get("content");
		
		InputStream in = UploadExcel.class.getResourceAsStream("excelPath.properties");
		Properties excelPro = new Properties();
		excelPro.load(in);
		String savePath = excelPro.getProperty("excelPath") + saveType + "/";
		
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String filePath = savePath + dateFormat.format(date) + ".xls";
		
		File excelFile = new File(savePath);
		if(!excelFile.exists()){
			excelFile.mkdirs();
		}
		
		File targetFile = new File(filePath);
		if(!targetFile.exists()){
			FileOutputStream out= new FileOutputStream(filePath);
			out.write(contentBytes);
			out.close();
			parameterContext.setParameter(2, filePath);
		}
	}
}