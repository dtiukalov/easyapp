package com.saturn.action.report;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.export.JRHtmlExporterParameter;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.export.JRXlsExporter;
import net.sf.jasperreports.engine.export.JRXlsExporterParameter;
import net.sf.jasperreports.j2ee.servlets.ImageServlet;

import com.saturn.app.db.DatabaseManager;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.NullView;

/**
 * 建立数据库链接 由 sql 语法取出资料，准备好传入的 parameters 将 parameters 及取出的资料传入 Jasper 中。会由
 * .jasper 文档生出 .jrprint 文档 再由 .jrprint 文档生出 .pdf 目的文档给调用页面下载
 * 
 * @author Defonds
 */
public class ReportExportAction implements IAction {

	private static DataSource dataSource = DatabaseManager.getInstance()
			.getDataSource();

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		String fileName = request.getParameter("template");
		fileName = ReportExportAction.class.getResource("/template" + fileName)
				.getPath();

		String params = request.getParameter("params");
		Map<String, String> parameters = getParams(params);

		String type = request.getParameter("type");
		if (type == null) {
			type = "review";
		}
		
		Connection conn = null;
		try {

			conn = dataSource.getConnection();
			JasperPrint jasperPrint = JasperFillManager.fillReport(fileName,
					parameters, conn);

			export(type, jasperPrint, request, response);
			return new NullView();
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

	@SuppressWarnings("deprecation")
	public void export(String type, JasperPrint jasperPrint, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String fileName = request.getParameter("filename");
		if (fileName == null) {
			fileName = System.currentTimeMillis() + "";
		}
		
		ServletOutputStream outputStream = response.getOutputStream();
		String imagePath = request.getContextPath() + "/app/report/image?image=";
		String encode = "UTF-8";
		
		if ("review".equals(type)) {
			JRPdfExporter exporter = new JRPdfExporter();

			request.getSession().setAttribute(
					ImageServlet.DEFAULT_JASPER_PRINT_SESSION_ATTRIBUTE,
					jasperPrint);
			exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
			exporter.setParameter(JRExporterParameter.CHARACTER_ENCODING,
					encode);
			exporter.setParameter(JRExporterParameter.OUTPUT_STREAM,
					outputStream);
			exporter.setParameter(JRHtmlExporterParameter.IMAGES_URI,
					imagePath);

			exporter.exportReport();
		} else if ("xls".equals(type)) {
			JRXlsExporter exporter = new JRXlsExporter();
			response.reset();
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-disposition", "attachment;filename=" + fileName + ".xls");
			
			exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
			exporter.setParameter(JRExporterParameter.CHARACTER_ENCODING, encode);
			exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, outputStream);
			exporter.setParameter(JRXlsExporterParameter.IS_AUTO_DETECT_CELL_TYPE, new Boolean(false));
			exporter.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS, Boolean.TRUE);
			exporter.setParameter(JRXlsExporterParameter.IS_WHITE_PAGE_BACKGROUND, Boolean.FALSE);
			exporter.setParameter(JRHtmlExporterParameter.IMAGES_URI, imagePath);
			
			exporter.exportReport();
		} else if ("pdf".equals(type)) {
			JRPdfExporter exporter = new JRPdfExporter();
			response.reset();
			response.setContentType("application/pdf");
			response.setHeader("Content-disposition", "attachment;filename=" + fileName + ".pdf");
			
			request.getSession().setAttribute(ImageServlet .DEFAULT_JASPER_PRINT_SESSION_ATTRIBUTE, jasperPrint);
			
			exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
			exporter.setParameter(JRExporterParameter.CHARACTER_ENCODING, encode);
			exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, outputStream);
			exporter.setParameter(JRHtmlExporterParameter.IMAGES_URI, imagePath);
			
			exporter.exportReport();
		}
		
		outputStream.flush();
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
		return "/app/report/export.do";
	}
}
