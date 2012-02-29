package importModule.component;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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

import edu.ccut.saturn.component.IDataDictTypeInfo;
import edu.ccut.saturn.component.IDictItemInfo;
import edu.ccut.saturn.component.IParameterContext;
import edu.ccut.saturn.component.SaturnData;
import edu.ccut.saturn.component.SaturnDataManager;
import edu.ccut.saturn.component.SaturnDictionaryManager;

public class Utils {
	private static final String TITLE = "__TITLE__";

	/**
	 * 获得Excel中要求导出的字段名称
	 * 
	 * @param args
	 */
	public List<Map<String, String>> getFieldsAndDict(String propertiesName) {
		InputStream in = GetSaturnDataList.class
				.getResourceAsStream(propertiesName);
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		try {
			BufferedReader br = new BufferedReader(new InputStreamReader(in,
					"utf-8"));
			String tmp;
			while ((tmp = br.readLine()) != null) {
				Map<String, String> map = new HashMap<String, String>();
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
	 * 获得Excel中第一个sheet
	 * 
	 */
	public HSSFSheet getFirstSheet(String path) {
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
	 * 新增数据字典
	 */
	public String sqlSrt(String sqltype, String sqlcode, String sqlvalue,
			IParameterContext parameterContext) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			String strSql = "select  MAX(code)+1 code from saturn_dict where 1=1 and type='"
					+ sqltype + "'";
			conn = parameterContext.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(strSql);
			rs.next();
			sqlcode = rs.getString("code");
			String strSql1 = "INSERT INTO saturn_dict(TYPE,code,value,hidden_flag) VALUES('"
					+ sqltype + "','" + sqlcode + "','" + sqlvalue + "','0') ";
			stmt.executeUpdate(strSql1);
			SaturnDictionaryManager dict = SaturnDictionaryManager.getInstance();
			IDataDictTypeInfo dictType = dict.getDataDictTypeInfo(sqltype);
			
			if (dictType != null) {
				dictType.getItems().add(new NewDataItem(sqlcode, null, null, sqltype, sqlvalue));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return sqlcode;
	}

	public String sqlSrtCar(String sqltype, String sqlcode, String sqlvalue,
			String favalue,IParameterContext parameterContext) {
		Connection conn = null;
		Statement stmt = null;
		Statement stmt1 = null;
		ResultSet rs = null;
		ResultSet rs1 = null;
		try {
			conn = parameterContext.getConnection();
			stmt1 = conn.createStatement();
			String strSql2 = "select code from saturn_dict where 1=1 and type='"
					+ sqltype +"'and value = '"+sqlvalue+"' and parent_code= '"+favalue+"'";
			rs1 = stmt1.executeQuery(strSql2);
			if(rs1.next()){
				sqlcode = rs1.getString("code");
			}else{
				sqlcode = "";
			}
			try{
				if(sqlcode==null||"".equals(sqlcode)){
					stmt = conn.createStatement();
					String strSql = "select  MAX(code)+1 code from saturn_dict where 1=1 and type='"
						+ sqltype + "'";
					rs = stmt.executeQuery(strSql);
					rs.next();
					sqlcode = rs.getString("code");
					String strSql1 = "INSERT INTO saturn_dict(TYPE,code,value,hidden_flag,parent_code) VALUES('"
							+ sqltype + "','" + sqlcode + "','" + sqlvalue + "','0','"+ favalue +"') ";
					stmt.executeUpdate(strSql1);
					SaturnDictionaryManager dict = SaturnDictionaryManager.getInstance();
					IDataDictTypeInfo dictType = dict.getDataDictTypeInfo(sqltype);
					
					if (dictType != null) {
						dictType.getItems().add(new NewDataItem(sqlcode, favalue, null, sqltype, sqlvalue));
					}
				}
		
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				try {
					if(rs != null){
						rs.close();
						
					}
					if(stmt!=null){
						stmt.close();
					}
					
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				rs1.close();
				stmt1.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return sqlcode;
	}
	
	class NewDataItem implements IDictItemInfo {

		private String code;
		private String parentCode;
		private String pinyin;
		private String type;
		private String value;
		
		public NewDataItem(String code, String parentCode, String pinyin,
				String type, String value) {
			super();
			this.code = code;
			this.parentCode = parentCode;
			this.pinyin = pinyin;
			this.type = type;
			this.value = value;
		}
		
		public String getCode() {
			return code;
		}
		public void setCode(String code) {
			this.code = code;
		}
		public String getParentCode() {
			return parentCode;
		}
		public void setParentCode(String parentCode) {
			this.parentCode = parentCode;
		}
		public String getPinyin() {
			return pinyin;
		}
		public void setPinyin(String pinyin) {
			this.pinyin = pinyin;
		}
		public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type = type;
		}
		public String getValue() {
			return value;
		}
		public void setValue(String value) {
			this.value = value;
		}
		public int compareTo(IDictItemInfo o) {
			return this.code.compareTo(o.getCode());
		}
	}
	/**
	 * 获得要求导出字段在Excel中的列序号
	 * 
	 * @param List
	 *            <Map<String,String>>
	 */
	public Map<String, String> getColNum(List<Map<String, String>> list,
			String filePath) {
		Map<String, String> colNumMap = new HashMap<String, String>();
		HSSFSheet sheet = getFirstSheet(filePath);
		HSSFRow rowfri = sheet.getRow(0);
		colNumMap.put(TITLE, rowfri.getCell(0).toString());

		HSSFRow row = sheet.getRow(3);
		for (Map<String, String> colMap : list) {
			String colName = colMap.get("colName").toString();
			String colLetter = colMap.get("colLetter").toString();
			for (Iterator<Cell> cit = row.cellIterator(); cit.hasNext();) {
				Cell cell = cit.next();
				switch (cell.getCellType()) {
				case Cell.CELL_TYPE_STRING:
					if (colName.equals(cell.getRichStringCellValue()
							.getString())) {
						colNumMap.put(colLetter, String.valueOf(cell
								.getColumnIndex()));
					}
					break;
				}
			}
		}
		// 第三行没有值
		String firstColValue = row.getCell(0).getRichStringCellValue()
				.toString();
		if ("".equals(firstColValue)) {
			row = sheet.getRow(4);
			for (Map<String, String> colMap : list) {
				String colName = colMap.get("colName").toString();
				String colLetter = colMap.get("colLetter").toString();
				for (Iterator<Cell> cit = row.cellIterator(); cit.hasNext();) {
					Cell cell = cit.next();
					switch (cell.getCellType()) {
					case Cell.CELL_TYPE_STRING:
						if (colName.equals(cell.getRichStringCellValue()
								.getString())) {
							colNumMap.put(colLetter, String.valueOf(cell
									.getColumnIndex()));
						}
						break;
					}
				}
			}
		}

		return colNumMap;
	}

	// public static void main(String args[]){
	/*
	 * Utils utils = new Utils(); HSSFSheet sheet =
	 * utils.getFirstSheet("C:\\长春正泰_回访结果查询.xls"); HSSFRow row =
	 * sheet.getRow(3); String s =
	 * row.getCell(0).getRichStringCellValue().toString();
	 * System.out.println("".equals(s)); for (Iterator<Cell> cit =
	 * row.cellIterator(); cit.hasNext(); ) { Cell cell = cit.next();
	 * switch(cell.getCellType()) { case Cell.CELL_TYPE_STRING:
	 * System.out.println(cell.getColumnIndex()+"--"+cell.getRichStringCellValue().getString()); } }
	 * 
	 * 
	 * row = sheet.getRow(4); for (Iterator<Cell> cit = row.cellIterator();
	 * cit.hasNext(); ) { Cell cell = cit.next(); switch(cell.getCellType()) {
	 * case Cell.CELL_TYPE_STRING:
	 * System.out.println(cell.getColumnIndex()+"--"+cell.getRichStringCellValue().getString()); } }
	 */
	// }
	public String getDictCode(String type, String value,
			IParameterContext parameterContext) {
		List<Map<String, String>> dictList = SaturnDictionaryManager
				.getInstance().getDictList(type);
		String key = "";
		value = value.replace(" ", "");
		for (int i = 0; i < dictList.size(); i++) {
			Map<String, String> map = dictList.get(i);
			String dictValue = map.get("value").replace(" ", "");
			if (value.equalsIgnoreCase(dictValue)) {
				key = map.get("key");
			}
		}
		if (key == null || "".equals(key)) {
			return this.sqlSrt(type, key, value, parameterContext);
		} else {
			return key;
		}

	}
	public String getDictCodeCar(String type, String value,
			String favalue,IParameterContext parameterContext) {
		String sqlcode="";
		return this.sqlSrtCar(type, sqlcode, value,favalue, parameterContext);

	}

	public String getCellValue(Cell cell, String pattern) {
		String dateValue = null;
		switch (cell.getCellType()) {
		case HSSFCell.CELL_TYPE_NUMERIC:
			if (HSSFDateUtil.isCellDateFormatted(cell)) {
				SimpleDateFormat format = new SimpleDateFormat(pattern);
				dateValue = format.format(cell.getDateCellValue());
			} else {
				dateValue = Integer.toString((int) cell.getNumericCellValue());
			}
			break;
		case HSSFCell.CELL_TYPE_STRING:
			dateValue = cell.getRichStringCellValue().getString();
			break;
		case HSSFCell.CELL_TYPE_FORMULA:
			dateValue = cell.getCellFormula();
			break;
		}

		return dateValue;
	}

	public String getPropertiesName(String importType) {
		String propertiesName = "";
		if ("car".equals(importType)) {
			propertiesName = "car.properties";
		} else if ("reserve".equals(importType)) {
			propertiesName = "reserve.properties";
		} else if ("visit".equals(importType)) {
			propertiesName = "visit.properties";
		} else if ("regulremind".equals(importType)) {
			propertiesName = "regulremind.properties";
		} else if ("service".equals(importType)) {
			propertiesName = "service.properties";
		} else if ("complaint".equals(importType)) {
			propertiesName = "complaint.properties";
		} else if ("complaint_deal".equals(importType)) {
			propertiesName = "complaint_deal.properties";
		} else if ("complaint_closed".equals(importType)) {
			propertiesName = "complaint_closed.properties";
		}

		return propertiesName;
	}

	/**
	 * 获得数据项列表
	 * 
	 * @param 属性文件名称:propertiesName,读取文件路径：filePath
	 */
	public ArrayList<Map<String, SaturnData>> getDataList(String importType,
			String filePath, IParameterContext parameterContext)
			throws Exception {
		ArrayList<Map<String, SaturnData>> dataList = new ArrayList<Map<String, SaturnData>>();
		List<Map<String, String>> list = getFieldsAndDict(getPropertiesName(importType));
		Map<String, String> colNumMap = getColNum(list, filePath);
		HSSFSheet sheet = getFirstSheet(filePath);

		int dataRowIndex = 0;
		for (Iterator<Row> rit = sheet.rowIterator(); rit.hasNext();) {
			Row row = rit.next();
			if (HSSFCell.CELL_TYPE_STRING == row.getCell(0).getCellType()) {
				if ("序号".equals(row.getCell(0).getRichStringCellValue()
						.toString())) {
					dataRowIndex = row.getRowNum() + 1;
				}
			}
		}

		HSSFRow endRow = sheet.getRow(sheet.getLastRowNum());
		int endRowIndex = sheet.getLastRowNum();
		String endRowFirstCellValue = getCellValue(endRow.getCell(0), "");
		if ("记录数:".equals(endRowFirstCellValue)) {
			endRowIndex = endRowIndex - 1;
		}
		String colfri = colNumMap.get(TITLE);

		for (Iterator<Row> rit = sheet.rowIterator(); rit.hasNext();) {
			Row row = rit.next();
			// Map<String,SaturnData> map = new HashMap<String,SaturnData>();
			Map<String, SaturnData> map = null;

			if (row.getRowNum() >= dataRowIndex
					&& row.getRowNum() <= endRowIndex) {
				if ("car".equals(importType) && "车主车辆资料查询".equals(colfri)) {
					map = getCarData(row, colNumMap, parameterContext);
				} else if ("reserve".equals(importType)
						&& "预约状况查询".equals(colfri)) {
					map = getReserveData(row, colNumMap, parameterContext);
				} else if ("visit".equals(importType)
						&& "回访结果查询".equals(colfri)) {
					map = getVisitData(row, colNumMap, parameterContext);
				} else if ("regulremind".equals(importType)
						&& "定期保养提醒".equals(colfri)) {
					map = getRegulRemindData(row, colNumMap, parameterContext);
				} else if ("service".equals(importType)
						&& "维修业务报表".equals(colfri)) {
					map = getServiceData(row, colNumMap, parameterContext);
				} else if ("complaint".equals(importType)
						&& "客户投诉查询".equals(colfri)) {
					map = getComplaintData(row, colNumMap, parameterContext);
				} else if ("complaint_deal".equals(importType)
						&& "客户投诉查询".equals(colfri)) {
					map = getComplaintDealData(row, colNumMap);
				} else if ("complaint_closed".equals(importType)
						&& "客户投诉结案".equals(colfri)) {
					map = getComplaintClosedData(row, colNumMap);
				} else {
					throw new Exception("导入文件[" + filePath + "]与类型[" + importType+ "]不符合");
				}
				
				dataList.add(map);

			}

		}
		return dataList;
	}

	/**
	 * 设置要导入的车辆和车主数据项
	 * 
	 * @param row
	 * @param colNumMap
	 * @return
	 */
	public Map<String, SaturnData> getCarData(Row row,
			Map<String, String> colNumMap, IParameterContext parameterContext) {
		SaturnDataManager dataInfo = new SaturnDataManager();
		SaturnData carData = dataInfo
				.createData("http://crm/coreModule/data::crm_car");
		SaturnData customerData = dataInfo
				.createData("http://crm/coreModule/data::crm_customer");
		// VIN
		carData.set("carvin", row.getCell(
				Integer.parseInt(colNumMap.get("carvin"))).toString());
		// 车牌号
		carData.set("carlicenceno", row.getCell(
				Integer.parseInt(colNumMap.get("carlicenceno"))).toString());
		// 发动机号
		carData.set("carengineno", row.getCell(
				Integer.parseInt(colNumMap.get("carengineno"))).toString());
		// 车型年
		carData.set("caryearstyle", row.getCell(
				Integer.parseInt(colNumMap.get("caryearstyle"))).toString());
		// 颜色
		String color = row.getCell(Integer.parseInt(colNumMap.get("carcolor")))
				.toString();
		// String color_dict = getDictCode("crm_carColor",color);
		carData.set("carcolor", color);
		// 品牌
		String brand = row.getCell(Integer.parseInt(colNumMap.get("carbrand")))
				.toString();
		String brand_dict = getDictCode("crm_carModel", brand, parameterContext);
		carData.set("carbrand", brand_dict);
		// 车系
		String series = row.getCell(
				Integer.parseInt(colNumMap.get("carseries"))).toString();
		String series_dict = getDictCodeCar("crm_carModel", series,brand_dict,
				parameterContext);
		carData.set("carseries", series_dict);
		
		// 车型
		String model = row.getCell(Integer.parseInt(colNumMap.get("carmodel")))
				.toString();
		String model_dict = getDictCodeCar("crm_carModel", model, series_dict, parameterContext);
		carData.set("carmodel", model_dict);
		// 车主性质
		String ownership = row.getCell(
				Integer.parseInt(colNumMap.get("carownership"))).toString();
		String ownership_dict = getDictCode("crm_carType", ownership,
				parameterContext);
		carData.set("carownership", ownership_dict);
		// 服务顾问
		String seller = row.getCell(
				Integer.parseInt(colNumMap.get("carseller"))).toString();
		String seller_dict = getDictCode("crm_waiter", seller, parameterContext);
		carData.set("carseller", seller_dict);
		// 销售日期
		Cell cell = row.getCell(Integer.parseInt(colNumMap.get("carselldate")));
		String carselldate = getCellValue(cell, "yyyy-MM-dd");
		carData.set("carselldate", carselldate);
		// 上牌日期
		cell = row.getCell(Integer.parseInt(colNumMap.get("carregistdate")));
		String carregistdate = getCellValue(cell, "yyyy-MM-dd");
		carData.set("carregistdate", carregistdate);
		// 保修起始日期
		cell = row.getCell(Integer.parseInt(colNumMap.get("carsrepairdate")));
		String carsrepairdate = getCellValue(cell, "yyyy-MM-dd");
		carData.set("carsrepairdate", carsrepairdate);
		// 保修起始里程
		cell = row.getCell(Integer.parseInt(colNumMap.get("carsrepairmile")));
		String carsrepairmile = getCellValue(cell, "");
		carData.set("carsrepairmile", carsrepairmile);
		// 城市
		String cararea = row
				.getCell(Integer.parseInt(colNumMap.get("cararea"))).toString();
		String cararea_dict = getDictCode("crm_carArea", cararea,
				parameterContext);
		carData.set("cararea", cararea_dict);
		// 上次维修日期
	/**
	 	cell = row.getCell(Integer.parseInt(colNumMap.get("carlrepairdate")));
		String carlrepairdate = getCellValue(cell, "yyyy-MM-dd");
		carData.set("carlrepairdate", carlrepairdate);
	**/
		// 上次维修里程
		cell = row.getCell(Integer.parseInt(colNumMap.get("carlrepairmile")));
		String carlrepairmile = getCellValue(cell, "");
		carData.set("carlrepairmile", carlrepairmile);
		// 下次保养里程
		cell = row.getCell(Integer.parseInt(colNumMap.get("carnmaintainmile")));
		String carnmaintainmile = getCellValue(cell, "");
		carData.set("carnmaintainmile", carnmaintainmile);

		// 车架号
		cell = row.getCell(Integer.parseInt(colNumMap.get("carvin")));
		String carvin = getCellValue(cell, "");
		customerData.set("carvin", carvin);
		// 车主
		cell = row.getCell(Integer.parseInt(colNumMap.get("cstmname")));
		String cstmname = getCellValue(cell, "");
		customerData.set("cstmname", cstmname);
		// 性别
		String cstmsex = row
				.getCell(Integer.parseInt(colNumMap.get("cstmsex"))).toString();
		String cstmsex_dict = getDictCode("crm_sex", cstmsex, parameterContext);
		customerData.set("cstmsex", cstmsex_dict);
		// 地址
		cell = row.getCell(Integer.parseInt(colNumMap.get("cstmaddress")));
		String cstmaddress = getCellValue(cell, "");
		customerData.set("cstmaddress", cstmaddress);
		// 邮编
		cell = row.getCell(Integer.parseInt(colNumMap.get("cstmzipcode")));
		String cstmzipcode = getCellValue(cell, "");
		customerData.set("cstmzipcode", cstmzipcode);
		// 电话
		cell = row.getCell(Integer.parseInt(colNumMap.get("cstmtel")));
		String cstmtel = getCellValue(cell, "");
		customerData.set("cstmtel", cstmtel);
		// 手机
		cell = row.getCell(Integer.parseInt(colNumMap.get("cstmmobile")));
		String cstmmobile = getCellValue(cell, "");
		customerData.set("cstmmobile", cstmmobile);
		// 出生日期
		cell = row.getCell(Integer.parseInt(colNumMap.get("cstmbirthday")));
		String cstmbirthday = getCellValue(cell, "yyyy-MM-dd");
		customerData.set("cstmbirthday", cstmbirthday);
		// E_MAIL
		cell = row.getCell(Integer.parseInt(colNumMap.get("cstmemail")));
		String cstmemail = getCellValue(cell, "");
		customerData.set("cstmemail", cstmemail);
		// 家庭月收入
		cell = row.getCell(Integer.parseInt(colNumMap.get("cstmincome")));
		String cstmincome = getCellValue(cell, "");
		customerData.set("cstmincome", cstmincome);
		// 婚姻状况
		String cstmmarriage = row.getCell(
				Integer.parseInt(colNumMap.get("cstmmarriage"))).toString();
		String cstmmarriage_dict = getDictCode("crm_marriage", cstmmarriage,
				parameterContext);
		customerData.set("cstmmarriage", cstmmarriage_dict);
		// 学历
		String cstmeducation = row.getCell(
				Integer.parseInt(colNumMap.get("cstmeducation"))).toString();
		String cstmeducation_dict = getDictCode("crm_education", cstmeducation,
				parameterContext);
		customerData.set("cstmeducation", cstmeducation_dict);
		// 联系人
		cell = row.getCell(Integer.parseInt(colNumMap.get("cstmcontact")));
		String cstmcontact = getCellValue(cell, "");
		customerData.set("cstmcontact", cstmcontact);
		// 联系人性别
		String cstmcontsex = row.getCell(
				Integer.parseInt(colNumMap.get("cstmcontsex"))).toString();
		String cstmcontsex_dict = getDictCode("crm_sex", cstmcontsex,
				parameterContext);
		customerData.set("cstmcontsex", cstmcontsex_dict);
		// 联系人电话
		cell = row.getCell(Integer.parseInt(colNumMap.get("cstmconttel")));
		String cstmconttel = getCellValue(cell, "");
		customerData.set("cstmconttel", cstmconttel);
		// 联系人手机
		cell = row.getCell(Integer.parseInt(colNumMap.get("cstmcontmobile")));
		String cstmcontmobile = getCellValue(cell, "");
		customerData.set("cstmcontmobile", cstmcontmobile);
		// 联系人详细地址
		cell = row.getCell(Integer.parseInt(colNumMap.get("cstmcontaddr")));
		String cstmcontaddr = getCellValue(cell, "");
		customerData.set("cstmcontaddr", cstmcontaddr);

		Map<String, SaturnData> map = new HashMap<String, SaturnData>();
		map.put("car", carData);
		map.put("customer", customerData);

		return map;
	}

	/**
	 * 设置要导入的预约数据项
	 * 
	 * @param row
	 * @param colNumMap
	 * @return
	 */
	public Map<String, SaturnData> getReserveData(Row row,
			Map<String, String> colNumMap, IParameterContext parameterContext) {
	
		Map<String, SaturnData> map = new HashMap<String, SaturnData>();
		try {
			SaturnDataManager dataInfo = new SaturnDataManager();
			SaturnData reserveData = dataInfo
					.createData("http://crm/coreModule/data::crm_reserve");
			// 工单号
			Cell cell = row.getCell(Integer.parseInt(colNumMap.get("servorderid")));
			String servorderid = getCellValue(cell, "");
			reserveData.set("servorderid", servorderid);
			// 开单日期
			cell = row.getCell(Integer.parseInt(colNumMap.get("servorderdate")));
			String servorderdate = getCellValue(cell, "yyyy-MM-dd HH:mm:ss");
			reserveData.set("servorderdate", servorderdate);
			// 预约单号
			cell = row.getCell(Integer.parseInt(colNumMap.get("resvorderid")));
			String resvorderid = getCellValue(cell, "");
			reserveData.set("resvorderid", resvorderid);
			
			// 服务专员
			String servstaffVal = colNumMap.get("servstaff");
			if (servstaffVal != null) {
				try {
					String servstaff = row.getCell(Integer.parseInt(servstaffVal)).toString();
					String servstaff_dict = getDictCode("crm_waiter", servstaff,parameterContext);
					reserveData.set("servstaff", servstaff_dict);
				} catch (NumberFormatException e) {
					//e.printStackTrace();
				}
			}
			// 车牌号
			cell = row.getCell(Integer.parseInt(colNumMap.get("carlicenseno")));
			String carlicenseno = getCellValue(cell, "");
			reserveData.set("carlicenseno", carlicenseno);
			// 资料来源
			String resvsource = row.getCell(
					Integer.parseInt(colNumMap.get("resvsource"))).toString();
			String resvsource_dict = getDictCode("crm_resvSource", resvsource,
					parameterContext);
			reserveData.set("resvsource", resvsource_dict);
			// 预约类别
			String resvtype = row.getCell(
					Integer.parseInt(colNumMap.get("resvtype"))).toString();
			String resvtype_dict = getDictCode("crm_resvType", resvtype,
					parameterContext);
			reserveData.set("resvtype", resvtype_dict);
			// 接受预约日
			cell = row.getCell(Integer.parseInt(colNumMap.get("resvaccessdate")));
			String resvaccessdate = getCellValue(cell, "yyyy-MM-dd HH:mm:ss");
			reserveData.set("resvaccessdate", resvaccessdate);
			// 预约进厂时间
			cell = row.getCell(Integer.parseInt(colNumMap.get("resvintime")));
			String resvintime = getCellValue(cell, "yyyy-MM-dd HH:mm:ss");
			reserveData.set("resvintime", resvintime);
			// 车主
			cell = row.getCell(Integer.parseInt(colNumMap.get("carownername")));
			String carownername = getCellValue(cell, "");
			reserveData.set("carownername", carownername);
			// 联系人,
			cell = row.getCell(Integer.parseInt(colNumMap.get("contactname")));
			String contactname = getCellValue(cell, "");
			reserveData.set("contactname", contactname);
			// 联系人电话
			cell = row.getCell(Integer.parseInt(colNumMap.get("contacttel")));
			String contacttel = getCellValue(cell, "");
			reserveData.set("contacttel", contacttel);
			// 联系人手机
			cell = row.getCell(Integer.parseInt(colNumMap.get("contactmobile")));
			String contactmobile = getCellValue(cell, "");
			reserveData.set("contactmobile", contactmobile);
			// 预约单状态
			String resvstate = row.getCell(
					Integer.parseInt(colNumMap.get("resvstate"))).toString();
			String resvstate_dict = getDictCode("crm_resvState", resvstate,
					parameterContext);
			reserveData.set("resvstate", resvstate_dict);
			// 提醒人
			String remindname = row.getCell(
					Integer.parseInt(colNumMap.get("remindname"))).toString();
			String remindname_dict = getDictCode("crm_waiter", remindname,
					parameterContext);
			reserveData.set("remindname", remindname_dict);
			// 提醒时间
			cell = row.getCell(Integer.parseInt(colNumMap.get("remindtime")));
			String remindtime = getCellValue(cell, "yyyy-MM-dd HH:mm:ss");
			reserveData.set("remindtime", remindtime);
			// 指定技师
			// String resvworker =
			// row.getCell(Integer.parseInt(colNumMap.get("resvworker"))).toString();
			// String resvworker_dict = getDictCode("crm_worker",resvworker);
			cell = row.getCell(Integer.parseInt(colNumMap.get("resvworker")));
			String resvworker = getCellValue(cell, "");
			reserveData.set("resvworker", resvworker);
			// 取消进厂原因
			cell = row.getCell(Integer.parseInt(colNumMap.get("resvcancelreason")));
			String resvcancelreason = getCellValue(cell, "");
			reserveData.set("resvcancelreason", resvcancelreason);
			// 操作员
			String resvstaff = row.getCell(
					Integer.parseInt(colNumMap.get("resvstaff"))).toString();
			String resvstaff_dict = getDictCode("crm_waiter", resvstaff,
					parameterContext);
			reserveData.set("resvstaff", resvstaff_dict);

			map.put("reserve", reserveData);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return map;
	}

	/**
	 * 设置要导入的回访数据项
	 * 
	 * @param row
	 * @param colNumMap
	 * @return
	 */
	public Map<String, SaturnData> getVisitData(Row row,
			Map<String, String> colNumMap, IParameterContext parameterContext) {
		SaturnDataManager dataInfo = new SaturnDataManager();
		SaturnData visitData = dataInfo
				.createData("http://crm/coreModule/data::crm_visit");
		// 录入日期
		Cell cell = row.getCell(Integer.parseInt(colNumMap.get("visitdate")));
		String visitdate = getCellValue(cell, "yyyy-MM-dd HH:mm:ss");
		visitData.set("visitdate", visitdate);
		// 工单号
		cell = row.getCell(Integer.parseInt(colNumMap.get("servorderid")));
		String servorderid = getCellValue(cell, "");
		visitData.set("servorderid", servorderid);
		// VIN
		cell = row.getCell(Integer.parseInt(colNumMap.get("carvin")));
		String carvin = getCellValue(cell, "");
		visitData.set("carvin", carvin);
		// 跟踪员
		String visitstaff = row.getCell(
				Integer.parseInt(colNumMap.get("visitstaff"))).toString();
		String visitstaff_dict = getDictCode("crm_waiter", visitstaff,
				parameterContext);
		visitData.set("visitstaff", visitstaff_dict);
		// 维修质量评分
		cell = row.getCell(Integer.parseInt(colNumMap.get("servmark")));
		String servmark = getCellValue(cell, "");
		if ("未打分".equals(servmark)) {
			servmark = "0";
		}
		visitData.set("servmark", servmark);
		// 服务评分
		cell = row.getCell(Integer.parseInt(colNumMap.get("repairmark")));
		String repairmark = getCellValue(cell, "");
		if ("未打分".equals(repairmark)) {
			repairmark = "0";
		}
		visitData.set("repairmark", repairmark);
		// 维修质量
		cell = row.getCell(Integer.parseInt(colNumMap.get("repairpleased")));
		String repairpleased = getCellValue(cell, "");
		String repairpleased_dict = "";
		if (!"".equals(repairpleased)) {
			repairpleased_dict = getDictCode("crm_repaPleased", "很好",
					parameterContext);
		}
		cell = row
				.getCell(Integer.parseInt(colNumMap.get("repairpleased")) + 1);
		repairpleased = getCellValue(cell, "");
		if (!"".equals(repairpleased) && repairpleased != null) {
			repairpleased_dict = getDictCode("crm_repaPleased", "良好",
					parameterContext);
		}
		cell = row
				.getCell(Integer.parseInt(colNumMap.get("repairpleased")) + 2);
		repairpleased = getCellValue(cell, "");
		if (!"".equals(repairpleased) && repairpleased != null) {
			repairpleased_dict = getDictCode("crm_repaPleased", "一般",
					parameterContext);
		}
		cell = row
				.getCell(Integer.parseInt(colNumMap.get("repairpleased")) + 3);
		repairpleased = getCellValue(cell, "");
		if (!"".equals(repairpleased) && repairpleased != null) {
			repairpleased_dict = getDictCode("crm_repaPleased", "不好",
					parameterContext);
		}
		visitData.set("repairpleased", repairpleased_dict);
		// 服务质量
		cell = row.getCell(Integer.parseInt(colNumMap.get("serverpleased")));
		String serverpleased = getCellValue(cell, "");
		String serverpleased_dict = "";
		if (!"".equals(serverpleased) && serverpleased != null) {
			serverpleased_dict = getDictCode("crm_servPleased", "非常满意",
					parameterContext);
		}
		cell = row
				.getCell(Integer.parseInt(colNumMap.get("serverpleased")) + 1);
		serverpleased = getCellValue(cell, "");
		if (!"".equals(serverpleased) && serverpleased != null) {
			serverpleased_dict = getDictCode("crm_servPleased", "满意",
					parameterContext);
		}
		cell = row
				.getCell(Integer.parseInt(colNumMap.get("serverpleased")) + 2);
		serverpleased = getCellValue(cell, "");
		if (!"".equals(serverpleased) && serverpleased != null) {
			serverpleased_dict = getDictCode("crm_servPleased", "一般",
					parameterContext);
		}
		cell = row
				.getCell(Integer.parseInt(colNumMap.get("serverpleased")) + 3);
		serverpleased = getCellValue(cell, "");
		if (!"".equals(serverpleased) && serverpleased != null) {
			serverpleased_dict = getDictCode("crm_servPleased", "不满意",
					parameterContext);
		}
		cell = row
				.getCell(Integer.parseInt(colNumMap.get("serverpleased")) + 4);
		serverpleased = getCellValue(cell, "");
		if (!"".equals(serverpleased) && serverpleased != null) {
			serverpleased_dict = getDictCode("crm_servPleased", "非常不满意",
					parameterContext);
		}
		visitData.set("serverpleased", serverpleased_dict);
		// 意见/建议
		cell = row.getCell(Integer.parseInt(colNumMap.get("hasproposal")));
		String hasproposal = getCellValue(cell, "");
		if (!"".equals(hasproposal)) {
			visitData.set("hasproposal", "1");
		}
		cell = row.getCell(Integer.parseInt(colNumMap.get("hasproposal")) + 1);
		hasproposal = getCellValue(cell, "");
		if (!"".equals(hasproposal)) {
			visitData.set("hasproposal", "0");
		}
		// 服务专员
		String servstaff = row.getCell(
				Integer.parseInt(colNumMap.get("servstaff"))).toString();
		String servstaff_dict = getDictCode("crm_waiter", servstaff,
				parameterContext);
		visitData.set("servstaff", servstaff_dict);

		// 车牌号
		cell = row.getCell(Integer.parseInt(colNumMap.get("carlicenceno")));
		String carlicenceno = getCellValue(cell, "");
		visitData.set("carlicenceno", carlicenceno);

		// 品牌
		String carbrand = row.getCell(
				Integer.parseInt(colNumMap.get("carbrand"))).toString();
		String carbrand_dict = getDictCode("crm_carModel", carbrand,
				parameterContext);
		visitData.set("carbrand", carbrand_dict);

		// 车系
		String carseries = row.getCell(
				Integer.parseInt(colNumMap.get("carseries"))).toString();
		String carseries_dict = getDictCodeCar("crm_carModel", carseries,carbrand_dict,
				parameterContext);
		visitData.set("carseries", carseries_dict);

		// 维修技师
		String servworker = row.getCell(
				Integer.parseInt(colNumMap.get("servworker"))).toString();
		String servworker_dict = getDictCode("crm_worker", servworker,
				parameterContext);
		visitData.set("servworker", servworker_dict);

		// 维修项目
		cell = row.getCell(Integer.parseInt(colNumMap.get("servitem")));
		String servitem = getCellValue(cell, "");
		visitData.set("servitem", servitem);

		// 维修类型
		String servtype = row.getCell(
				Integer.parseInt(colNumMap.get("servtype"))).toString();
		String servtype_dict = getDictCode("crm_serviceType", servtype,
				parameterContext);
		visitData.set("servtype", servtype_dict);

		// 送修人手机
		cell = row.getCell(Integer.parseInt(colNumMap.get("linktel")));
		String linktel = getCellValue(cell, "");
		visitData.set("linktel", linktel);

		// 送修人
		cell = row.getCell(Integer.parseInt(colNumMap.get("linkman")));
		String linkman = getCellValue(cell, "");
		visitData.set("linkman", linkman);

		Map<String, SaturnData> map = new HashMap<String, SaturnData>();
		map.put("visit", visitData);

		return map;
	}

	/**
	 * 设置要导入的提醒数据项
	 * 
	 * @param row
	 * @param colNumMap
	 * @return
	 */
	public Map<String, SaturnData> getRegulRemindData(Row row,
			Map<String, String> colNumMap, IParameterContext parameterContext) {
		SaturnDataManager dataInfo = new SaturnDataManager();
		SaturnData regulremindData = dataInfo
				.createData("http://crm/coreModule/data::crm_regulremind");
		// VIN
		Cell cell = row.getCell(Integer.parseInt(colNumMap.get("carvin")));
		String carvin = getCellValue(cell, "");
		regulremindData.set("carvin", carvin);
		// 车主,
		cell = row.getCell(Integer.parseInt(colNumMap.get("carownername")));
		String carownername = getCellValue(cell, "");
		regulremindData.set("carownername", carownername);
		// 车主手机
		cell = row.getCell(Integer.parseInt(colNumMap.get("carownermobile")));
		String carownermobile = getCellValue(cell, "");
		regulremindData.set("carownermobile", carownermobile);
		// 车主电话
		cell = row.getCell(Integer.parseInt(colNumMap.get("carownertel")));
		String carownertel = getCellValue(cell, "");
		regulremindData.set("carownertel", carownertel);
		// 送修人
		cell = row.getCell(Integer.parseInt(colNumMap.get("servdeliver")));
		String servdeliver = getCellValue(cell, "");
		regulremindData.set("servdeliver", servdeliver);
		// 送修人手机
		cell = row.getCell(Integer.parseInt(colNumMap.get("servdelimobile")));
		String servdelimobile = getCellValue(cell, "");
		regulremindData.set("servdelimobile", servdelimobile);
		// 送修人电话
		cell = row.getCell(Integer.parseInt(colNumMap.get("servdelitel")));
		String servdelitel = getCellValue(cell, "");
		regulremindData.set("servdelitel", servdelitel);
		// 联系人
		cell = row.getCell(Integer.parseInt(colNumMap.get("contactname")));
		String contactname = getCellValue(cell, "");
		regulremindData.set("contactname", contactname);
		// 联系人手机,contactMobile
		cell = row.getCell(Integer.parseInt(colNumMap.get("contactmobile")));
		String contactmobile = getCellValue(cell, "");
		regulremindData.set("contactmobile", contactmobile);
		// 联系人电话,
		cell = row.getCell(Integer.parseInt(colNumMap.get("contacttel")));
		String contacttel = getCellValue(cell, "");
		regulremindData.set("contacttel", contacttel);
		// 上次维修日期,carLRepairDate
		cell = row.getCell(Integer.parseInt(colNumMap.get("carlrepairdate")));
		String carlrepairdate = getCellValue(cell, "yyyy-MM-dd HH:mm:ss");
		regulremindData.set("carlrepairdate", carlrepairdate);
		// 上次维修里程,carlrepairmile
		cell = row.getCell(Integer.parseInt(colNumMap.get("carlrepairmile")));
		String carlrepairmile = getCellValue(cell, "");
		regulremindData.set("carlrepairmile", carlrepairmile);
		// 预计下次保养日期,carNMaintainTime
		cell = row.getCell(Integer.parseInt(colNumMap.get("carnmaintaintime")));
		String carnmaintaintime = getCellValue(cell, "yyyy-MM-dd");
		regulremindData.set("carnmaintaintime", carnmaintaintime);
		// 下次保养里程,
		cell = row.getCell(Integer.parseInt(colNumMap.get("carnmaintainmile")));
		String carnmaintainmile = getCellValue(cell, "");
		regulremindData.set("carnmaintainmile", carnmaintainmile);
		// 提醒人,
		String remdname = row.getCell(Integer.parseInt(colNumMap.get("remdname"))).toString();
		String remdname_dict = getDictCode("crm_waiter", remdname,parameterContext);
		regulremindData.set("remdname", remdname_dict);
		// 提醒内容,
		cell = row.getCell(Integer.parseInt(colNumMap.get("remdcontent")));
		String remdcontent = getCellValue(cell, "");
		regulremindData.set("remdcontent", remdcontent);
		// 提醒状态,
		String remdstate = row.getCell(
				Integer.parseInt(colNumMap.get("remdstate"))).toString();
		String remdstate_dict = getDictCode("crm_remdState", remdstate,
				parameterContext);
		regulremindData.set("remdstate", remdstate_dict);
		// 提醒失败原因,
		cell = row.getCell(Integer.parseInt(colNumMap.get("remdfailreason")));
		String remdfailreason = getCellValue(cell, "");
		regulremindData.set("remdfailreason", remdfailreason);
		// 提醒时间,
		cell = row.getCell(Integer.parseInt(colNumMap.get("remdtime")));
		String remdtime = getCellValue(cell, "yyyy-MM-dd HH:mm:ss");
		regulremindData.set("remdtime", remdtime);
		// 客户反馈,
		cell = row.getCell(Integer.parseInt(colNumMap.get("remdfeedback")));
		String remdfeedback = getCellValue(cell, "");
		regulremindData.set("remdfeedback", remdfeedback);

		Map<String, SaturnData> map = new HashMap<String, SaturnData>();
		map.put("regulremind", regulremindData);

		return map;
	}

	public Map<String, SaturnData> getServiceData(Row row,
			Map<String, String> colNumMap, IParameterContext parameterContext) {
		SaturnDataManager dataInfo = new SaturnDataManager();
		SaturnData serviceData = dataInfo
				.createData("http://crm/coreModule/data::crm_service");
		// 工单号,
		Cell cell = row.getCell(Integer.parseInt(colNumMap.get("servorderid")));
		String servorderid = getCellValue(cell, "");
		serviceData.set("servorderid", servorderid.replace("R0", "RO"));
		// 工单开单日期
		cell = row.getCell(Integer.parseInt(colNumMap.get("servintime")));
		String servintime = getCellValue(cell, "yyyy-MM-dd HH:mm:ss");
		serviceData.set("servintime", servintime);
		// 维修类型,
		String servtype = row.getCell(
				Integer.parseInt(colNumMap.get("servtype"))).toString();
		String servtype_dict = getDictCode("crm_serviceType", servtype,
				parameterContext);
		serviceData.set("servtype", servtype_dict);
		// 交车日期,
		// cell = row.getCell(Integer.parseInt(colNumMap.get("servouttime")));
		// String servouttime = getCellValue(cell, "yyyy-MM-dd HH:mm:ss");
		// serviceData.set("servouttime", servouttime);
		// VIN,
		cell = row.getCell(Integer.parseInt(colNumMap.get("carvin")));
		String carvin = getCellValue(cell, "");
		serviceData.set("carvin", carvin);
		// 进厂行驶里程,
		cell = row.getCell(Integer.parseInt(colNumMap.get("servkilometer")));
		String servkilometer = getCellValue(cell, "");
		serviceData.set("servkilometer", servkilometer);
		// 预约单号,
		cell = row.getCell(Integer.parseInt(colNumMap.get("resveorederid")));
		String resveorederid = getCellValue(cell, "");
		serviceData.set("resveorederid", resveorederid);
		// 是否预约,
		cell = row.getCell(Integer.parseInt(colNumMap.get("isreserve")));
		String isreserve = getCellValue(cell, "");
		if ("是".equals(isreserve)) {
			serviceData.set("isreserve", "1");
		} else {
			serviceData.set("isreserve", "0");
		}
		// 是否回访,
		// cell = row.getCell(Integer.parseInt(colNumMap.get("isvisited")));
		// String isvisited = getCellValue(cell, "");
		// if("是".equals(isvisited)){
		// serviceData.set("isvisited", "1");
		// }else{
		// serviceData.set("isvisited", "0");
		// }
		// 不回访原因,
		cell = row.getCell(Integer.parseInt(colNumMap.get("novisitreason")));
		String novisitreason = getCellValue(cell, "");
		serviceData.set("novisitreason", novisitreason);
		// 服务顾问,
		cell = row.getCell(Integer.parseInt(colNumMap.get("servstaff")));
		String servstaff = getCellValue(cell, "");
		String servstaff_dict = getDictCode("crm_waiter", servstaff,
				parameterContext);

		serviceData.set("servstaff", servstaff_dict);
		// 操作员,
		cell = row.getCell(Integer.parseInt(colNumMap.get("servoperator")));
		String servoperator = getCellValue(cell, "");
		serviceData.set("servoperator", servoperator);

		Map<String, SaturnData> map = new HashMap<String, SaturnData>();
		map.put("service", serviceData);

		return map;
	}

	/**
	 * 设置要导入的导入当日投诉数据项
	 * 
	 * @param row
	 * @param colNumMap
	 * @return
	 */
	public Map<String, SaturnData> getComplaintData(Row row,
			Map<String, String> colNumMap, IParameterContext parameterContext) {
		SaturnDataManager dataInfo = new SaturnDataManager();
		SaturnData complaintData = dataInfo
				.createData("http://crm/coreModule/data::crm_complaint_new");
		// 投诉编号,
		Cell cell = row
				.getCell(Integer.parseInt(colNumMap.get("comptorderid")));
		String comptorderid = getCellValue(cell, "");
		complaintData.set("comptorderid", comptorderid);
		// 投诉类型,
		cell = row.getCell(Integer.parseInt(colNumMap.get("compttype")));
		String compttype = getCellValue(cell, "");
		String compttype_dict = getDictCode("crm_comptType", compttype,
				parameterContext);
		complaintData.set("compttype", compttype_dict);
		// 投诉人姓名,
		cell = row.getCell(Integer.parseInt(colNumMap.get("comptname")));
		String comptname = getCellValue(cell, "");
		complaintData.set("comptname", comptname);
		// 投诉人电话,
		cell = row.getCell(Integer.parseInt(colNumMap.get("compttel")));
		String compttel = getCellValue(cell, "");
		complaintData.set("compttel", compttel);
		// 接单时间,
		cell = row.getCell(Integer.parseInt(colNumMap.get("compttime")));
		String compttime = getCellValue(cell, "yyyy-MM-dd HH:mm:ss");
		complaintData.set("compttime", compttime);
		// 服务顾问,
		cell = row.getCell(Integer.parseInt(colNumMap.get("comptstaff")));
		String comptstaff = getCellValue(cell, "");
		if (comptstaff != null && !"".equals(comptstaff)) {
			String comptstaff_dict = getDictCode("crm_waiter", comptstaff,
					parameterContext);
			complaintData.set("comptstaff", comptstaff_dict);
		}

		// 责任技师,
		cell = row.getCell(Integer.parseInt(colNumMap.get("compttarget")));
		String compttarget = getCellValue(cell, "");
		/*
		 * if(compttarget!=null&&!"".equals(compttarget)){ String
		 * compttarget_dict = getDictCode("crm_worker",compttarget);
		 * complaintData.set("compttarget", compttarget_dict); }
		 */
		complaintData.set("compttarget", compttarget);
		// 发生部门,
		cell = row.getCell(Integer.parseInt(colNumMap.get("comptdept")));
		String comptdept = getCellValue(cell, "");
		if (comptdept != null && !"".equals(comptdept)) {
			String comptdept_dict = getDictCode("crm_department", comptdept,
					parameterContext);
			complaintData.set("comptdept", comptdept_dict);
		}

		// 投诉来源,
		cell = row.getCell(Integer.parseInt(colNumMap.get("comptsource")));
		String comptsource = getCellValue(cell, "");
		String comptsource_dict = getDictCode("crm_comptSource", comptsource,
				parameterContext);
		complaintData.set("comptsource", comptsource_dict);
		// 投诉内容,comptcontent
		cell = row.getCell(Integer.parseInt(colNumMap.get("comptcontent")));
		String comptcontent = getCellValue(cell, "");
		complaintData.set("comptcontent", comptcontent);
		// 被投诉员工,
		cell = row.getCell(Integer.parseInt(colNumMap.get("comptworker")));
		String comptworker = getCellValue(cell, "");
		/*
		 * if(comptworker!=null&&!"".equals(comptworker)){ String
		 * comptworker_dict = getDictCode("crm_worker",comptworker);
		 * complaintData.set("comptworker", comptworker_dict); }
		 */
		complaintData.set("comptworker", comptworker);

		// 车主姓名,
		cell = row.getCell(Integer.parseInt(colNumMap.get("carownername")));
		String carownername = getCellValue(cell, "");
		complaintData.set("carownername", carownername);
		// 车牌号,
		cell = row.getCell(Integer.parseInt(colNumMap.get("carlicenseno")));
		String carlicenseno = getCellValue(cell, "");
		complaintData.set("carlicenseno", carlicenseno);

		Map<String, SaturnData> map = new HashMap<String, SaturnData>();
		map.put("complaint", complaintData);

		return map;
	}

	/**
	 * 设置要导入的导入当日已处理投诉数据项
	 * 
	 * @param row
	 * @param colNumMap
	 * @return
	 */
	public Map<String, SaturnData> getComplaintDealData(Row row,
			Map<String, String> colNumMap) {
		SaturnDataManager dataInfo = new SaturnDataManager();
		SaturnData complaintData = dataInfo
				.createData("http://crm/coreModule/data::crm_complaint_deal");
		// 投诉编号
		Cell cell = row
				.getCell(Integer.parseInt(colNumMap.get("comptorderid")));
		String comptorderid = getCellValue(cell, "");
		complaintData.set("comptorderid", comptorderid);
		// 处理完成日期,
		cell = row.getCell(Integer.parseInt(colNumMap.get("comptdealtime")));
		String comptdealtime = getCellValue(cell, "yyyy-MM-dd HH:mm:ss");
		complaintData.set("comptdealtime", comptdealtime);
		// 及时处理,
		cell = row.getCell(Integer.parseInt(colNumMap.get("comptisdeal")));
		String comptisdeal = getCellValue(cell, "");
		if ("是".equals(comptisdeal)) {
			complaintData.set("comptisdeal", "1");
		} else if ("否".equals(comptisdeal)) {
			complaintData.set("comptisdeal", "0");
		}
		// 投诉原因,
		cell = row.getCell(Integer.parseInt(colNumMap.get("comptreason")));
		String comptreason = getCellValue(cell, "");
		complaintData.set("comptreason", comptreason);
		// 对策方案,
		cell = row.getCell(Integer.parseInt(colNumMap.get("comptplan")));
		String comptplan = getCellValue(cell, "");
		complaintData.set("comptplan", comptplan);

		Map<String, SaturnData> map = new HashMap<String, SaturnData>();
		map.put("complaint_deal", complaintData);

		return map;

	}

	/**
	 * 设置要导入的导入当日已结案投诉数据项
	 * 
	 * @param row
	 * @param colNumMap
	 * @return
	 */
	public Map<String, SaturnData> getComplaintClosedData(Row row,
			Map<String, String> colNumMap) {
		SaturnDataManager dataInfo = new SaturnDataManager();
		SaturnData complaintData = dataInfo
				.createData("http://crm/coreModule/data::crm_complaint_closed");
		// 投诉编号
		Cell cell = row
				.getCell(Integer.parseInt(colNumMap.get("comptorderid")));
		String comptorderid = getCellValue(cell, "");
		complaintData.set("comptorderid", comptorderid);
		// 结案日期,
		cell = row.getCell(Integer.parseInt(colNumMap.get("comptendtime")));
		String comptendtime = getCellValue(cell, "yyyy-MM-dd HH:mm:ss");
		complaintData.set("comptendtime", comptendtime);
		// 回访结果,
		cell = row.getCell(Integer.parseInt(colNumMap.get("comptvisitrslt")));
		String comptvisitrslt = getCellValue(cell, "");
		complaintData.set("comptvisitrslt", comptvisitrslt);

		Map<String, SaturnData> map = new HashMap<String, SaturnData>();
		map.put("complaint_closed", complaintData);

		return map;
	}

}
