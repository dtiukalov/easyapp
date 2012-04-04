package com.saturn.action.medication.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.medication.Medication;

public class DeleteMedicationAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		String idStr = request.getParameter("ids");
		String[] ids = idStr.split("__");
		
		Medication.removes(ids);
		return new JspView("/app/medication/admin/medicationShow.jsp");
	}

	public String requestMapping() {
		return "/app/medication/deleteMedication.action";
	}

}
