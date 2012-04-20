package com.satrun.data.extraction.main;

import java.awt.Image;
import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.NoInitialContextException;

import org.htmlparser.Node;
import org.htmlparser.Parser;
import org.htmlparser.nodes.TagNode;
import org.htmlparser.nodes.TextNode;
import org.htmlparser.tags.Bullet;
import org.htmlparser.tags.BulletList;
import org.htmlparser.tags.Div;
import org.htmlparser.tags.HeadingTag;
import org.htmlparser.tags.ImageTag;
import org.htmlparser.tags.LinkTag;
import org.htmlparser.tags.ParagraphTag;
import org.htmlparser.tags.TableColumn;
import org.htmlparser.tags.TableRow;
import org.htmlparser.tags.TableTag;
import org.htmlparser.tags.TitleTag;
import org.htmlparser.util.NodeList;
import org.htmlparser.util.ParserException;

import sun.security.jca.GetInstance.Instance;
import com.satrun.data.extraction.utils.ExtractUtils;
import com.satrun.data.extraction.utils.ImageUtils;
import com.satrun.data.extraction.utils.ParserUtils;
import com.satrun.data.extraction.utils.StringUtils;
import com.satrun.data.extraction.vo.Brand;
import com.satrun.data.extraction.vo.CarType;
import com.satrun.data.extraction.vo.SubCarType;

public class ExtractAutoInfoFrom163 {

	private static String DOMAIN = "http://product.auto.163.com";
	private static String WEBADDRESS = "http://product.auto.163.com/brand/";
	
	private static String dbUrl = "jdbc:mysql://192.168.7.8:3306/autocar";
	private static String username = "root";
	private static String password = "root";
	
	
	public static void main(String[] args) {
		Connection conn = null;
		Statement statement = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbUrl, username, password);
			statement = conn.createStatement();
			
			
			//��ȡһ��ҳ��Դ����
			String htmlCode = ExtractUtils.extractHtmlByUrl(WEBADDRESS).toString();
			
			if (htmlCode != null) {
//				��ȡ��ҳ����
				String htmlTitle = ParserUtils.getHtmlTitle(htmlCode);
				
//				����һ��ҳ��
//				��ȡƷ�ơ����ӡ�ͼƬ
				ArrayList<Brand> brandList = getBrandInfo(htmlCode);
				
				
//				�������ҳ��
//				��ȡ��Ʒ�Ƶ�ȫ����ϵ[��ϵ�����ӡ�ͼƬ���ӡ����̡��������ͣ����ڳ��̡����ʳ��̡��������̣����Ƿ�ͣ��]
				ArrayList<CarType> cartypeList = new ArrayList<CarType>();
				for (Brand brand : brandList) {
					if("��ͨ".equals(brand.getBrand())) {  //����ʱֻȡ�µ�
						String htmlCode2 = ExtractUtils.extractHtmlByUrl(DOMAIN + brand.getUrl()).toString();
						cartypeList = getCarTypeInfo(cartypeList, 
								htmlCode2, brand);
						break;
					}
				}
				
//				��������ҳ��
//				��ȡ����ϵ��ȫ������[��������ȡ����]
				
				ArrayList<SubCarType> subCarTypeList = new ArrayList<SubCarType>();
				for(CarType car : cartypeList) {

					String sql = "insert into brand_info" + 
								"(brand_id, brand, brand_logo, cartype_id, cartype, cartype_logo, company, company_type, isstop)" + 
								" values(" +
								"'"+ car.getBrandId() + "', '" + car.getBrand()+ "', '" + car.getBrandLogo() + "', " + 
								"'" + car.getCarTypeId() + "', '" + car.getCarType() + "', '" + car.getCarTypeLogo() + "', " + 
								"'" + car.getCompany() + "', '" + car.getCompanyType() + "', '" + car.getIsStop() + "'" + 
								")";
			System.out.println("SQL = " + sql);
					statement.executeUpdate(sql);
					
					String carType = car.getCarType();
//					if ("A4L".equals(carType)) {  //����ʱֻȡA4
						String htmlCode3 = ExtractUtils.extractHtmlByUrl(DOMAIN + car.getUrl()).toString();
						getSubCarType(subCarTypeList, htmlCode3, car);
//					}
					
				}
				

				
				for(SubCarType car : subCarTypeList) {

					String sql = "insert into temp(brand_id, brand, cartype_id, cartype, displacement_url)" + 
								" values(" + 
								"'" + car.getBrandId() + "', '" + car.getBrand() + "', " + 
								"'" + car.getCarTypeId() + "', '" + car.getCarType() + "', " + 
								"'" + car.getUrl() + "'" + 
								")";
			System.out.println("SQL2: = " + sql);
					statement.executeUpdate(sql);
							
				}
				
				statement.executeUpdate("COMMIT");

				
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} finally {
			try {
				conn.close();
				statement.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}

		
	}
	
	public static ArrayList<SubCarType> getSubCarType(ArrayList<SubCarType> subCarTypeList,
			String htmlCode, CarType carTypeInfo) {
System.out.println("��ϵ = " + carTypeInfo.getCarType());
//		��ǰ��ʾ�ģ�Ĭ��Ϊ�ڲ�����(���������ϵ��ͣ���ˣ����ڴ�DIV�У�������DIV��panel)
		ArrayList<TagNode> tagNodes1 = ParserUtils.
			getNodeListByTagAndClass(htmlCode, "div", "panel current");
		String divHtml1 = ParserUtils.addBodyTag(tagNodes1.get(0).toHtml());
		
		NodeList nodelist1 = ParserUtils.getNodeListByTagFilter(divHtml1, "table");
		TableTag tableTag1 = (TableTag)nodelist1.elementAt(0);
		TableRow[] rows1 = tableTag1.getRows();
		for(int i=1; i<rows1.length; i++) {
			TableRow tr = (TableRow)rows1[i];
			if ("pailiang".equals(tr.getAttribute("class"))) {
				TableColumn[] td = tr.getColumns();
				TableColumn fifthTD = td[4];
				String tdhtml = ParserUtils.addBodyTag(fifthTD.toHtml().replaceAll("\t", ""));
				NodeList nodes = ParserUtils.getNodeListByTagFilter(tdhtml, "a");
				String link = "";
				if (nodes.elementAt(0) instanceof LinkTag) {
					LinkTag href = (LinkTag)nodes.elementAt(0);
					link = href.getLink();
				}
				SubCarType subcar = new SubCarType();
				subcar.setBrandId(carTypeInfo.getBrandId());
				subcar.setBrand(carTypeInfo.getBrand());
				subcar.setCarTypeId(carTypeInfo.getCarTypeId());
				subcar.setCarType(carTypeInfo.getCarType());
				subcar.setUrl(link);
				subCarTypeList.add(subcar);
			}
			
		}
		
		
//		���������������ʾ�����ڲ�����Ҳ��ͣ�۳���
		ArrayList<TagNode> tagNodes2 = ParserUtils.
			getNodeListByTagAndClass(htmlCode, "div", "panel");
		if (tagNodes2.size() > 0) {
			String divHtml2 = ParserUtils.addBodyTag(tagNodes2.get(0).toHtml());
			
			NodeList nodelist2 = ParserUtils.getNodeListByTagFilter(divHtml2, "table");
			TableTag tableTag2 = (TableTag)nodelist2.elementAt(0);
			TableRow[] rows2 = tableTag2.getRows();
			
			for(int i=1; i<rows2.length; i++) {
				TableRow tr = (TableRow)rows2[i];
				if ("pailiang".equals(tr.getAttribute("class"))) {
					TableColumn[] td = tr.getColumns();
					TableColumn fifthTD = td[4];
					String tdhtml = ParserUtils.addBodyTag(fifthTD.toHtml().replaceAll("\t", ""));
					NodeList nodes = ParserUtils.getNodeListByTagFilter(tdhtml, "a");
					String link = "";
					if (nodes.elementAt(0) instanceof LinkTag) {
						LinkTag href = (LinkTag)nodes.elementAt(0);
						link = href.getLink();
					}
					SubCarType subcar = new SubCarType();
					subcar.setBrandId(carTypeInfo.getBrandId());
					subcar.setBrand(carTypeInfo.getBrand());
					subcar.setCarTypeId(carTypeInfo.getCarTypeId());
					subcar.setCarType(carTypeInfo.getCarType());
					subcar.setUrl(link);
					subCarTypeList.add(subcar);
				}
			}
			
		}
		
		return subCarTypeList;
	}

	
	public static ArrayList<CarType> getCarTypeInfo(ArrayList<CarType> carTypeList,
			String htmlCode, Brand brand) {
		
		String brand_id = Long.toString(System.currentTimeMillis());
		
		NodeList nodelist = ParserUtils.getNodeListByTagFilter(htmlCode, "div");
		
		if (nodelist.size() > 0) {
//			��ȡͬһƷ�ƵĲ�ͬ����
			int count = 0; //����ѭ��group
			
			for (int i = 0; i < nodelist.size(); i++) {
				if (nodelist.elementAt(i) instanceof Div) {
					Div div = (Div)nodelist.elementAt(i);
//					��ϵ��Ϣ����ʽ��Ϊgroup group1��group group2...��DIV��
					if (div.getAttribute("class") != null && 
							div.getAttribute("class").startsWith("group group")) {
						
						count++;
						
						String groupHtml = ParserUtils.addBodyTag(div.toHtml());
						
						ArrayList<TagNode> tagNodes = ParserUtils.
							getNodeListByTagAndClass(groupHtml, "div", "ghd");

						TagNode tagNode = tagNodes.get(0);
						String tagNodeHtml = ParserUtils.addBodyTag(tagNode.toHtml());
						HeadingTag H5 = (HeadingTag)ParserUtils.getNodeListByTagFilter(tagNodeHtml, "h5").toNodeArray()[0];
						String company = H5.getStringText(); //����
						ParagraphTag p = (ParagraphTag)ParserUtils.getNodeListByTagFilter(tagNodeHtml, "p").toNodeArray()[0];
						String companyType = p.getStringText(); //��������
						
//						ѭ����ȡÿ�����̵ĳ�ϵ
						ArrayList<TagNode> groupNode = ParserUtils.getNodeListByTagAndClass(htmlCode, "div", "group group"+count);
						String groupNodeTtml = ParserUtils.addBodyTag(groupNode.get(0).toHtml());
						
						
//						ͣ����ϵ--class="autocard disabled"
						ArrayList<TagNode> stopCarTypeDiv = ParserUtils.getNodeListByTagAndClass(groupNodeTtml, "div", "autocard disabled");
						for (TagNode node : stopCarTypeDiv) {
							String nodehtml = ParserUtils.addBodyTag(node.toHtml());
							CarType car = new CarType();
							
							car.setBrandId(brand_id); //Ʒ��ID
							car.setBrand(brand.getBrand()); //Ʒ��
							car.setBrandLogo(brand.getImageUrl()); //Ʒ��LOGO
							
							car.setCompany(company);//����
							car.setCompanyType(companyType);//��������
							
							car.setIsStop("ͣ��"); //�Ƿ�ͣ��

							ArrayList<TagNode> firstDiv = ParserUtils.getNodeListByTagAndClass(nodehtml, "div", "cardhd");
							TagNode firstTag = firstDiv.get(0);
							NodeList carTypeHref = ParserUtils.getNodeListByTagFilter(
									ParserUtils.addBodyTag(firstTag.toHtml()), "a");
							LinkTag href = (LinkTag)carTypeHref.elementAt(0);
							
							car.setCarTypeId(Long.toString(System.currentTimeMillis()));  //��ϵID
							car.setCarType(href.getLinkText()); //��ϵ
							car.setUrl(href.getLink()); //��ϵ����
							
							NodeList imgNode = ParserUtils.getNodeListByTagFilter(nodehtml, "img");
							ImageTag imgTag = (ImageTag)imgNode.elementAt(0);
							
							String localPath = "D:\\car\\logo\\" + brand.getBrand() + "\\" + href.getLinkText() + ".png";
							ImageUtils.downloadImageToLocal(
									imgTag.getImageURL(), 
									localPath);
							
							car.setCarTypeLogo("/car/logo/" + brand.getBrand() + "/" + href.getLinkText() + ".png"); //ͼƬ����
							
							carTypeList.add(car);
						}
		
//						�ڲ���ϵ--class="autocard "
						ArrayList<TagNode> onlineCarTypeDiv = ParserUtils.getNodeListByTagAndClass(groupNodeTtml, "div", "autocard ");
						for (TagNode node : onlineCarTypeDiv) {
							String nodehtml = ParserUtils.addBodyTag(node.toHtml());
							CarType car = new CarType();
							
							car.setBrandId(brand_id); //Ʒ��ID
							car.setBrand(brand.getBrand()); //Ʒ��
							car.setBrandLogo(brand.getImageUrl()); //Ʒ��LOGO
							
							car.setCompany(company);//����
							car.setCompanyType(companyType);//��������
							
							car.setIsStop("�ڲ�"); //�Ƿ�ͣ��

							ArrayList<TagNode> firstDiv = ParserUtils.getNodeListByTagAndClass(nodehtml, "div", "cardhd");
							TagNode firstTag = firstDiv.get(0);
							NodeList carTypeHref = ParserUtils.getNodeListByTagFilter(
									ParserUtils.addBodyTag(firstTag.toHtml()), "a");
							LinkTag href = (LinkTag)carTypeHref.elementAt(0);
							
							car.setCarTypeId(Long.toString(System.currentTimeMillis()));  //��ϵID
							car.setCarType(href.getLinkText()); //��ϵ
							car.setUrl(href.getLink()); //��ϵ����

							NodeList imgNode = ParserUtils.getNodeListByTagFilter(nodehtml, "img");
							ImageTag imgTag = (ImageTag)imgNode.elementAt(0);
							
							String localPath = "D:\\car\\logo\\" + brand.getBrand() + "\\" + href.getLinkText() + ".png";
							ImageUtils.downloadImageToLocal(
									imgTag.getImageURL(), 
									localPath);
							
							car.setCarTypeLogo("/car/logo/" + brand.getBrand() + "/" + href.getLinkText() + ".png"); //ͼƬ����
							
							carTypeList.add(car);
						}
						
					}
				}
			}
		}
		
		return carTypeList;
	}
	
	public static ArrayList<Brand> getBrandInfo(String htmlCode) {
		ArrayList<Brand> brandList = new ArrayList<Brand>();
		NodeList nodelist = ParserUtils.getNodeListByTagFilter(htmlCode.toString(), "a");
		for (int i = 0; i < nodelist.size(); i++) {
			if (nodelist.elementAt(i) instanceof LinkTag) {
				LinkTag link = (LinkTag)nodelist.elementAt(i);
				
				if (link.getAttribute("title") != null && 
						link.getAttribute("title").startsWith("����") &&
						link.getAttribute("title").endsWith("Ƶ��")) {
					
					String title = link.getAttribute("title");
					String url = link.getLink();
					String childHtml = ParserUtils.addBodyTag(link.getChildrenHTML());
					
					HeadingTag H5 = (HeadingTag)ParserUtils.getNodeListByTagFilter(childHtml, "h5").toNodeArray()[0];
					String brand = H5.getStringText();
					
					ImageTag img = (ImageTag)ParserUtils.getNodeListByTagFilter(childHtml, "img").toNodeArray()[0];
					String imageUrl = img.getImageURL();
					/*String localPath = "D:\\car\\logo\\" + brand + "\\logo.png";
					ImageUtils.downloadImageToLocal(imageUrl, localPath);*/
					
					Brand brandinfo = new Brand();
					brandinfo.setBrand(brand);
					brandinfo.setImageUrl("/car/logo/"+ brand + "/logo.png");
					brandinfo.setUrl(url);
					brandList.add(brandinfo);
				}
				
			}
			
		}
		return brandList;
	}
}
