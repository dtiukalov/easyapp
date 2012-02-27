package foton.picture.xml;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DictionaryManager {

	private Map<String, List<String>> dicts = new HashMap<String, List<String>>();

	private static DictionaryManager instance;

	static {
		instance = new DictionaryManager();
	}

	public static DictionaryManager getInstance() {
		return instance;
	}

	public Map<String, List<String>> getDicts() {
		return dicts;
	}

	public List<String> getDict(String key) {
		if (key != null && !"".equals(key)) {
			if (dicts.keySet().contains(key.trim())) {
				return dicts.get(key.trim());
			}
		}
		return null;
	}

	private String addDict(String key, String value) {
		if (dicts.get(key) == null) {
			return "there is no " + key + " in dicts ";
		}
		if (!isValueExit(key, value)) {
			if (DictionaryLoader.ANGLE.equalsIgnoreCase(key)
					|| DictionaryLoader.YEAR.equalsIgnoreCase(key)
					|| DictionaryLoader.INTEROUTER.equalsIgnoreCase(key)
					|| DictionaryLoader.OUTER.equalsIgnoreCase(key)
					|| DictionaryLoader.INTER.equalsIgnoreCase(key)
					|| DictionaryLoader.CARTYPE.equalsIgnoreCase(key)) {
				dicts.get(key).add(value);
				return "true";
			} else if (DictionaryLoader.COUNTRY.equalsIgnoreCase(key)) {
				dicts.get(key).add(value);
				dicts.put(value, new ArrayList<String>());
				return "true";
			} else {
				if(dicts.get(DictionaryLoader.COUNTRY).contains(key)){
					dicts.get(key).add(value);
					dicts.put(value, new ArrayList<String>());
				} else {
					dicts.get(key).add(value);
				}
				return "true";
			}
		} else {
			return value + "　already exits in " + key;
		}
	}

	private String delDict(String key, String value) {
		if (dicts.get(key) == null) {
			return "there is no " + key + " in dicts ";
		}
		if (isValueExit(key, value)) {
			dicts.get(key).remove(value);
			return "true";
		} else {
			return "there is no  " + value + " in " + key;
		}
	}

	private String updateDict(String key, String old, String newValue) {
		
		if(old.trim().equals("") || old == null){
			return "old value error ! ";
		}
		
		if(newValue.trim().equals("") || newValue == null){
			return "update value error ! ";
		}
		
		if(key.trim().equals("") || key == null){
			return "key error!";
		}			
		
		if (dicts.get(key) == null) {
			return "there is no " + key + " in dicts ";
		}
		try {
			if (dicts.get(key).contains(newValue)) {
				return newValue + "　already exits in " + key;
			}
			if (DictionaryLoader.ANGLE.equalsIgnoreCase(key)
					|| DictionaryLoader.YEAR.equalsIgnoreCase(key)
					|| DictionaryLoader.INTEROUTER.equalsIgnoreCase(key)
					|| DictionaryLoader.OUTER.equalsIgnoreCase(key)
					|| DictionaryLoader.INTER.equalsIgnoreCase(key)
					|| DictionaryLoader.CARTYPE.equalsIgnoreCase(key)) {
				dicts.get(key).set(dicts.get(key).indexOf(old), newValue);
				return "true";
			} else {
				if (dicts.get(old) != null) {
					List<String> templist = dicts.get(old);
					dicts.get(key).set(dicts.get(key).indexOf(old), newValue);
					//dicts.remove(old);
					dicts.put(newValue, templist);
					return "true";
				}
				dicts.get(key).set(dicts.get(key).indexOf(old), newValue);
				return "true";
			}
		} catch (RuntimeException e) {
			return e.getMessage().toString();
		}
	}

	public List<String> getCarTypeList() {
		return dicts.get(DictionaryLoader.CARTYPE);
	}

	public List<String> getInterOuterList() {
		return dicts.get(DictionaryLoader.INTEROUTER);
	}

	public List<String> getInterList() {
		return dicts.get(DictionaryLoader.INTER);
	}

	public List<String> getOuterList() {
		return dicts.get(DictionaryLoader.OUTER);
	}

	public List<String> getYearList() {
		return dicts.get(DictionaryLoader.YEAR);
	}

	public List<String> getAngleList() {
		return dicts.get(DictionaryLoader.ANGLE);
	}

	public List<String> getCountryList() {
		return dicts.get(DictionaryLoader.COUNTRY);
	}

	/**
	 * 判断type列表中是否已存在数据字典object值
	 * 
	 * type = country/cartype/angle/inter/outer/interouter/year/國家值/品牌值
	 * object為列表值
	 */
	public Boolean isValueExit(String type, String value) {
		if (value != null && !"".equals(value) && dicts.get(type) != null) {
			if (dicts.get(type).contains(value.trim())) {
				return true;
			}
		}
		return false;
	}

	public void setDicts(Map<String, List<String>> dicts) {
		this.dicts = dicts;
	}

	public String toXML(String type, List<String> list) {
		try {
			if (DictionaryLoader.ANGLE.equalsIgnoreCase(type)
					|| DictionaryLoader.YEAR.equalsIgnoreCase(type)
					|| DictionaryLoader.INTEROUTER.equalsIgnoreCase(type)
					|| DictionaryLoader.OUTER.equalsIgnoreCase(type)
					|| DictionaryLoader.INTER.equalsIgnoreCase(type)
					|| DictionaryLoader.CARTYPE.equalsIgnoreCase(type)) {
				XMLHelper.writeListtoXML(type, list);
			} else {
				XMLHelper.writeCountryListtoXML(dicts);
			}

			return "true";
		} catch (Exception e) {
			return e.getMessage().toString();
		}
	}

	public String addValue(String key, String value) {
		
		if(value.trim().equals("") || value == null){
			return "please set value !";
		}
		
		if(key.trim().equals("") || key == null){
			return "key error!";
		}	
		
		if(dicts.get(key) == null){
			return "there is no  " + key + " in  dicts";
		}
		
		String info = addDict(key, value);

		if ("true".equalsIgnoreCase(info)) {
			String toXMLinfo = toXML(key, dicts.get(key));
			if ("true".equalsIgnoreCase(toXMLinfo)) {
				return "true";
			} else {
				delDict(key, value);
				return toXMLinfo;
			}
		}

		return info;
	}

	public String delValue(String key, String value) {
		if(value.trim().equals("") || value == null){
			return "please set value !";
		}
		
		if(key.trim().equals("") || key == null){
			return "key error!";
		}	
		
		if(dicts.get(key) == null){
			return "there is no  " + key + " in  dicts";
		}
		
		if (DictionaryLoader.ANGLE.equalsIgnoreCase(key)
				|| DictionaryLoader.YEAR.equalsIgnoreCase(key)
				|| DictionaryLoader.INTEROUTER.equalsIgnoreCase(key)
				|| DictionaryLoader.OUTER.equalsIgnoreCase(key)
				|| DictionaryLoader.INTER.equalsIgnoreCase(key)
				|| DictionaryLoader.CARTYPE.equalsIgnoreCase(key)) {
			// delDict(key, value);
			String info = delDict(key, value);
			if ("true".equalsIgnoreCase(info)) {
				String toXMLinfo = toXML(key, dicts.get(key));
				if ("true".equalsIgnoreCase(toXMLinfo)) {
					return "true";
				} else {
					addDict(key, value);
					return toXMLinfo;
				}
			}
			return info;
		} else {
			String info = delDict(key, value);

			if ("true".equalsIgnoreCase(info)) {
				String toXMLinfo = toXML(key, dicts.get(key));
				if ("true".equalsIgnoreCase(toXMLinfo)) {
					/*
					 * if (dicts.get(value) != null) { for(String tempkey :
					 * dicts.get(value)){ dicts.remove(tempkey); if
					 * (dicts.get(tempkey) != null) { for(String inerkey :
					 * dicts.get(tempkey)){ dicts.remove(inerkey); } } } }
					 */
					return "true";
				} else {
					addDict(key, value);
					return toXMLinfo;
				}
			}
			return info;
		}

		/*
		 * if (delDict(key, value)) { if (toXML(key, dicts.get(key))) { return
		 * true; } else { addDict(key, value); return false; } }
		 */
		// return false;
	}

	public String updateValue(String key, String old, String newValue) {
		String info = updateDict(key, old, newValue);
		if ("true".equalsIgnoreCase(info)) {
			String toXMLinfo = toXML(key, dicts.get(key));
			if ("true".equalsIgnoreCase(toXMLinfo)) {
				return "true";
			} else {
				updateDict(key, newValue, old);
				return toXMLinfo;
			}
		}
		return info;
	}

	public static void main(String[] args) {
		DictionaryLoader.loadDictsFromXML();
		// DictionaryManager.getInstance().toXML(DictionaryLoader.COUNTRY,
		// null);
		List<String> list = DictionaryManager.getInstance().getDict(
				DictionaryLoader.INTEROUTER);
		for (String str : list) {
			System.out.println(str);
		}
		DictionaryManager.getInstance().delValue(DictionaryLoader.INTEROUTER,
				"内饰");
	}

}
