package com.saturn.tc.foton.gys;

import org.json.JSONObject;

import com.saturn.app.db.DymaticCondition;
import com.saturn.app.db.ListData;
import com.saturn.app.db.ORMapping;
import com.saturn.app.db.ResultORMapping;
import com.saturn.app.db.SimpleDaoTemplate;
import com.saturn.app.exception.BSException;
import com.saturn.app.utils.CodeUtils;
import com.saturn.tc.utils.WorkspaceUtils;

public class UserInfo {
	
	private String userid;// 当前登录供应商在TC中登录的用户名
	
	private String userpass;//DB中用户密码
	
	public String getNO() {
		return NO;
	}

	public void setNO(String nO) {
		NO = nO;
	}

	private String NO;//rownum
	
	private static ORMapping<UserInfo> mapping = new ResultORMapping<UserInfo>();
	
	public UserInfo() {
		
	}
	
	public UserInfo(String userid, String userpass) {
		this.userid = userid;
		this.userpass = userpass;
	}
	
	//新增
	public static int addUserInfotoDB(UserInfo user) {
		if (get(user.getUserid()) != null) {
			throw new BSException("用户ID重复,id=" + user.getUserid());
		}
		user.setUserpass(CodeUtils.encode(user.getUserpass()));
		return SimpleDaoTemplate
				.update("INSERT INTO \"userinfo\" (\"userid\", \"userpass\") VALUES(?, ?)",
						user.getUserid(), user.getUserpass());
	}
	
    //修改
	public static int edit(UserInfo userinfo) {
		return SimpleDaoTemplate
				.update("UPDATE \"userinfo\" SET \"userpass\" = ? WHERE \"userid\" = ?",
						userinfo.getUserpass(),
						userinfo.getUserid());
	}
	
	public static void edits(String[] ids) {
		if (ids != null) {
			for (String id : ids) {
				UserInfo user = get(id);
				if(user != null){
					user.setUserpass(CodeUtils.encode(WorkspaceUtils.GYS_TC_PASSWORD));
					edit(user);
				}
			}
		}
	}
    //查询
	public static UserInfo get(String userid) {
		UserInfo user = SimpleDaoTemplate.queryOne(
				"SELECT * FROM \"userinfo\" WHERE 1 = 1 and \"userid\" = '"
						+ userid + "'",
				null, mapping, UserInfo.class);
		return user;
	}
	
	public static ListData<UserInfo> getUsers(UserInfo user, String start,
			String offset, String orderBy, String order) {
		
		DymaticCondition dymaticCondition = new DymaticCondition().addSimpleCondition(user, "userid", "userpass");
		String sql = "select rownum no ,\"userid\", \"userpass\" FROM  \"userinfo\" WHERE 1 = 1";
		if (dymaticCondition != null) {
			sql += dymaticCondition.toString();
		}
	//	System.out.println(("querySql:" + sql));
		return SimpleDaoTemplate.query(
				 "select * from ("+ sql + ")",
				 new DymaticCondition(), mapping, UserInfo.class, start, offset);
	}
	
	public static void removes(String[] ids) {
		if (ids != null) {
			for (String id : ids) {
				remove(id);
			}
		}
	}

	//删除
	public static int remove(final String userid) {
		return SimpleDaoTemplate.update(
				"DELETE FROM \"userinfo\" WHERE \"userid\" = ?", userid);
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserpass() {
		return userpass;
	}

	public void setUserpass(String userpass) {
		this.userpass = userpass;
	}
	
	@Override
	public String toString() {
		return new JSONObject(this).toString();
	}
	
}
