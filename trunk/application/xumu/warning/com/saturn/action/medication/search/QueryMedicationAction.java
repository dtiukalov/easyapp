package com.saturn.action.medication.search;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.medication.Medication;

public class QueryMedicationAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		String number = request.getParameter("number");
		Medication medication = Medication.search(number);
		
		request.setAttribute("search", medication);
		return new JspView("/app/medication/search/search.jsp");
	}

	public String requestMapping() {
		return "/app/medication/search/queryMedication.do";
	}

}
