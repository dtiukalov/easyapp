package com.customer.fawvw.issues.commands.shift;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import com.customer.fawvw.issues.exception.FawvmLoaderException;
import com.customer.fawvw.issues.utils.ComponentUtils;
import com.customer.fawvw.issues.utils.DateUtil;
import com.customer.fawvw.issues.utils.StringUtil;
import com.teamcenter.rac.aif.kernel.InterfaceAIFComponent;
import com.teamcenter.rac.kernel.TCComponent;
import com.teamcenter.rac.kernel.TCComponentItem;
import com.teamcenter.rac.kernel.TCComponentItemRevision;
import com.teamcenter.rac.kernel.TCSession;
import com.teamcenter.rac.util.MessageBox;

public class IssueShiftReportLoader {
	private IssueShiftReportLoader() {
	}

	public static Map<String, Object> load(HashMap<String, Object> parameters)throws Exception {
		System.out.println("开始获取数据"); //$NON-NLS-1$
		
		List<Map<String, Object>> planIssues = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> actualIssues = new ArrayList<Map<String, Object>>();
		Map<String, Object> values = new HashMap<String, Object>();

		try {
			TCSession session = (TCSession) parameters.get("session"); //$NON-NLS-1$
			String currentPrj = (String)parameters.get("project_id"); //$NON-NLS-1$
			
			//查询出FV9Component类型的零件
			TCComponent[] FV9Components = ComponentUtils.
				findTCComponentItemByType(session, "FV9Component"); //$NON-NLS-1$
			
			System.out.println("获取零件及批次信息"); //$NON-NLS-1$
			
			//符合条件的零件列表
			List<TCComponentItem> tcComponentList = new ArrayList<TCComponentItem>(); 
			//零件批次列表
			LinkedList<InterfaceAIFComponent> FV9VSCPartSerials = new LinkedList<InterfaceAIFComponent>();
			
			//FV9Component这个类型的零组件存在
			if (FV9Components.length > 0) {
				//输入的零件号
				String carNumber = (String)parameters.get("carNumber"); //$NON-NLS-1$

				for(int i=0; i<FV9Components.length; i++) {
					//零件的所属项目
					String fv9ProjectId = (String)((TCComponentItem)FV9Components[i])
											.getLatestItemRevision().getProperty("project_ids"); //$NON-NLS-1$
					
					//零件的零件号
					String fv9PartNo = (String)((TCComponentItem)FV9Components[i])
											.getLatestItemRevision().getProperty("fv9PartNo"); //$NON-NLS-1$
					
					//零件的所属项目包含当前项目
					if (StringUtil.containsNo(fv9ProjectId, currentPrj)) {
						//零件的零件号不为空
						if (!"".equals(fv9PartNo)) { //$NON-NLS-1$
							//零件的零件号与输入的零件号相同
							if (carNumber.equals(fv9PartNo) || fv9PartNo == carNumber) {
								
								tcComponentList.add((TCComponentItem)FV9Components[i]);
								
								System.out.println("获取" + ((TCComponentItem)FV9Components[i])
										.getLatestItemRevision() + "的信息");
							}
							
						}
					}
					
					
				}
				
			} else {
				MessageBox.post("不存在零件",  //$NON-NLS-1$
						"提示", MessageBox.INFORMATION); //$NON-NLS-1$
				return null;
			}
			
			if (tcComponentList.size() > 0) {
				
				// 通过BOM关系在(1)找到的FV9Component 类对象下查找FV9VSCPartSerial类对象
				for (int j=0; j<tcComponentList.size(); j++) {
					TCComponent fv9Component = tcComponentList.get(j);
					
					LinkedList<InterfaceAIFComponent> FV9VSCPartSerialsTemp = ComponentUtils
						.getChildComponents((TCComponentItem)fv9Component, "FV9VSCPartSerial");  //$NON-NLS-1$
					
					if (FV9VSCPartSerialsTemp.size() > 0) {
						String log = "零件" + tcComponentList.get(j).getLatestItemRevision() + "的批次为：\r\n";
						for (int k=0; k<FV9VSCPartSerialsTemp.size(); k++) {
							
							FV9VSCPartSerials.add(FV9VSCPartSerialsTemp.get(k));
							log += ((TCComponentItem)FV9VSCPartSerialsTemp.get(k)).getLatestItemRevision() + "\r\n"; //$NON-NLS-1$
							
						}
						System.out.println(log);
						
					} else {
						System.out.println("零件" + tcComponentList.get(j).getLatestItemRevision() + "不存在批次");
					}
				}
				
				//符合条件的批次详细信息
				List<Map<String, Object>> list = new ArrayList<Map<String, Object>>(); 
				
				if (FV9VSCPartSerials.size() > 0) {
					for (InterfaceAIFComponent FV9VSCPartSerial : FV9VSCPartSerials) {
						// 通过BOM关系在(2)找到的FV9VSCPartSerial类对象下所有的FV9VSCPartSerial类对象；
						InterfaceAIFComponent FV9VSCPartSerialRevision = ComponentUtils
								.getChildComponent(FV9VSCPartSerial,
										"FV9VSCPartSerialRevision", null, null); //$NON-NLS-1$
						LinkedList<InterfaceAIFComponent> component = ComponentUtils
								.getChildComponents(FV9VSCPartSerialRevision,
										"FV9VSCPartSerial"); //$NON-NLS-1$
						String log = FV9VSCPartSerialRevision + "的具体批次为：\r\n";  //$NON-NLS-1$
						// 读取(3)对象版本属性“批次号”、“预测改进时间”和“实际改进时间”
						for (InterfaceAIFComponent c : component) {
							TCComponentItemRevision itemRevision = ((TCComponentItem) c)
									.getLatestItemRevision();
							Map<String, Object> map = new HashMap<String, Object>();
							map.put("fv9RoundNo", itemRevision //$NON-NLS-1$
									.getProperty("fv9RoundNo")); // 批次号 //$NON-NLS-1$
							map.put("fv9PlImTime", itemRevision //$NON-NLS-1$
									.getProperty("fv9PlImTime")); // 预测改进时间 //$NON-NLS-1$
							map.put("fv9ReImTime", itemRevision //$NON-NLS-1$
									.getProperty("fv9ReImTime")); // 实际改进时间 //$NON-NLS-1$
							list.add(map);
							log += itemRevision + ": \r\n"  //$NON-NLS-1$
								 + "批次号 : " + itemRevision	.getProperty("fv9RoundNo") + "\r\n"  //$NON-NLS-1$//$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-1$ //$NON-NLS-1$
								 + "预测改进时间 :" + itemRevision.getProperty("fv9PlImTime") + "\r\n"   //$NON-NLS-1$//$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-1$ //$NON-NLS-1$
								 + "实际改进时间 :" + itemRevision.getProperty("fv9ReImTime") + "\r\n"; //$NON-NLS-2$ //$NON-NLS-1$ //$NON-NLS-1$
						}
						System.out.println(log);
					}
				}
				
				
				// 根据“控件A”输入的零件号找到FV9Issue类的所有对象；
				TCComponent[] tccomponents = ComponentUtils
						.findTCComponentItemByType(session, "FV9Issue"); //$NON-NLS-1$
				
				String log = "根据零件号获取问题信息" + "\r\n"; //$NON-NLS-1$
				
				if (tccomponents.length > 0) {
					for (TCComponent tccomponent : tccomponents) {
						TCComponentItemRevision itemRevision = ((TCComponentItem) tccomponent)
								.getLatestItemRevision();
						// 读取(5)所找到的对象如下属性
						//问题的所属项目包含当前项目
						//获取项目ID
						TCComponent[] projects = ComponentUtils.getItemRevisionProjectIds(
								itemRevision, "fv9ProjectLov"); //$NON-NLS-1$
						String[] projectIds = ComponentUtils.getProjectInfos(projects, "project_id"); //$NON-NLS-1$
						String projectInfos = StringUtil.ArrayToString(projectIds);
	System.out.println("projectInfos = " + projectInfos);					 //$NON-NLS-1$
	
						if (StringUtil.containsNo(projectInfos, currentPrj)) {
							
							//问题的涉及零件号包含输入的零件号
							if (StringUtil.containsNo(itemRevision.getProperty("fv9PartNumber"),  //$NON-NLS-1$
									(String) parameters.get("carNumber")))	{ //$NON-NLS-1$
								log += itemRevision + "\r\n"; //$NON-NLS-1$
								
								//计划sheet
								Map<String, Object> planMap = new HashMap<String, Object>();
								
								planMap.put("item_id", itemRevision //$NON-NLS-1$
										.getProperty("item_id"));// 问题单号 //$NON-NLS-1$
								planMap.put("fv9IssueDesc", itemRevision //$NON-NLS-1$
										.getProperty("fv9IssueDesc"));// 问题描述 //$NON-NLS-1$
								//措施
								planMap.put("fv9SolutionBS", itemRevision.getProperty("fv9SolutionBS"));
								planMap.put("fv9SolutionCA", itemRevision.getProperty("fv9SolutionCA"));
								planMap.put("fv9SolutionLO", itemRevision.getProperty("fv9SolutionLO"));
								planMap.put("fv9SolutionPA", itemRevision.getProperty("fv9SolutionPA"));
								planMap.put("fv9SolutionPL", itemRevision.getProperty("fv9SolutionPL"));
								planMap.put("fv9SolutionQAPP", itemRevision.getProperty("fv9SolutionQAPP"));
								planMap.put("fv9SolutionSU", itemRevision.getProperty("fv9SolutionSU"));
								planMap.put("fv9SolutionVSC", itemRevision.getProperty("fv9SolutionVSC"));
								planMap.put("fv9SolutionTE", itemRevision.getProperty("fv9SolutionTE"));
								
//								planMap.put("fv9SlResDepBS", itemRevision.getProperty("fv9SlResDepBS"));
//								planMap.put("fv9SlResDepCA", itemRevision.getProperty("fv9SlResDepCA"));
//								planMap.put("fv9SlResDepLO", itemRevision.getProperty("fv9SlResDepLO"));
//								planMap.put("fv9SlResDepPA", itemRevision.getProperty("fv9SlResDepPA"));
//								planMap.put("fv9SlResDepPL", itemRevision.getProperty("fv9SlResDepPL"));
//								planMap.put("fv9SlResDepQAPP", itemRevision.getProperty("fv9SlResDepQAPP"));
//								planMap.put("fv9SlResDepSU", itemRevision.getProperty("fv9SlResDepSU"));
//								planMap.put("fv9SlResDepVSC", itemRevision.getProperty("fv9SlResDepVSC"));

								planMap.put("fv9RGStatus", itemRevision //$NON-NLS-1$
										.getProperty("fv9RGStatus"));// 红绿灯状态 //$NON-NLS-1$
								planMap.put("carNumber", (String) parameters //$NON-NLS-1$
										.get("carNumber")); // 零件号 //$NON-NLS-1$
								
								// TODO:预测改进时间
								if (!"".equals(itemRevision.getProperty("fv9SolDeadlineDate")) && //$NON-NLS-1$ //$NON-NLS-2$
										list.size() > 0) { //$NON-NLS-1$ //$NON-NLS-1$
									//解决期限不为空  按需求逻辑比较
									HashMap roundNo = getRoundNo(
											itemRevision.getProperty("fv9SolDeadlineDate"), //$NON-NLS-1$
											list, "fv9PlImTime"); //$NON-NLS-1$
									planMap.put("fv9RoundNo", roundNo.get("fv9RoundNo")); //$NON-NLS-1$ //$NON-NLS-2$
									planMap.put("fv9PlImTime", roundNo.get("fv9PlImTime")); //$NON-NLS-1$ //$NON-NLS-2$
									
								} else {
									//解决期限为空，显示尚未确定
									planMap.put("fv9RoundNo", "尚未确定批次"); //$NON-NLS-1$  //$NON-NLS-2$
									planMap.put("fv9PlImTime", "尚未确定改进时间"); //$NON-NLS-1$  //$NON-NLS-2$
									
								}
								
								// 提出时间 
								if (!"".equals(itemRevision.getProperty("fv9ProposedDate"))) { //$NON-NLS-1$ //$NON-NLS-2$
									planMap.put("fv9ProposedDate",  //$NON-NLS-1$
											DateUtil.transformTime(itemRevision.getProperty("fv9ProposedDate"), "MM.dd"));// 提出时间 //$NON-NLS-1$ //$NON-NLS-2$
								} else {
									planMap.put("fv9ProposedDate",  "");//$NON-NLS-1$ //$NON-NLS-2$
								}
								
								// 解决期限 
								if (!"".equals(itemRevision.getProperty("fv9SolDeadlineDate"))) { //$NON-NLS-1$ //$NON-NLS-2$
									planMap.put("fv9SolDeadlineDate", DateUtil.getWeekOfYear(itemRevision  //$NON-NLS-1$
											.getProperty("fv9SolDeadlineDate")));//$NON-NLS-1$
								} else {
									planMap.put("fv9SolDeadlineDate", "");//$NON-NLS-1$ //$NON-NLS-2$
								}
								
								// 责任部门 
								planMap.put("fv9SlResDep1", itemRevision //$NON-NLS-1$
										.getProperty("fv9SlResDep1")); //$NON-NLS-1$
								planMap.put("itemRevision", itemRevision); //$NON-NLS-1$
								planIssues.add(planMap);

								
								//实际sheet
								Map<String, Object> actualMap = new HashMap<String, Object>();
								actualMap.put("item_id", itemRevision //$NON-NLS-1$
										.getProperty("item_id"));// 问题单号 //$NON-NLS-1$
								actualMap.put("fv9IssueDesc", itemRevision //$NON-NLS-1$
										.getProperty("fv9IssueDesc"));// 问题描述 //$NON-NLS-1$
								
								actualMap.put("fv9SolutionBS", itemRevision.getProperty("fv9SolutionBS"));
								actualMap.put("fv9SolutionCA", itemRevision.getProperty("fv9SolutionCA"));
								actualMap.put("fv9SolutionLO", itemRevision.getProperty("fv9SolutionLO"));
								actualMap.put("fv9SolutionPA", itemRevision.getProperty("fv9SolutionPA"));
								actualMap.put("fv9SolutionPL", itemRevision.getProperty("fv9SolutionPL"));
								actualMap.put("fv9SolutionQAPP", itemRevision.getProperty("fv9SolutionQAPP"));
								actualMap.put("fv9SolutionSU", itemRevision.getProperty("fv9SolutionSU"));
								actualMap.put("fv9SolutionVSC", itemRevision.getProperty("fv9SolutionVSC"));
								
								actualMap.put("fv9SlResDepBS", itemRevision.getProperty("fv9SlResDepBS"));
								actualMap.put("fv9SlResDepCA", itemRevision.getProperty("fv9SlResDepCA"));
								actualMap.put("fv9SlResDepLO", itemRevision.getProperty("fv9SlResDepLO"));
								actualMap.put("fv9SlResDepPA", itemRevision.getProperty("fv9SlResDepPA"));
								actualMap.put("fv9SlResDepPL", itemRevision.getProperty("fv9SlResDepPL"));
								actualMap.put("fv9SlResDepQAPP", itemRevision.getProperty("fv9SlResDepQAPP"));
								actualMap.put("fv9SlResDepSU", itemRevision.getProperty("fv9SlResDepSU"));
								actualMap.put("fv9SlResDepVSC", itemRevision.getProperty("fv9SlResDepVSC"));
								
								actualMap.put("fv9RGStatus", itemRevision //$NON-NLS-1$
										.getProperty("fv9RGStatus"));// 红绿灯状态 //$NON-NLS-1$
								actualMap.put("carNumber", (String) parameters //$NON-NLS-1$
										.get("carNumber")); // 零件号 //$NON-NLS-1$
								
								// TODO:实际改进时间
								//解决期限不为空  按需求比较
								if (!"".equals(itemRevision.getProperty("fv9SolDeadlineDate")) && //$NON-NLS-1$ //$NON-NLS-2$
										list.size() > 0) { //$NON-NLS-1$ //$NON-NLS-1$
									HashMap roundNo2 = getRoundNo(
											itemRevision.getProperty("fv9SolDeadlineDate"), //$NON-NLS-1$
											list, "fv9ReImTime"); //$NON-NLS-1$
									actualMap.put("fv9RoundNo", roundNo2.get("fv9RoundNo")); //$NON-NLS-1$ //$NON-NLS-2$
									actualMap.put("fv9ReImTime", roundNo2.get("fv9ReImTime")); //$NON-NLS-1$ //$NON-NLS-2$
									
								} else {
									//解决期限为空，显示尚未确定
									actualMap.put("fv9RoundNo", "尚未确定批次"); //$NON-NLS-1$  //$NON-NLS-2$
									actualMap.put("fv9ReImTime", "尚未确定改进时间"); //$NON-NLS-1$  //$NON-NLS-2$
									
								}
								
								// 实际完成日期
								if (!"".equals(itemRevision.getProperty("fv9CompletedDate"))) { //$NON-NLS-1$ //$NON-NLS-2$
									actualMap.put("fv9CompletedDate",  //$NON-NLS-1$
											DateUtil.transformTime(itemRevision.getProperty("fv9CompletedDate"), "MM.dd"));  //$NON-NLS-1$ //$NON-NLS-2$
								} else {
									actualMap.put("fv9CompletedDate", "");  //$NON-NLS-1$ //$NON-NLS-2$
								}
								
								// 提出时间
								if (!"".equals(itemRevision.getProperty("fv9ProposedDate"))) { //$NON-NLS-1$ //$NON-NLS-2$
									actualMap.put("fv9ProposedDate",  //$NON-NLS-1$
											DateUtil.transformTime(itemRevision.getProperty("fv9ProposedDate"), "MM.dd"));  //$NON-NLS-1$ //$NON-NLS-2$
								} else {
									actualMap.put("fv9ProposedDate", "");  //$NON-NLS-1$ //$NON-NLS-2$
								}
								
								// 解决期限
								if (!"".equals(itemRevision.getProperty("fv9SolDeadlineDate"))) { //$NON-NLS-1$ //$NON-NLS-2$
									actualMap.put("fv9SolDeadlineDate", DateUtil.getWeekOfYear(itemRevision //$NON-NLS-1$
											.getProperty("fv9SolDeadlineDate"))); //$NON-NLS-1$
								} else {
									actualMap.put("fv9SolDeadlineDate", ""); //$NON-NLS-1$ //$NON-NLS-2$
								}
								
								// 责任部门
								actualMap.put("fv9SlResDep1", itemRevision  //$NON-NLS-1$
										.getProperty("fv9SlResDep1"));   //$NON-NLS-1$
								actualMap.put("itemRevision", itemRevision); //$NON-NLS-1$
								actualIssues.add(actualMap);
							}
						}
						
					}
				}
				
				
				System.out.println(log);
				
			} 
			values.put("planIssues", planIssues); //$NON-NLS-1$
			values.put("actualIssues", actualIssues); //$NON-NLS-1$
			values.put("ProjectName", (String)parameters.get("project_name"));// TODO:项目名称 //$NON-NLS-1$ //$NON-NLS-2$
			values.put("CreatTime", new DateUtil().getSysDate());// TODO:制表日期 //$NON-NLS-1$ //$NON-NLS-2$
			
		} catch (Exception e) {
			
			throw new FawvmLoaderException(e.getMessage());
		} 
		return values;
	}

	private static HashMap getRoundNo(
			String fv9SolDeadlineDate, List<Map<String, Object>> list, String action) {
		HashMap map = new HashMap();
		
		if (list.size() > 0) {
			//存在批次信息的情况下
			if (list.size() == 1) {
				//只有一个批次
				map.put("fv9RoundNo", list.get(0).get("fv9RoundNo")); //$NON-NLS-1$ //$NON-NLS-2$
				map.put(action, list.get(0).get(action)); //$NON-NLS-1$ //$NON-NLS-2$

			} else {
				//多个批次
				String getTime = ""; //$NON-NLS-1$
				String actualTime = ""; //$NON-NLS-1$
				int m = 0;
				for (int i = 0; i < list.size()-1; i++) {
					getTime = CompareDate(list.get(i).get(action) //$NON-NLS-1$
							.toString(), list.get(i + 1).get(action) //$NON-NLS-1$
							.toString(), fv9SolDeadlineDate);
					if (!"".equals(getTime)) { //$NON-NLS-1$
						m = i + 1;
						break;
					} 
					
				}
				if (!"".equals(getTime)) { //$NON-NLS-1$
					//解决期限位于两个批次的预测改进时间之间
					map.put("fv9RoundNo", list.get(m).get("fv9RoundNo")); //$NON-NLS-1$ //$NON-NLS-2$
					map.put(action, DateUtil.transformTime((String)list.get(m).get(action), "YYYY.MM.dd")); //$NON-NLS-1$ //$NON-NLS-2$
				} else {
					if (compareTime(fv9SolDeadlineDate, (String)list.get(0).get(action))) {
						//解决期限小于最早批次的预测改进时间
						map.put("fv9RoundNo", list.get(0).get("fv9RoundNo"));  //$NON-NLS-1$ //$NON-NLS-2$
						map.put(action, DateUtil.transformTime((String)list.get(0).get(action), "YYYY.MM.dd"));  //$NON-NLS-1$
					} else if (!compareTime(fv9SolDeadlineDate, (String)list.get(list.size()-1).get(action))) {
						//解决期限大于最后批次的预测改进时间
						map.put("fv9RoundNo", "尚未确定批次");  //$NON-NLS-1$ //$NON-NLS-2$
						map.put(action, "尚未确定改进时间");  //$NON-NLS-1$
					} else {
						map.put("fv9RoundNo", "尚未确定批次");  //$NON-NLS-1$  //$NON-NLS-2$
						map.put(action, "尚未确定改进时间");   //$NON-NLS-1$
					}
				}
				return map;

			}
		}
		
		return map;
	}

	/*
	 * 判断 compareData是否在date1和date2之间，是返回true，否返回false
	 */
	private static String CompareDate(String date1, String date2,
			String compareDate) {
		Date startDate = new Date();
		Date endDate = new Date();
		Date selectedDate = new Date();
		String result = ""; //$NON-NLS-1$
		try {
			if (!"".equals(date1)) { //$NON-NLS-1$
				startDate = new SimpleDateFormat("yyyy-MM-dd HH:mm") //$NON-NLS-1$
				.parse(date1);
			}
			if (!"".equals(date2)) { //$NON-NLS-1$
				endDate = new SimpleDateFormat("yyyy-MM-dd HH:mm") //$NON-NLS-1$
				.parse(date2);
			}
			if (!"".equals(compareDate)) { //$NON-NLS-1$
				selectedDate = new SimpleDateFormat("yyyy-MM-dd HH:mm") //$NON-NLS-1$
				.parse(compareDate);
			}
			
			if (((startDate.getTime() - endDate.getTime())/3600/24/1000 < 0) && 
					((selectedDate.getTime() - startDate.getTime())/3600/24/1000  > 0) &&
							  ((selectedDate.getTime() - endDate.getTime())/3600/24/1000 <= 0) ) {
				result = date2;
			}

		} catch (ParseException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//date1 < date2 返回 true
	private static boolean compareTime(String date1, String date2) {
		Date startDate = new Date();
		Date endDate = new Date();
		try {
			if (!"".equals(date1)) { //$NON-NLS-1$
				startDate = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(date1); //$NON-NLS-1$
			}
			if (!"".equals(date2)) { //$NON-NLS-1$
				endDate = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(date2); //$NON-NLS-1$
			}
			
			if ((startDate.getTime() - endDate.getTime())/3600/24/1000 <= 0) {
				return true;
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	

}
