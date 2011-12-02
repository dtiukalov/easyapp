package com.saturn.workflow.runtime.condition;

import java.util.List;

import com.saturn.auth.User;
import com.saturn.workflow.NodeCondition;

public interface IConditionUser {
	
	List<User> getConditionUsers(String instanceId, NodeCondition condition);
}
