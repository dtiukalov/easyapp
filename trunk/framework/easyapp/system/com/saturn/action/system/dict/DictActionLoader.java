package com.saturn.action.system.dict;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.db.ListData;
import com.saturn.app.utils.BeanUtils;
import com.saturn.app.utils.JSONUtils;
import com.saturn.app.web.BaseAction;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IActionLoader;
import com.saturn.app.web.IView;
import com.saturn.app.web.easyui.DataGridInfo;
import com.saturn.app.web.view.JsonView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.system.Dict;

public class DictActionLoader implements IActionLoader {
	
	public static final String BASE_NAME = "dict";
	public static final String BASE_PATH = "/app/system/" + BASE_NAME + "/";
	
	public static final String ADD_ACTION = BASE_PATH + "add.action";
	public static final String LIST_ACTION = BASE_PATH + "list.action";
	public static final String QUERY_ACTION = BASE_PATH + "query.action";
	public static final String DELETE_ACTION = BASE_PATH + "delete.action";
	public static final String UPDATE_ACTION = BASE_PATH + "update.action";
	
	public static final String SHOW_JSP = BASE_PATH + "show.jsp";
	public static final String ADD_JSP = BASE_PATH + "add.jsp";
	public static final String EDIT_JSP = BASE_PATH + "edit.jsp";
	
	public static final String QUERY_DICT_TYPE_ACTION = BASE_PATH + "queryDictType.action";
	public static final String LIST_BY_TYPE_ACTION = BASE_PATH + "listDictByType.action";
	public static final String ISREPEAT_ACTION = BASE_PATH + "isRepeatDictId.action";
	public static final String CHANGE_ACTION = BASE_PATH + "change.action";

	public List<IAction> getActions() {
		List<IAction> actions = new ArrayList<IAction>();
		
		actions.add(new BaseAction(ADD_ACTION) {

			public IView execute(HttpServletRequest request,
					HttpServletResponse response) {
				Dict vo = BeanUtils.getBean(request, Dict.class);
				
				if (Dict.add(vo) == 1) {
					return new JspView(SHOW_JSP);
				} else {
					return new JspErrorView("添加数据字典失败");
				}
			}
			
		});
		
		actions.add(new BaseAction(CHANGE_ACTION) {

			public IView execute(HttpServletRequest request,
					HttpServletResponse response) {
				
				String firstId = request.getParameter("first");
				String secondId = request.getParameter("second");
				
				Dict.change(firstId, secondId);
				return new JsonView("true");

			}
		});
		
		actions.add(new BaseAction(DELETE_ACTION) {
			
			public IView execute(HttpServletRequest request,
					HttpServletResponse response) {
				
				String idStr = request.getParameter("ids");
				String[] ids = idStr.split("__");
				
				Dict.removes(ids);
				return new JspView(SHOW_JSP);
				
			}
		});
		
		actions.add(new BaseAction(ISREPEAT_ACTION) {
			
			public IView execute(HttpServletRequest request,
					HttpServletResponse response) {
				
				String id = request.getParameter("id");

				if (Dict.get(id) != null) {
					return new JsonView("true");
				}
				return new JsonView("false");
			}
		});
		
		actions.add(new BaseAction(LIST_ACTION) {
			
			public IView execute(HttpServletRequest request,
					HttpServletResponse response) {
				
				DataGridInfo dataGridInfo = new DataGridInfo(request);

				Dict vo = BeanUtils.getBean(request, Dict.class);

				ListData<Dict> data = Dict.getDicts(vo, dataGridInfo.getStartPage(),
						dataGridInfo.getRows(), dataGridInfo.getSortId(),
						dataGridInfo.getOreder());

				return new JsonView(JSONUtils.getDataGridJSON(data.getTotal(),
						data.getList()));
				
			}
		});
		
		actions.add(new BaseAction(LIST_BY_TYPE_ACTION) {
			
			public IView execute(HttpServletRequest request,
					HttpServletResponse response) {
				
				String type = request.getParameter("type");
				
				return new JsonView(Dict.getDictJSONByType(type));
			}
		});
		
		actions.add(new BaseAction(QUERY_ACTION) {
			
			public IView execute(HttpServletRequest request,
					HttpServletResponse response) {
				
				String id = request.getParameter("id");
				Dict vo = Dict.get(id);
				
				request.setAttribute(BASE_NAME, vo);
				return new JspView(EDIT_JSP);
			}
		});
		
		actions.add(new BaseAction(QUERY_DICT_TYPE_ACTION) {
			
			public IView execute(HttpServletRequest request,
					HttpServletResponse response) {
				
				return new JsonView(Dict.getAllTypeJSON());
			}
		});
		
		actions.add(new BaseAction(UPDATE_ACTION) {
			
			public IView execute(HttpServletRequest request,
					HttpServletResponse response) {
				
				Dict vo = BeanUtils.getBean(request, Dict.class);
				
				if (Dict.edit(vo) == 1) {
					return new JspView(SHOW_JSP);
				} else {
					return new JspErrorView("修改数据字典失败");
				}
			}
		});
		
		return actions;
	}

}
