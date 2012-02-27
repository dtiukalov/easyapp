package foton.picture.vo;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

public class LOVProperty {

	private Map<String, List<String>> lovMap = new HashMap<String, List<String>>();

	public static final String path = "/foton/picture/property/";

	public static final String country = "country.property";

	private static LOVProperty instance;

	static {
		instance = new LOVProperty();
	}

	public static LOVProperty getInstance() {
		return instance;
	}

	public static void main(String[] args) {
		new LOVProperty().initLOV();
	}

	public Map<String, List<String>> initLOV() {
		Properties p = new Properties();
		try {
			p.load(LOVProperty.class.getResourceAsStream(path + country));
			// p.load(new FileInputStream("country.property"));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		List<String> countrylist = new ArrayList<String>();
		p.propertyNames().nextElement().toString();
		Set<Object> set = p.keySet();
		for (Object s : set) {
			String strKey = s.toString();
			String strValue = p.getProperty(strKey);
			countrylist.add(strKey);
			try {
				lovMap.put(strKey, initList(LOVProperty.class
						.getResourceAsStream(path + strValue), "band"));
			} catch (IOException e) {
				continue;
			}
		}

		lovMap.put("country", countrylist);

		Set<String> setest = lovMap.keySet();
		for (String s : setest) {
			System.out.println(s + "," + lovMap.get(s));
		}
		
		return lovMap;
	}

	private List<String> initList(InputStream input, String type)
			throws IOException {
		List<String> templist = new ArrayList<String>();
		Properties p = new Properties();
		p.load(input);
		Set<Object> set = p.keySet();

		for (Object s : set) {
			String strKey = s.toString();
			String strValue = p.getProperty(strKey);
			templist.add(strKey);

			if ("band".equalsIgnoreCase(type)) {
				try {
					lovMap.put(strKey, initList(LOVProperty.class
							.getResourceAsStream(path + strValue), "subband"));
				} catch (IOException e) {
					continue;
				}
			}
		}
		return templist;
	}

}
