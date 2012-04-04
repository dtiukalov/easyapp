package com.saturn.action.warning.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.db.ListData;
import com.saturn.app.utils.JSONUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.easyui.DataGridInfo;
import com.saturn.app.web.view.JsonView;
import com.saturn.warning.date.farmer.FarmerForage;

public class ListFarmerForageAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		DataGridInfo dataGridInfo = new DataGridInfo(request);

		FarmerForage farmerForage = new FarmerForage(null, request.getParameter("opId"), null, null, null, null, null, null);

		ListData<FarmerForage> data = FarmerForage.getAll(farmerForage, dataGridInfo.getStartPage(),
				dataGridInfo.getRows(), dataGridInfo.getSortId(),
				dataGridInfo.getOreder());

		return new JsonView(JSONUtils.getDataGridJSON(data.getTotal(),
				data.getList()));
	}

	public String requestMapping() {
		return "/app/warning/farmer/listFarmerForage.action";
	}

}
