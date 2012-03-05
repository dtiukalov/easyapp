<%@page import="com.saturn.website.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	String rootcid=WebUtils.getRootCid(request);
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../include/include.jsp" %>
<title>东风日产绥化融展绥鑫专营店</title>
<script src="js/swfobject_modified.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="css/shouye.css" />
<link rel="stylesheet" type="text/css" href="css/page.css"  />
</head>
<body style="margin:0px; padding:0px;">
 	<%@ include file="include/top.jsp" %>	
    
    <div id="divBig">
    	<div id="divYhg">
        	<div id="divFyt"><a href="<%="content.jsp?cid="+rootcid+".about&aid="+rootcid+".about.introduce" %>" class="aTwo">更多..</a></div>
            <div id="divTu"></div>
            <div id="divWen" style="overflow: hidden;">
            	<p>&nbsp;&nbsp;&nbsp;<%=WebUtils.getTextWithMax(Article.getOneArticleText(rootcid+".about.introduce"), 120)%></p> 
            </div>
            <div id="divRug"><a href="<%=WebUtils.getLink(rootcid+".salled", null)%>" class="aGeng">更多..</a></div>
            <div id="divTus"></div>
            <div id="divMg">
            <%
            	
            		List artiles_salled = Article.getByLikeCid(rootcid+".salled.");
            		
            		int size_salled = Math.min(artiles_salled.size(), 8);
            		for (int i = 0; i < size_salled; ++i) {
            			Article article = (Article) artiles_salled.get(i);
            			if(i==0){
		            	%>
		            	<div id="divSack"></div><div id="divGer"><a href="<%="content.jsp?cid="+rootcid+".salled&aid=" +article.getCid()+"&did="+article.getId()%>" class="aClgh"><%=WebUtils.getTextWithMax(article.getTitle(), 11)%></a></div><br />
		                <%
            			}else{
        				%>
                    	<div id="divHao"></div><div id="divEr"><a href="<%="content.jsp?cid="+rootcid+".salled&aid=" +article.getCid()+"&did="+article.getId()%>" class="aClgh"><%=WebUtils.getTextWithMax(article.getTitle(), 11)%></a></div><br />
                        <%
            			}
            		}
                %>
            </div>       
        </div>
        
        <div id="divYou">
        	<div id="divRjg">
        	<%@ include file="include/images.jsp" %>
        	</div>
            <div id="divFay">
            	<div id="divGfy"><a href="<%=WebUtils.getLink(rootcid+".new", null)%>" class="ahgh">更多..</a></div>
            	<%
            		List artiles_new = Article.getByLikeCid(rootcid+".new.");
            		int size_new = Math.min(artiles_new.size(), 8);
            		for (int i = 0; i < size_new; ++i) {
            			Article article = (Article) artiles_new.get(i);
            			if(i==0){
		            	%>
		            	<div id="divYuf">
		                	<div id="divTopf"></div>
		                    <div id="divED"><a href="<%="detail.jsp?cid="+rootcid+".new&aid=" +article.getCid()+"&did="+article.getId()%>" class="afg"><%=WebUtils.getTextWithMax(article.getTitle(), 18)%></a></div>
		                </div>
		                <%
            			}else{
        				%>
                    	<div id="divDjhj">
                        	<div id="divEui"></div>
                            <div id="divED"><a href="<%="detail.jsp?cid="+rootcid+".new&aid=" +article.getCid()+"&did="+article.getId()%>" class="afg"><%=WebUtils.getTextWithMax(article.getTitle(), 18)%></a></div>
                        </div>
                        <%
            			}
            		}
                %>
                
            </div>
            <div id="divDjk">
             <div id="divDuht">
             <%
            		List artiles_sall = Article.getByLikeCid(rootcid+".new.offsall");
            		int size_sall = Math.min(artiles_sall.size(), 6);
            		for (int i = 0; i < size_sall; ++i) {
            			Article article = (Article) artiles_sall.get(i);
            			if(i==0){
		            	%>
		            	<div id="divLk">
		                   <div id="divCheng"></div>
		                   <a href="<%="detail.jsp?cid="+rootcid+".new&aid=" +article.getCid()+"&did="+article.getId()%>" class="aDai"><strong><%=WebUtils.getTextWithMax(article.getTitle(), 16)%></strong></a>
		                </div>
		                <%
            			}else{
        				%>
        				<div id="divDOki">
		                   <div id="divLid"></div>
		                   <a href="<%="detail.jsp?cid="+rootcid+".new&aid=" +article.getCid()+"&did="+article.getId()%>" class="aty"><strong><%=WebUtils.getTextWithMax(article.getTitle(), 16)%></strong></a>
		                </div>
                        <%
            			}
            		}
                %>
             </div>
             <div id="divWliao"><a href="<%="list.jsp?cid="+rootcid+".new&aid="+rootcid+".new.offsall" %>" class="aghne">更多..</a></div>   
            </div>  
        </div>
    </div>
   <%@ include file="include/foot.jsp" %>
</body>
</html>