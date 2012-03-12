package com.saturn.sldb;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.json.JSONObject;

import com.saturn.app.db.DymaticCondition;
import com.saturn.app.db.ListData;
import com.saturn.app.db.ORMapping;
import com.saturn.app.db.ResultORMapping;
import com.saturn.app.db.SimpleDaoTemplate;

public class IdCheck {

	private String num;
	private String id;
	private String key;
	private String result;
	private String infoType;
	private String value;

	private static ORMapping<IdCheck> mapping = new ResultORMapping<IdCheck>();

	private static ORMapping<Import> mappingImport = new ResultORMapping<Import>();

	@SuppressWarnings("rawtypes")
	private static ORMapping<HashMap> mappingMap = new ORMapping<HashMap>() {

		@SuppressWarnings("unchecked")
		// hashmap的类型检查
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

	public static int add(IdCheck vo) {
		// 指定值对象类型(VOClass)。例子：User
		// 指定插入表名称(tableName)。例子：如user表3个列，tableName=user(id, name, gender)
		// 根据列的顺序获取值对象的属性值。例子：vo.getId(), vo.getName(), vo.getGender()
		return SimpleDaoTemplate
				.update("INSERT INTO sldb_id_check (`id`, `key`, `result`, `infoType`,`value`) VALUES(?, ?, ?, ?, ?)",
						vo.id, vo.key, vo.result, vo.infoType, vo.value);
	}

	public static void addAll(List<IdCheck> checks) {
		for (IdCheck check : checks) {
			add(check);
		}
	}

	public static int remove(final String id) {
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		return SimpleDaoTemplate.update(
				"DELETE FROM sldb_id_check WHERE id = ?", id);
	}

	public static IdCheck get(String num) {
		return SimpleDaoTemplate.queryOne(
				"SELECT * FROM sldb_id_check WHERE 1 = 1 AND num = " + num,
				null, mapping, IdCheck.class);
	}

	public static ListData<IdCheck> getAll(String id, String start,
			String offset, String orderBy, String order) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query(
				"SELECT * FROM sldb_id_check WHERE 1 = 1",
				new DymaticCondition().addCondition(" AND id = '?'", id)
						.addCondition("ORDER BY {0} {1}", orderBy, order),
				mapping, IdCheck.class, start, offset);
	}

	@SuppressWarnings("rawtypes")
	public static HashMap batchCheck(String id, String importDate, String toId,
			String toImportDate) {
		ImportInfo info = ImportInfo.get(id);//
		List<HashMap> persons = Import.getAllImportOrderBy(info.getTableName(),
				importDate, "identify");
		String key = "identify";
		
		List<HashMap> result = new ArrayList<HashMap>();
		List<HashMap> source = new ArrayList<HashMap>();

		if (id.equals(toId)) {// check oneself
			if (!persons.isEmpty()) {
				HashMap first = persons.get(0);

				for (int i = 1; i < persons.size(); ++i) {
					HashMap second = (HashMap) persons.get(i);

					String firstValue = (String) first.get(key);
					String secondValue = (String) second.get(key);

					if (firstValue.equals("") || secondValue.equals("")) {
						first = second;
						continue;
					}

					if (firstValue.equals(secondValue)) {
						result.add(first);
						source.add(second);
					} else {
						first = second;
					}
				}
			}
		} else {
			ImportInfo toInfo = ImportInfo.get(toId);
			String tableName = toInfo.getTableName();

			if (tableName.indexOf("marry") >= 0) {
				key = "mIdentify";
			}
			List<HashMap> others = Import.getAllImportOrderBy(tableName,
					toImportDate, key);

			int firstSize = persons.size();
			int secondSize = others.size();

			int first = 0;
			int second = 0;

			HashMap firstValue = null;
			HashMap secondValue = null;

			while (first < firstSize && second < secondSize) {
				firstValue = persons.get(first);
				secondValue = others.get(second);

				String identify1 = firstValue.get("identify") + "";
				String identify2 = secondValue.get(key) + "";
				
				int index = identify1.compareTo(identify2);
				
				if (index == 0) {
					if (identify2 != null && !"".equals(identify2)) {
						result.add(secondValue);
						source.add(firstValue);
					}
					first++;
					second++;
				} else if (index > 0) {
					second++;
				} else {
					first++;
				}
			}

			// for (HashMap person : persons) {
			// String identify = (String)person.get("identify");
			// String name = (String)person.get("name");
			//
			//
			//
			// result.addAll(checkTable(identify, name, tableName));
			// }
		}

		HashMap<String, List<HashMap>> resultMap = new HashMap<String, List<HashMap>>();
		resultMap.put("result", result);
		resultMap.put("source", source);
		return resultMap;
	}

	@SuppressWarnings("rawtypes")
	public static HashMap batchCheckByName(String id, String importDate, String toId,
			String toImportDate) {
		ImportInfo info = ImportInfo.get(id);
		List<HashMap> persons = Import.getAllImportOrderBy(info.getTableName(),
				importDate, "name");
		String key = "name";
		
		List<HashMap> result = new ArrayList<HashMap>();
		List<HashMap> source = new ArrayList<HashMap>();

		if (id.equals(toId)) {// check oneself
			if (!persons.isEmpty()) {
				HashMap first = persons.get(0);

				for (int i = 1; i < persons.size(); ++i) {
					HashMap second = (HashMap) persons.get(i);

					String firstValue = (String) first.get(key);
					String secondValue = (String) second.get(key);

					if (firstValue.equals("") || secondValue.equals("")) {
						first = second;
						continue;
					}

					if (firstValue.equals(secondValue)) {
						result.add(first);
						source.add(second);
					} else {
						first = second;
					}
				}
			}
		} else {
			ImportInfo toInfo = ImportInfo.get(toId);
			String tableName = toInfo.getTableName();

			if (tableName.indexOf("marry") >= 0) {
				key = "mName";
			}
			List<HashMap> others = Import.getAllImportOrderBy(tableName,
					toImportDate, key);

			int firstSize = persons.size();
			int secondSize = others.size();

			int first = 0;
			int second = 0;

			HashMap firstValue = null;
			HashMap secondValue = null;

			while (first < firstSize && second < secondSize) {
				firstValue = persons.get(first);
				secondValue = others.get(second);

				String name1 = firstValue.get("name") + "";
				String name2 = secondValue.get(key) + "";
				
				int index = name1.compareTo(name2);
				
				if (index == 0) {
					if (name2 != null && !"".equals(name2)) {
						result.add(secondValue);
						source.add(firstValue);
					}
					first++;
					second++;
				} else if (index > 0) {
					second++;
				} else {
					first++;
				}
			}
		}

		HashMap<String, List<HashMap>> resultMap = new HashMap<String, List<HashMap>>();
		resultMap.put("result", result);
		resultMap.put("source", source);
		return resultMap;
	}
	
	public static String check(String pid) {
		Person person = Person.get(pid);
		List<PersonSub> subs = PersonSub.getByPid(pid);

		checkOnePerson(pid, person.getIdentify(), person.getName());

		for (PersonSub sub : subs) {
			checkOnePerson(sub.getId(), sub.getIdentify(), sub.getName());
		}

		return "true";
	}
	
	@SuppressWarnings("rawtypes")
	public static void checkOnePerson(String pid, String identify, String name) {
		List<IdCheck> checks = new ArrayList<IdCheck>();
		List<ImportInfo> infos = ImportInfo.getAllList();

		String id = pid + "_" + identify;

		if (getAll(id, null, null, null, null).getTotal() > 0) {
			remove(id);
		}//删除重复核对过的数据

		for (ImportInfo info : infos) {
			Import importLast = getLastImport(info.getId());

			if (importLast != null) {
				List<HashMap> results = checkOne(identify, name,
						importLast.getId());
				String key = info.getName() + "(" + importLast.getImportDate()
						+ ")";

				if (results.isEmpty()) {
					add(new IdCheck(id, key, "无", info.getId(), ""));
				} else {
					List<IdCheck> checkResult = getList(results, id, key,
							info.getId());

					checks.addAll(checkResult);
					addAll(checkResult);
				}
			}
		}
	}

	@SuppressWarnings("rawtypes")
	public static List<HashMap> checkOne(String identify, String name,
			String importId) {
		Import imp = Import.get(importId);
		String type = imp.getType();

		ImportInfo info = ImportInfo.get(type);
		String tableName = info.getTableName() + imp.getImportDate();

		return checkTable(identify, name, tableName);
	}

	@SuppressWarnings("rawtypes")
	public static List<HashMap> checkTable(String identify, String name,
			String tableName) {

		if ((identify == null || "".equals(identify.trim()))
				&& (name == null || "".equals(name.trim()))) {
			return new ArrayList<HashMap>();
		}

		try {
			if (tableName.indexOf("marry") >= 0) {
				return SimpleDaoTemplate
						.query("SELECT * FROM `" + tableName + "` WHERE 1 = 1",
								new DymaticCondition()
										.addCondition(
												" AND (wIdentify like '%{?}%' OR mIdentify like '%?%')",
												identify)
										.addCondition(
												" AND (wName like '%?%' OR mName like '%?%')",
												name), mappingMap,
								HashMap.class);
			} else {
				return SimpleDaoTemplate.query(
						"SELECT * FROM `" + tableName + "` WHERE 1 = 1",
						new DymaticCondition().addCondition(
								" AND identify like '%?%'", identify)
								.addCondition(" AND name like '%?%'", name),
						mappingMap, HashMap.class);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ArrayList<HashMap>();
	}

	//根据姓名进行核对
	public static String checkByName(String pid) {
		Person person = Person.get(pid);
		List<PersonSub> subs = PersonSub.getByPid(pid);

		checkOnePersonName(pid, person.getIdentify(), person.getName());

		for (PersonSub sub : subs) {
			checkOnePersonWithName(sub.getId(), sub.getIdentify(), sub.getName());
		}
		return "true";
	}
	public static void checkOnePersonWithName(String pid, String identify, String name) {
		List<IdCheck> checks = new ArrayList<IdCheck>();
		List<ImportInfo> infos = ImportInfo.getAllList();

		String id = pid + "_" + identify;

		if (getAll(id, null, null, null, null).getTotal() > 0) {
			remove(id);
		}//删除重复核对过的数据

		for (ImportInfo info : infos) {
			Import importLast = getLastImport(info.getId());

			if (importLast != null) {
				List<HashMap> results = checkOneName(name,
						importLast.getId());
				String key = info.getName() + "(" + importLast.getImportDate()
						+ ")";

				if (results.isEmpty()) {
					add(new IdCheck(id, key, "无", info.getId(), ""));
				} else {
					List<IdCheck> checkResult = getList(results, id, key,
							info.getId());

					checks.addAll(checkResult);
					addAll(checkResult);
				}
			}
		}
	}
	
	@SuppressWarnings("rawtypes")
	public static void checkOnePersonName(String pid, String identify, String name) {
		List<IdCheck> checks = new ArrayList<IdCheck>();
		List<ImportInfo> infos = ImportInfo.getAllList();

		String id = pid + "_" + identify;

		if (getAll(id, null, null, null, null).getTotal() > 0) {
			remove(id);
		}//删除重复核对过的数据

		for (ImportInfo info : infos) {
			Import importLast = getLastImport(info.getId());

			if (importLast != null) {
				List<HashMap> results = checkOneName(name,
						importLast.getId());
				String key = info.getName() + "(" + importLast.getImportDate()
						+ ")";

				if (results.isEmpty()) {
					add(new IdCheck(id, key, "无", info.getId(), ""));
				} else {
					List<IdCheck> checkResult = getList(results, id, key,
							info.getId());

					checks.addAll(checkResult);
					addAll(checkResult);
				}
			}
		}
	}
	@SuppressWarnings("rawtypes")
	public static List<HashMap> checkOneName(String name,
			String importId) {
		Import imp = Import.get(importId);
		String type = imp.getType();

		ImportInfo info = ImportInfo.get(type);
		String tableName = info.getTableName() + imp.getImportDate();

		return checkTableName(name, tableName);
	}

	@SuppressWarnings("rawtypes")
	public static List<HashMap> checkTableName(String name,
			String tableName) {

		if ((name == null || "".equals(name.trim()))) {
			return new ArrayList<HashMap>();
		}

		try {
			if (tableName.indexOf("marry") >= 0) {
				return SimpleDaoTemplate
						.query("SELECT * FROM `" + tableName + "` WHERE 1 = 1",
								new DymaticCondition()
										.addCondition(
												" AND (wName like '%?%' OR mName like '%?%')",
												name), mappingMap,
								HashMap.class);
			} else {
				return SimpleDaoTemplate.query(
						"SELECT * FROM `" + tableName + "` WHERE 1 = 1",
						new DymaticCondition()
								.addCondition(" AND name like '%?%'", name),
						mappingMap, HashMap.class);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ArrayList<HashMap>();
	}
	//根据身份证号核对数据
	public static String checkByIdentify(String pid) {
		Person person = Person.get(pid);
		List<PersonSub> subs = PersonSub.getByPid(pid);

		checkOnePersonIdentify(pid, person.getIdentify());

		for (PersonSub sub : subs) {
			checkOnePersonWithIdentify(sub.getId(), sub.getIdentify());
		}

		return "true";
	}
	
	//根据身份证号核对数据
	@SuppressWarnings("rawtypes")
	public static void checkOnePersonIdentify(String pid, String identify) {
		List<IdCheck> checks = new ArrayList<IdCheck>();
		List<ImportInfo> infos = ImportInfo.getAllList();

		String id = pid + "_" + identify;

		if (getAll(id, null, null, null, null).getTotal() > 0) {
			remove(id);
		}//删除重复核对过的数据

		for (ImportInfo info : infos) {
			Import importLast = getLastImport(info.getId());

			if (importLast != null) {
				List<HashMap> results = checkOneIdentify(identify,
						importLast.getId());
				String key = info.getName() + "(" + importLast.getImportDate()
						+ ")";

				if (results.isEmpty()) {
					add(new IdCheck(id, key, "无", info.getId(), ""));
				} else {
					List<IdCheck> checkResult = getList(results, id, key,
							info.getId());

					checks.addAll(checkResult);
					addAll(checkResult);
				}
			}
		}
	}

	public static void checkOnePersonWithIdentify(String pid, String identify) {
		List<IdCheck> checks = new ArrayList<IdCheck>();
		List<ImportInfo> infos = ImportInfo.getAllList();

		String id = pid + "_" + identify;

		if (getAll(id, null, null, null, null).getTotal() > 0) {
			remove(id);
		}//删除重复核对过的数据

		for (ImportInfo info : infos) {
			Import importLast = getLastImport(info.getId());

			if (importLast != null) {
				List<HashMap> results = checkOneIdentify(identify,
						importLast.getId());
				String key = info.getName() + "(" + importLast.getImportDate()
						+ ")";

				if (results.isEmpty()) {
					add(new IdCheck(id, key, "无", info.getId(), ""));
				} else {
					List<IdCheck> checkResult = getList(results, id, key,
							info.getId());

					checks.addAll(checkResult);
					addAll(checkResult);
				}
			}
		}
	}
	@SuppressWarnings("rawtypes")
	public static List<HashMap> checkOneIdentify(String identify,
			String importId) {
		Import imp = Import.get(importId);
		String type = imp.getType();

		ImportInfo info = ImportInfo.get(type);
		String tableName = info.getTableName() + imp.getImportDate();

		return checkTableIdentify(identify, tableName);
	}

	@SuppressWarnings("rawtypes")
	public static List<HashMap> checkTableIdentify(String identify,
			String tableName) {

		if ((identify == null || "".equals(identify.trim()))) {
			return new ArrayList<HashMap>();
		}

		try {
			if (tableName.indexOf("marry") >= 0) {
				return SimpleDaoTemplate
						.query("SELECT * FROM `" + tableName + "` WHERE 1 = 1",
								new DymaticCondition()
										.addCondition(
												" AND (wIdentify like '%{?}%' OR mIdentify like '%?%')",
												identify), mappingMap,
								HashMap.class);
			} else {
				return SimpleDaoTemplate.query(
						"SELECT * FROM `" + tableName + "` WHERE 1 = 1",
						new DymaticCondition().addCondition(
								" AND identify like '%?%'", identify),
						mappingMap, HashMap.class);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ArrayList<HashMap>();
	}
	
	public static Import getLastImport(String type) {
		List<Import> imports = SimpleDaoTemplate.query(
				"select * from sldb_import where type = '" + type
						+ "' order by importDate desc", null, mappingImport,
				Import.class);

		if (imports.isEmpty()) {
			return null;
		}

		return imports.get(0);
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static List<IdCheck> getList(List<HashMap> results, String id,
			String key, String infoType) {
		List<IdCheck> checks = new ArrayList<IdCheck>();

		for (HashMap map : results) {
			String mapStr = new JSONObject(map).toString();
			// checks.add(new IdCheck(id, key, mapStr, infoType));
			checks.add(new IdCheck(id, key, "有", infoType, mapStr));
		}

		return checks;
	}

	public static List<IdCheck> getValuesByInfoType(String infoType) {
		List<IdCheck> idCheckValues = SimpleDaoTemplate.query(
				"select * from sldb_id_check where infoType = '" + infoType,
				null, mapping, IdCheck.class);

		return idCheckValues;
	}

	public IdCheck() {
		super();
	}

	public IdCheck(String id, String key, String result, String infoType,
			String value) {
		super();

		this.id = id;
		this.key = key;
		this.result = result;
		this.infoType = infoType;
		this.value = value;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getInfoType() {
		return infoType;
	}

	public void setInfoType(String infoType) {
		this.infoType = infoType;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	@Override
	public String toString() {
		return new JSONObject(this).toString();
	}
}
