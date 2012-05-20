package com.saturn.ph;

import java.util.ArrayList;
import java.util.List;

import com.teamcenter.soa.client.model.ModelObject;
import com.teamcenter.soa.exceptions.NotLoadedException;

public class IndexManager {

	public static List<PHResource> getListTree(List<String> indexes) {
		List<PHResource> list = new ArrayList<PHResource>();
		int i = 1;
		
		for(String index: indexes){
			String titleName = null;
			if(index.contains("=")){
				String uid = index.split("=")[1];
				try {
					ModelObject modelObject = PH.getDataService().loadModelObjectRefresh(uid);
					PH.getDataService().getProperties(modelObject,"fv9PageName");
				    titleName = modelObject.getPropertyDisplayableValue("fv9PageName");
				    if(titleName == null){
						titleName = "backup";
					}
				} catch (NotLoadedException e) {
					e.printStackTrace();
					titleName = i + "";
				}
			}
			PHResource vo = new PHResource();
			vo.setId(i);
			if(titleName == null){
				titleName = "主页";
			}
			if(titleName.contains("\n")){
				titleName = titleName.replaceAll("\\n", "");
			}
			
			vo.setText(titleName);
			vo.setPath("/app/pep/view/view.do?current=" + i);
			i++;
			list.add(vo);
		}
		return list;
	}
}
