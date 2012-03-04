package com.customer.fawvw.issues.commands.issueStatus;

import java.io.FileOutputStream;
import java.util.ArrayList;

public class IssueStatus {

	String kw;
	int red;
	int yellow;
	int green;
	int sum;
	
	public static ArrayList<IssueStatus> getBeforeData(ArrayList<IssueStatus> beforeList,
			String txtContent) {
		
		if (!"".equals(txtContent)) {
			txtContent = txtContent.substring(0, txtContent.length()-1);
			String[] arr = txtContent.split(",");
			for (int i = 0; i < arr.length; i++) {
				IssueStatus issue = new IssueStatus();
				issue.kw = (arr[i].split("/"))[0]; System.out.println("kw = " + issue.kw);
				issue.red = Integer.parseInt((arr[i].split("/"))[1]); System.out.println("red = " + issue.red);
				issue.yellow = Integer.parseInt((arr[i].split("/"))[2]); System.out.println("yellow = " + issue.yellow);
				issue.green = Integer.parseInt((arr[i].split("/"))[3]); System.out.println("green = " + issue.green);
				issue.sum = Integer.parseInt((arr[i].split("/"))[4]); System.out.println("sum = " + issue.sum);
				beforeList.add(issue);
			}
			System.out.println(beforeList.size());
		}
		
		return beforeList;
	}
}
