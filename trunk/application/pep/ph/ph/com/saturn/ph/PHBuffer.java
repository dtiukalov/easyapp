package com.saturn.ph;

import java.util.HashMap;
import java.util.Map;

public class PHBuffer {

	public static final String PH_BUFFER = "PH_BUFFER";

	private final Map<String, Map<String, Object>> buffer = new HashMap<String, Map<String, Object>>();

	public Map<String, Object> getFormBuffer(String uid) {
		if (buffer.containsKey(uid)) {
			return buffer.get(uid);
		}

		return null;
	}

	public void addBuffer(String formUid, Map<String, Object> value) {
		if (!buffer.containsKey(formUid)) {
			buffer.put(formUid, value);
		}
	}
}
