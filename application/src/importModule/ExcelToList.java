package importModule;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Date;
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

import edu.ccut.saturn.component.ComponentFactory;
import edu.ccut.saturn.component.ComponentManager;
import edu.ccut.saturn.component.DefaultComponent;
import edu.ccut.saturn.component.IComponent;
import edu.ccut.saturn.component.IParameterContext;

public class ExcelToList extends DefaultComponent {
	@Override
	public void execute(IParameterContext parameterContext) throws Exception {
		try {
			   String file = (String) parameterContext.getParameterValue(0);   
			   List<Map<String,String>> dictList = getFieldsAndDict();			   
			   ArrayList<String> colNameList =  new ArrayList();

			   InputStream input = new FileInputStream(file);
			   POIFSFileSystem fs = new POIFSFileSystem(input);
			   HSSFWorkbook wb = new HSSFWorkbook(fs);
			   HSSFSheet sheet = wb.getSheetAt(0);
			   int colCount = sheet.getRow(4).getPhysicalNumberOfCells();		
			   int vinErrorNum = 0;
			   ArrayList<String> vinErrorList = new ArrayList<String>();
			   String[] colNum = new String[colCount];
			   ArrayList list = new ArrayList();			   
			   String cellValue = null;			
			   // 循环取出sheet的每行（row）
			   Iterator rows = sheet.rowIterator();
			   while (rows.hasNext()) {
			       HSSFRow row = (HSSFRow) rows.next();			    
			       System.out.println("Row #" + row.getRowNum());
			       int rowNum = row.getRowNum();
			       Map map = new HashMap();
			       // 循环取出每行中的cell			    
			       Iterator cells = row.cellIterator();
			        while (cells.hasNext()) {
			            HSSFCell cell = (HSSFCell) cells.next();
			            int cellNum = cell.getCellNum();
			            System.out.println("Cell #" + cell.getCellNum());   
			            Boolean flag = false;			            
			            String type = "";
			            Boolean vinFlag = false;
			            for (Map dictMap : dictList) {
			            	if (colNum[cellNum] != null){
					            if (colNum[cellNum].equals(String.valueOf(dictMap.get("colName")))) {
					            	flag = true;
					            	type = String.valueOf(dictMap.get("colDict"));
					            	break;
					            }
					            
					            if (colNum[cellNum].equals("VIN")) {
					            	vinFlag = true;
					            	break;
					            }
			            	}
			            }
			            switch (cell.getCellType()) {
			                case HSSFCell.CELL_TYPE_NUMERIC:
			                System.out.println(cell.getNumericCellValue());
			      
			                if (HSSFDateUtil.isCellDateFormatted(cell)) {
			    	            // 如果是Date类型则，取得该Cell的Date值
	                            Date date = cell.getDateCellValue();
			    	            //if(cellNum == 10 || cellNum == 11 || cellNum == 12) {		                  
		                             // 把Date转换成本地格式的字符串,截取到日
		                             //cellValue = (cell.getDateCellValue().toLocaleString()).substring(0,10);
	                            //} else {
	                	            // 把Date转换成本地格式的字符串
		                            cellValue = cell.getDateCellValue().toLocaleString();
	                            //}
			               }
	                       // 如果是纯数字
	                       else {
	                           // 取得当前Cell的数值
	                           Integer num = new Integer((int) cell.getNumericCellValue());
	                           cellValue = String.valueOf(num);
	                       }
			               //System.out.println("ooooooooooooooooo1");
			               // String newD = ((Double)cell.getNumericCellValue()).toString()   ; 
			               //cellValue  = newD.substring(0,newD.indexOf("."));
			               break;
			               case HSSFCell.CELL_TYPE_STRING:
			               System.out.println(cell.getStringCellValue());
			               cellValue = cell.getStringCellValue();
			               //System.out.println("ooooooooooooooooo2");
			               if (rowNum == 3) {
			    	           colNameList.add(cellValue);
			               }
			               
			               if (vinFlag) {
			            	   if (!"17".equals(cellValue.length())){
			            		   vinErrorNum++;
			            		   vinErrorList.add(cellValue);
			            	   }
			               }
			               break;
			               case HSSFCell.CELL_TYPE_FORMULA:
			               System.out.println(cell.getCellFormula());
			               cellValue = cell.getCellFormula();
			               //System.out.println("ooooooooooooooooo3");
			               break;
			               default:
			               System.out.println("unsuported sell type");
			               cellValue = null;
			               break;
			           }
			           if (flag) {				    	   				    	   
			        	    IParameterContext crmCodeContext = ComponentFactory.createParameterContext();
			        	    crmCodeContext.addParameter(type, String.class);
			        	    crmCodeContext.addParameter(cellValue, String.class);
			        	    crmCodeContext.addParameter(null, String.class);
					   		IComponent crmCodeComponent = ComponentManager.getInstance().getComponent("crm::/importModule/logic/GetCode.logic");
					   		crmCodeComponent.execute(crmCodeContext);
					   		
					   		Map dictMap = (Map)crmCodeContext.getParameterValue(2);
					   		if (dictMap != null){
						   		String code = (String)dictMap.get("code");
						   		if (code != null && !"".equals(code)){
						   			cellValue = code;
						   		} else {
						   			cellValue = null;
						   		}
					   		}					   		
			           }
			           
			           for (int i = 0; i < colCount; i++){
				    	  if(colNameList.size() != 0  && rowNum == 3 && cellNum == colCount - 1){
						      colNum[i] = colNameList.get(i);
					      }
			           }
			           //从第几行数据入库，Excel中的第一行rowNum为0
			           if (rowNum >= 4) {
			              map.put(colNum[cellNum], cellValue);
			           }
			      }
			      //System.out.println("ooooooooooooooooooooooooomap"+map);
			      if(rowNum >= 4){
			          list.add(map);			    
			          //System.out.println("ooooooooooooooooooooooooolist"+list);
			      }
			  }
			  parameterContext.setParameter(1, list);
			  parameterContext.setParameter(2, vinErrorList);
			  parameterContext.setParameter(3, vinErrorList);
			   
		  } catch (IOException ex) {
		       ex.printStackTrace();
		  }
	}
	
	/**
	 * 获得Excel中要求导出的字段名称和相应的数据字典类型
	 * @param args
	 */
	public List<Map<String,String>> getFieldsAndDict(){
		 InputStream in = ExcelToList.class.getResourceAsStream("fileds.properties");
		 List<Map<String,String>> list = new ArrayList<Map<String,String>>();
		 try {
			BufferedReader br = new BufferedReader(new InputStreamReader(in, "utf-8"));
			 String tmp;
			 while((tmp = br.readLine()) != null){ 
				 Map<String, String> map = new HashMap<String,String>();
				 String[] values = tmp.split(",");
				 map.put("colName", values[0]);
				 map.put("colDict", values[1]);
				 list.add(map);
			 }  
		} catch (Exception e) {
			e.printStackTrace();
		}   
		
		return list;
	}
}