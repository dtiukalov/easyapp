<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	
	int teilSumNum = 0; //总零件数
	String tempKWNo = ""; //临时周数
	String tempZBS = "";  //临时零件范围

	int flag = 0;
	List<HashMap> teilList = new ArrayList<HashMap>();
	//周数与零件范围发生变化的位置索引
	List<Integer> indexArr = new ArrayList<Integer>();
	//合并行的值
	List<Integer> rowSpanArr = new ArrayList<Integer>();
	int count = 0;
	for (int i=0; i<fv9KWNo.size(); i++) {
		String kw = (String)fv9KWNo.get(i);
		String zsb = (String)fv9ZSB.get(i);
		String teil = (String)fv9Teil.get(i);
		int teilNum = Integer.parseInt((String)fv9TeilNum.get(i));
		teilSumNum = teilSumNum + teilNum;
		//周数和零件范围均不相同的，需合并单元格		
		if (!kw.equalsIgnoreCase(tempKWNo) ||
				!zsb.equalsIgnoreCase(tempZBS)){
			tempKWNo = kw;
			tempZBS = zsb;
			indexArr.add(i);
		} 
	}
			
	if (indexArr != null && indexArr.size() > 0) {
		for (int index = 1; index < indexArr.size(); index++) {
			count += indexArr.get(index) - indexArr.get(index-1);
			rowSpanArr.add(indexArr.get(index) - indexArr.get(index-1));
		}
	}
	
	if (count < fv9KWNo.size()) {
		rowSpanArr.add(fv9KWNo.size() - count);
	}
			
	if (rowSpanArr != null && rowSpanArr.size() > 0) {
%>
	<div class="top-table">
		<table cellspacing="0">
			<tr>
				<td colspan="3" style="text-align: center;" height="<%=tdHeight%>px">
					<%=teilSumNum %> Teile Nach <%=milestone %> frei
				</td>
			</tr>
			<tr>
				<td width="15%" height="<%=tdHeight%>px" style="text-align: center;">Zeil</td>
				<td width="25%" height="<%=tdHeight%>px" style="text-align: center;">ZSB</td>
				<td width="60%" height="<%=tdHeight%>px" style="text-align: center;">Teile</td>
			</tr>
<%
		//按合并行循环	
		int tempNo = 0;
		int tempNo2 = 0;
		for (int row_index = 0; row_index < rowSpanArr.size(); row_index++) {
					
			int rowcols = rowSpanArr.get(row_index);
			tempNo += rowcols;
			//每合并的所有零件名称行
			for (int row=0; row<rowcols; row++) {
							
				String tempTeil = fv9Teil.get(tempNo2 + row);
				String tempTeilNum = fv9TeilNum.get(tempNo2 + row);
%>
			<tr>
<%
				if (row==0) {
%>
				<td rowspan="<%=rowcols%>" width="15%" style="text-align: center;">
					<%=fv9KWNo.get(tempNo-1) %>
				</td>
				<td rowspan="<%=rowcols%>" width="25%" style="text-align: center;">
					<%=fv9ZSB.get(tempNo-1) %>
				</td>
<%
				}
%>
				<td width="60%" height="<%=tdHeight%>px" style="text-align: center;">
					<%=tempTeil %> X<%=tempTeilNum %>
				</td>
			</tr>
							
<%
			}
			tempNo2 += rowcols;	
		}
%>
		</table>
	</div>
<%
	}
%>