package foton.picture.util;

import java.util.HashMap;
import java.util.Map;

/**
 * 
 * @author emily
 * 
 */
public class PropertiesService implements IPropertiesService {

	private static PropertiesService instance;

	static {
		instance = new PropertiesService();
	}

	private Map<String, Object> properties = new HashMap<String, Object>();

	private PropertiesService() {
	}

	public static PropertiesService getInstance() {
		return instance;
	}

	public Object getPropertyObject(String name) {
		return this.properties.get(name);
	}

	public void setPropertyObject(String name, Object value) {
		this.properties.put(name, value);
	}
}
