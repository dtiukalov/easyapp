package com.saturn.action.warning.farmer;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.auth.User;
import com.saturn.warning.date.farmer.Farmer;
import com.saturn.warning.date.farmer.FarmerForage;
import com.saturn.warning.date.farmer.FarmerPig;
import com.saturn.warning.date.farmer.FarmerSpend;

public class UpLoadAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		User user = (User)request.getSession().getAttribute("authUser");
		
		List<FarmerPig> pigs = initalFarmerPig(request);
		List<FarmerForage> forages = initalFarmerForage(request);
		List<FarmerSpend> spends = initalFarmerSpend(request);
		
		if((pigs!=null&&!pigs.isEmpty())||(forages!=null&&!forages.isEmpty())||(spends!=null&&!spends.isEmpty())){
			Farmer farmer = new Farmer();
			farmer.setUserId("1010101");
			farmer.setUserName("站点1");
			
			int i = Farmer.addAll(farmer, pigs, forages, spends);
			if( i == 1 ) {
				request.getSession().removeAttribute(FarmerPig.SESSION_ADD);
				request.getSession().removeAttribute(FarmerPig.SESSION_SALE);
				request.getSession().removeAttribute(FarmerPig.SESSION_DEAD);
				request.getSession().removeAttribute(FarmerPig.SESSION_WASHOUT);
				request.getSession().removeAttribute(FarmerForage.SESSION_FORAGE);
				request.getSession().removeAttribute(FarmerSpend.SESSION_SPEND);
				request.getSession().removeAttribute(FarmerPig.SESSION_CHECK);
				request.getSession().removeAttribute(FarmerPig.SESSION_PRICE);
			}
		}
		return new JspView("/app/warning/farmer/main.jsp");
	}
	
	public List<FarmerPig> initalFarmerPig(HttpServletRequest request) {
		List<FarmerPig> allPigs = new ArrayList<FarmerPig>();
		
		Map addPigs = (Map)request.getSession().getAttribute(FarmerPig.SESSION_ADD);
		if(addPigs != null) {
			FarmerPig p1 = (FarmerPig)addPigs.get("仔猪");
			FarmerPig p2 = (FarmerPig)addPigs.get("育肥猪");
			FarmerPig p3 = (FarmerPig)addPigs.get("能繁母猪");
			FarmerPig p4 = (FarmerPig)addPigs.get("后备母猪");
			
			addOrNo(allPigs, p1);
			addOrNo(allPigs, p2);
			addOrNo(allPigs, p3);
			addOrNo(allPigs, p4);
		}
		
		Map salePigs = (Map)request.getSession().getAttribute(FarmerPig.SESSION_SALE);
		if(salePigs != null) {
			FarmerPig p1 = (FarmerPig)salePigs.get("仔猪");
			FarmerPig p2 = (FarmerPig)salePigs.get("育肥猪");
			FarmerPig p3 = (FarmerPig)salePigs.get("能繁母猪");
			FarmerPig p4 = (FarmerPig)salePigs.get("后备母猪");
			
			addOrNo(allPigs, p1);
			addOrNo(allPigs, p2);
			addOrNo(allPigs, p3);
			addOrNo(allPigs, p4);
		}
		
		Map deadPigs = (Map)request.getSession().getAttribute(FarmerPig.SESSION_DEAD);
		if(deadPigs != null) {
			FarmerPig p1 = (FarmerPig)deadPigs.get("仔猪");
			FarmerPig p2 = (FarmerPig)deadPigs.get("育肥猪");
			FarmerPig p3 = (FarmerPig)deadPigs.get("能繁母猪");
			FarmerPig p4 = (FarmerPig)deadPigs.get("后备母猪");
			
			addOrNo(allPigs, p1);
			addOrNo(allPigs, p2);
			addOrNo(allPigs, p3);
			addOrNo(allPigs, p4);
		}
		
		Map washOutPigs = (Map)request.getSession().getAttribute(FarmerPig.SESSION_WASHOUT);
		if(washOutPigs != null) {
			FarmerPig p1 = (FarmerPig)washOutPigs.get("能繁母猪");
			FarmerPig p2 = (FarmerPig)washOutPigs.get("后备母猪");
			
			addOrNo(allPigs, p1);
			addOrNo(allPigs, p2);
		}
		Map checkPigs = (Map)request.getSession().getAttribute(FarmerPig.SESSION_CHECK);
		if(checkPigs != null) {
			FarmerPig p1 = (FarmerPig)checkPigs.get("出省境仔猪");
			FarmerPig p2 = (FarmerPig)checkPigs.get("出省境育肥猪");
			FarmerPig p3 = (FarmerPig)checkPigs.get("省内仔猪");
			FarmerPig p4 = (FarmerPig)checkPigs.get("省内育肥猪");
			FarmerPig p5 = (FarmerPig)checkPigs.get("屠宰育肥猪");
			
			
			addOrNo(allPigs, p1);
			addOrNo(allPigs, p2);
			addOrNo(allPigs, p3);
			addOrNo(allPigs, p4);
			addOrNo(allPigs, p5);
		}	
		Map pricePigs = (Map)request.getSession().getAttribute(FarmerPig.SESSION_PRICE);
		if(pricePigs != null) {
			FarmerPig p2 = (FarmerPig)pricePigs.get("育肥猪");
			FarmerPig p3 = (FarmerPig)pricePigs.get("育肥猪");
			
			addOrNo(allPigs, p2);
			addOrNo(allPigs, p3);
		}
		return allPigs;
	}
	
	public void addOrNo(List<FarmerPig> pigs, FarmerPig pig) {
		if (isAvailed(pig)) {
			pigs.add(pig);
		}
	}
	public boolean isAvailed(FarmerPig pig) {
		if (pig == null) {
			return false;
		}
		
		String num = pig.getNum();
		if (num != null && !"".equals(num.trim())) {
			return true;
		}
		
		return false;
	}
	
	public List<FarmerForage> initalFarmerForage(HttpServletRequest request) {
		List<FarmerForage> allForages = new ArrayList<FarmerForage>();
		
		Map forages = (Map)request.getSession().getAttribute(FarmerForage.SESSION_FORAGE);
		if(forages != null) {
			FarmerForage p1 = (FarmerForage)forages.get("浓缩料");
			FarmerForage p2 = (FarmerForage)forages.get("玉米");
			FarmerForage p3 = (FarmerForage)forages.get("麸皮");
			FarmerForage p4 = (FarmerForage)forages.get("仔猪全价料");
			FarmerForage p5 = (FarmerForage)forages.get("育肥猪全价料");
			
			addOrNo(allForages, p1);
			addOrNo(allForages, p2);
			addOrNo(allForages, p3);
			addOrNo(allForages, p4);
			addOrNo(allForages, p5);
		}
			
		return allForages;
	}
	
	public void addOrNo(List<FarmerForage> forages, FarmerForage forage) {
		if (isAvailed(forage)) {
			forages.add(forage);
		}
	}
	public boolean isAvailed(FarmerForage forage) {
		if (forage == null) {
			return false;
		}
		
		String num = forage.getNum();
		if (num != null && !"".equals(num.trim())) {
			return true;
		}
		
		return false;
	}
	
	public List<FarmerSpend> initalFarmerSpend(HttpServletRequest request) {
		List<FarmerSpend> allSpends = new ArrayList<FarmerSpend>();
		
		Map spends = (Map)request.getSession().getAttribute(FarmerSpend.SESSION_SPEND);
		if(spends != null) {
			FarmerSpend p1 = (FarmerSpend)spends.get("人员工资");
			FarmerSpend p2 = (FarmerSpend)spends.get("疫苗、治疗、劁猪费");
			FarmerSpend p3 = (FarmerSpend)spends.get("水、电、燃料费");
			
			addOrNo(allSpends, p1);
			addOrNo(allSpends, p2);
			addOrNo(allSpends, p3);
		}
		return allSpends;
	}
	
	public void addOrNo(List<FarmerSpend> spends, FarmerSpend spend) {
		if (isAvailed(spend)) {
			spends.add(spend);
		}
	}
	public boolean isAvailed(FarmerSpend spend) {
		if (spend == null) {
			return false;
		}
		
		String price = spend.getPrice();
		if (price != null && !"".equals(price.trim())) {
			return true;
		}
		
		return false;
	}
	/*
	public void inital(FarmerPig pig, String postfix, HttpServletRequest request) {
		String num = request.getParameter("num" + postfix);
		String price = request.getParameter("price" + postfix);
		String total = request.getParameter("total" + postfix);
		
		if (num != null && !"".equals(num.trim())) {
			pig.setNum(num);
		}
		
		if (price != null && !"".equals(price.trim())) {
			pig.setPrice(price);
		}
		
		if (total != null && !"".equals(total.trim())) {
			pig.setTotal(total);
		}
	}
*/
	public String requestMapping() {
		return "/app/warning/farmer/upload.do";
	}
	
}
