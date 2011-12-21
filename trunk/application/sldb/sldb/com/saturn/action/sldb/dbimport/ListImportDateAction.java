package com.saturn.action.sldb.dbimport;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.JSONUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JsonView;
import com.saturn.sldb.Import;

public class ListImportDateAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		String type = request.getParameter("type");
		List<Import> data = Import.getAllDate(type);

		return new JsonView(JSONUtils.getComboxJSON(data));
	}
	
	public String requestMapping() {
		return "/app/sldb/import/listImportDate.action";
	}
	
}





