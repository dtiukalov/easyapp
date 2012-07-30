package com.saturn.ph;

import java.util.ArrayList;
import java.util.List;

import com.teamcenter.soa.client.model.ModelObject;
import com.teamcenter.soa.exceptions.NotLoadedException;

public class IndexManager {

	public static List<PHResource> getListTree(List<ReportPage> indexes) {
		List<PHResource> list = new ArrayList<PHResource>();
		int i = 1;
		
		for(ReportPage index: indexes){
			
			String uid = index.getUid();
			String titleName = index.getPageName().replaceAll("\\n", "");
			boolean isBackup = index.getBackup();
			String type = index.getType();
			String path = index.getPath();

			PHResource vo = new PHResource();
			vo.setId(i);
			vo.setText(titleName);
			vo.setPath("/app/pep/view/view.do?current=" + i);
			list.add(vo);
			i++;
		}
		return list;
	}
}
