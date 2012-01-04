<%@page import="com.saturn.sldb.IdCheck"%>
<%@page import="com.saturn.sldb.ImportInfo"%>
<%@page import="com.saturn.sldb.ImportItem"%>
<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@page import="org.apache.poi.hssf.util.Region"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFCellStyle"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@page import="java.io.OutputStream"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.io.PrintWriter"%>
<%
	String idSource = request.getParameter("idSource");

	String way = request.getParameter("way");

	List itemSources = ImportItem.getList(idSource);
	String date = request.getParameter(idSource + "_importDateSource");
	String[] idChecks = request.getParameterValues("idCheck");
	String[] importDates = new String[idChecks.length];

	ImportInfo sourceInfo = ImportInfo.get(idSource);

	String filename = sourceInfo.getName() + "(" + date + ")";
	filename = new String(filename.getBytes(), "iso8859-1");
	response.setHeader("Content-Disposition", "attachment;Filename="
			+ filename + ".xls");
	response.setContentType("application/ms-excel");
	HSSFWorkbook wb = new HSSFWorkbook();

	for (int i = 0; i < idChecks.length; ++i) {
		importDates[i] = request.getParameter(idChecks[i]
				+ "_importDate");
	}

	HSSFCellStyle cs = wb.createCellStyle();
	cs.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	cs.setBorderTop(HSSFCellStyle.BORDER_THIN);
	cs.setBorderRight(HSSFCellStyle.BORDER_THIN);
	cs.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	cs.setAlignment(HSSFCellStyle.ALIGN_CENTER);
	cs.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
	cs.setWrapText(true);

	for (int i = 0; i < idChecks.length; ++i) {
		String id = idChecks[i];
		ImportInfo info = ImportInfo.get(id);
		String tableName = info.getTableName();
		String importDate = importDates[i];
		List items = ImportItem.getList(id);

		Map valueResult = null;
		if (way != null && way.equals("identify")) {
			valueResult = IdCheck.batchCheck(idSource, date, id,
					importDate);
		}
		if (way != null && way.equals("name")) {
			valueResult = IdCheck.batchCheckByName(idSource, date, id,
					importDate);
		}

		List results = (List) valueResult.get("result");
		List source = (List) valueResult.get("source");

		HSSFSheet sheet = wb.createSheet(info.getName() + "("
				+ importDate + ")");
		if (results != null && !results.isEmpty()) {
			HSSFRow row = sheet.createRow(0);

			int colume = 0;
			for (int j = 0; j < items.size(); ++j) {
				colume = j;
				ImportItem item = (ImportItem) items.get(j);
				HSSFCell cell = row.createCell(j);

				cell.setCellValue(item.getName());
				cell.setCellStyle(cs);
			}

			for (int j = 0; j < itemSources.size(); ++j) {
				ImportItem item = (ImportItem) itemSources.get(j);
				HSSFCell cell = row.createCell(j + colume + 3);

				cell.setCellValue(item.getName());
				cell.setCellStyle(cs);
			}

			for (int j = 0; j < results.size(); ++j) {
				colume = j;
				HashMap result = (HashMap) results.get(j);
				HashMap resultSource = (HashMap) source.get(j);
				row = sheet.createRow(j + 1);

				colume = 0;
				for (int k = 0; k < items.size(); ++k) {
					colume = k;
					ImportItem item = (ImportItem) items.get(k);
					HSSFCell cell = row.createCell(k);
					String value = (String) result
							.get(item.getColume());
					if (value == null) {
						value = "";
					}
					cell.setCellValue(value);
					cell.setCellStyle(cs);
				}

				for (int k = 0; k < itemSources.size(); ++k) {
					ImportItem item = (ImportItem) itemSources.get(k);
					HSSFCell cell = row.createCell(k + colume + 3);
					String value = (String) resultSource.get(item
							.getColume());
					if (value == null) {
						value = "";
					}
					cell.setCellValue(value);
					cell.setCellStyle(cs);
				}
			}
		}
	}

	OutputStream os = null;
	try {
		os = response.getOutputStream();
		wb.write(os);
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		os.close();
		out.clear();
		out = pageContext.pushBody();
	}
%>
