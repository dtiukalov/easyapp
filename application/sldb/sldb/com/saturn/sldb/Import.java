package com.saturn.sldb;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.json.JSONObject;

import com.saturn.app.db.DymaticCondition;
import com.saturn.app.db.ITransaction;
import com.saturn.app.db.ListData;
import com.saturn.app.db.ORMapping;
import com.saturn.app.db.ResultORMapping;
import com.saturn.app.db.SimpleDaoTemplate;
import com.saturn.app.utils.DateUtils;

public class Import {

	private static final int IMPORT_TYPE_IDENTIF_CHANGE = 2;
	private static final int IMPORT_TYPE_ERROR = 0;
	private static final int IMPORT_TYPE_OK = 1;
	
	private String id;
	private String name;
	private String type;
	private String typeName;

	private String createTime;
	private String creater;
	private String createrName;

	private String sum;
	private String importDate;
	private String filePath;
	
	private static ORMapping<Import> mappingEasy = new ResultORMapping<Import>();

	private static ORMapping<Import> mapping = new ResultORMapping<Import>() {

		@Override
		public void mappingResult(ResultSet rs, Import t) throws SQLException {
			super.mappingResult(rs, t);

			ImportInfo info = ImportInfo.get(t.getType());
			if (info != null) {
				t.typeName = info.getName();
			}
		}

	};
	
	@SuppressWarnings("rawtypes")
	private static ORMapping<HashMap> mappingMap = new ORMapping<HashMap>() {

		@SuppressWarnings("unchecked")//hashmap的类型检查
		@Override
		public void mappingResult(ResultSet rs, HashMap t) throws SQLException {
			try {
				ResultSetMetaData metaData = rs.getMetaData();
				
				if (metaData != null) {
					int size = metaData.getColumnCount();
					for (int i = 1; i <= size; ++i) {
						String name = metaData.getColumnName(i);
						
						try {
							String value = rs.getString(name);
							t.put(name, value);
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	};

	public static int add(Import vo) {
		// 指定值对象类型(VOClass)。例子：User
		// 指定插入表名称(tableName)。例子：如user表3个列，tableName=user(id, name, gender)
		// 根据列的顺序获取值对象的属性值。例子：vo.getId(), vo.getName(), vo.getGender()
		return SimpleDaoTemplate
				.update("INSERT INTO sldb_import(id, name, type, createTime, creater, createrName, sum, importDate, filePath) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)",
						vo.id, vo.name, vo.type, vo.createTime, vo.creater, vo.createrName,
						vo.sum, vo.importDate, vo.filePath);
	}

	public static int importDate(Import vo) {
		InputStream input = null;

		try {
			input = new FileInputStream(new File(vo.filePath));
			HSSFWorkbook wb = new HSSFWorkbook(input);
			ImportInfo info = ImportInfo.get(vo.getType());

			if (info == null) {
				return 0;
			}

			createTable(getCreateTableSql(info, vo));
			
			int startLine = Integer.parseInt(info.getStartLine());

			HSSFSheet sheet = wb.getSheetAt(0);
			
			List<ImportItem> items = ImportItem.getList(info.getId());
			int size = items.size();
			if (size > 0) {
				String[] columnNames = new String[size];
				
				String[] quotes = new String[size];
				
				int i = 0;
				for (ImportItem item : items) {
					columnNames[i] = "`" + item.getColume() + "`";
					quotes[i] = "?";
					++i;
				}
				
				int num = startLine;
				int sum = 0;
				while (true) {
					HSSFRow row = sheet.getRow(num++);
					if (addRow(row, info, vo, columnNames, quotes, size) == 0) {
						break;
					} else {
						++sum;
					}
				}
				vo.setSum(sum + "");
	
				return add(vo);
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (input != null) {
				try {
					input.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

		return 0;
	}

	public static int addRow(HSSFRow row, ImportInfo info, Import vo, String[] columnNames, String[] quotes, int size) {
		String[] values = new String[size+4];
		
		int importType = IMPORT_TYPE_OK;
		String importError = "";
		
		for (int i = 0; i < size; ++i) {
			try {
				HSSFCell cell = row.getCell(i);
				
				if (cell == null) {
					values[i] = "";
				} else {
					switch (cell.getCellType()) {
					case HSSFCell.CELL_TYPE_NUMERIC:
						if (HSSFDateUtil.isCellDateFormatted(cell)) {
							SimpleDateFormat format = new SimpleDateFormat(DateUtils.getDateFormat());
							values[i] = format.format(cell.getDateCellValue()); 
						} else {
							values[i] = cell.getNumericCellValue() + "";
						}
						break;
					case HSSFCell.CELL_TYPE_STRING:
						values[i] = cell.getStringCellValue();
						break;
					default:
						values[i] = "";
						break;
					}
					
					if (values[i] == null) {
						values[i] = "";
					} else {
						values[i] = values[i].trim();
					}
				}
				
				
			} catch (Exception e) {
				importType = IMPORT_TYPE_ERROR;
				importError += e.getMessage() + "\n";
			}
		}
		
		boolean hasValue = false;
		for (int i = 0; i < size; ++i) {
			String value = values[i];
			if (value != null && !"".equals(value)) {
				hasValue = true;
				break;
			}
		}
		
		if (hasValue) {
			for (int i = 0; i < columnNames.length; ++i) {
				String name = columnNames[i];
				if (name != null && name.indexOf("identify") > 0) {//身份证校验
					String value = IdCardUtil.filterStr(values[i]);
					values[i] = value;
					if (value != null && value.trim().length() != 18) {
						importType = IMPORT_TYPE_IDENTIF_CHANGE;
						importError = value;
						values[i] = IdCardUtil.to18(value);
					}
				}
			}
			
			values[size] = vo.getImportDate();
			values[size+1] = vo.getId();
			values[size+2] = importType + "";
			values[size+3] = importError;
			
			return SimpleDaoTemplate.update(
					"INSERT INTO `" + info.getTableName() + vo.getImportDate() + "` ("
							+ getStr(columnNames) + ", importDate, iid, importType, importError) VALUES("
							+ getStr(quotes) + ",?,?,?,?)", values);
		}	

		return 0;
	}

	public static int createTable(final String sql) {
		String[] sqls = sql.split(";");

		try {
			for (String s : sqls) {
				SimpleDaoTemplate.update(s);
			}
		} catch (Exception e) {
			//如果表建过，会出现异常，不处理
		}
		
		return 1;
	}
	
	public static String getCreateTableSql(ImportInfo info, Import vo) {
		List<ImportItem> items = ImportItem.getList(info.getId());
		
		StringBuffer buffer = new StringBuffer();
		String tableName = info.getTableName() + vo.getImportDate();
		
		//允许多次创建同张表，报异常不处理
		//buffer.append("DROP TABLE IF EXISTS `" + tableName + "`;\n");
		buffer.append("CREATE TABLE `").append(tableName).append("`(\n");
		buffer.append("\t`id` int(11) NOT NULL AUTO_INCREMENT,\n");
		if (items != null) {
			int size = items.size();
			for (int i = 0; i < size; ++i) {
				ImportItem column = items.get(i);
				buffer.append("\t`").append(column.getColume()).append("` ");
				if (column.getType().equals("字符串")) {
					buffer.append("varchar(")
						.append(column.getLength()).append(") ");
				} else {
					buffer.append("decimal(10,2) ");
				}
				buffer.append("DEFAULT NULL,");
				buffer.append('\n');
			}
		}
		buffer.append("\t`importDate` varchar(50) DEFAULT NULL,\n");
		buffer.append("\t`iid` varchar(100) DEFAULT NULL,\n");
		buffer.append("\t`importType` int(10) DEFAULT NULL,\n");
		buffer.append("\t`importError` varchar(1000) DEFAULT NULL,\n");
		buffer.append("\tPRIMARY KEY (`id`)");

		buffer.append("\n) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;");
		return buffer.toString();
	}
	
	@SuppressWarnings("rawtypes")
	public static ListData<HashMap> getAllImport(Map vo, String id, String start,
			String offset, String orderBy, String order) {
		
		Import imp = Import.get(id);
		String type = imp.getType();
		
		ImportInfo info = ImportInfo.get(type);
		String tableName = info.getTableName() + imp.getImportDate();
		List<ImportItem> items = ImportItem.getList(info.getId());
		int size = items.size();
		
		List<String> conditions = new ArrayList<String>();
		for (ImportItem item : items) {
			conditions.add(item.getColume());
		}
		
		return SimpleDaoTemplate.query("SELECT * FROM `" + tableName + "` WHERE iid = '" + id + "' ",
				new DymaticCondition().addSimpleCondition(vo, conditions.toArray(new String[size]))
						.addCondition("ORDER BY {0} {1}", orderBy, order),
				mappingMap, HashMap.class, start, offset);
	}
	
	@SuppressWarnings("rawtypes")
	public static List<HashMap> getAllImport(String tableName, String importDate) {
		String table = tableName + importDate;
		
		return SimpleDaoTemplate.query("SELECT * FROM `" + table + "`",
				null,
				mappingMap, HashMap.class);
	}
	
	@SuppressWarnings("rawtypes")
	public static List<HashMap> getIdImportOrderBy(String tableName, String importDate, String order) {
		String table = tableName + importDate;
		
		return SimpleDaoTemplate.query("SELECT id, " + order + ", name FROM `" + table + "` order by " + order + " asc",
				null,
				mappingMap, HashMap.class);
	}
	
	@SuppressWarnings("rawtypes")
	public static List<HashMap> getAllImportOrderBy(String tableName, String importDate, String order) {
		String table = tableName + importDate;
		
		return SimpleDaoTemplate.query("SELECT * FROM `" + table + "` order by " + order + " asc",
				null,
				mappingMap, HashMap.class);
	}
	
	public static String getStr(String[] vars) {
		StringBuffer buffer = new StringBuffer();
		for (String var : vars) {
			buffer.append(var).append(",");
		}

		buffer.deleteCharAt(buffer.length() - 1);
		return buffer.toString();
	}

	public static int edit(Import vo) {
		// 指定值对象类型(VOClass)。例子：User
		// 指定插入表名称(tableName)。例子：如user表3个列，tableName=user
		// 指定修改列信息(modify)。例子：name=?, value=?
		// 根据修改列的顺序获取值对象的属性值。例子：vo.getName(), vo.getValue(), vo.getId()
		return SimpleDaoTemplate
				.update("UPDATE sldb_import SET name = ?, type = ?, createTime = ?, creater = ?, createrName = ?, sum = ?, importDate = ?, filePath = ? WHERE id = ?",
						vo.name, vo.type, vo.createTime, vo.creater, vo.createrName,
						vo.sum, vo.importDate, vo.filePath, vo.id);
	}

	public static Import get(String id) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定表主键(key)。例子:key=id
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.queryOne(
				"SELECT * FROM sldb_import WHERE 1 = 1 and id = '" + id + "'",
				null, mapping, Import.class);
	}

	public static ListData<Import> getAll(Import vo, String start,
			String offset, String orderBy, String order) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query(
				"SELECT * FROM sldb_import WHERE 1 = 1",
				new DymaticCondition().addSimpleCondition(vo, "importDate",
						"createrName", "creater", "createTime")
						.addCondition(" AND type = '?'", vo.getType()).addCondition(
						"ORDER BY {0} {1}", orderBy, order), mapping,
				Import.class, start, offset);
	}
	
	public static List<Import> getAllDate(String type) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		if (type == null) {
			return SimpleDaoTemplate.query(
					"SELECT distinct importDate, type FROM sldb_import WHERE 1 = 1 order by importdate desc",
					null,
					mappingEasy,
					Import.class);
		} else {
			return SimpleDaoTemplate.query(
					"SELECT distinct importDate, type FROM sldb_import WHERE 1 = 1 and type = '" + type + "' order by importdate desc",
					null,
					mappingEasy,
					Import.class);
		}
	}

	public static int remove(final String id) {
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		Import vo = Import.get(id);
		ImportInfo info = ImportInfo.get(vo.getType());
		final String tableName;
		if (info != null){
			tableName = info.getTableName() + vo.getImportDate();
		} else {
			tableName = null;
		}
		
		return SimpleDaoTemplate.update(new ITransaction() {
			public int execute(Connection connection) {
				if (tableName != null) {
					SimpleDaoTemplate.update(connection, "DELETE FROM `" + tableName + "` WHERE iid = ?",
						id);
				}
				
				return SimpleDaoTemplate.update(connection, "DELETE FROM sldb_import WHERE id = ?",
						id);
			}
		});
	}

	public static void removes(String[] ids) {
		if (ids != null) {
			for (String id : ids) {
				remove(id);
			}
		}
	}

	public Import() {
		super();
	}

	public Import(String id, String name, String type, String createTime, String creater,
			String createrName, String sum, String importDate, String filePath) {
	
		super();
		this.id = id;
		this.name = name;
		this.type = type;
		this.createTime = createTime;
		this.creater = creater;
		this.createrName = createrName;
		this.sum = sum;
		this.importDate = importDate;
		this.filePath = filePath;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getCreater() {
		return creater;
	}

	public void setCreater(String creater) {
		this.creater = creater;
	}

	public String getCreaterName() {
		return createrName;
	}

	public void setCreaterName(String createrName) {
		this.createrName = createrName;
	}

	public String getSum() {
		return sum;
	}

	public void setSum(String sum) {
		this.sum = sum;
	}

	public String getImportDate() {
		return importDate;
	}

	public void setImportDate(String importDate) {
		this.importDate = importDate;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	@Override
	public String toString() {
		return new JSONObject(this).toString();
	}
}
