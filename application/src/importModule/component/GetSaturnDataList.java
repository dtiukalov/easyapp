package importModule.component;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;

import edu.ccut.saturn.component.DefaultComponent;
import edu.ccut.saturn.component.IParameterContext;
import edu.ccut.saturn.component.SaturnData;
import edu.ccut.saturn.component.SaturnDataManager;
import edu.ccut.saturn.component.SaturnDictionaryManager;

public class GetSaturnDataList extends DefaultComponent {
	@Override
	public void execute(IParameterContext parameterContext) throws Exception {
		//String propertiesName = (String)parameterContext.getParameterValue(0);
		String importType = (String)parameterContext.getParameterValue(0);
		String filePath = (String)parameterContext.getParameterValue(1);
		/*propertiesName = "car.properties";
		filePath = "C:\\长春正泰_车主车辆资料查询.xls";*/
		Utils util = new Utils();
		String result = "success";
		
		ArrayList<Map<String,SaturnData>> dataList = null;
		
		try {
			dataList = util.getDataList(importType, filePath,parameterContext);
		} catch (Exception e) {
			e.printStackTrace();
			result = e.getMessage();
		}
		/*ArrayList list = new ArrayList();
		for(Map map:dataList){
			list.add(map.get("visit"));
		}*/
		//ArrayList<SaturnData> dataList = getCarDataList(propertiesName,filePath);
		//parameterContext.setParameter(2, list);
		parameterContext.setParameter(2, dataList);
		parameterContext.setParameter(3, result);
		
	}
}