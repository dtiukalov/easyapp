package com.saturn.action.report;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;

import com.saturn.app.db.DatabaseManager;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.ObjectStreamView;

/**
 * 建立数据库链接 由 sql 语法取出资料，准备好传入的 parameters 将 parameters 及取出的资料传入 Jasper 中。会由
 * .jasper 文档生出 .jrprint 文档 再由 .jrprint 文档生出 .pdf 目的文档给调用页面下载
 * 
 * @author Defonds
 */
public class ReportPrintAction implements IAction {

	private static final String CONTENTTYPE = "application/octet-stream";
	private static DataSource dataSource = DatabaseManager.getInstance()
			.getDataSource();

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		String fileName = request.getParameter("template");
		fileName = ReportPrintAction.class.getResource("/template" + fileName).getPath();
		
		String params = request.getParameter("params");
		Map<String, String> parameters = getParams(params);
		
		Connection conn = null;
		try {
			
			conn = dataSource.getConnection();
			JasperPrint jpt = JasperFillManager.fillReport(fileName, parameters,
					conn);

			return new ObjectStreamView(jpt, CONTENTTYPE);
		} catch (Exception e) {
			System.out.println("Error:" + e.toString());
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return new JspErrorView("打印报表失败");
	}
	
	private Map<String, String> getParams(String params) {
		Map<String, String> map = new HashMap<String, String>();
		
		String[] ps = params.split(",");
		for (String str : ps) {
			String[] param = str.split(":");
			map.put(param[0], param[1]);
		}
		
		return map;
	}

	public String requestMapping() {
		return "/app/report/print.do";
	}
}
