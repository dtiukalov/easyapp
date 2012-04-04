package com.saturn.action.warning.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.db.ListData;
import com.saturn.app.utils.JSONUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.easyui.DataGridInfo;
import com.saturn.app.web.view.JsonView;
import com.saturn.warning.date.farmer.FarmerSpend;

public class ListFarmerSpendAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		DataGridInfo dataGridInfo = new DataGridInfo(request);

		FarmerSpend farmerSpend = new FarmerSpend(null, request.getParameter("opId"), null, null, null, null);

		ListData<FarmerSpend> data = FarmerSpend.getAll(farmerSpend, dataGridInfo.getStartPage(),
				dataGridInfo.getRows(), dataGridInfo.getSortId(),
				dataGridInfo.getOreder());

		return new JsonView(JSONUtils.getDataGridJSON(data.getTotal(),
				data.getList()));
	}

	public String requestMapping() {
		return "/app/warning/farmer/listFarmerSpend.action";
	}

}
