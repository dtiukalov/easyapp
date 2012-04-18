package com.saturn.warning;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.saturn.warning.date.farmer.FarmerForage;
import com.saturn.warning.date.farmer.FarmerPig;
import com.saturn.warning.date.farmer.FarmerSpend;

public class WebUtils {
	
	public static String getFarmerPig(FarmerPig pig) {
		if (pig == null) {
			return "";
		}
		
		String num = pig.getNum();
		if (num != null && !"".equals(num.trim())) {
			return pig.toString();
		}
		
		return "";
	}
	
	public static String print(HttpServletRequest request) {
		StringBuffer print = new StringBuffer("");
		Map addPigs = (Map)request.getSession().getAttribute(FarmerPig.SESSION_ADD);
		if(addPigs != null) {
			FarmerPig p1 = (FarmerPig)addPigs.get("仔猪");
			FarmerPig p2 = (FarmerPig)addPigs.get("育肥猪");
			FarmerPig p3 = (FarmerPig)addPigs.get("能繁母猪");
			FarmerPig p4 = (FarmerPig)addPigs.get("后备母猪");
			
			if (p1 != null) {
				String num = p1.getNum()!=null?p1.getNum().trim():"";
				String price = p1.getPrice()!=null?p1.getPrice().trim():"";
				String total = p1.getTotal()!=null?p1.getTotal().trim():"";
				if(!"".equals(num)){
					print.append("新增仔猪：").append(num+"头");
					if(!"".equals(price)){
						print.append("，单价"+price+"元/斤");
					}
					if(!"".equals(total)){
						print.append("，本次购买共花费"+total+"元");
					}
					print.append("；</br>");
				}
			}
			if (p2 != null) {
				String num = p2.getNum()!=null?p2.getNum().trim():"";
				String price = p2.getPrice()!=null?p2.getPrice().trim():"";
				String total = p2.getTotal()!=null?p2.getTotal().trim():"";
				if(!"".equals(num)){
					print.append("新增育肥猪：").append(num+"头");
					if(!"".equals(price)){
						print.append("，单价"+price+"元/斤");
					}
					if(!"".equals(total)){
						print.append("，本次购买共花费"+total+"元");
					}
					print.append("；</br>");
				}
			}
			if (p3 != null) {
				String num = p3.getNum()!=null?p3.getNum().trim():"";
				String price = p3.getPrice()!=null?p3.getPrice().trim():"";
				String total = p3.getTotal()!=null?p3.getTotal().trim():"";
				if(!"".equals(num)){
					print.append("新增能繁母猪：").append(num+"头");
					if(!"".equals(price)){
						print.append("，单价"+price+"元/斤");
					}
					if(!"".equals(total)){
						print.append("，本次购买共花费"+total+"元");
					}
					print.append("；</br>");
				}
			}
			if (p4 != null) {
				String num = p4.getNum()!=null?p4.getNum().trim():"";
				String price = p4.getPrice()!=null?p4.getPrice().trim():"";
				String total = p4.getTotal()!=null?p4.getTotal().trim():"";
				if(!"".equals(num)){
					print.append("新增后备母猪：").append(num+"头");
					if(!"".equals(price)){
						print.append("，单价"+price+"元/斤");
					}
					if(!"".equals(total)){
						print.append("，本次购买共花费"+total+"元");
					}
					print.append("；</br>");
				}
			}
		}
		
		Map salePigs = (Map)request.getSession().getAttribute(FarmerPig.SESSION_SALE);
		if(salePigs != null) {
			FarmerPig p1 = (FarmerPig)salePigs.get("仔猪");
			FarmerPig p2 = (FarmerPig)salePigs.get("育肥猪");
			FarmerPig p3 = (FarmerPig)salePigs.get("能繁母猪");
			FarmerPig p4 = (FarmerPig)salePigs.get("后备母猪");
			
			if (p1 != null) {
				String num = p1.getNum()!=null?p1.getNum().trim():"";
				String price = p1.getPrice()!=null?p1.getPrice().trim():"";
				String total = p1.getTotal()!=null?p1.getTotal().trim():"";
				if(!"".equals(num)){
					print.append("卖出仔猪：").append(num+"头");
					if(!"".equals(price)){
						print.append("，单价"+price+"元/斤");
					}
					if(!"".equals(total)){
						print.append("，本次卖出共收入"+total+"元");
					}
					print.append("；</br>");
				}
			}
			if (p2 != null) {
				String num = p2.getNum()!=null?p2.getNum().trim():"";
				String price = p2.getPrice()!=null?p2.getPrice().trim():"";
				String total = p2.getTotal()!=null?p2.getTotal().trim():"";
				if(!"".equals(num)){
					print.append("卖出育肥猪：").append(num+"头");
					if(!"".equals(price)){
						print.append("，单价"+price+"元/斤");
					}
					if(!"".equals(total)){
						print.append("，本次卖出共收入"+total+"元");
					}
					print.append("；</br>");
				}
			}
			if (p3 != null) {
				String num = p3.getNum()!=null?p3.getNum().trim():"";
				String price = p3.getPrice()!=null?p3.getPrice().trim():"";
				String total = p3.getTotal()!=null?p3.getTotal().trim():"";
				if(!"".equals(num)){
					print.append("卖出能繁母猪：").append(num+"头");
					if(!"".equals(price)){
						print.append("，单价"+price+"元/斤");
					}
					if(!"".equals(total)){
						print.append("，本次卖出共收入"+total+"元");
					}
					print.append("；</br>");
				}
			}
			if (p4 != null) {
				String num = p4.getNum()!=null?p4.getNum().trim():"";
				String price = p4.getPrice()!=null?p4.getPrice().trim():"";
				String total = p4.getTotal()!=null?p4.getTotal().trim():"";
				if(!"".equals(num)){
					print.append("卖出后备母猪：").append(num+"头");
					if(!"".equals(price)){
						print.append("，单价"+price+"元/斤");
					}
					if(!"".equals(total)){
						print.append("，本次卖出共收入"+total+"元");
					}
					print.append("；</br>");
				}
			}
		}
		
		Map deadPigs = (Map)request.getSession().getAttribute(FarmerPig.SESSION_DEAD);
		if(deadPigs != null) {
			FarmerPig p1 = (FarmerPig)deadPigs.get("仔猪");
			FarmerPig p2 = (FarmerPig)deadPigs.get("育肥猪");
			FarmerPig p3 = (FarmerPig)deadPigs.get("能繁母猪");
			FarmerPig p4 = (FarmerPig)deadPigs.get("后备母猪");
			
			if (p1 != null) {
				String num = p1.getNum()!=null?p1.getNum().trim():"";
				String price = p1.getPrice()!=null?p1.getPrice().trim():"";
				String total = p1.getTotal()!=null?p1.getTotal().trim():"";
				if(!"".equals(num)){
					print.append("死亡仔猪：").append(num+"头");
					print.append("；</br>");
				}
			}
			if (p2 != null) {
				String num = p2.getNum()!=null?p2.getNum().trim():"";
				String price = p2.getPrice()!=null?p2.getPrice().trim():"";
				String total = p2.getTotal()!=null?p2.getTotal().trim():"";
				if(!"".equals(num)){
					print.append("死亡育肥猪：").append(num+"头");
					print.append("；</br>");
				}
			}
			if (p3 != null) {
				String num = p3.getNum()!=null?p3.getNum().trim():"";
				String price = p3.getPrice()!=null?p3.getPrice().trim():"";
				String total = p3.getTotal()!=null?p3.getTotal().trim():"";
				if(!"".equals(num)){
					print.append("死亡能繁母猪：").append(num+"头");
					print.append("；</br>");
				}
			}
			if (p4 != null) {
				String num = p4.getNum()!=null?p4.getNum().trim():"";
				String price = p4.getPrice()!=null?p4.getPrice().trim():"";
				String total = p4.getTotal()!=null?p4.getTotal().trim():"";
				if(!"".equals(num)){
					print.append("死亡后备母猪：").append(num+"头");
					print.append("；</br>");
				}
			}
		}
		
		Map washOutPigs = (Map)request.getSession().getAttribute(FarmerPig.SESSION_WASHOUT);
		if(washOutPigs != null) {
			FarmerPig p1 = (FarmerPig)washOutPigs.get("能繁母猪");
			FarmerPig p2 = (FarmerPig)washOutPigs.get("后备母猪");
			
			if (p1 != null) {
				String num = p1.getNum()!=null?p1.getNum().trim():"";
				String price = p1.getPrice()!=null?p1.getPrice().trim():"";
				String total = p1.getTotal()!=null?p1.getTotal().trim():"";
				if(!"".equals(num)){
					print.append("淘汰能繁母猪：").append(num+"头");
					if(!"".equals(price)){
						print.append("，单价"+price+"元/斤");
					}
					if(!"".equals(total)){
						print.append("，本次卖出共收入"+total+"元");
					}
					print.append("；</br>");
				}
			}
			if (p2 != null) {
				String num = p2.getNum()!=null?p2.getNum().trim():"";
				String price = p2.getPrice()!=null?p2.getPrice().trim():"";
				String total = p2.getTotal()!=null?p2.getTotal().trim():"";
				if(!"".equals(num)){
					print.append("淘汰后备母猪：").append(num+"头");
					if(!"".equals(price)){
						print.append("，单价"+price+"元/斤");
					}
					if(!"".equals(total)){
						print.append("，本次卖出共收入"+total+"元");
					}
					print.append("；</br>");
				}
			}
		}
		Map checkPigs = (Map)request.getSession().getAttribute(FarmerPig.SESSION_CHECK);
		if(checkPigs != null) {
			FarmerPig p1 = (FarmerPig)checkPigs.get("出省境仔猪");
			FarmerPig p2 = (FarmerPig)checkPigs.get("出省境育肥猪");
			FarmerPig p3 = (FarmerPig)checkPigs.get("省内仔猪");
			FarmerPig p4 = (FarmerPig)checkPigs.get("省内育肥猪");
			FarmerPig p5 = (FarmerPig)checkPigs.get("屠宰育肥猪");
			
			if (p1 != null) {
				String num = p1.getNum()!=null?p1.getNum().trim():"";
				String price = p1.getPrice()!=null?p1.getPrice().trim():"";
				String total = p1.getTotal()!=null?p1.getTotal().trim():"";
				if(!"".equals(num)){
					print.append("检疫出省境仔猪：").append(num+"头");
					if(!"".equals(price)){
						print.append("，单价"+price+"元/斤");
					}
					if(!"".equals(total)){
						print.append("，本次卖出共收入"+total+"元");
					}
					print.append("；</br>");
				}
			}
			if (p2 != null) {
				String num = p2.getNum()!=null?p2.getNum().trim():"";
				String price = p2.getPrice()!=null?p2.getPrice().trim():"";
				String total = p2.getTotal()!=null?p2.getTotal().trim():"";
				if(!"".equals(num)){
					print.append("检疫出省境育肥猪：").append(num+"头");
					if(!"".equals(price)){
						print.append("，单价"+price+"元/斤");
					}
					if(!"".equals(total)){
						print.append("，本次卖出共收入"+total+"元");
					}
					print.append("；</br>");
				}
			}
			if (p3 != null) {
				String num = p3.getNum()!=null?p3.getNum().trim():"";
				String price = p3.getPrice()!=null?p3.getPrice().trim():"";
				String total = p3.getTotal()!=null?p3.getTotal().trim():"";
				if(!"".equals(num)){
					print.append("检疫省内仔猪：").append(num+"头");
					if(!"".equals(price)){
						print.append("，单价"+price+"元/斤");
					}
					if(!"".equals(total)){
						print.append("，本次卖出共收入"+total+"元");
					}
					print.append("；</br>");
				}
			}
			if (p4 != null) {
				String num = p4.getNum()!=null?p4.getNum().trim():"";
				String price = p4.getPrice()!=null?p4.getPrice().trim():"";
				String total = p4.getTotal()!=null?p4.getTotal().trim():"";
				if(!"".equals(num)){
					print.append("检疫省内育肥猪：").append(num+"头");
					if(!"".equals(price)){
						print.append("，单价"+price+"元/斤");
					}
					if(!"".equals(total)){
						print.append("，本次卖出共收入"+total+"元");
					}
					print.append("；</br>");
				}
			}
			if (p5 != null) {
				String num = p5.getNum()!=null?p5.getNum().trim():"";
				String price = p5.getPrice()!=null?p5.getPrice().trim():"";
				String total = p5.getTotal()!=null?p5.getTotal().trim():"";
				if(!"".equals(num)){
					print.append("检疫屠宰育肥猪：").append(num+"头");
					if(!"".equals(price)){
						print.append("，单价"+price+"元/斤");
					}
					if(!"".equals(total)){
						print.append("，本次卖出共收入"+total+"元");
					}
					print.append("；</br>");
				}
			}
		}
		Map pricePigs = (Map)request.getSession().getAttribute(FarmerPig.SESSION_PRICE);
		if(pricePigs != null) {
			FarmerPig p2 = (FarmerPig)pricePigs.get("育肥猪");
			FarmerPig p3 = (FarmerPig)pricePigs.get("能繁母猪");
			if (p2 != null) {
				String num = p2.getNum()!=null?p2.getNum().trim():"";
				String price = p2.getPrice()!=null?p2.getPrice().trim():"";
				String total = p2.getTotal()!=null?p2.getTotal().trim():"";
				if(!"".equals(num)){
					print.append("市场价格育肥猪：").append(num+"头");
					if(!"".equals(price)){
						print.append("，单价"+price+"元/斤");
					}
					if(!"".equals(total)){
						print.append("，本次卖出共收入"+total+"元");
					}
					print.append("；</br>");
				}
			}
			
			if (p3 != null) {
				String num = p3.getNum()!=null?p3.getNum().trim():"";
				String price = p3.getPrice()!=null?p3.getPrice().trim():"";
				String total = p3.getTotal()!=null?p3.getTotal().trim():"";
				if(!"".equals(num)){
					print.append("企业价格育肥猪：").append(num+"头");
					if(!"".equals(price)){
						print.append("，单价"+price+"元/斤");
					}
					if(!"".equals(total)){
						print.append("，本次卖出共收入"+total+"元");
					}
					print.append("；</br>");
				}
			}
		}
		Map forages = (Map)request.getSession().getAttribute(FarmerForage.SESSION_FORAGE);
		if(forages != null) {
			FarmerForage p1 = (FarmerForage)forages.get("浓缩料");
			FarmerForage p2 = (FarmerForage)forages.get("玉米");
			FarmerForage p3 = (FarmerForage)forages.get("麸皮");
			FarmerForage p4 = (FarmerForage)forages.get("仔猪全价料");
			FarmerForage p5 = (FarmerForage)forages.get("育肥猪全价料");
			
			if (p1 != null) {
				String num = p1.getNum()!=null?p1.getNum().trim():"";
				String price = p1.getPrice()!=null?p1.getPrice().trim():"";
				String total = p1.getTotal()!=null?p1.getTotal().trim():"";
				if(!"".equals(num)){
					print.append("购进浓缩料：").append(num+"斤");
					if(!"".equals(price)){
						print.append("，单价"+price+"元/斤");
					}
					if(!"".equals(total)){
						print.append("，本次总购入价格"+total+"元");
					}
					print.append("；</br>");
				}
			}
			if (p2 != null) {
				String num = p2.getNum()!=null?p2.getNum().trim():"";
				String price = p2.getPrice()!=null?p2.getPrice().trim():"";
				String total = p2.getTotal()!=null?p2.getTotal().trim():"";
				if(!"".equals(num)){
					print.append("购进玉米：").append(num+"斤");
					if(!"".equals(price)){
						print.append("，单价"+price+"元/斤");
					}
					if(!"".equals(total)){
						print.append("，本次总购入价格"+total+"元");
					}
					print.append("；</br>");
				}
			}
			if (p3 != null) {
				String num = p3.getNum()!=null?p3.getNum().trim():"";
				String price = p3.getPrice()!=null?p3.getPrice().trim():"";
				String total = p3.getTotal()!=null?p3.getTotal().trim():"";
				if(!"".equals(num)){
					print.append("购进麸皮：").append(num+"斤");
					if(!"".equals(price)){
						print.append("，单价"+price+"元/斤");
					}
					if(!"".equals(total)){
						print.append("，本次总购入价格"+total+"元");
					}
					print.append("；</br>");
				}
			}
			if (p4 != null) {
				String num = p4.getNum()!=null?p4.getNum().trim():"";
				String price = p4.getPrice()!=null?p4.getPrice().trim():"";
				String total = p4.getTotal()!=null?p4.getTotal().trim():"";
				if(!"".equals(num)){
					print.append("购进仔猪全价料：").append(num+"斤");
					if(!"".equals(price)){
						print.append("，单价"+price+"元/斤");
					}
					if(!"".equals(total)){
						print.append("，本次总购入价格"+total+"元");
					}
					print.append("；</br>");
				}
			}
			if (p5 != null) {
				String num = p5.getNum()!=null?p5.getNum().trim():"";
				String price = p5.getPrice()!=null?p5.getPrice().trim():"";
				String total = p5.getTotal()!=null?p5.getTotal().trim():"";
				if(!"".equals(num)){
					print.append("购进育肥猪全价料：").append(num+"斤");
					if(!"".equals(price)){
						print.append("，单价"+price+"元/斤");
					}
					if(!"".equals(total)){
						print.append("，本次总购入价格"+total+"元");
					}
					print.append("；</br>");
				}
			}
		}
		

		Map spends = (Map)request.getSession().getAttribute(FarmerSpend.SESSION_SPEND);
		if(spends != null) {
			FarmerSpend p1 = (FarmerSpend)spends.get("人员工资");
			FarmerSpend p2 = (FarmerSpend)spends.get("疫苗、治疗、劁猪费");
			FarmerSpend p3 = (FarmerSpend)spends.get("水、电、燃料费");
			
			if (p1 != null) {
				String price = p1.getPrice()!=null?p1.getPrice().trim():"";
				if(!"".equals(price)){
					print.append("本次人员工资实际支出：").append(price+"元");
					print.append("；</br>");
				}
			}
			if (p2 != null) {
				String price = p2.getPrice()!=null?p2.getPrice().trim():"";
				if(!"".equals(price)){
					print.append("本次疫苗、治疗、劁猪费实际支出：").append(price+"元");
					print.append("；</br>");
				}
			}
			if (p3 != null) {
				String price = p3.getPrice()!=null?p3.getPrice().trim():"";
				if(!"".equals(price)){
					print.append("本次水、电、燃料费实际支出：").append(price+"元");
					print.append("；</br>");
				}
			}
		}
		
		return print.toString();
	}
	
}
