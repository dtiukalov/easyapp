package com.saturn.tc.utils;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.Arrays;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.commons.lang.StringUtils;
import org.w3c.dom.DOMException;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;


public class XMLUtils {

	public static String[] getXmlValue() {
		
		try {
			long lasting = System.currentTimeMillis(); 
   
			File file = new File(getCurrentPath() + "relations.xml");    
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();    
			DocumentBuilder builder = factory.newDocumentBuilder();    
			Document doc = builder.parse(file);    
			NodeList nl = doc.getElementsByTagName("RELATION");    
			String[] relations = new String[nl.getLength()];
			for (int i = 0; i < nl.getLength(); i++) {    
				String en_US = doc.getElementsByTagName("en_US").item(i).getFirstChild().getNodeValue(); 
				String zh_CN = doc.getElementsByTagName("zh_CN").item(i).getFirstChild().getNodeValue();  
				relations[i] = en_US;
			}    
			
			return relations;
		} catch (DOMException e) {
			e.printStackTrace();
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		} catch (SAXException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return new String[]{};
	}
	
	public static String getCurrentPath() {
		String className = XMLUtils.class.getName(); 
		String classNamePath = className.replace(".", "/") + ".class";
		URL is = XMLUtils.class.getClassLoader().getResource(classNamePath);
		String path = is.getFile();
		path = StringUtils.replace(path, "%20", " ");
		path = StringUtils.removeStart(path, "/");
		int n = path.lastIndexOf("/");
		return path.substring(0, n+1);
		
	}
}
