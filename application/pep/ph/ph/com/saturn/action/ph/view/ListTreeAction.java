package com.saturn.action.ph.view;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JsonView;
import com.saturn.ph.PH;
import com.saturn.ph.PHResource;
import com.saturn.tc.utils.server.EasyDataManagementService;
import com.teamcenter.soa.client.model.ModelObject;
import com.teamcenter.soa.exceptions.NotLoadedException;

public class ListTreeAction implements IAction {

	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		List<String> indexes = (List<String>) request.getSession()
				.getAttribute("indexes");
		String json = test(indexes);
		return new JsonView(json);
	}

	@Override
	public String requestMapping() {
		return "/app/pep/ListTree.do";
	}

	private String test(List<String> indexes) {
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
		
		String json = PHResource.generateTreeJSON(list);
		System.out.println(json);
		return json;
	}
}
