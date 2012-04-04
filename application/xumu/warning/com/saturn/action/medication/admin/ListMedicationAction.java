package com.saturn.action.medication.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.db.ListData;
import com.saturn.app.utils.JSONUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.easyui.DataGridInfo;
import com.saturn.app.web.view.JsonView;
import com.saturn.medication.Medication;

public class ListMedicationAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		DataGridInfo dataGridInfo = new DataGridInfo(request);

		Medication medication = new Medication(null, request.getParameter("number"), request.getParameter("title"), request.getParameter("createTime"));

		ListData<Medication> data = Medication.getAll(medication, dataGridInfo.getStartPage(),
				dataGridInfo.getRows(), dataGridInfo.getSortId(),
				dataGridInfo.getOreder());

		return new JsonView(JSONUtils.getDataGridJSON(data.getTotal(),
				data.getList()));
	}

	public String requestMapping() {
		return "/app/medication/listMedication.action";
	}

}
