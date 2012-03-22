package tc.util.excel;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;

public class WorkbookPOI {

	public final Workbook wb;
	public final FormulaEvaluator eval;

	public WorkbookPOI(InputStream is) throws InvalidFormatException,
			IOException {
		wb = WorkbookFactory.create(is);
		eval = wb.getCreationHelper().createFormulaEvaluator();
	}

	public WorkbookPOI(File file) throws InvalidFormatException, IOException {
		this(new FileInputStream(file));
	}

	public Object getCellValue(Cell c) {
		if (c == null)
			return null;
		int t = c.getCellType();
		if (t == Cell.CELL_TYPE_FORMULA) {
			t = eval.evaluateFormulaCell(c);
		}
		switch (t) {
		case Cell.CELL_TYPE_BOOLEAN:
			return (c.getBooleanCellValue());
		case Cell.CELL_TYPE_NUMERIC:
			return (c.getNumericCellValue());
		case Cell.CELL_TYPE_STRING:
			return (c.getStringCellValue());
		case Cell.CELL_TYPE_BLANK:
			return "";
		case Cell.CELL_TYPE_ERROR:
			return (c.getErrorCellValue());
		case Cell.CELL_TYPE_FORMULA:
			// CELL_TYPE_FORMULA will never occur
		default:
			return null;
		}
	}

	public String getCellString(Cell c) {
		Object v = getCellValue(c);
		if (v == null)
			return null;
		return String.valueOf(v.toString()).trim();
	}

}
