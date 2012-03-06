package com.saturn.action.system.dict;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JsonView;
import com.saturn.system.Dict;

public class QueryDictNameAction implements IAction{

	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		return new JsonView(Dict.getAllNameJSON());
	}

	@Override
	public String requestMapping() {
		return "/app/system/dict/queryDictName.action";
	}

}
