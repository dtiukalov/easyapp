package com.saturn.auth;

import java.sql.Connection;

import org.json.JSONObject;

import com.saturn.app.db.DymaticCondition;
import com.saturn.app.db.ITransaction;
import com.saturn.app.db.ListData;
import com.saturn.app.db.ORMapping;
import com.saturn.app.db.ResultORMapping;
import com.saturn.app.db.SimpleDaoTemplate;
import com.saturn.app.exception.BSException;
import com.saturn.app.utils.CodeUtils;

public class User {

	private String id = "";
	private String name = "";
	private String password = "";
	private String email = "";
	private String phone = "";

	private static ORMapping<User> mapping = new ResultORMapping<User>();

	public static int add(User user) {
		if (get(user.getId()) != null) {
			throw new BSException("用户ID重复,id=" + user.getId());
		}

		user.setPassword(CodeUtils.encode(user.getPassword()));
		return SimpleDaoTemplate.update(
				"INSERT INTO auth_users VALUES(?, ?, ?, ?, ?)", user.getId(),
				user.getName(), user.getPassword(), user.getEmail(),
				user.getPhone());

	}

	public static int addRole(String userId, String roleId) {
		return SimpleDaoTemplate.update(
				"INSERT INTO auth_re_user_role VALUES(?, ?)", userId, roleId);
	}

	public static void addRoles(String userId, String[] roleIds) {
		if (roleIds != null) {
			for (String roleId : roleIds) {
				addRole(userId, roleId);
			}
		}
	}

	public static void addUsersToOrganization(String organizationId,
			String[] userIds) {
		if (userIds != null) {
			for (String userId : userIds) {
				addUserToOrganization(organizationId, userId);
			}
		}
	}

	public static int addUserToOrganization(String organizationId, String userId) {
		return SimpleDaoTemplate.update(
				"INSERT INTO auth_re_organization_user VALUES(?, ?)",
				organizationId, userId);
	}

	public static int edit(User user) {
		return SimpleDaoTemplate
				.update("UPDATE auth_users SET name = ?, password = ?, email = ?, phone = ? WHERE id = ?",
						user.getName(), user.getPassword(), user.getEmail(),
						user.getPhone(), user.getId());
	}
	
	public static User get(String id) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定表主键(key)。例子:key=id
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.queryOne(
				"SELECT * FROM auth_users WHERE 1 = 1 and id = '" + id + "'",
				null, mapping, User.class);
	}

	public static ListData<User> getUsers(User user, String start,
			String offset, String orderBy, String order) {

		return SimpleDaoTemplate.query(
				"SELECT * FROM auth_users WHERE 1 = 1",
				new DymaticCondition().addSimpleCondition(user, "id", "name",
						"email", "phone").addCondition("ORDER BY {0} {1}",
						orderBy, order), mapping, User.class, start, offset);
	}

	public static ListData<User> getUsersByOrganizationId(
			String organizationId, String start, String offset, String orderBy) {

		return SimpleDaoTemplate
				.query("SELECT user.* FROM auth_users user, auth_re_organization_user organizationUser WHERE 1=1 and user.id = organizationUser.userId",
						new DymaticCondition().addCondition(
								"AND organizationUser.organizationId = '?' ",
								organizationId).addCondition("ORDER BY ? desc",
								orderBy), mapping, User.class, start, offset);
	}

	public static int updateUserResource(final String userId,
			final String[] chekcedIds) {
		return SimpleDaoTemplate.update(new ITransaction() {

			public int execute(Connection connection) {
				SimpleDaoTemplate.update(connection,
						"DELETE FROM auth_re_user_resource WHERE userId = ?",
						userId);
				StringBuffer buffer = new StringBuffer();
				buffer.append("insert into auth_re_user_resource values");

				for (int i = 0; i < (chekcedIds.length); i++) {
					buffer.append("(\'");
					buffer.append(userId + "\', \'" + chekcedIds[i]);
					buffer.append("\'),");
				}
				String sql = buffer.toString().substring(0,
						buffer.toString().length() - 1);

				return SimpleDaoTemplate.update(connection, sql, (String) null);
			}
		});
	}

	public static int removeAllResource(String id) {
		return SimpleDaoTemplate.update(
				"DELETE FROM auth_re_user_resource WHERE userId = ?", id);
	}

	public static int remove(final String id) {
		return SimpleDaoTemplate.update(new ITransaction() {

			public int execute(Connection connection) {
				SimpleDaoTemplate.update(connection,
						"DELETE FROM auth_re_user_role WHERE userId = ?", id);

				return SimpleDaoTemplate.update(connection,
						"DELETE FROM auth_users WHERE id = ?", id);
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

	public static int removeRole(String userId, String roleId) {
		return SimpleDaoTemplate
				.update("DELETE FROM auth_re_user_role WHERE userId = ? and roleId = ?",
						userId, roleId);
	}

	public static void removeRoles(String userId, String[] roleIds) {
		if (roleIds != null) {
			for (String roleId : roleIds) {
				removeRole(userId, roleId);
			}
		}
	}

	public static int removeAllRole(String userId) {
		return SimpleDaoTemplate.update(
				"DELETE FROM auth_re_user_role WHERE userId = ?", userId);
	}

	public static ListData<User> getUsersByRoleId(String roleId, String start,
			String offset, String orderBy) {

		return SimpleDaoTemplate
				.query("SELECT user.* FROM auth_users user, auth_re_user_role userRole WHERE 1=1 and user.id = userRole.userId",
						new DymaticCondition().addCondition(
								"AND userRole.roleId = '?'", roleId)
								.addCondition("ORDER BY ? desc", orderBy),
						mapping, User.class, start, offset);

	}

	public static ListData<User> getNotInOrganizationsByOrganizationId(
			String organizationId, String start, String offset, String orderBy,
			String order) {

		return SimpleDaoTemplate
				.query("SELECT * FROM auth_users WHERE 1= 1",
						new DymaticCondition()
								.addCondition(
										"AND id NOT IN(SELECT user.id FROM auth_users user, `auth_re_organization_user` organizationUser WHERE organizationUser.`userId` = user.id and organizationUser.organizationId = '?')",
										organizationId).addCondition(
										"ORDER BY {0} {1}", orderBy, order),
						mapping, User.class, start, offset);
	}

	public User() {
	}

	public User(String id, String name, String password, String email,
			String phone) {
		this.id = id;
		this.name = name;
		this.password = password;
		this.email = email;
		this.phone = phone;
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return new JSONObject(this).toString();
	}
}
