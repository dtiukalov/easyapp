package com.saturn.app.utils;

import static org.junit.Assert.assertEquals;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

public class JSONUtilsTest {

	@Test
	public void testGetDataGridJSON() throws Exception {
		int total = 20;
		List<TestData> rows = new ArrayList<TestData>();

		rows.add(new TestData("1", "n1"));
		rows.add(new TestData("2", "n2"));
		rows.add(new TestData("3", "n3"));
		List<TestData> footer = new ArrayList<TestData>();

		footer.add(new TestData("1", "n1"));
		footer.add(new TestData("2", "n2"));

		String str = "";
		BufferedReader reader = new BufferedReader(new InputStreamReader(
				JSONUtilsTest.class
						.getResourceAsStream("testGetDataGridJSON.json")));
		str = reader.readLine();
		reader.close();
		
		assertEquals(str, JSONUtils.getDataGridJSON(total, rows, footer));
	}

}
