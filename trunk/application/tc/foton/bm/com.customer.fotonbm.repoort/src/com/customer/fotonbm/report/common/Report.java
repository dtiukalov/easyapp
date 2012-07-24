package com.customer.fotonbm.report.common;

import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.customer.fotonbm.report.exception.BmModelException;


public abstract class Report {

	public abstract void importData(HSSFWorkbook workbook, Map<String, Object> values) throws BmModelException;

	public abstract String getTemplate();

}
