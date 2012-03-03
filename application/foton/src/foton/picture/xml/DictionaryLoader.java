package foton.picture.xml;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.Element;

import foton.picture.util.Dom4jUtils;
import foton.picture.util.IConstants;
import foton.picture.util.PropertiesService;

public class DictionaryLoader {
	public static final String TEMPLATE_FILE_PATH = PropertiesService.getInstance().getPropertyObject(
			IConstants.DICTS_XML_PATH) + "/";

	public static final String TEMPLATE = ".xml";

	public static final String COUNTRY = "country"; //$NON-NLS-1$

	public static final String BAND = "band"; //$NON-NLS-1$

	public static final String SUBBAND = "subband"; //$NON-NLS-1$

	public static final String CARTYPE = "cartype"; //$NON-NLS-1$

	public static final String INTEROUTER = "interouter"; //$NON-NLS-1$

	public static final String INTER = "inter"; //$NON-NLS-1$

	public static final String OUTER = "outer"; //$NON-NLS-1$

	public static final String YEAR = "year"; //$NON-NLS-1$

	public static final String ANGLEINTER = "angleinter"; //$NON-NLS-1$
	
	public static final String ANGLEOUTER = "angleouter"; //$NON-NLS-1$

	public static final String KEY = "key"; //$NON-NLS-1$

	private static Map<String, List<String>> lovMap = new HashMap<String, List<String>>();

	public static void loadDictsFromXML() {
		load(CARTYPE);
		load(INTEROUTER);
		load(INTER);
		load(OUTER);
		load(YEAR);
		load(ANGLEINTER);
		load(ANGLEOUTER);
		load(COUNTRY);
	}

	private static void load(String type) {
		if (COUNTRY.equals(type)) {
			DictionaryManager.getInstance().getDicts().putAll(
					getDict(TEMPLATE_FILE_PATH + type + TEMPLATE));
		} else {
			DictionaryManager.getInstance().getDicts().put(type,
					getDict(TEMPLATE_FILE_PATH + type + TEMPLATE, type));
		}
	}

	private static List<String> getDict(String path, String type) {
		InputStream in = null;
		try {
			in = new FileInputStream(path); // DictionaryLoader.class.getResourceAsStream(path);
			return initList(in, type);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (in != null) {
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	private static List<String> initList(InputStream in, String type)
			throws Exception {
		List<String> lovlist = new ArrayList<String>();

		Document document = Dom4jUtils.getDocment(in);

		if (document != null) {
			Element root = document.getRootElement();
			List<Element> lovs = (List<Element>) root.elements(type);

			for (Element lov : lovs) {
				String key = lov.attributeValue(KEY);
				lovlist.add(key.trim());
			}
		}
		return lovlist;
	}

	@SuppressWarnings("unused")
	private static Map<String, List<String>> getDict(String path) {
		InputStream in = null;
		try {
			in = new FileInputStream(path); //DictionaryLoader.class.getResourceAsStream(path);
			return initCountry(in);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (in != null) {
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

		return null;
	}

	@SuppressWarnings("unchecked")
	private static Map<String, List<String>> initCountry(InputStream in)
			throws Exception {
		List<String> countrylist = new ArrayList<String>();

		Document document = Dom4jUtils.getDocment(in);

		if (document != null) {
			Element root = document.getRootElement();
		//	Element template = root.element(LOV);

			List<Element> countrys = (List<Element>) root.elements(COUNTRY);

			for (Element country : countrys) {
				String key = country.attributeValue(KEY);
				countrylist.add(key.trim());
				try {
					lovMap.put(key.trim(), initBand(country, BAND));
				} catch (IOException e) {
					e.printStackTrace();
					continue;
				}
			}

			lovMap.put(COUNTRY, countrylist);

		}
		return lovMap;
	}

	@SuppressWarnings("unchecked")
	private static List<String> initBand(Element element, String type)
			throws IOException {
		List<String> templist = new ArrayList<String>();
		List<Element> bands = (List<Element>) element.elements(type);

		for (Element band : bands) {
			String key = band.attributeValue(KEY);
			templist.add(key.trim());

			if (BAND.equalsIgnoreCase(type)) {
				try {
					lovMap.put(key.trim(), initBand(band, SUBBAND));
				} catch (IOException e) {
					e.printStackTrace();
					continue;
				}
			}
		}
		return templist;
	}

/*	public static void main(String[] args) {
		DictionaryLoader.loadDictsFromXML();		
	}
	
	public static void printALL(List<String> list){
		for(String str : list){
			System.out.println(str);
		}
	}
	
	public static void printCountry(List<String> list){
		for(String country : list){
			System.out.println(country);
			List<String> bands = DictionaryManager.getInstance().getDict(country);
			for(String band : bands){
				System.out.println("    " + band);
				List<String> subbands = DictionaryManager.getInstance().getDict(band);
				for(String subband : subbands){
					System.out.println("    	" + subband);
				}
			}
		}
	}*/
	
}
