package com.saturn.sldb;

import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;

import org.json.JSONObject;

import com.saturn.app.db.DymaticCondition;
import com.saturn.app.db.ITransaction;
import com.saturn.app.db.ListData;
import com.saturn.app.db.ORMapping;
import com.saturn.app.db.ResultORMapping;
import com.saturn.app.db.SimpleDaoTemplate;
import com.saturn.app.utils.DateUtils;
import com.saturn.auth.Organization;
import com.saturn.auth.User;

public class Person {

	private String id;

	private String identify;
	private String type;

	private String createTime;
	private String creater;
	private String createrName;
	private String createrDepartment;

	private String state;

	private String name;
	private String gender;
	private String race;
	private String hukou;

	private String home;
	private String homeSum;
	private String marry;
	private String workable;
	private String idType;
	private String first;

	private String ill;
	private String deformity;
	private String deformityLevel;
	private String companyType;
	private String trade;

	private String insurance;
	private String company;
	private String contact;
	private String street;
	private String address;
	private String desc;

	private String userId;

	private static ORMapping<Person> mapping = new ResultORMapping<Person>();
	private static Map<String, String> stateMap = new HashMap<String, String>();

	static {
		stateMap.put("创建", "申报");
		stateMap.put("申报", "初审");
		stateMap.put("初审", "已核对");
		stateMap.put("已核对", "评议");
		stateMap.put("评议", "通过");
	}

	public static int add(Person vo) {
		// 指定值对象类型(VOClass)。例子：User
		// 指定插入表名称(tableName)。例子：如user表3个列，tableName=user(id, name, gender)
		// 根据列的顺序获取值对象的属性值。例子：vo.getId(), vo.getName(), vo.getGender()
		return SimpleDaoTemplate
				.update("INSERT INTO sldb_person("
						+ "identify, type, createTime, "
						+ "creater, createrName, createrDepartment, "
						+ "state, name, gender, race, "
						+ "hukou, home, homeSum, marry, workable, "
						+ "idType, first, ill, deformity, "
						+ "deformityLevel, companyType, trade, "
						+ "insurance, company, contact, street, "
						+ "address, `desc`) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
						vo.identify, vo.type, vo.createTime, vo.creater,
						vo.createrName, vo.createrDepartment, vo.state,
						vo.name, vo.gender, vo.race, vo.hukou, vo.home,
						vo.homeSum, vo.marry, vo.workable, vo.idType, vo.first,
						vo.ill, vo.deformity, vo.deformityLevel,
						vo.companyType, vo.trade, vo.insurance, vo.company,
						vo.contact, vo.street, vo.address, vo.desc);
	}

	public static int edit(Person vo) {
		// 指定值对象类型(VOClass)。例子：User
		// 指定插入表名称(tableName)。例子：如user表3个列，tableName=user
		// 指定修改列信息(modify)。例子：name=?, value=?
		// 根据修改列的顺序获取值对象的属性值。例子：vo.getName(), vo.getValue(), vo.getId()
		return SimpleDaoTemplate.update("UPDATE sldb_person SET "
				+ "identify = ?, type = ?, createTime = ?, "
				+ "creater = ?, createrName = ?, createrDepartment = ?, "
				+ "state = ?, name = ?, gender = ?, race = ?, "
				+ "hukou = ?, home = ?, homeSum = ?, marry = ?, workable = ?, "
				+ "idType = ?, first = ?, ill = ?, deformity = ?, "
				+ "deformityLevel = ?, companyType = ?, trade = ?, "
				+ "insurance = ?, company = ?, contact = ?, street = ?, "
				+ "address = ?, `desc` = ? " + "WHERE id = ?", vo.identify,
				vo.type, vo.createTime, vo.creater, vo.createrName,
				vo.createrDepartment, vo.state, vo.name, vo.gender, vo.race,
				vo.hukou, vo.home, vo.homeSum, vo.marry, vo.workable,
				vo.idType, vo.first, vo.ill, vo.deformity, vo.deformityLevel,
				vo.companyType, vo.trade, vo.insurance, vo.company, vo.contact,
				vo.street, vo.address, vo.desc, vo.id);
	}

	public static Person get(String id) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定表主键(key)。例子:key=id
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.queryOne(
				"SELECT * FROM sldb_person WHERE 1 = 1 and id = '" + id + "'",
				null, mapping, Person.class);
	}

	public static ListData<Person> getAll(Person vo, String start,
			String offset, String orderBy, String order) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query(
				"SELECT * FROM sldb_person WHERE 1 = 1",
				new DymaticCondition().addSimpleCondition(vo, "state",
						"identify", "name", "gender", "type", "createrName",
						"createTime","creater")
						.addCondition("ORDER BY {0} {1}", orderBy,
						order), mapping, Person.class, start, offset);
	}

	public static ListData<Person> getAllWithOutCreater(Person vo, String start,
			String offset, String orderBy, String order) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query(
				"SELECT * FROM sldb_person WHERE 1 = 1",
				new DymaticCondition().addSimpleCondition(vo, "state",
						"identify", "name", "gender", "createrName",
						"createTime")
						.addCondition("ORDER BY {0} {1}", orderBy,
						order), mapping, Person.class, start, offset);
	}
	
	public static ListData<Person> getAllWithoutCreater(Person vo, String start,
			String offset, String orderBy, String order) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query(
				"SELECT * FROM sldb_person WHERE 1 = 1",
				new DymaticCondition().addSimpleCondition(vo, "state",
						"identify", "name", "gender", "createrName",
						"createTime")
						.addCondition("ORDER BY {0} {1}", orderBy,
						order), mapping, Person.class, start, offset);
	}
	
	public static int confirm(final String id, final String userId,
			final String note, final String department) {
		return SimpleDaoTemplate.update(new ITransaction() {
			public int execute(Connection connection) {
				
				User user = User.get(userId);
				Person person = Person.get(id);

				String nextState = stateMap.get(person.getState());
				
				PersonState personState = new PersonState(null, id, userId,
						user.getName(), DateUtils.getSystemTime(), person
								.getName(), person.getIdentify(), nextState,
						note, department);

				state(connection, id, nextState);
				PersonState.add(connection, personState);

				return 1;
			}
		});
	}
	
	public static int confirm(final String[] ids, final String userId,
			final String note, final String department) {
		for (String id : ids) {
			confirm(id, userId, note, department);
		}

		return 1;
	}

	public static int refuse(final String id, final String userId,
			final String note, final String department) {
		return SimpleDaoTemplate.update(new ITransaction() {
			public int execute(Connection connection) {

				User user = User.get(userId);
				Person person = Person.get(id);

				String nextState = "驳回";

				PersonState personState = new PersonState(null, id, userId,
						user.getName(), DateUtils.getSystemTime(), person
								.getName(), person.getIdentify(), nextState,
						note, department);

				state(connection, id, nextState);
				PersonState.addRefuse(connection, personState);

				return 1;
			}
		});
	}

	public static int refuse(final String[] ids, final String userId,
			final String note) {
		
		Organization organization = Organization.getOneOrganizationByUser(userId);
		String department = organization.getName();
		
		for (String id : ids) {
			refuse(id, userId, note, department);
		}

		return 1;
	}

	public static int replay(String id, String state) {
		return SimpleDaoTemplate.update(
				"UPDATE sldb_person SET state = ? where id = ?", state,id);
	}
	
	private static int state(Connection connection, String id, String state) {
		return SimpleDaoTemplate.update(connection,
				"UPDATE sldb_person SET state = ? WHERE id = ?", state, id);
	}

	public static  int UpdateState(String id, String state) {
		return SimpleDaoTemplate.update(
				"UPDATE sldb_person SET state = ? WHERE id = ?", state, id);
	}
	
	public static int remove(final String id) {
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		return SimpleDaoTemplate.update("DELETE FROM sldb_person WHERE id = ?",
				id);
	}

	public static void removes(String[] ids) {
		if (ids != null) {
			for (String id : ids) {
				remove(id);
			}
		}
	}

	public static ListData<Person> getAllOld(Person vo, String start,
			String offset, String orderBy, String order) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate
				.query("select distinct (s.pid), p.* from  sldb_person p ,sldb_person_state s where 1 = 1 and p.id = s.pid",
						new DymaticCondition().addCondition(
								"and userId = '?' ", vo.getUserId()), mapping,
						Person.class, start, offset);
	}

	public static ListData<Person> getAllOldWithOutUserId(Person vo, String start,
			String offset, String orderBy, String order) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate
				.query("select distinct (s.pid), p.* from  sldb_person p ,sldb_person_state s where 1 = 1 and p.id = s.pid",
						new DymaticCondition(), mapping,
						Person.class, start, offset);
	}
	public Person(String id, String identify, String type, String createTime,
			String creater, String createrName, String createrDepartment,
			String state, String name, String gender, String race,
			String hukou, String home, String homeSum, String marry,
			String workable, String idType, String first, String ill,
			String deformity, String deformityLevel, String companyType,
			String trade, String insurance, String company, String contact,
			String street, String address, String desc) {
		super();
		this.id = id;
		this.identify = identify;
		this.type = type;
		this.createTime = createTime;
		this.creater = creater;
		this.createrName = createrName;
		this.createrDepartment = createrDepartment;
		this.state = state;
		this.name = name;
		this.gender = gender;
		this.race = race;
		this.hukou = hukou;
		this.home = home;
		this.homeSum = homeSum;
		this.marry = marry;
		this.workable = workable;
		this.idType = idType;
		this.first = first;
		this.ill = ill;
		this.deformity = deformity;
		this.deformityLevel = deformityLevel;
		this.companyType = companyType;
		this.trade = trade;
		this.insurance = insurance;
		this.company = company;
		this.contact = contact;
		this.street = street;
		this.address = address;
		this.desc = desc;
	}

	public Person() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getIdentify() {
		return identify;
	}

	public void setIdentify(String identify) {
		this.identify = identify;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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

	public String getCreaterDepartment() {
		return createrDepartment;
	}

	public void setCreaterDepartment(String createDepartment) {
		this.createrDepartment = createDepartment;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getHomeSum() {
		return homeSum;
	}

	public void setHomeSum(String homeSum) {
		this.homeSum = homeSum;
	}

	public String getIll() {
		return ill;
	}

	public void setIll(String ill) {
		this.ill = ill;
	}

	public String getDeformity() {
		return deformity;
	}

	public void setDeformity(String deformity) {
		this.deformity = deformity;
	}

	public String getRace() {
		return race;
	}

	public void setRace(String race) {
		this.race = race;
	}

	public String getHukou() {
		return hukou;
	}

	public void setHukou(String hukou) {
		this.hukou = hukou;
	}

	public String getHome() {
		return home;
	}

	public void setHome(String home) {
		this.home = home;
	}

	public String getMarry() {
		return marry;
	}

	public void setMarry(String marry) {
		this.marry = marry;
	}

	public String getIdType() {
		return idType;
	}

	public void setIdType(String idType) {
		this.idType = idType;
	}

	public String getFirst() {
		return first;
	}

	public void setFirst(String first) {
		this.first = first;
	}

	public String getDeformityLevel() {
		return deformityLevel;
	}

	public void setDeformityLevel(String deformityLevel) {
		this.deformityLevel = deformityLevel;
	}

	public String getCompanyType() {
		return companyType;
	}

	public void setCompanyType(String companyType) {
		this.companyType = companyType;
	}

	public String getTrade() {
		return trade;
	}

	public void setTrade(String trade) {
		this.trade = trade;
	}

	public String getInsurance() {
		return insurance;
	}

	public void setInsurance(String insurance) {
		this.insurance = insurance;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getWorkable() {
		return workable;
	}

	public void setWorkable(String workable) {
		this.workable = workable;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	@Override
	public String toString() {
		return new JSONObject(this).toString();
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserId() {
		return userId;
	}
}
