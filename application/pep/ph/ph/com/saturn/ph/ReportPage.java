package com.saturn.ph;

public class ReportPage {

	private String uid;
	private String type;
	private String pageName;
	private boolean backup;
	private String path;
	private String sortNum;
	
	public String getSortNum() {
		return sortNum;
	}
	public void setSortNum(String sortNum) {
		this.sortNum = sortNum;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getPageName() {
		return pageName;
	}
	public void setPageName(String pageName) {
		this.pageName = pageName;
	}
	public boolean getBackup() {
		return backup;
	}
	public void setBackup(boolean backup) {
		this.backup = backup;
	}
	
	
}
