package com.satrun.data.extraction.main;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.htmlparser.NodeFilter;
import org.htmlparser.Parser;
import org.htmlparser.filters.TagNameFilter;
import org.htmlparser.tags.Div;
import org.htmlparser.tags.Span;
import org.htmlparser.tags.TableColumn;
import org.htmlparser.tags.TableRow;
import org.htmlparser.tags.TableTag;
import org.htmlparser.util.NodeList;
import org.htmlparser.util.ParserException;

import com.satrun.data.extraction.vo.ParamterConfigration;

public class ExtractParameterConfiguration {
	//读取一个车的配置参数页
	public static void getParameterConfigurationByOneCarUrl(String resource) throws Exception {
		int count = 0;
		String title = "";
		Parser titleParser = new Parser(resource);
		titleParser.setEncoding("GBK");
		String titlefilterStr = "div";
		NodeFilter titlefilter = new TagNameFilter(titlefilterStr);
		NodeList nodetitleList = titleParser
				.extractAllNodesThatMatch(titlefilter);
		/*
		 * <div id="xxpeizhi" class="mod"> <div class="hd"><h4>奥迪Q7 2012款
		 * 柴油6.0TDI AT四驱旗舰型 详细参数配置</h4>
		 */
		for (int p = 0; p < nodetitleList.size(); p++) {
			Div div = (Div) nodetitleList.elementAt(p);
			String divid = div.getAttribute("id");
			String divclass = div.getAttribute("class");
			if (divid == null) {
				divid = "";
			}
			if (divclass == null) {
				divclass = "";
			}
			if (divid.equalsIgnoreCase("xxpeizhi")
					&& divclass.equalsIgnoreCase("mod")) {
				Parser divParser = new Parser(div.getChildrenHTML());
				NodeList nodethList = divParser
						.extractAllNodesThatMatch(titlefilter);
				title = nodethList.elementAt(0).getChildren().elementAt(0)
						.getChildren().elementAt(0).getText();
				System.out.println(title);
			}
		}

		Parser myParser = new Parser(resource);
		myParser.setEncoding("GBK");
		String filterStr = "table";
		NodeFilter filter = new TagNameFilter(filterStr);
		NodeList nodeList = myParser.extractAllNodesThatMatch(filter);
		for (int i = 0; i < nodeList.size(); i++) {
			TableTag tabletag = (TableTag) nodeList.elementAt(i);
			// 标签名称
			TableRow[] rows = tabletag.getRows();
			String header = "";
			for (int j = 0; j < rows.length; j++) {
				TableRow tr = (TableRow) rows[j];
				// 获取 <tr class="header"> <th><p>发动机类参数</p></th>
				if (tr.getAttributeEx("class") != null) {
					if (tr.getAttribute("class").equalsIgnoreCase("header")) {
						Parser thParser = new Parser(tr.toHtml());
						String thfilterStr = "th";
						NodeFilter thfilter = new TagNameFilter(thfilterStr);
						NodeList nodethList = thParser
								.extractAllNodesThatMatch(thfilter);
						header = nodethList.elementAt(0).getChildren()
								.elementAt(0).getChildren().elementAt(0)
								.getText();
						System.out.println("==============" + header
								+ "==============");
					}
				}
				/*
				 * <tr> <td class="odd">排气量(L)</td> <td class="dataset">5.9</td>
				 * <td class="odd">气缸排列形式</td> <td class="dataset">V型</td> <td
				 * class="odd">气缸数(个)</td> <td class="dataset">12</td> </tr>
				 */
				TableColumn[] td = tr.getColumns();
				for (int k = 0; k < td.length; k++) {
					if (td[k].getAttribute("class").equalsIgnoreCase("odd")) {
						System.out.print(td[k].toPlainTextString()
								+ "   ");
						count = count + 1;
					} else if (td[k].getAttribute("class").equalsIgnoreCase(
							"dataset")) {
						String value = td[k].toPlainTextString();
						System.out.println(getValueBySymbol(value));
					}
				}
			}
		}
		System.out.println(count);
	}

	private static String getValueBySymbol(String symbol){
		String result = symbol;
		
		if(symbol.contains("●")){
			result = "标配";
		}
		if(symbol.contains("▲")){
			result = "待查";
		}
		if(symbol.contains("○")){
			result = "选装";
		}
		if(symbol.contains("--")){
			result = "无";
		}
		
		return result;
	}

	public static void main(String[] args) throws Exception {
		
		
		
		
		
		
		getParameterConfigurationByManyCars("http://product.auto.163.com/config_compare/0000GZAe,0000fJQB.html");
	
	}
	//读取多个车的配置参数对比页	
	public static void getParameterConfigurationByManyCars(String resource){
		Parser myParser;
		try {
			myParser = new Parser(resource);
		
		myParser.setEncoding("GBK");
		String filterStr = "table";
		NodeFilter titlefilter = new TagNameFilter(filterStr);
		NodeList nodeList = myParser
				.extractAllNodesThatMatch(titlefilter);
		
		Map<Integer, ParamterConfigration> carMap = new HashMap<Integer,ParamterConfigration>();
		int j = 0;
		for (int p = 0; p < nodeList.size(); p++) {
			TableTag table = (TableTag)nodeList.elementAt(p);
			String tableAttClass = table.getAttribute("class");
			if(tableAttClass!= null && tableAttClass.equalsIgnoreCase("main left")){
				Parser myParser_td = new Parser(table.toHtml());
				String filterStr_td = "td";
				NodeList nodeCarTitleList_td = myParser_td.extractAllNodesThatMatch(new TagNameFilter(filterStr_td));
				
				for(int i=0; i<nodeCarTitleList_td.size(); i++){
					TableColumn column = (TableColumn)nodeCarTitleList_td.elementAt(i);
					String td_class = column.getAttribute("class");
					if(td_class.equalsIgnoreCase("name cell f14px")){
						Parser myParser_a = new Parser(column.toHtml());
						NodeList nodeCarTitleList_a = myParser_a.extractAllNodesThatMatch(new TagNameFilter("a"));
						String carTitle = nodeCarTitleList_a.elementAt(0).getChildren().elementAt(0).getText();
						String carType = nodeCarTitleList_a.elementAt(1).getChildren().elementAt(0).getText();
						
						Parser myParser_span = new Parser(column.toHtml());
						NodeList nodeCarTitleList_span = myParser_span.extractAllNodesThatMatch(new TagNameFilter("span"));
						String price = nodeCarTitleList_span.elementAt(0).getChildren().elementAt(0).getText();
						ParamterConfigration car = new ParamterConfigration();
						car.setTitle(carTitle);//获取   奥迪A4L
						car.setCartype(carType);//获取   2010款 1.8 TFSI 舒适型
						car.setPrice(price);//获取   29.10万
						carMap.put(j, car);
						j++;
					}
				}
		/////////////////////////////////////////////////////////////////////////////////////////////////		
				
				TableRow[] rows= table.getRows()	;		
				for(int i=0; i<rows.length; i++){
					TableRow row = rows[i];
					
					if (row.getAttributeEx("class") == null) {
						Parser parser_td = new Parser(row.toHtml());
						String tdfilterStr = "td";
						NodeFilter tdfilter = new TagNameFilter(tdfilterStr);
						NodeList nodetdList = parser_td
								.extractAllNodesThatMatch(tdfilter);
						int u = 0;
						String attributeName = "";
						for(int n=0;n<nodetdList.size(); n++){
							TableColumn tableColumn = (TableColumn) nodetdList.elementAt(n);
							String attributeValue = "";
							
							if(tableColumn.getAttribute("class").equalsIgnoreCase("set cell")){
								Parser parser_span = new Parser(tableColumn.toHtml());
								String spanfilterStr = "span";
								NodeFilter spanfilter = new TagNameFilter(spanfilterStr);
								NodeList nodespanList = parser_span
										.extractAllNodesThatMatch(spanfilter);
								
								for(int t=0;t<nodespanList.size(); t++){
									Span span = (Span)nodespanList.elementAt(t);
									String span_class = span.getAttribute("class");
									String span_key = span.getAttribute("key");
									String value = span.getChildren().elementAt(0).getText().replaceAll("\r", "").replaceAll("\t", "").replaceAll("&nbsp;", "").replaceAll("\n", "");
									value = getValueBySymbol(value);
									if(span_class.equalsIgnoreCase("cell") &&  span_key != null){
										attributeName = value;
									}
									if(span_class.equalsIgnoreCase("cell") &&  span_key == null){
										attributeValue = value;
										carMap.get(u).getCarParamtershtml().put(attributeName, attributeValue);
										u++; 
									}
								}
							}
						}
					}
				}
			}
		}
		
		int size = carMap.size();
		
		for(int tt=0; tt<size; tt++){
			Map<String,String> map = carMap.get(tt).getCarParamtershtml();
			//String title = carMap.get(tt).getTitle();
			System.out.println(carMap.get(tt).getTitle());
			System.out.println(carMap.get(tt).getCartype());
			System.out.println(carMap.get(tt).getPrice());
			DataTransform(map);
			System.out.println();System.out.println();
		}
		
		} catch (ParserException e) {
			e.printStackTrace();
		}
	}
	
	private static Map<String,String> DataTransform(Map<String,String> carhtmlMap){
		Map<String,String> result = new HashMap<String,String>();
		Iterator<String> keys = carhtmlMap.keySet().iterator();
		while(keys.hasNext()){
			String key = keys.next();
			if(ParamterConfigration.paramtersMap.containsKey(key)){
				result.put(ParamterConfigration.paramtersMap.get(key), carhtmlMap.get(key));
				System.out.print(key + "      ");
				System.out.print(ParamterConfigration.paramtersMap.get(key) + "      ");
				System.out.println(carhtmlMap.get(key));
			}
		}
		return result;
	}
}
