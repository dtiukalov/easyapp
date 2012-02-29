package importModule.component;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
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

public class ImportLDCarCard extends DefaultComponent {
	@Override
	public void execute(IParameterContext parameterContext) throws Exception {
		ArrayList<Map<String,SaturnData>> list = getDataList("C:\\ww.xls");
		parameterContext.setParameter(0, list);
	}
	
	/**
	 * 获得Excel中要求导出的字段名称
	 * @param args
	 */
	public List<Map<String,String>> getFieldsAndDict(String propertiesName){
		 InputStream in = GetSaturnDataList.class.getResourceAsStream(propertiesName);
		 List<Map<String,String>> list = new ArrayList<Map<String,String>>();
		 try {
			BufferedReader br = new BufferedReader(new InputStreamReader(in, "utf-8"));
			 String tmp;
			 while((tmp = br.readLine()) != null){ 
				 Map<String, String> map = new HashMap<String,String>();
				 String[] values = tmp.split(",");
				 map.put("colName", values[0]);
				 map.put("colLetter", values[1]);
				 
				 list.add(map);
			 }  
		} catch (Exception e) {
			e.printStackTrace();
		}   
		return list;
	}
	
	/**
	 *获得Excel中第一个sheet
	 * 
	 */
	public HSSFSheet getFirstSheet(String path){
		HSSFSheet sheet = null;	
		try {
			POIFSFileSystem fs = new POIFSFileSystem(new FileInputStream(path));
			HSSFWorkbook wb = new HSSFWorkbook(fs);
			sheet = wb.getSheetAt(0);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return sheet;
	}
	
	/**
	 * 获得要求导出字段在Excel中的列序号
	 * @param List<Map<String,String>>
	 */
	public Map<String,String> getColNum(List<Map<String,String>> list,String filePath){
		Map<String,String> colNumMap = new HashMap<String,String>();
		HSSFSheet sheet = getFirstSheet(filePath);
		HSSFRow row = sheet.getRow(0);
		for(Map<String,String> colMap : list){
			String colName = colMap.get("colName").toString();
			String colLetter = colMap.get("colLetter").toString();
			for (Iterator<Cell> cit = row.cellIterator(); cit.hasNext(); ) {
				Cell cell = cit.next();
				switch(cell.getCellType()) {
			      case Cell.CELL_TYPE_STRING:
			    	  if(colName.equals(cell.getRichStringCellValue().getString())){
			    		  colNumMap.put(colLetter,String.valueOf(cell.getColumnIndex()));
			    	  }	
			        break;
				}
			}
		}
		
	   return colNumMap;
	}
	
	public String getDictCode(String type,String value){
		List<Map<String,String>> dictList = SaturnDictionaryManager.getInstance().getDictList(type);
		String key = "";
		if(value!=null){
			value = value.replace(" ", "");
			for(int i=0;i<dictList.size();i++){
				Map<String,String> map = dictList.get(i);
				String dictValue = map.get("value").replace(" ", "");
				if(value.equalsIgnoreCase(dictValue)){
					key = map.get("key");
				}
			}
		}
		return key;
	}
	
	public String getCellValue(Cell cell,String pattern){
		 String dateValue = null;
		 if(cell!=null){
			 switch (cell.getCellType()) {
		        case HSSFCell.CELL_TYPE_NUMERIC :
		        	if(HSSFDateUtil.isCellDateFormatted(cell)){
		    			SimpleDateFormat format = new SimpleDateFormat(pattern);
		    			dateValue = format.format(cell.getDateCellValue());
		    		}else{
		    			dateValue = Integer.toString((int)cell.getNumericCellValue());
		    		}
		            break;
		        case HSSFCell.CELL_TYPE_STRING :
		        	dateValue = cell.getRichStringCellValue().getString();
		            break;
		        case HSSFCell.CELL_TYPE_FORMULA :
		        	dateValue = cell.getCellFormula();
		            break;
		    }
		 }
	
		return dateValue;	
	}
	
	/**
	 * 获得数据项列表
	 * @param 属性文件名称:propertiesName,读取文件路径：filePath
	 */
	public ArrayList<Map<String,SaturnData>> getDataList(String filePath){
		ArrayList<Map<String,SaturnData>> dataList = new ArrayList<Map<String,SaturnData>>();
		List<Map<String,String>> list = getFieldsAndDict("ldCar.properties");
		Map<String,String> colNumMap = getColNum(list,filePath);
		HSSFSheet sheet = getFirstSheet(filePath);
		System.out.println("....................."+sheet.getLastRowNum());
		for (Iterator<Row> rit = sheet.rowIterator(); rit.hasNext(); ) {	
			Row row = rit.next();
			if(row.getRowNum()>0&&row.getRowNum()<=sheet.getLastRowNum()){
				Map<String,SaturnData> map  = getCarData(row,colNumMap);
				dataList.add(map);
			}
	    }
		
		return dataList;
	}
	
	/**
	 * 设置要导入的车辆和车主数据项
	 * @param row
	 * @param colNumMap
	 * @return
	 */
	public Map<String,SaturnData> getCarData(Row row,Map<String,String> colNumMap){
		//System.out.println("-----------------"+row.getRowNum());
		SaturnDataManager dataInfo = new SaturnDataManager();
		SaturnData carData = dataInfo.createData("http://crm/coreModule/data::crm_car");
		SaturnData customerData = dataInfo.createData("http://crm/coreModule/data::crm_customer");
		//档案编号
		Cell cell = row.getCell(Integer.parseInt(colNumMap.get("carcardid")));
		String carcardid = getCellValue(cell, "");
		carData.set("carcardid", carcardid);	
		//城市
		String cararea = row.getCell(Integer.parseInt(colNumMap.get("cararea"))).toString();
		cararea = cararea.replace("市", "");
		String cararea_dict = getDictCode("crm_carArea",cararea);
		carData.set("cararea", cararea_dict);
		//车架号
		cell = row.getCell(Integer.parseInt(colNumMap.get("carvin")));
		String carvin = getCellValue(cell, "");
		if(carvin!=null){
			carvin = carvin.replace("/", ",");
			String[] arr_carvin = carvin.split(",");
			carvin = arr_carvin[arr_carvin.length-1];
			carData.set("carvin", carvin);	
			customerData.set("carvin", carvin);	
		}
		//发动机号
		cell = row.getCell(Integer.parseInt(colNumMap.get("carengineno")));
		String carengineno = getCellValue(cell, "");
		carData.set("carengineno", carengineno);	
		//车牌号
		cell = row.getCell(Integer.parseInt(colNumMap.get("carlicenceno")));
		String carlicenceno = getCellValue(cell, "");
		if(carlicenceno!=null){
			carlicenceno = carlicenceno.replace("/", ",");
			carlicenceno = carlicenceno.replace("\\", ",");
			carlicenceno = carlicenceno.split(",")[0];
		}
		//System.out.println("------......."+carlicenceno);
		carData.set("carlicenceno", carlicenceno);	
		
		//销售日期
		cell = row.getCell(Integer.parseInt(colNumMap.get("carselldate")));
		String carselldate = getCellValue(cell, "yyyy-MM-dd");
		if(!"新".equals(carselldate)&&carselldate!=null){
			carselldate = carselldate.replace("/", ",");
			carselldate = carselldate.replace("\\", ",");
			carselldate = carselldate.split(",")[0];
			carData.set("carselldate", carselldate);
		}
		//变速箱号
		cell = row.getCell(Integer.parseInt(colNumMap.get("cartransmno")));
		String cartransmno = getCellValue(cell, "");
		carData.set("cartransmno", cartransmno);	
		//钥匙号
		cell = row.getCell(Integer.parseInt(colNumMap.get("carkeyno")));
		String carkeyno = getCellValue(cell, "");
		carData.set("carkeyno", carkeyno);	
		//颜色
		cell = row.getCell(Integer.parseInt(colNumMap.get("carcolor")));
		String carcolor = getCellValue(cell, "");
		carData.set("carcolor", carcolor);
		//车型
		cell = row.getCell(Integer.parseInt(colNumMap.get("carmodel")));
		String model = getCellValue(cell, "");
		String model_dict = getDictCode("crm_carModel",model);
		carData.set("carmodel", model_dict);
		//车型年
		//cell = row.getCell(Integer.parseInt(colNumMap.get("caryearstyle")));
		//String caryearstyle = getCellValue(cell, "");
		//carData.set("caryearstyle", caryearstyle);	
		
		//车主姓名
		cell = row.getCell(Integer.parseInt(colNumMap.get("cstmname")));
		String cstmname = getCellValue(cell, "");
		customerData.set("cstmname", cstmname);	
		//车主属性
		cell = row.getCell(Integer.parseInt(colNumMap.get("cstmsex")));
		String cstmsex = getCellValue(cell, "");
		String cstmsex_dict = getDictCode("crm_sex",cstmsex);
		customerData.set("cstmsex", cstmsex_dict);
		//电话
		cell = row.getCell(Integer.parseInt(colNumMap.get("cstmtel")));
		String cstmtel = getCellValue(cell, "");
		customerData.set("cstmtel", cstmtel);
		//手机
		cell = row.getCell(Integer.parseInt(colNumMap.get("cstmmobile")));
		String cstmmobile = getCellValue(cell, "");
		customerData.set("cstmmobile", cstmmobile);
		//地址
		cell = row.getCell(Integer.parseInt(colNumMap.get("cstmaddress")));
		String cstmaddress = getCellValue(cell, "");
		customerData.set("cstmaddress", cstmaddress);
		//联系人
		cell = row.getCell(Integer.parseInt(colNumMap.get("cstmcontact")));
		String cstmcontact = getCellValue(cell, "");
		customerData.set("cstmcontact", cstmcontact);
		//联系人手机
		cell = row.getCell(Integer.parseInt(colNumMap.get("cstmcontmobile")));
		String cstmcontmobile = getCellValue(cell, "");
		customerData.set("cstmcontmobile", cstmcontmobile);	
		
		Map<String,SaturnData> map = new HashMap<String,SaturnData>();
		map.put("car", carData);
		map.put("customer", customerData);
		
		return map;
	}
}