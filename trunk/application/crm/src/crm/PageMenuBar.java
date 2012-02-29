package crm;
/**
 * 分页类
 * @author ant组
 *
 */
public class PageMenuBar {
	
	public String url="";			// 链接
	public int rowPerPage = 0;		// 每页显示行数
	public long sumRow = 0;			// 总行数
	public int pageNo = 1;			// 当前页号
	public int pagePerScreen = 0;	// 每屏页数
	public int sumPage = 0;		// 总页数
	public int screenNo = 1;		// 当前屏号码
	public int sumScreen = 0;		// 总屏数
	public String pageName = "pageNo";		// 当前分页条当前页参数名

	public PageMenuBar() {
	}
	/**
	 * 构造方法
	 * @param url url 链接 如：manageStudentAction.do?xxxx
	 * @param rowPrePage 每页显示行数
	 * @param pageNo 当前页号
	 * @param pagePreScreen 每屏显示页数
	 * @return 总页数
	 */
	public PageMenuBar(String url,int rowPerPage,long sumRow,int pageNo,int pagePerScreen,String pageName) {
		//this.page=page;
		this.pageName=pageName!=null?pageName.trim():"pageNo";
		this.url=url.indexOf("?")>-1?url+"&"+this.pageName+"=":url+"?"+this.pageName+"=";
		this.rowPerPage=rowPerPage;
		this.sumRow=sumRow;
		this.sumPage=sumPage();
		this.pageNo=pageNo<1?1:pageNo>this.sumPage?this.sumPage:pageNo;
		this.pagePerScreen = pagePerScreen;
		this.screenNo=screenNo();
		this.sumScreen=sumScreen();
		
	}
	/**
	 * 获得首页第一条记录
	 * @return 
	 */
	public int shouPageFirst(){
		return 0;
	}
	/**
	 * 获得首页最后一条记录
	 * @return 
	 */
	public int shouPageLast(){
		int rowcount=0;
		if (this.rowPerPage == 0)
			rowcount=(int)this.sumRow;
		if (this.sumRow == 0)
			rowcount=0;
		if (1==this.sumPage)
			rowcount=(int)(this.sumRow - (this.sumPage - 1) * this.rowPerPage);
		if (1 !=this.sumPage)
			rowcount=this.rowPerPage;
		rowcount=rowcount>0?rowcount-1:0;
		return (1 - 1) * this.rowPerPage + rowcount;
	}
	/**
	 * 获得上一页第一条记录
	 * @return 
	 */
	public int priviorPageFirst(){
		return (this.getPriviorPage() - 1) * this.rowPerPage+1-1;
	}
	/**
	 * 获得上一页最后一条记录
	 * @return 
	 */
	public int priviorPageLast(){
		int rowcount=0;
		if (this.rowPerPage == 0)
			rowcount=(int)this.sumRow;
		if (this.sumRow == 0)
			rowcount=0;
		if (this.getPriviorPage() ==this.sumPage)
			rowcount=(int)(this.sumRow - (this.sumPage - 1) * this.rowPerPage);
		if (this.getPriviorPage() !=this.sumPage)
			rowcount=this.rowPerPage;
		rowcount=rowcount>0?rowcount-1:0;
		return (this.getPriviorPage() - 1) * this.rowPerPage + rowcount;
	}
	/**
	 * 获得上一屏第一条记录
	 * @return 
	 */
	public int priviorScreenFirst(){
		return (this.getPriviorScreen() - 1) * this.rowPerPage+1-1;
	}
	/**
	 * 获得上一屏最后一条记录
	 * @return 
	 */
	public int priviorScreenLast(){
		int rowcount=0;
		if (this.rowPerPage == 0)
			rowcount=(int)this.sumRow;
		if (this.sumRow == 0)
			rowcount=0;
		if (this.getPriviorScreen() ==this.sumPage)
			rowcount=(int)(this.sumRow - (this.sumPage - 1) * this.rowPerPage);
		if (this.getPriviorScreen() !=this.sumPage)
			rowcount=this.rowPerPage;
		rowcount=rowcount>0?rowcount-1:0;
		return (this.getPriviorScreen() - 1) * this.rowPerPage + rowcount;
	}
	/**
	 * 获得当前页第一条记录
	 * @return 
	 */
	public int pageFirst(int pNo){
		return (pNo - 1) * this.rowPerPage + 1-1;
	}
	/**
	 * 获得当前页最后一条记录
	 * @return 
	 */
	public int pageLast(int pNo){
		int rowcount=0;
		if (this.rowPerPage == 0)
			rowcount=(int)this.sumRow;
		if (this.sumRow == 0)
			rowcount=0;
		if (pNo ==this.sumPage)
			rowcount=(int)(this.sumRow - (this.sumPage - 1) * this.rowPerPage);
		if (pNo !=this.sumPage)
			rowcount=this.rowPerPage;
		rowcount=rowcount>0?rowcount-1:0;
		return (pNo - 1) * this.rowPerPage + rowcount;
	}
	/**
	 * 获得下一屏第一条记录
	 * @return 
	 */
	public int nextScreenFirst(){
		return (this.getNextScreen() - 1) * this.rowPerPage+1-1;
	}
	/**
	 * 获得下一屏最后一条记录
	 * @return 
	 */
	public int nextScreenLast(){
		int rowcount=0;
		if (this.rowPerPage == 0)
			rowcount=(int)this.sumRow;
		if (this.sumRow == 0)
			rowcount=0;
		if (this.getNextScreen() ==this.sumPage)
			rowcount=(int)(this.sumRow - (this.sumPage - 1) * this.rowPerPage);
		if (this.getNextScreen() !=this.sumPage)
			rowcount=this.rowPerPage;
		rowcount=rowcount>0?rowcount-1:0;
		return (this.getNextScreen() - 1) * this.rowPerPage + rowcount;
	}
	/**
	 * 获得下一页第一条记录
	 * @return 
	 */
	public int nextPageFirst(){
		return (this.getNextPage() - 1) * this.rowPerPage+1-1;
	}
	/**
	 * 获得下一页最后一条记录
	 * @return 
	 */
	public int nextPageLast(){
		int rowcount=0;
		if (this.rowPerPage == 0)
			rowcount=(int)this.sumRow;
		if (this.sumRow == 0)
			rowcount=0;
		if (this.getNextPage() ==this.sumPage)
			rowcount=(int)(this.sumRow - (this.sumPage - 1) * this.rowPerPage);
		if (this.getNextPage() !=this.sumPage)
			rowcount=this.rowPerPage;
		rowcount=rowcount>0?rowcount-1:0;
		return (this.getNextPage() - 1) * this.rowPerPage + rowcount;
	}
	/**
	 * 获得末页第一条记录
	 * @return 
	 */
	public int moPageFirst(){
		if (1==this.sumPage)
			return 0;
		return (this.sumPage - 1) * this.rowPerPage+1-1;
	}
	/**
	 * 获得末页最后一条记录
	 * @return 
	 */
	public int moPageLast(){
		int rowcount=0;
		if (this.rowPerPage == 0)
			rowcount=(int)this.sumRow;
		if (this.sumRow == 0)
			rowcount=0;
		if (0<this.sumRow)
			rowcount=(int)(this.sumRow - (this.sumPage - 1) * this.rowPerPage);
		rowcount=rowcount>0?rowcount-1:0;
		return (this.sumPage - 1) * this.rowPerPage + rowcount;
	}
	/**
	 * 获得总页数
	 * @return 总页数
	 */
	public int sumPage() {
		return (int)(this.sumRow%this.rowPerPage==0 ? this.sumRow/this.rowPerPage : this.sumRow/this.rowPerPage+1);
	}
	/**
	 * 获得当前屏号码
	 * @return 当前屏号码
	 */
	public int screenNo(){
		return this.pageNo%this.pagePerScreen==0 ? this.pageNo/this.pagePerScreen : this.pageNo/this.pagePerScreen+1;
	}
	/**
	 * 获得总屏数
	 * @return 总屏数
	 */
	public int sumScreen(){
		return this.sumPage%this.pagePerScreen==0 ? this.sumPage/this.pagePerScreen : this.sumPage/this.pagePerScreen+1;
	}
	/**
	 * 本屏开始页
	 * @return 数字
	 */
	public int getStart() {
		return (this.screenNo-1)*this.pagePerScreen+1;
	}
	
	/**
	 * 本屏结束页
	 * @return 数字
	 */
	public int getEnd() {
		return this.screenNo*this.pagePerScreen<this.sumPage?this.screenNo*this.pagePerScreen:this.sumPage;
	}
	/**
	 * 上一页
	 * @return 上一页页码
	 */
	public int getPriviorPage() {
		return this.pageNo>1?this.pageNo-1:this.pageNo;
	}
	/**
	 * 下一页
	 * @return 下一页页码
	 */
	public int getNextPage() {
		return this.pageNo<this.sumPage?this.pageNo+1:this.pageNo;
	}
	/**
	 * 上一屏
	 * @return 上一屏页码
	 */
	public int getPriviorScreen() {
		return this.screenNo>1?(this.screenNo-2)*this.pagePerScreen+1:this.pageNo;
	}
	/**
	 * 下一屏
	 * @return 下一屏页码
	 */
	public int getNextScreen() {
		return this.screenNo<this.sumScreen?this.screenNo*this.pagePerScreen+1:this.pageNo;
	}
	/**
	 * form表单href
	 * @return href
	 */
	public String getHref(String formname,String action) {
		return "javascript:document.getElementById('"+formname+"').action='"+action+"';document.getElementById('"+formname+"').submit();";
	}
	/**
	 * 获得分页工具条
	 * @param url 链接 如：request.getContextPath()+"manageStudentAction.do?method=xxx"
	 * @param rowPrePage 每页显示行数
	 * @param sumRow 总数据行数
	 * @param pageNo 当前页数
	 * @param pagePreScreen 每屏页数
	 * @param type 分页条显示类型 0最简 1有跳转 2有显示条数说明 3最全
	 * @param pageName 分页名称 默认pageNo
	 * @return 分页字符串
	 */
	public static String pageMenuBar(String url,int rowPrePage,long sumRow,int pageNo,int pagePreScreen,int type,String pageName){//url格式:/st/manageStudentAction.do
		if(sumRow<=0){
			return "";
		}
		PageMenuBar bar=new PageMenuBar(url,rowPrePage,sumRow,pageNo,pagePreScreen,pageName);
		StringBuffer menubar=new StringBuffer("");
		menubar.append("&nbsp;[<A href='"+bar.url+"1' title='首页'>首页</A>]&nbsp;");
		menubar.append("&nbsp;[<A href='"+bar.url+bar.getPriviorPage()+"' title='上一页'>上一页</A>]&nbsp;");
		if(type>2){
			menubar.append("<A href='"+bar.url+bar.getPriviorScreen()+"' title='上"+bar.pagePerScreen+"页'>&lt;&lt;</A>");
			for(int i=bar.getStart();i<bar.getEnd()+1;i++){
				if(i==bar.pageNo){
					menubar.append("<A href='"+bar.url+i+"'>"+i+"</A>");
				}else{
					menubar.append("[<A href='"+bar.url+i+"'>"+i+"</A>]");
				}
			}
			menubar.append("<A href='"+bar.url+bar.getNextScreen()+"' title='下"+bar.pagePerScreen+"页'>&gt;&gt;</A>");
		}
		menubar.append("&nbsp;[<A href='"+bar.url+bar.getNextPage()+"' title='下一页'>下一页</A>]&nbsp;");
		menubar.append("&nbsp;[<A href='"+bar.url+bar.sumPage+"' title='尾页'>尾页</A>]&nbsp;");
		if(type>0){
			menubar.append(" 转到第<SELECT name='"+bar.pageName+"' id='"+bar.pageName+"' onchange=\"window.location.href='"+bar.url+"'+this.value;\">");
			for(int j=1;j<=bar.sumPage;j++){
				if(j==bar.pageNo){
					menubar.append("<OPTION selected='selected' value='"+j+"'>"+j+"</OPTION>");
				}else{
					menubar.append("<OPTION value='"+j+"'>"+j+"</A></OPTION>");
				}
			}
			menubar.append("</SELECT>页");
		}
		menubar.append(" 第<span style=\"color:#ff0000;\">"+bar.pageNo+"</span>/"+bar.sumPage+"页");
		if(type>1){
			menubar.append(" 每页"+bar.rowPerPage+"条记录 "+"共"+bar.sumRow+"条记录 ");
		}
		return menubar.toString();
	}
	/**
	 * 获得有form表单功能的分页工具条
	 * @param url 链接 如：request.getContextPath()+"manageStudentAction.do?method=xxx"
	 * @param rowPrePage 每页显示行数
	 * @param sumRow 总数据行数
	 * @param pageNo 当前页数
	 * @param pagePreScreen 每屏页数
	 * @param type 分页条显示类型 0最简 1有跳转 2有显示条数说明 3最全
	 * @param pageName 分页名称 默认pageNo
	 * @param formname form表单名
	 * @param validate 验证js代码或验证js函数
	 * @return 分页字符串
	 */
	public static String pageMenuBar(String url,int rowPrePage,long sumRow,int pageNo,int pagePreScreen,int type,String pageName,String formname,String validate){//url格式:/st/manageStudentAction.do
		if(sumRow<=0){
			return "";
		}
		if(formname==null||"".equals(formname.trim())){
			return pageMenuBar(url,rowPrePage,sumRow,pageNo,pagePreScreen,type,pageName);
		}
		if(validate==null||"".equals(validate.trim())){
			validate="true";
		}
		PageMenuBar bar=new PageMenuBar(url,rowPrePage,sumRow,pageNo,pagePreScreen,pageName);
		StringBuffer menubar=new StringBuffer("");
		menubar.append("&nbsp;[<A href=\""+bar.getHref(formname, bar.url+"1")+"\" onclick=\"return "+validate+"\" title=\"首页\">首页</A>]&nbsp;");
		menubar.append("&nbsp;[<A href=\""+bar.getHref(formname, bar.url+bar.getPriviorPage())+"\" onclick=\"return "+validate+"\" title=\"上一页\">上一页</A>]&nbsp;");
		if(type>2){
			menubar.append("<A href=\""+bar.getHref(formname, bar.url+bar.getPriviorScreen())+"\" onclick=\"return "+validate+"\" title=\"上"+bar.pagePerScreen+"页\">&lt;&lt;</A>");
			for(int i=bar.getStart();i<bar.getEnd()+1;i++){
				if(i==bar.pageNo){
					menubar.append("<A href=\""+bar.getHref(formname, bar.url+i)+"\" onclick=\"return "+validate+"\">"+i+"</A>");
				}else{
					menubar.append("[<A href=\""+bar.getHref(formname, bar.url+i)+"\" onclick=\"return "+validate+"\">"+i+"</A>]");
				}
			}
			menubar.append("<A href=\""+bar.getHref(formname, bar.url+bar.getNextScreen())+"\" onclick=\"return "+validate+"\" title=\"下"+bar.pagePerScreen+"页\">&gt;&gt;</A>");
		}
		menubar.append("&nbsp;[<A href=\""+bar.getHref(formname, bar.url+bar.getNextPage())+"\" onclick=\"return "+validate+"\" title=\"下一页\">下一页</A>]&nbsp;");
		menubar.append("&nbsp;[<A href=\""+bar.getHref(formname, bar.url+bar.sumPage)+"\" onclick=\"return "+validate+"\" title=\"尾页\">尾页</A>]&nbsp;");
		if(type>0){
			menubar.append(" 转到第<SELECT name='"+bar.pageName+"' id='"+bar.pageName+"' onchange=\"javascript:document.getElementById('"+formname+"').action='"+bar.url+"'+this.value;document.getElementById('"+formname+"').submit();\" onclick=\"return "+validate+"\">");
			for(int j=1;j<=bar.sumPage;j++){
				if(j==bar.pageNo){
					menubar.append("<OPTION selected='selected' value='"+j+"'>"+j+"</OPTION>");
				}else{
					menubar.append("<OPTION value='"+j+"'>"+j+"</A></OPTION>");
				}
			}
			menubar.append("</SELECT>页");
		}
		menubar.append(" 第<span style=\"color:#ff0000;\">"+bar.pageNo+"</span>/"+bar.sumPage+"页");
		if(type>1){
			menubar.append(" 每页"+bar.rowPerPage+"条记录 "+"共"+bar.sumRow+"条记录 ");
		}
		return menubar.toString();
	}
	/**
	 * 获得分页工具条
	 * @param url 链接 如：request.getContextPath()+"manageStudentAction.do?method=xxx"
	 * @param rowPrePage 每页显示行数
	 * @param sumRow 总数据行数
	 * @param pageNo 当前页数
	 * @param pagePreScreen 每屏页数
	 * @param type 分页条显示类型 0最简 1有跳转 2有显示条数说明 3最全
	 * @param pageName 分页名称 默认pageNo
	 * @return 分页字符串
	 */
	public static String pageMenuBar_(String url,int rowPrePage,long sumRow,int pageNo,int pagePreScreen,int type,String pageName){//url格式:/st/manageStudentAction.do
		if(sumRow<=0){
			return "";
		}
		PageMenuBar bar=new PageMenuBar(url,rowPrePage,sumRow,pageNo,pagePreScreen,pageName);
		StringBuffer menubar=new StringBuffer("");
		menubar.append("&nbsp;[<A href='"+bar.url+"1&startIndex="+bar.shouPageFirst()+"&endIndex="+bar.shouPageLast()+"' title='首页'>首页</A>]&nbsp;");
		menubar.append("&nbsp;[<A href='"+bar.url+bar.getPriviorPage()+"&startIndex="+bar.priviorPageFirst()+"&endIndex="+bar.priviorPageLast()+"' title='上一页'>上一页</A>]&nbsp;");
		if(type>2){
			menubar.append("<A href='"+bar.url+bar.getPriviorScreen()+"&startIndex="+bar.priviorScreenFirst()+"&endIndex="+bar.priviorScreenLast()+"' title='上"+bar.pagePerScreen+"页'>&lt;&lt;</A>");
			for(int i=bar.getStart();i<bar.getEnd()+1;i++){
				if(i==bar.pageNo){
					menubar.append("<A href='"+bar.url+i+"&startIndex="+bar.pageFirst(i)+"&endIndex="+bar.pageLast(i)+"'>"+i+"</A>");
				}else{
					menubar.append("[<A href='"+bar.url+i+"&startIndex="+bar.pageFirst(i)+"&endIndex="+bar.pageLast(i)+"'>"+i+"</A>]");
				}
			}
			menubar.append("<A href='"+bar.url+bar.getNextScreen()+"&startIndex="+bar.nextScreenFirst()+"&endIndex="+bar.nextScreenLast()+"' title='下"+bar.pagePerScreen+"页'>&gt;&gt;</A>");
		}
		menubar.append("&nbsp;[<A href='"+bar.url+bar.getNextPage()+"&startIndex="+bar.nextPageFirst()+"&endIndex="+bar.nextPageLast()+"' title='下一页'>下一页</A>]&nbsp;");
		menubar.append("&nbsp;[<A href='"+bar.url+bar.sumPage+"&startIndex="+bar.moPageFirst()+"&endIndex="+bar.moPageLast()+"' title='尾页'>尾页</A>]&nbsp;");
		menubar.append(" 第<span style=\"color:#ff0000;\">"+bar.pageNo+"</span>/"+bar.sumPage+"页");
		if(type>1){
			menubar.append(" 每页"+bar.rowPerPage+"条记录 "+"共"+bar.sumRow+"条记录 ");
		}
		return menubar.toString();
	}
	/**
	 * 获得有form表单功能的分页工具条
	 * @param url 链接 如：request.getContextPath()+"manageStudentAction.do?method=xxx"
	 * @param rowPrePage 每页显示行数
	 * @param sumRow 总数据行数
	 * @param pageNo 当前页数
	 * @param pagePreScreen 每屏页数
	 * @param type 分页条显示类型 0最简 1有跳转 2有显示条数说明 3最全
	 * @param pageName 分页名称 默认pageNo
	 * @param formname form表单名
	 * @param validate 验证js代码或验证js函数
	 * @return 分页字符串
	 */
	public static String pageMenuBar_(String url,int rowPrePage,long sumRow,int pageNo,int pagePreScreen,int type,String pageName,String formname,String validate){//url格式:/st/manageStudentAction.do
		if(sumRow<=0){
			return "";
		}
		if(formname==null||"".equals(formname.trim())){
			return pageMenuBar_(url,rowPrePage,sumRow,pageNo,pagePreScreen,type,pageName);
		}
		if(validate==null||"".equals(validate.trim())){
			validate="true";
		}
		PageMenuBar bar=new PageMenuBar(url,rowPrePage,sumRow,pageNo,pagePreScreen,pageName);
		StringBuffer menubar=new StringBuffer("");
		menubar.append("&nbsp;[<A href=\""+bar.getHref(formname, bar.url+"1&startIndex="+bar.shouPageFirst()+"&endIndex="+bar.shouPageLast())+"\" onclick=\"return "+validate+"\" title=\"首页\">首页</A>]&nbsp;");
		menubar.append("&nbsp;[<A href=\""+bar.getHref(formname, bar.url+bar.getPriviorPage()+"&startIndex="+bar.priviorPageFirst()+"&endIndex="+bar.priviorPageLast())+"\" onclick=\"return "+validate+"\" title=\"上一页\">上一页</A>]&nbsp;");
		if(type>2){
			menubar.append("<A href=\""+bar.getHref(formname, bar.url+bar.getPriviorScreen()+"&startIndex="+bar.priviorScreenFirst()+"&endIndex="+bar.priviorScreenLast())+"\" onclick=\"return "+validate+"\" title=\"上"+bar.pagePerScreen+"页\">&lt;&lt;</A>");
			for(int i=bar.getStart();i<bar.getEnd()+1;i++){
				if(i==bar.pageNo){
					menubar.append("<A href=\""+bar.getHref(formname, bar.url+i+"&startIndex="+bar.pageFirst(i)+"&endIndex="+bar.pageLast(i))+"\" onclick=\"return "+validate+"\">"+i+"</A>");
				}else{
					menubar.append("[<A href=\""+bar.getHref(formname, bar.url+i+"&startIndex="+bar.pageFirst(i)+"&endIndex="+bar.pageLast(i))+"\" onclick=\"return "+validate+"\">"+i+"</A>]");
				}
			}
			menubar.append("<A href=\""+bar.getHref(formname, bar.url+bar.getNextScreen()+"&startIndex="+bar.nextScreenFirst()+"&endIndex="+bar.nextScreenLast())+"\" onclick=\"return "+validate+"\" title=\"下"+bar.pagePerScreen+"页\">&gt;&gt;</A>");
		}
		menubar.append("&nbsp;[<A href=\""+bar.getHref(formname, bar.url+bar.getNextPage()+"&startIndex="+bar.nextPageFirst()+"&endIndex="+bar.nextPageLast())+"\" onclick=\"return "+validate+"\" title=\"下一页\">下一页</A>]&nbsp;");
		menubar.append("&nbsp;[<A href=\""+bar.getHref(formname, bar.url+bar.sumPage+"&startIndex="+bar.moPageFirst()+"&endIndex="+bar.moPageLast())+"\" onclick=\"return "+validate+"\" title=\"尾页\">尾页</A>]&nbsp;");
		menubar.append(" 第<span style=\"color:#ff0000;\">"+bar.pageNo+"</span>/"+bar.sumPage+"页");
		if(type>1){
			menubar.append(" 每页"+bar.rowPerPage+"条记录 "+"共"+bar.sumRow+"条记录 ");
		}
		return menubar.toString();
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getRowPerPage() {
		return rowPerPage;
	}
	public void setRowPerPage(int rowPerPage) {
		this.rowPerPage = rowPerPage;
	}
	public long getSumRow() {
		return sumRow;
	}
	public void setSumRow(long sumRow) {
		this.sumRow = sumRow;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getPagePerScreen() {
		return pagePerScreen;
	}
	public void setPagePerScreen(int pagePerScreen) {
		this.pagePerScreen = pagePerScreen;
	}
	public int getSumPage() {
		return sumPage;
	}
	public void setSumPage(int sumPage) {
		this.sumPage = sumPage;
	}
	public int getScreenNo() {
		return screenNo;
	}
	public void setScreenNo(int screenNo) {
		this.screenNo = screenNo;
	}
	public int getSumScreen() {
		return sumScreen;
	}
	public void setSumScreen(int sumScreen) {
		this.sumScreen = sumScreen;
	}
	public String getPageName() {
		return pageName;
	}
	public void setPageName(String pageName) {
		this.pageName = pageName;
	}
	public static void main(String[] args){
		//int pageNo=2;//页号
	    //int rowPerPage=15;//每页行数
		//long sumRow=31;//总行数
		//PageMenuBar bar=new PageMenuBar("/server/oldcar::/articleModule/action/GetArticleResult.action",rowPerPage,sumRow,pageNo,3,"pageNo");
		//System.out.println(bar.shouPageFirst()+"=0="+bar.shouPageLast());
		//System.out.println(bar.priviorPageFirst()+"=1="+bar.priviorPageLast());
		//System.out.println(bar.priviorScreenFirst()+"=-1="+bar.priviorScreenLast());
		//System.out.println(bar.nextScreenFirst()+"=-2="+bar.nextScreenLast());
		//System.out.println(bar.nextPageFirst()+"=2="+bar.nextPageLast());
		//System.out.println(bar.moPageFirst()+"=3="+bar.moPageLast());
		//System.out.println(PageMenuBar.pageMenuBar(bar,3,"pageform",null));
		
	}
}
