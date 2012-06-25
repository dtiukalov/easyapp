package tc.wfcf.auto;

import java.io.PrintStream;
import java.util.ArrayList;

import com.teamcenter.rac.kernel.TCCRDecision;
import com.teamcenter.rac.kernel.TCComponent;
import com.teamcenter.rac.kernel.TCComponentGroup;
import com.teamcenter.rac.kernel.TCComponentGroupMember;
import com.teamcenter.rac.kernel.TCComponentGroupMemberType;
import com.teamcenter.rac.kernel.TCComponentRole;
import com.teamcenter.rac.kernel.TCComponentSignoff;
import com.teamcenter.rac.kernel.TCComponentTask;
import com.teamcenter.rac.kernel.TCComponentUser;
import com.teamcenter.rac.kernel.TCComponentUserType;
import com.teamcenter.rac.kernel.TCException;
import com.teamcenter.rac.kernel.TCPreferenceService;
import com.teamcenter.rac.kernel.TCSession;
import com.teamcenter.rac.kernel.TCSignoffOriginType;

public class DecisionReassign extends AutoProcessDecision implements
		AutoProcessor {

	@Override
	public AutoProcessDecision processTask(TCComponentTask task, PrintStream log)
			throws Exception {
		return this;
	}

	protected final String targetUserPrefKey;
	protected final String defaultUser;
	protected final boolean allowFurtherProcess;

	public DecisionReassign(String targetUserPrefKey, String defaultUser,
			long retryDelay, boolean allowFurtherProcess) {
		super(retryDelay);
		this.targetUserPrefKey = targetUserPrefKey;
		this.defaultUser = defaultUser;
		this.allowFurtherProcess = allowFurtherProcess;
	}

	@Override
	public boolean allowFurtherProcess() {
		return this.allowFurtherProcess;
	}

	@Override
	public boolean finishProcess(TCComponentTask task, PrintStream log)
			throws Exception {
		return reassignTask(targetUserPrefKey, defaultUser, task, log);
	}

	public static boolean reassignTask(String targetUserPrefKey,
			String defaultUser, TCComponentTask task, PrintStream log)
			throws TCException {
		TCSession session = task.getSession();
		String userID = defaultUser;
		if (targetUserPrefKey != null && targetUserPrefKey.length() > 0)
			userID = session.getPreferenceService().getString(
					TCPreferenceService.TC_preference_all, targetUserPrefKey,
					defaultUser);
		if (userID == null) {
			log.println("No reassignee from preference: " + targetUserPrefKey);
			return false;
		}
		if (userID.equals(session.getUser().getProperty("user_id"))) {
			log.println("Reassignee '" + userID
					+ "' is current login user, reassignment is meaningless.");
			return false;
		}
		TCComponentUserType userType = (TCComponentUserType) session
				.getTypeComponent("User");
		TCComponentUser user = userType.find(userID);
		if (user == null) {
			log.println("Can't find reassignee '" + userID + "'");
			return false;
		}
		if ("EPMPerformSignoffTask".equals(task.getType())) {
			TCComponentGroupMemberType gmt = (TCComponentGroupMemberType) session
					.getTypeComponent("GroupMember");
			int reassignCount = 0;
			for (TCComponentSignoff signoff : task.getValidSignoffs()) {
				TCCRDecision decision = signoff.getDecision();
				if (decision.getIntValue() != TCCRDecision.NO_DECISION
						.getIntValue())
					// ignore signoffs already approved or rejected
					continue;
				TCComponentGroupMember origGM = signoff.getGroupMember();
				if (origGM.getUser() != session.getUser()) {
					// don't touch others' signoffs
					continue;
				}
				if (signoff.getOriginType() == TCSignoffOriginType.PROFILE) {
					boolean allowSubgroups;
					TCComponentGroup group;
					TCComponentRole role;
					TCComponent spf = signoff.getReferenceProperty("origin");
					if (spf != null) {
						allowSubgroups = spf
								.getLogicalProperty("allow_subgroups");
						group = (TCComponentGroup) spf
								.getReferenceProperty("group");
						role = (TCComponentRole) spf
								.getReferenceProperty("role");
					} else {
						allowSubgroups = false;
						TCComponent gm = signoff
								.getReferenceProperty("group_member");
						group = (TCComponentGroup) gm
								.getReferenceProperty("group");
						role = (TCComponentRole) gm
								.getReferenceProperty("role");
					}
					TCComponentGroupMember[] gms;
					if (group == null) {
						gms = gmt.findByUser(user);
					} else if (allowSubgroups) {
						TCComponentGroupMember[] allGMs = gmt.findByUser(user);
						ArrayList<TCComponentGroupMember> gml = new ArrayList<TCComponentGroupMember>(
								allGMs.length);
						for (TCComponentGroupMember gm : allGMs) {
							for (TCComponent g = gm.getGroup(); g != null; g = g
									.getReferenceProperty("parent")) {
								if (g == group) {
									gml.add(gm);
									break;
								}
							}
						}
						gms = gml
								.toArray(new TCComponentGroupMember[gml.size()]);
					} else {
						gms = gmt.find(user, group);
					}
					if (gms == null || gms.length < 1) {
						log.println("Assignee '" + user
								+ "' is not in profile group: "
								+ group.getFullName());
						continue;
					}
					TCComponentGroupMember reassignGM = null;
					if (role == null) {
						reassignGM = gms[0];
					} else {
						for (TCComponentGroupMember gm : gms) {
							if (gm.getRole() == role) {
								reassignGM = gm;
								break;
							}
						}
						if (reassignGM == null) {
							log.println("Assignee '" + user
									+ "' has no profile role: " + role);
							continue;
						}
					}
					signoff.delegate(reassignGM);
					signoff.refresh();
					reassignCount++;
				} else if (signoff.getOriginType() == TCSignoffOriginType.ADHOC_USER) {
					TCComponentGroupMember[] gms = gmt.findByUser(user);
					signoff.delegate(gms[0]);
					signoff.refresh();
					reassignCount++;
				} else {
					log.println("Signoff origin type "
							+ signoff.getOriginType() + " not supported yet!");
				}
			}
			log.println("Reassigned " + reassignCount + " signoff(s).");
			return reassignCount > 0;
		} else {
			task.setReferenceProperty("responsible_party", user);
			return true;
		}
	}

}
