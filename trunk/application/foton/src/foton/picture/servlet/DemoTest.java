package foton.picture.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class for Servlet: DemoTest
 *
 */
 public class DemoTest extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;
  
    /* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#HttpServlet()
	 */
	public DemoTest() {
		super();
	}   	
	
	 public void doGet(HttpServletRequest request, HttpServletResponse response)    
	   throws ServletException, IOException {    
	   
	  doPost(request, response);    
	 }  
	 
	 public void doPost(HttpServletRequest request, HttpServletResponse response)    
	   throws ServletException, IOException {    
	System.out.println("test");
	  request.setCharacterEncoding("utf-8");    
	  response.setCharacterEncoding("utf-8");    
	  response.setContentType("text/html");    
	  PrintWriter out = response.getWriter();    
	  int id=Integer.parseInt(request.getParameter("id"));    
	  List<String> list=new ArrayList<String>();
	  list.add("a");
	  list.add("b");
	  list.add("c");
	  
	  String json="";    
	  for (int i = 0; i < list.size(); i++) {    
	   json+=list.get(i)+",";    
	  }    
	  System.out.println(json);    
	  out.write(json);    
	  out.flush();    
	  out.close();    
	 }   	  	    
}