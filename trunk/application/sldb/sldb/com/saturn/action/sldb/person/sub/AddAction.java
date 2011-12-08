package com.saturn.action.sldb.person.sub;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.sldb.Person;
import com.saturn.sldb.PersonSub;

public class AddAction implements IAction{

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		PersonSub vo = BeanUtils.getBean(request, PersonSub.class);
		
		String pid = request.getParameter("pid"); 
		Person voPerson = Person.get(pid); 
		
		vo.setPersonName(voPerson.getName());
		request.setAttribute("person", voPerson);
		
		if (PersonSub.add(vo) == 1){
			return new JspView("/app/sldb/person/sub/show.jsp?id=" + pid);
		}else {
			return new JspErrorView("添加家庭成员信息失败。");
		}
	}

	public String requestMapping() {
		return "/app/sldb/person/sub/add.action";
	}

}
