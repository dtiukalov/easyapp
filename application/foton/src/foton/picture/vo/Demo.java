package foton.picture.vo;

import java.io.IOException;
import java.io.StringReader;
import java.io.StringWriter;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class Demo {

	/**
	 * @param args
	 */
/*	public static void main(String[] args) {
		// 创建文档解析器工厂
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		DocumentBuilder db = null;
		Document d = null;
		try {
			// 创建一个新的文档解析器
			db = dbf.newDocumentBuilder();
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		}
		try {
			// 读取指定路径下的xml文件，并生成一个xml文档
			d = db.parse("c:/server.xml");
		} catch (SAXException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		// 获得跟节点对象
		Element root = d.getDocumentElement();
		// 获得指定的节点对象
		NodeList dl = root.getElementsByTagName("学生");
		// 遍历节点对象
		for (int i = 0; i < dl.getLength(); i++) {
			if (dl.item(i).getAttributes().getNamedItem("性别").equals("女"))
				d.getDocumentElement().removeChild(dl.item(i));
			System.out.println(dl.item(i).getAttributes().getNamedItem("性别"));
		}

		// 将xml写入文件
		// 创建一个TransformerFactory对象
		TransformerFactory transfactory = TransformerFactory.newInstance();
		Transformer transformer = null;
		try {
			// 创建一个新的Transformer对象(转换器)
			transformer = transfactory.newTransformer();
		} catch (TransformerConfigurationException e) {
			e.printStackTrace();
		}
		// 转换的源
		DOMSource source = new DOMSource(d);
		// 设置xml文件的输出方式
		transformer.setOutputProperty("encoding", "gb2312");
		// 转换的对象
		StreamResult result = new StreamResult("c:/server.xml");
		try {
			// 将源中的数据转换成目标对象
			transformer.transform(source, result);
		} catch (TransformerException e) {
			e.printStackTrace();
		}

	}*/
	
	public static String prettyFormat(String input, int indent) {
	    try {
	        Source xmlInput = new StreamSource(new StringReader(input));
	        StringWriter stringWriter = new StringWriter();
	        StreamResult xmlOutput = new StreamResult(stringWriter);
	        Transformer transformer = TransformerFactory.newInstance().newTransformer(); 
	        transformer.setOutputProperty(OutputKeys.INDENT, "yes");
	        transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", String.valueOf(indent));
	        transformer.transform(xmlInput, xmlOutput);
	        return xmlOutput.getWriter().toString();
	    } catch (Exception e) {
	        throw new RuntimeException(e); // simple exception handling, please review it
	    }
	}

	public static String prettyFormat(String input) {
	    return prettyFormat(input, 8);
	}
	
	public static void main(String[] args) {
		System.out.println(prettyFormat("<root><child>aaa</child><child>child><child/><child/></root>"));
	}
}
