package com.fawvw.ph.policy;

import java.util.HashSet;
import java.util.Set;

import com.teamcenter.rac.kernel.TCComponent;
import com.teamcenter.rac.kernel.TCComponentGroupMember;
import com.teamcenter.rac.kernel.TCException;

public class PHFragmentPolicy {

	public final PHReportConfig config;

	public final String section;
	public final String objType;
	public final String objName;
	public final String relation;
	public final String group;
	public final String role;

	protected final Set<String> milestones = new HashSet<String>();

	protected PHFragmentPolicy(PHReportConfig config, String section,
			String objType, String objName, String relation, String group,
			String role) {
		this.config = config;
		this.section = section;
		this.objType = objType;
		this.objName = objName;
		this.relation = relation;
		this.group = group;
		this.role = role;
	}

	public boolean shouldPresentForMilestone(String ms) {
		return milestones.contains(ms);
	}

	public boolean isTeamMemberQualify(TCComponentGroupMember gm)
			throws TCException {
		if (group != null && group.length() > 0) {
			if (!group.equals(gm.getGroup().getProperty("full_name")))
				return false;
		}
		if (role != null && role.length() > 0) {
			if (!role.equals(gm.getRole().getProperty("role_name")))
				return false;
		}
		return true;
	}

	public boolean isValidSrc(TCComponent c) throws TCException {
		if (objType != null && objType.length() > 0) {
			if (!c.isTypeOf(objType))
				return false;
		}
		if (objName != null && objName.length() > 0) {
			// XXX object_name or fv9PageName ??
			if (!objName.equals(c.getProperty("object_name")))
				return false;
		}
		if (section != null && section.length() > 0) {
			String cs = c.getProperty("fv9PageNo");
			if (!section.equals(cs))
				return false;
		}
		return true;
	}

	public String toString() {
		StringBuilder sb = new StringBuilder(200);
		sb.append(section).append('-');
		if (objName != null)
			sb.append(objName);
		if (objType != null)
			sb.append('(').append(objType).append(')');
		else
			sb.append("()");
		sb.append('@');
		if (relation != null)
			sb.append(relation);
		sb.append("->");
		if (group != null)
			sb.append(group);
		sb.append('/');
		if (role != null)
			sb.append(role);
		return sb.toString();
	}

}
