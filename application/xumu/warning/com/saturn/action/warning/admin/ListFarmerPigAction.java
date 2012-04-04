package com.saturn.action.warning.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.db.ListData;
import com.saturn.app.utils.JSONUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.easyui.DataGridInfo;
import com.saturn.app.web.view.JsonView;
import com.saturn.warning.date.farmer.FarmerPig;

public class ListFarmerPigAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		DataGridInfo dataGridInfo = new DataGridInfo(request);

		FarmerPig farmerPig = new FarmerPig(null, request.getParameter("opId"), null, null, null, null, null, null, null);

		ListData<FarmerPig> data = FarmerPig.getAll(farmerPig, dataGridInfo.getStartPage(),
				dataGridInfo.getRows(), dataGridInfo.getSortId(),
				dataGridInfo.getOreder());

		return new JsonView(JSONUtils.getDataGridJSON(data.getTotal(),
				data.getList()));
	}

	public String requestMapping() {
		return "/app/warning/farmer/listFarmerPig.action";
	}

}
