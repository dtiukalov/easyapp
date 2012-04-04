package com.saturn.action.medication.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.medication.Medication;

public class AddMedicationAction implements IAction {

	public String requestMapping() {
		return "/app/medication/addMedication.action";
	}

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		Medication medication = BeanUtils.getBean(request, Medication.class);

		if (Medication.add(medication) == 1) {
			return new JspView("/app/medication/admin/medicationShow.jsp");
		} else {
			return new JspErrorView("添加失败");
		}
	}
}
