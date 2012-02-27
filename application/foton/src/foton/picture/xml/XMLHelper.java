package foton.picture.xml;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class XMLHelper {
	
	private static final String ENTER = "\n";

	private static final String XML_HEADER = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" + ENTER + "<templates>" + ENTER;

	private static final String TAB = "    ";
	
	private static final String TAG_TEMPLATE_END = "</templates>";

	private static final String TAG_START = "<";

	private static final String TAG_END = ">";

	private static String getElementStartTag(String elementName) {

		if (notEmptyStr(elementName)) {
			return (new StringBuffer()).append(TAG_START).append(elementName)
					.append(TAG_END).toString();
		}
		return null;
	}

	private static String getElementTailTag(String elementName) {

		if (notEmptyStr(elementName)) {
			return (new StringBuffer()).append("</").append(elementName)
					.append(TAG_END).toString();
		}
		return null;
	}

	private static String getElementSTARTTagWithAttributes(String elementName,
			Map<String, String> attributes) {

		if (notEmptyStr(elementName) && attributes != null) {
			StringBuffer buffer = new StringBuffer();
			buffer.append(TAB).append(TAG_START).append(elementName);

			for (String key : attributes.keySet()) {
				String value = attributes.get(key);

				if (value == null) {
					value = "";
				}
				buffer.append(" ").append(key).append("=").append("\"").append(
						value).append("\"");
			}
			return buffer.append(TAG_END).toString() ;
		}
		return null;
	}

	private static String getElementTagWithAttributes(String elementName,
			Map<String, String> attributes) {

		if (notEmptyStr(elementName) && attributes != null) {
			StringBuffer buffer = new StringBuffer();
			buffer.append(TAG_START).append(elementName);

			for (String key : attributes.keySet()) {
				buffer.append(" ").append(key).append("=").append("\"").append(
						attributes.get(key)).append("\"");
			}
			return buffer.append("/").append(TAG_END).toString();
		}
		return null;
	}

	private static String getElementTag(String elementName) {

		if (notEmptyStr(elementName)) {
			return (new StringBuffer()).append(getElementStartTag(elementName))
					.append(getElementTailTag(elementName)).toString();
		}
		return null;
	}

	private static void writeFile(String directoryPath, String fileName,
			String content) throws IOException {

		if (notEmptyStr(directoryPath) && notEmptyStr(fileName)) {

			FileOutputStream fos = null;

			try {
				File directory = new File(directoryPath);

				if (!directory.exists()) {
					directory.mkdirs();
				}
				File file = new File(directoryPath + File.separator + fileName);
				fos = new FileOutputStream(file);
				byte[] contentBytes = content.getBytes("UTF-8");
				fos.write(XML_HEADER.getBytes("UTF-8"));
				fos.write(contentBytes);

			} finally {
				if (fos != null) {
					fos.close();
				}
			}
		}
	}

	private static boolean notEmptyStr(String value) {

		if (value != null && !"".equals(value)) {
			return true;
		}
		return false;
	}
	
	public static void writeListtoXML(String type, List<String> list) throws IOException{
		StringBuffer strBuffer = new StringBuffer();
		for(String value: list){
			Map<String,String> map = new HashMap<String, String>();
			map.put("key", value);
			strBuffer.append(getElementSTARTTagWithAttributes(type, map));
			strBuffer.append(getElementTailTag(type)+ ENTER);
		}
		strBuffer.append(ENTER +TAG_TEMPLATE_END);
		writeFile(DictionaryLoader.TEMPLATE_FILE_PATH , type + DictionaryLoader.TEMPLATE, strBuffer.toString());
	}
	
	public static void writeCountryListtoXML(Map<String, List<String>> dicts) throws IOException{
		StringBuffer strBuffer = new StringBuffer();
		if(dicts.get(DictionaryLoader.COUNTRY) != null){
			for(String country : dicts.get(DictionaryLoader.COUNTRY)){
				Map<String,String> countryMap = new HashMap<String, String>();
				countryMap.put("key", country);
				strBuffer.append(getElementSTARTTagWithAttributes(DictionaryLoader.COUNTRY, countryMap));
				strBuffer.append(ENTER);
				if(dicts.get(country) != null){
					for(String band : dicts.get(country)){
						Map<String,String> bandMap = new HashMap<String, String>();
						bandMap.put("key", band);
						strBuffer.append(TAB);
						strBuffer.append(getElementSTARTTagWithAttributes(DictionaryLoader.BAND, bandMap));
						strBuffer.append(ENTER);
						if(dicts.get(band) != null){
							for(String subband : dicts.get(band)){
								Map<String,String> subbandMap = new HashMap<String, String>();
								subbandMap.put("key", subband);
								strBuffer.append(TAB);
								strBuffer.append(TAB);
								strBuffer.append(getElementSTARTTagWithAttributes(DictionaryLoader.SUBBAND, subbandMap));
								strBuffer.append(getElementTailTag(DictionaryLoader.SUBBAND)+ ENTER);
							}
						}	
						strBuffer.append(TAB);
						strBuffer.append(TAB);
						strBuffer.append(getElementTailTag(DictionaryLoader.BAND)+ ENTER);
					}
				}
				strBuffer.append(TAB);
				strBuffer.append(getElementTailTag(DictionaryLoader.COUNTRY)+ ENTER);
			}
		}
		strBuffer.append(ENTER +TAG_TEMPLATE_END);
		//System.out.println(strBuffer);
		//writeFile(XMLHelper.class.getResource(DictionaryLoader.TEMPLATE_FILE_PATH).getFile().substring(1), DictionaryLoader.COUNTRY + DictionaryLoader.TEMPLATE, strBuffer.toString());
		writeFile(DictionaryLoader.TEMPLATE_FILE_PATH , DictionaryLoader.COUNTRY + DictionaryLoader.TEMPLATE, strBuffer.toString());
		
	}
}
